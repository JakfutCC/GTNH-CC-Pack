# Beta 3 to RC2

Target: GT New Horizons **2.9.0-RC-2, Java 17-26**, released 2026-10-04.
Start with a normal RC2 instance before installing this patch bundle. The patch ZIP replaces mods; it does not upgrade the base pack's configs, quests, translations or launcher libraries.

The official manifests list **88 changed mod versions**, with the same overall mod list. Mobs Info and Salis Arcana moved from GTNH-fork entries to upstream downloads. Salis Arcana 1.1.71-GTNH and upstream v2.7.0 have identical Git trees. Both downloaded client ZIPs contain 241 mod jars. There are 89 changed jar filenames: the extra one is Advanced Solar Panels, whose 48 compiled classes are identical while its filename/metadata changed.

The CC bundle carries forward all 83 jars. 38 patched jars were rebuilt against their RC2 bases. Hydro already uses RC2's 1.4.25, and patched Angelica 2.2.29 is retained (RC2 ships 2.2.28). CubicChunks remains v0.1.25-alpha-pre with the combined storage and compatibility fixes.

FindIt 1.4.7 now sends signed integer Y coordinates upstream. The obsolete CC-only packet switch is removed; the negative-coordinate flooring fix remains.

RC2's new Hodgepodge bed-packet height mask is skipped under CC to preserve negative signed Y values. Without CC, RC2's 0-255 correction is retained. This restores the earlier CC behavior; the existing packet's one-byte height range is still a partial-compatibility limit.

