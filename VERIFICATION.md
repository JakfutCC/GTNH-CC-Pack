# Verification — 2026-10-08

The bundle contains 83 jars: 81 patched mod jars, CubicChunks and RegionLib.
The inventory includes partial compatibility patches as well as the patches
with broader runtime coverage. Historical per-mod audit scope is in
`patches.json`; this release does not certify every gameplay feature.

A fresh GTNH 2.9.0-beta-3 client loaded the complete bundle, created a cubic
world, saved it, and reopened it. After reopening, the harness teleported to
and verified client-side blocks at Y -32, 64 and 512. All 83 jar hashes in that
run match the release. ArchaicFix's `enablePhosphor` config remained `true`;
its CC exclusion handled the coexistence automatically. This was an integrated
client/server check, not a dedicated multiplayer packet or performance test.

The combined builds passed:

- CubicChunks: 80 private storage tests and 35 upstream tests; style check passed.
- AE2: 72 existing tests, with both controller and spatial-loading fixes present.
- Angelica: four focused cache tests, with the Celeritas rendering changes included.

Fresh Opus 5.5 reviews covered the CC base integration, the Angelica cache port,
the AE2 combination and the deployment scripts. Review findings about script
error visibility, read-only jars, generated-file consistency and filename hashes
were addressed. Reviews supplement the builds and runtime checks.

Bash and Wine CMD each passed two full-inventory cleanup runs: 79 stock versions
and 83 simulated older patched versions removed; 83 replacements and 162
unrelated stock jars retained. Additional fixtures covered spaces, case,
`!`, `%` and `&` in filenames, read-only jars, absent replacements, directories,
nested jars and `.jar.bak` files. No native Windows/NTFS run was performed.

The builder checks every pinned jar hash and ZIP entry, prevents replacement
patterns from overlapping, and checks the resulting bundle again. Public release
downloads are checked against their SHA256 hashes after upload.
