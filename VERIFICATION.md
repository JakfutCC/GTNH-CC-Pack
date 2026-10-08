# RC2 verification — 2026-10-08

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