Sources: [beta 3 manifest](https://github.com/GTNewHorizons/DreamAssemblerXXL/blob/master/releases/manifests/2.9.0-beta-3.json), [RC2 manifest](https://github.com/GTNewHorizons/DreamAssemblerXXL/blob/master/releases/manifests/2.9.0-RC-2.json), [official releases](https://www.gtnewhorizons.com/version-history/).

| Mod | Beta 3 | RC2 |
| --- | --- | --- |
| AE2FluidCraft-Rework | 1.5.106-gtnh | 1.5.113-gtnh |
| Amazing-Trophies | 1.4.9 | 1.4.10 |
| Angelica | 2.2.10 | 2.2.28 |
| AppleCore | 3.3.12 | 3.3.13 |
| Applied-Energistics-2-Unofficial | rv3-beta-1050-GTNH | rv3-beta-1080-GTNH |
| ArchitectureCraft | 1.12.17 | 1.12.18 |
| AspectRecipeIndex | 1.1.4 | 1.1.5 |
| Backhand | 1.8.14 | 1.8.16 |
| Baubles-Expanded | 2.2.22-GTNH | 2.2.25-GTNH |
| BetterLoadingScreen | 1.7.16-GTNH | 1.7.18-GTNH |
| BetterP2P | 1.4.7 | 1.4.8 |
| BetterQuesting | 3.8.84-GTNH | 3.8.89-GTNH |
| Binnie | 2.6.47 | 2.6.48 |
| BlockRenderer6343 | 1.4.21 | 1.4.24 |
| BloodMagic | 1.9.13 | 1.9.14 |
| Botania | 1.13.34-GTNH | 1.13.37-GTNH |
| Bug-Torch | 1.2.15 | 1.3.1 |
| BuildCraft | 7.1.63 | 7.1.64 |
| Chisel | 2.17.32-GTNH | 2.17.34-GTNH |
| ChromaticTooltips | 1.0.35-GTNH | 1.0.36-GTNH |
| ChromaticTooltipsCompat | 1.0.36-GTNH | 1.0.38-GTNH |
| CodeChickenCore | 1.4.19 | 1.4.22 |
| CookingForBlockheads | 1.4.13-GTNH | 1.4.14-GTNH |
| CosmeticArmorReworked | 1.0.6-GTNH | 1.0.7-GTNH |
| CropsNH | 2.0.114 | 2.0.134 |
| Default-Configs | 1.3.1 | 1.3.2 |
| EnderIO | 2.10.44 | 2.10.48 |
| EnhancedLootBags | 1.3.4 | 1.3.5 |
| Et-Futurum-Requiem | 2.6.58-GTNH | 2.6.60-GTNH |
| Fether | 2.0.5 | 2.0.7 |
| FindIt | 1.4.6 | 1.4.7 |
| ForestryMC | 4.11.37 | 4.11.39 |
| ForgeMultipart | 1.7.12 | 1.7.16 |
| Gadomancy | 1.5.15 | 1.5.17 |
| Galacticraft | 3.4.33-GTNH | 3.4.34-GTNH |
| Galaxy-Space-GTNH | 1.1.142-GTNH | 1.1.143-GTNH |
| GT5-Unofficial | 5.09.54.133 | 5.09.54.205 |
| GTNHExtLib | 1.0.4 | 1.0.5 |
| GTNHLib | 0.11.46 | 0.11.52 |
| GuideNH | 1.3.29 | 1.3.41 |
| Hardcore-Ender-Expansion | 1.12.27-GTNH | 1.12.28-GTNH |
| harvestcraft | 1.3.14-GTNH | 1.3.15-GTNH |
| Hodgepodge | 2.7.196 | 2.7.215 |
| HydroEnergy | 1.4.24 | 1.4.25 |
| Infernal-Mobs | 1.10.6-GTNH | 1.10.7-GTNH |
| InGame-Info-XML | 2.9.6 | 2.9.7 |
| InventoryBogoSorter | 1.3.50-GTNH | 1.3.54-GTNH |
| JourneyMap | 5.2.20-fairplay | 5.2.23-fairplay |
| LittleTiles | 1.6.44 | 1.6.59 |
| LogisticsPipes | 1.5.35-GTNH | 1.5.36-GTNH |
| lwjgl3ify | 3.0.31 | 3.0.37 |
| MatterManipulator | 0.1.55-GTNH | 0.1.61-GTNH |
| Minecraft-Backpack-Mod | 2.6.17-GTNH | 2.6.18-GTNH |
| Mobs-Info | 0.5.21-GTNH | 0.6.0 |
| ModularUI2 | 2.3.88-1.7.10 | 2.3.92-1.7.10 |
| MouseTweaks | 2.5.2-GTNH | 2.5.3-GTNH |
| Navigator | 1.1.9 | 1.1.10 |
| nei-custom-diagram | 1.8.34 | 1.8.36 |
| neiaddons | 1.18.5 | 1.18.6 |
| NewHorizonsCoreMod | 2.9.61 | 2.9.84 |
| NotEnoughEnergistics | 1.7.41 | 1.7.46 |
| NotEnoughItems | 2.8.130-GTNH | 2.8.155-GTNH |
| Nuclear-Control | 2.7.13 | 2.7.16 |
| OpenBlocks | 1.12.21-GTNH | 1.12.22-GTNH |
| OpenComputers | 1.12.61-GTNH | 1.12.64-GTNH |
| PersonalSpace | 1.0.40 | 1.0.41 |
| Postea | 1.2.6 | 1.2.7 |
| ProjectBlue | 1.2.10-GTNH | 1.2.11-GTNH |
| ProjectRed | 4.12.43-GTNH | 4.12.47-GTNH |
| Random-Things | 2.7.9 | 2.7.11 |
| Salis-Arcana | 1.1.71-GTNH | 2.7.0 |
| ServerUtilities | 2.4.9 | 2.4.14 |
| SpecialMobs | 3.7.5 | 3.7.8 |
| StorageDrawers | 2.2.29-GTNH | 2.2.31-GTNH |
| StructureCompat | 0.7.4 | 0.7.5 |
| StructureLib | 1.4.42 | 1.4.45 |
| Thaumic_Exploration | 1.5.28-GTNH | 1.5.29-GTNH |
| ThaumicEnergistics | 1.7.60-GTNH | 1.7.64-GTNH |
| ThaumicHorizons | 1.8.22 | 1.8.27 |
| ThaumicMachina | 0.2.5-GTNH | 0.2.6-GTNH |
| ThaumicTinkerer | 2.12.32 | 2.12.33 |
| TiC-Tooltips | 1.4.1 | 1.4.2 |
| TinkersConstruct | 1.14.108-GTNH | 1.14.118-GTNH |
| twilightforest | 2.7.40 | 2.7.44 |
| TX-Loader | 1.9 | 1.9.1 |
| VendingMachine | 0.4.100 | 0.4.101 |
| VillageNames | 4.5.17-GTNH | 4.5.19-GTNH |
| VisualProspecting | 1.5.39 | 1.5.41 |
