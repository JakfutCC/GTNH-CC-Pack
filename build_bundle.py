#!/usr/bin/env python3
"""Build the patch ZIP and its Bash/batch cleanup scripts from one pinned list."""

import argparse
import fnmatch
import hashlib
import json
import re
import shlex
from pathlib import Path
from zipfile import ZIP_DEFLATED, ZIP_STORED, ZipFile, ZipInfo


MARKER = "jakfutcc"


def sha256(path):
    with path.open("rb") as stream:
        return hashlib.file_digest(stream, "sha256").hexdigest()


def script_rules(entries):
    rules = []
    for entry in entries:
        for pattern in entry["patterns"]:
            # A shared, deliberately small wildcard language for Bash and CMD.
            if not re.fullmatch(r"[A-Za-z0-9+_.*-]+\.jar", pattern):
                raise ValueError(f"Unsupported filename pattern: {pattern}")
            if not pattern[0].isalnum() or "*" not in pattern:
                raise ValueError(f"Use a named mod prefix and wildcard: {pattern}")
            matches = [e["filename"] for e in entries
                       if fnmatch.fnmatchcase(e["filename"].lower(), pattern.lower())]
            if any(name != entry["filename"] for name in matches):
                raise ValueError(f"Overlapping mod pattern {pattern}: {matches}")
            rules.append((pattern, entry["filename"]))
        if not any(fnmatch.fnmatchcase(entry["filename"].lower(), p.lower())
                   for p in entry["patterns"]):
            raise ValueError(f"Replacement does not match its rules: {entry['filename']}")
    return rules


def cleanup_scripts(entries):
    rules = script_rules(entries)
    bash = '''#!/usr/bin/env bash
# Run from the mods folder after copying in this bundle's jars.
# Deletes older versions, including older patched jars. No backups.
set -e
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
shopt -s nullglob nocasematch

clean() {
    local pattern=$1 keep=$2 jar
    for jar in *; do
        [[ -f "$jar" && "$jar" == *.jar && "$jar" == $pattern ]] || continue
        [[ "$jar" == "$keep" ]] && continue
        printf 'Deleting %s\\n' "$jar"
        rm -f -- "$jar"
    done
    return 0
}

'''
    bash += "".join(f"clean {shlex.quote(pattern)} {shlex.quote(keep)}\n"
                    for pattern, keep in rules)
    bash += "\nprintf 'Cleanup complete.\\n'\n"
    batch = '''@echo off
rem Run from the mods folder after copying in this bundle's jars.
rem Deletes older versions, including older patched jars. No backups.
setlocal DisableDelayedExpansion
pushd "%~dp0" || exit /b 1
set "failed=0"

'''
    batch += "".join(f'call :clean "{pattern}" "{keep}"\n' for pattern, keep in rules)
    batch += '''
popd
if "%failed%"=="0" (
    echo Cleanup complete.
) else (
    echo Some files could not be deleted. Close Minecraft and try again.
    pause
)
exit /b %failed%

:clean
for %%F in (%~1) do (
    if exist "%%~fF" if not exist "%%~fF\\" if /i "%%~xF"==".jar" if /i not "%%~nxF"=="%~2" (
        echo Deleting "%%~nxF"
        del /f /q "%%~fF"
        if exist "%%~fF" set "failed=1"
    )
)
exit /b 0
'''
    return {"cleanup.sh": bash.encode(), "cleanup.bat": batch.replace("\n", "\r\n").encode()}


def prepare(manifest, root):
    entries = []
    for record in manifest["patches"]:
        source = root / record["artifact"]
        actual = sha256(source)
        if actual != record["sha256"]:
            raise ValueError(f"Artifact hash differs from the pinned list: {source}")
        with ZipFile(source) as jar:
            bad = jar.testzip()
            if bad:
                raise ValueError(f"Corrupt jar entry: {source}: {bad}")
        filename = record.get("filename", f"{source.stem}-{MARKER}-{actual[:8]}.jar")
        if not re.fullmatch(r"[A-Za-z0-9+_.-]+\.jar", filename) or MARKER not in filename:
            raise ValueError(f"Invalid bundle filename: {filename}")
        if not filename.endswith(f"-{actual[:8]}.jar"):
            raise ValueError(f"Filename does not match its content hash: {filename}")
        entries.append(dict(record, filename=filename))
    names = [e["filename"].lower() for e in entries]
    if len(set(names)) != len(names):
        raise ValueError("Duplicate replacement filename")
    cleanup_scripts(entries)
    return entries


def build(manifest_path, root, output):
    manifest = json.loads(manifest_path.read_text())
    entries = prepare(manifest, root)
    scripts = cleanup_scripts(entries)
    readme = f'''{manifest['title']}

1. Close Minecraft.
2. Copy everything inside this ZIP's mods folder into your instance's mods folder.
3. Windows: run cleanup.bat. Linux: run bash cleanup.sh.
4. Launch Minecraft.

The cleanup script deletes other jar versions of the listed mods, including
previous patched versions. It keeps the exact filenames shipped in this ZIP.
It runs in its own folder. It does not check whether you copied the replacements
and does not make backups. Copy all the included jars before running it.

The patched ArchaicFix disables its Phosphor hooks when CubicChunks is installed;
no manual archaicfix.cfg edit is needed. Angelica contains the Celeritas changes.

CC base: {manifest['cubicchunks_base']}, plus our storage and compatibility fixes.
New writes default to Zstandard; new worlds use compact empty-cube storage.
Older unpatched CC cannot read all these records. The converter UI is not included.

Target: {manifest['target']}
This is a client patch set for an existing GTNH instance.
The per-mod evidence and remaining limitations are recorded in manifest.json.
'''
    public_manifest = dict(manifest, patches=[{k: v for k, v in e.items() if k != "artifact"}
                                             for e in entries])
    files = {"README.txt": readme.encode(),
             "manifest.json": (json.dumps(public_manifest, indent=2) + "\n").encode()}
    files.update({"mods/" + name: content for name, content in scripts.items()})
    files["SHA256SUMS.txt"] = "".join(
        f"{e['sha256']}  mods/{e['filename']}\n" for e in entries).encode()
    output.parent.mkdir(parents=True, exist_ok=True)
    try:
        with ZipFile(output, "x", compression=ZIP_STORED) as bundle:
            for entry in entries:
                bundle.write(root / entry["artifact"], "mods/" + entry["filename"])
            for name, content in files.items():
                info = ZipInfo(name, date_time=(2026, 10, 8, 0, 0, 0))
                info.compress_type = ZIP_DEFLATED
                info.external_attr = (0o100755 if name.endswith(".sh") else 0o100644) << 16
                bundle.writestr(info, content)
        with ZipFile(output) as bundle:
            if bundle.testzip():
                raise ValueError("Corrupt output ZIP")
            for entry in entries:
                with bundle.open("mods/" + entry["filename"]) as stream:
                    if hashlib.file_digest(stream, "sha256").hexdigest() != entry["sha256"]:
                        raise ValueError(f"Packaged hash mismatch: {entry['filename']}")
    except FileExistsError:
        raise
    except BaseException:
        output.unlink(missing_ok=True)
        raise
    return {"zip": str(output), "jars": len(entries), "bytes": output.stat().st_size,
            "sha256": sha256(output)}


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--manifest", type=Path, default=Path(__file__).with_name("patches.json"))
    parser.add_argument("--artifacts-root", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    print(json.dumps(build(args.manifest, args.artifacts_root, args.output), indent=2))
