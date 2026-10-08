# GTNH CC patches

One download for the CubicChunks compatibility patches for **GT New Horizons
2.9.0-RC-2 (Java 17–26)**. Download the patch ZIP from
[Releases](https://github.com/JakfutCC/GTNH-CC-Pack/releases).

Start with a normal **RC2 instance**. This ZIP does not upgrade a beta 3
instance's configs, quests or launcher files.

1. Close Minecraft.
2. Copy everything inside the ZIP's `mods` folder into your instance's `mods` folder.
3. Run `cleanup.bat` on Windows or `bash cleanup.sh` on Linux.
4. Launch Minecraft.

The scripts delete other versions of the listed mods, including older patched
versions, and keep the exact jar filenames included in this ZIP. They run in
their own directory. There are no backups or replacement-presence checks.
Copy all included jars before running the script.

The bundle contains 83 jars, including CubicChunks **v0.1.25-alpha-pre**
with our storage and compatibility changes, and RegionLib. ArchaicFix handles
the Phosphor exclusion automatically; no config edit is needed. Angelica includes
both the Celeritas changes and the shader-cache fix.

CC defaults to Zstandard writes and compact empty-cube storage for new worlds.
Older unpatched CC versions cannot read all of these records. This bundle does
not include the world-converter UI. Existing partial compatibility work is
included; the bundle does not make every mod fully cubic-compatible.

See [beta 3 → RC2 changes](RC2-CHANGES.md) for the base mod versions and patch
changes. The earlier beta 3 bundle remains available under its original release.

## Sources and verification

Each mod retains its own license. The separate sources ZIP contains the selected
source snapshots, build files and licenses, including Celeritas embedded in
Angelica. `patches.json` records jar hashes, source commits and prior per-mod
audit results. Those historical audit notes describe their original test scope.
See [verification](VERIFICATION.md) for the combined bundle checks and limitations.

## Building a bundle

Both cleanup scripts are generated from the pinned list in `patches.json`.
Jars and ZIPs are release assets, not Git files. With Python 3.11 or newer and
the selected artifacts available locally:

```sh
python3 build_bundle.py --artifacts-root /gtnh/modding --output dist/GTNH-CC-patches.zip
```

Use a precise pattern for each mod. BuildCraft's numeric version prefixes are
listed separately so BuildCraft Compat and Oil Tweak are preserved. The builder
checks jar hashes, ZIP integrity and overlapping replacement patterns before
writing the bundle; players only need Bash or Windows CMD.
