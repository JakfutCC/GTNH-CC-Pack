# Backup fix verification — 2026-10-09

Only CubicChunks and ServerUtilities changed; the other 81 jars are byte-identical to the previous RC2 bundle. Sources: [CC 43e4abe](https://github.com/JakfutCC/CubicChunks1710/commit/43e4abef776fb19791d5a1ea94ff11eec6c285c4) and [SU b152c8e](https://github.com/JakfutCC/ServerUtilities/commit/b152c8e1edfd4020792bf76946c67876340e070b).

The converted UHV test reproduced a 37,162 ms server-thread backup pause, including 36,962 ms of snapshot copying. The final completed run took 225 ms on that thread, including 89 ms for metadata capture. Storage flushing and compression continued in the background for about a minute. Across 1,296 active backup ticks, median tick interval was 49.86 ms and maximum measured tick work was 239.13 ms. Initial saving is still synchronous: another final-jar preparation took 1,219 ms, and an earlier contended run took 5,838 ms. This is not a zero-latency guarantee.

The final archive contained 5,126 files totaling 4,103,445,221 uncompressed bytes. Every entry passed CRC verification during extraction. The restored world loaded all 5,088 fixture cubes with zero missing cubes and zero multipart placeholders. Chests at Y -32, 64 and 512 restored their pre-backup diamond counts (11, 12 and 13), and their adjacent blocks matched. Changes made while backup was active stayed in memory and saved afterward (counts 50, 51 and 52); an attempted cube unload during save-off retained the dirty cubes. Cancelling during the CC flush left no archive, restored saving, and allowed a later save and successful backup.

A separate fresh Zstandard/compact-storage world also backed up and loaded from its extracted archive, including 31 compact .cce tables and the same three marker heights. Its backup used the preceding SU build; the final difference only preserves cancellation exception classification. Restore used the final jars.

The large-world check used a disposable copy of the converted UHV beta3 runtime with SU 2.4.14, GTNHLib 0.11.52 and the final CC integration. The old fixture's column layout was adapted privately to the current CC schema; the original world remained untouched. This verifies dedicated-server backup loading and selected persisted contents, not every machine or a new full RC2 client playthrough. Prior RC2 client coverage is retained below.

Both mods passed assemble/check. Focused checks passed 11 private CC cases, six private SU cases and 28 existing SU backup cases; two Windows-specific cases skipped on Linux. Eight Opus 5.5 read-only review runs across two retained sessions resolved the correctness findings, including write ordering, failure recovery and cancellation safety. Private fixtures are not in the public patches or jars.

Bash and Wine CMD cleanup tests each passed twice against the RC2 inventory. The bundle keeps all 83 jars; both changed source snapshots match their recorded commits. Binary/source ZIPs and checksums are verified again from the public release before the old release is deleted.

## Prior RC2 verification — 2026-10-08

This release contains all 83 selected jars: 81 patched mod jars, CubicChunks and RegionLib. Partial compatibility patches are included. Historical per-mod audit notes in `patches.json` retain their original scope; this release does not certify every gameplay feature.

A fresh official RC2 client loaded the complete bundle on Java 21, created a cubic world, saved it on shutdown and reopened it after a full client restart. Client-side marker blocks at Y -32, 64 and 512 survived. All three containing cubes matched the server with zero block or metadata differences. All 83 runtime jar hashes match the release ZIP. ArchaicFix's `enablePhosphor` remained `true`; its CC exclusion handled coexistence automatically.

In that world, smeltery floor validation and crop subsoil lookup passed at all three heights. AE2 controllers were placed in view at those heights, and JourneyMap's underground/sky observation path completed below and above vanilla height. These are bounded probes, not certification of complete machines, mapping, dedicated multiplayer or performance.

The first reopen assertion ran after 80 client ticks, before the negative-height cube had arrived, and reported air. Later readback passed without changing blocks or jars; all three full-cube comparisons agreed. The corrected checks allow time for initial world loading. The attempted `/save-all` command is unavailable in integrated singleplayer; persistence evidence comes from shutdown and restart/readback.

The logs are not error-free. Both RC2 starts print a caught `GT_CraftingRecipeLoader` index-5/length-5 exception, also present in the beta 3 runs. The recipe-loader and GregTech jars match the official RC2 ZIP. Resource/audio warnings and an incomplete shutdown-thread exception also remain. No array-bounds failure occurred during the in-world probes/readback; this check does not validate every recipe.

All 38 ports built successfully with their local Gradle wrappers and passed `check`. Existing JUnit reports contain 344 passed cases and two Windows-only skips on Linux. No new test files were added to the public mod patches for this migration. The 45 unchanged jars retain their earlier build and test evidence, described in the [beta 3 verification](https://github.com/JakfutCC/GTNH-CC-Pack/blob/2026.10.08/VERIFICATION.md).

Private focused fixtures also passed:

- AE2 controller rendering: 56 cases, including eight cases that crash without the guard.
- Tinkers' smeltery floor: 176 cases. Iterative traversal matched 960 callback sequences and completed a 10,000-layer fixture that overflows the old recursion.
- JourneyMap rendering controller: 126 non-CC and 282 CC attempts, with zero failures.
- FindIt: RC2's full-int Y wire format, with and without CC.
- Hodgepodge bed packet: all 256 vanilla unsigned heights and all 256 CC signed-byte heights. The fixture reproduces the upstream negative-Y regression and checks the actual vanilla codec plus mixin tail. The wire stays unchanged. This is not full-height sleeping support or a live multiplayer sleep test.

Thirteen Opus 5.5 review runs across eleven retained sessions checked the RC2 interactions in AE2, Blood Magic, CodeChickenCore, LittleTiles, CropsNH, FindIt, Hodgepodge, RandomThings, Twilight Forest, Tinkers and JourneyMap. Hodgepodge's bed regression and follow-up documentation finding were addressed. These were bounded integration reviews, not fresh full audits of every older patch. Another 262 patched source files match the previously selected versions byte-for-byte, with separate checks of JourneyMap's fourteen-file overlay.

Both Bash and Wine CMD passed two full RC2 inventory cleanup runs: 79 stock versions and 83 simulated older patched versions removed; 83 replacements and 162 unrelated stock jars retained. The unchanged cleanup logic also retains the earlier filename/error-handling fixture coverage. No native Windows/NTFS run was performed.

The binary bundle builder checks pinned hashes, ZIP integrity, unique filenames and non-overlapping replacement patterns. All 83 recorded source commits match the separate 84-project source archive, which also includes Celeritas embedded in Angelica. JourneyMap uses the valid four-component version `5.2.23.jakfutcc`, preserving its numeric version parsing. Both release ZIPs and the checksum file are verified again by downloading the published assets.
