#!/usr/bin/env bash
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
        printf 'Deleting %s\n' "$jar"
        rm -f -- "$jar"
    done
    return 0
}

clean 'adventurebackpack-*.jar' adventurebackpack-1.4.26-GTNH-cc-search-f580288-jakfutcc-c374f8f1.jar
clean 'amunra-gc-*.jar' AmunRa-GC-0.8.14-cc-saplings-cf20333-jakfutcc-efdd7ed1.jar
clean 'angelica-*.jar' angelica-2.2.29-jakfutcc-7d7878d8.jar
clean 'appliedenergistics2-*.jar' appliedenergistics2-rv3-beta-1050-jakfutcc-9e34656a.jar
clean 'archaicfix-*.jar' archaicfix-0.8.0-cc-disable-phosphor-b436d50-jakfutcc-486455b5.jar
clean 'architecturecraft-*.jar' ArchitectureCraft-1.12.17-cc-placement-b1df66d-jakfutcc-b953426f.jar
clean 'asielib-*.jar' AsieLib-0.7.2-cc-rotation-0fde228-jakfutcc-e852a854.jar
clean 'avaritia-*.jar' Avaritia-1.99-cc-axe-e054aa5-jakfutcc-f25b85b0.jar
clean 'buildcraft-0*.jar' buildcraft-7.1.63-cc-height-compat-d0002a8-jakfutcc-54e774f3.jar
clean 'buildcraft-1*.jar' buildcraft-7.1.63-cc-height-compat-d0002a8-jakfutcc-54e774f3.jar
clean 'buildcraft-2*.jar' buildcraft-7.1.63-cc-height-compat-d0002a8-jakfutcc-54e774f3.jar
clean 'buildcraft-3*.jar' buildcraft-7.1.63-cc-height-compat-d0002a8-jakfutcc-54e774f3.jar
clean 'buildcraft-4*.jar' buildcraft-7.1.63-cc-height-compat-d0002a8-jakfutcc-54e774f3.jar
clean 'buildcraft-5*.jar' buildcraft-7.1.63-cc-height-compat-d0002a8-jakfutcc-54e774f3.jar
clean 'buildcraft-6*.jar' buildcraft-7.1.63-cc-height-compat-d0002a8-jakfutcc-54e774f3.jar
clean 'buildcraft-7*.jar' buildcraft-7.1.63-cc-height-compat-d0002a8-jakfutcc-54e774f3.jar
clean 'buildcraft-8*.jar' buildcraft-7.1.63-cc-height-compat-d0002a8-jakfutcc-54e774f3.jar
clean 'buildcraft-9*.jar' buildcraft-7.1.63-cc-height-compat-d0002a8-jakfutcc-54e774f3.jar
clean 'betterbuilderswands-*.jar' betterbuilderswands-0.13.12-cc-height-47411f8-jakfutcc-7c0ae15d.jar
clean 'bloodmagic-*.jar' BloodMagic-1.9.13-cc-teleport-7f9b068-jakfutcc-24122cbc.jar
clean 'botania-*.jar' Botania-1.13.34-cubic-items-81870c6-jakfutcc-d38d4f2d.jar
clean 'botanic-horizons-*.jar' Botanic-horizons-1.12.10-cubic-targets-54e510d-jakfutcc-853134fe.jar
clean 'botanichorizons-*.jar' Botanic-horizons-1.12.10-cubic-targets-54e510d-jakfutcc-853134fe.jar
clean 'carpentersblocks-*.jar' CarpentersBlocks-3.7.3-GTNH-cc-garage-traversal-r1-jakfutcc-7a955ea5.jar
clean 'codechickencore-*.jar' CodeChickenCore-1.4.19-cc-cube-load-1f7a43d-jakfutcc-7ade0c5b.jar
clean 'computronics-*.jar' Computronics-1.9.10-GTNH-cc-note-playback-7bfda6e-jakfutcc-40209c49.jar
clean 'littletiles-*.jar' littletiles-1.6.44-cc-structure-loading-9ce6e92-jakfutcc-61e03b18.jar
clean 'cropsnh-*.jar' cropsnh-2.0.114-cc-subsoil-a3c97ed-jakfutcc-9f0cf6d1.jar
clean 'cubicchunks-*.jar' cubicchunks-0.1.25-alpha-pre-jakfutcc-057fefbc.jar
clean 'draconic-evolution-*.jar' Draconic-Evolution-1.5.33-cubic-placed-cache-3fd3f6f-jakfutcc-d77db629.jar
clean 'emt-*.jar' EMT-1.7.25-cc-energy-ball-06328b8-jakfutcc-0b6f82f0.jar
clean 'enderio-*.jar' EnderIO-2.10.44-cc-farm-3444f00-jakfutcc-89941914.jar
clean 'enderzoo-*.jar' EnderZoo-1.3.6-cc-teleport-shapes-1e27f87-jakfutcc-cb7e767b.jar
clean 'endercore-*.jar' endercore-0.5.15-cc-height-access-e54ad88-jakfutcc-ad353b36.jar
clean 'etfuturum-*.jar' etfuturum-2.6.58-GTNH-cc-bee-neighbors-d690454b-jakfutcc-3d918fa7.jar
clean 'fether-*.jar' fether-2.0.5-cc-plants-ccebb81-jakfutcc-28f3d4be.jar
clean 'findit-*.jar' findit-1.4.6-cc-search-a5d973d-jakfutcc-702d2176.jar
clean 'forbidden.magic-*.jar' forbiddenmagic-0.9.17-GTNH-cc-trees-4daf5a2-jakfutcc-25dd30b2.jar
clean 'forbiddenmagic-*.jar' forbiddenmagic-0.9.17-GTNH-cc-trees-4daf5a2-jakfutcc-25dd30b2.jar
clean 'forestry-*.jar' Forestry-4.11.37-cc-butterfly-de78a9f-jakfutcc-c2dc859f.jar
clean 'forgemultipart-*.jar' ForgeMultipart-1.7.15-cc-cube-packets-c16503a-jakfutcc-51fec6a6.jar
clean 'freecam-*.jar' freecam-1.0.12-cc-collision-5bf5c0a-jakfutcc-79b0b0c7.jar
clean 'gadomancy-*.jar' gadomancy-1.5.15-cc-devices-f26d543-jakfutcc-a605fb96.jar
clean 'galacticraft-*.jar' Galacticraft-3.4.33-GTNH-cc-astro-miner-minimum-e9521aa-jakfutcc-9cd139b0.jar
clean 'gendustry-*.jar' gendustry-1.9.13-GTNH-cc-grafter-4559055-jakfutcc-a6934b8f.jar
clean 'gravisuiteneo-*.jar' gravisuiteneo-1.3.16-cc-tools-eb162e8-jakfutcc-adc99711.jar
clean 'hardcoreenderexpansion-*.jar' HardcoreEnderExpansion-1.12.27-GTNH-cc-bat-target-b8ffd64-jakfutcc-1decfb32.jar
clean 'hodgepodge-*.jar' hodgepodge-2.7.196-cc-cofh-commands-500d025-jakfutcc-bc6ee8f4.jar
clean 'hydroenergy-*.jar' hydroenergy-1.4.25-cc-compat-jakfutcc-553fc498.jar
clean 'ifu-*.jar' ifu-1.12.4-cc-ore-finder-aa4ff8e-jakfutcc-6a547edf.jar
clean 'infernalmobs-*.jar' InfernalMobs-1.10.6-GTNH-cc-teleport-height-f313c35-jakfutcc-43109c3e.jar
clean 'journeymap-*.jar' journeymap-5.2.20-cc-safe-mapping-jakfutcc-7287ea51.jar
clean 'logisticspipes-*.jar' logisticspipes-1.5.35-GTNH-cc-handoff-b76d2bf-jakfutcc-d69e850f.jar
clean 'lootgames-*.jar' lootgames-2.2.14-cc-game-packets-1def288-jakfutcc-05e9f2b9.jar
clean 'magicbees-*.jar' magicbees-2.10.12-GTNH-cc-enchanted-earth-4acf8d7-jakfutcc-c8dc6b29.jar
clean 'malisisdoors-*.jar' malisisdoors-1.19.11-GTNH-cc-tall-garage-doors-03a2ffe-jakfutcc-4709c627.jar
clean 'matter-manipulator-*.jar' matter-manipulator-0.1.55-GTNH-cc-build-height-08387cf-jakfutcc-97bfd61d.jar
clean 'battlegear2-*.jar' battlegear2-1.6.8-backhand-cc-ender-arrow-a9c1313-jakfutcc-6dd4807b.jar
clean 'modularui2-*.jar' modularui2-2.3.88-1.7.10-preview-origin-5d3c00a-jakfutcc-c7e73929.jar
clean 'mrtjpcore-*.jar' MrTJPCore-1.3.7-cubic-tiles-d451dee-jakfutcc-3a9499e4.jar
clean 'natura-*.jar' Natura-2.8.24-cc-bloodwood-r1-jakfutcc-90ea37ec.jar
clean 'notenoughitems-*.jar' NotEnoughItems-2.8.130-cc-spawn-overlay-d0acb22-jakfutcc-d0d40de6.jar
clean 'openblocks-*.jar' OpenBlocks-1.12.21-cubic-xp-drain-9fbebf4-jakfutcc-45382207.jar
clean 'opencomputers-*.jar' OpenComputers-1.12.61-GTNH-cc-rack-lighting-c601052-jakfutcc-afb0cb9d.jar
clean 'openmodslibs-*.jar' OpenModsLibs-0.10.14-cc-block-placement-6ef0759-jakfutcc-fdabd490.jar
clean 'opensecurity-*.jar' opensecurity-1.2.2-GTNH-cc-turret-height-12a2ca3-jakfutcc-530c7049.jar
clean 'opis-*.jar' Opis-1.4.12-mapless-cc-block-teleport-r1-jakfutcc-91f2d2ca.jar
clean 'personalspace-*.jar' personalspace-1.0.40-cc-portal-search-53f151c-jakfutcc-a6b9a2bb.jar
clean 'railcraft-*.jar' Railcraft-9.17.31-cc-tile-recipients-6332829-jakfutcc-c295ce72.jar
clean 'randomthings-*.jar' RandomThings-2.7.9-cc-bloodmoon-0ff842b-jakfutcc-eefd0f1e.jar
clean 'regionlib-*.jar' regionlib-v0.1.0-GTNH-jakfutcc-7bcc8359.jar
clean 'salisarcana-*.jar' salisarcana-1.1.71-GTNH-cc-node-reach-53e29de-jakfutcc-741b134a.jar
clean 'serverutilities-*.jar' ServerUtilities-2.4.9-cc-seek-block-b4b3b3f-jakfutcc-5db21224.jar
clean 'sgcraft-*.jar' SGCraft-1.4.13-GTNH-cc-gate-render-46fa3a8-jakfutcc-aa3f016c.jar
clean 'sleepingbag-*.jar' sleepingbag-0.3.1-negative-placement-c662239-jakfutcc-280fa941.jar
clean 'specialmobs-*.jar' SpecialMobs-3.7.5-cc-teleport-shapes-2802f44-jakfutcc-f3cf684f.jar
clean 'stevescarts-*.jar' StevesCarts-2.3.15-cc-height-gauge-8af51d4-jakfutcc-af7d2637.jar
clean 'tcnodetracker-*.jar' tcnodetracker-1.4.6-cc-node-identity-9e1e1ea-jakfutcc-2d307526.jar
clean 'thaumicbases-*.jar' ThaumicBases-1.9.19-cc-large-oak-2069fa2-jakfutcc-f9c317bb.jar
clean 'thaumicboots-*.jar' thaumicboots-1.5.13-negative-ice-659a791-jakfutcc-b530c9c3.jar
clean 'thaumic-exploration-*.jar' Thaumic-Exploration-1.5.28-GTNH-cc-taint-6e17e48-jakfutcc-707e1984.jar
clean 'thaumicexploration-*.jar' Thaumic-Exploration-1.5.28-GTNH-cc-taint-6e17e48-jakfutcc-707e1984.jar
clean 'thaumicinsurgence-*.jar' thaumicinsurgence-0.4.1-cc-essentia-83a3e15-jakfutcc-a8f5f4cf.jar
clean 'thaumictinkerer-*.jar' ThaumicTinkerer-2.12.32-cc-connector-6ae2874-jakfutcc-aa5165f9.jar
clean 'thaumichorizons-*.jar' thaumichorizons-1.8.22-entity-coordinates-486351e-jakfutcc-6d0ae7e3.jar
clean 'twilightforest-*.jar' TwilightForest-2.7.40-cc-passive-flight-dde26da-jakfutcc-09070eef.jar
clean 'tmechworks-*.jar' TMechworks-0.4.2-cc-drawbridge-save-46d4608-jakfutcc-55ea79e6.jar
clean 'tconstruct-*.jar' TConstruct-1.14.108-GTNH-cc-tall-smeltery-r1-jakfutcc-68865d46.jar
clean 'villagenames-*.jar' VillageNames-4.5.17-guardian-targets-3546c70-jakfutcc-7b18fc5c.jar
clean 'visualprospecting-*.jar' visualprospecting-1.5.39-cc-refusal-acea97f-jakfutcc-f107d270.jar
clean 'warptheory-*.jar' WarpTheory-1.5.8-block-origins-acafba3-jakfutcc-b3d7aa13.jar
clean 'witchinggadgets-*.jar' WitchingGadgets-1.8.51-cubic-capsule-tint-42bf223-jakfutcc-cbceee45.jar
clean 'worldedit-*.jar' worldedit-0.0.10-cc-command-ranges-d81e9cb-jakfutcc-0c88d6de.jar
clean 'wr-cbe-*.jar' WR-CBE-1.7.12-cc-cube-lifecycle-841ab5c-jakfutcc-87680c91.jar
clean 'yamcore-*.jar' YAMCore-0.7.5-negative-coordinates-b8e8073-jakfutcc-a81aa60e.jar

printf 'Cleanup complete.\n'
