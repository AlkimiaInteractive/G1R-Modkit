---
title: "Commandline Flags"
description: "Useful commandline flags for developing, testing and running mods."
sidebar:
  order: 1
---
The following commandline flags may be useful while developing mods. Pass them to the *Gothic 1 Remake* executable (e.g. `G1R-Win64-Shipping.exe`).

## Mod loading

|Command|Description|
|------|------------|
|`-Mods="Mod1,Mod2,Mod3"`|Enable the given mod packages for this session only (comma-separated list).|
|`-ModsDirectory="<path>"`|Override the directory *Gothic 1 Remake* searches for mods. By default it checks `G1R/Mods/` and the SteamWorkshop (if available).|
|`-ModManagementUI`|Launch into the mod management UI.|

## AngelScript

|Command|Description|
|------|------------|
|`-as-development-mode`|Ignore precompiled script cache, compile script from source, act as language server for VSCode, enable hot-reload, listen for incoming debugger connections. Usually enough to work on scripts.|
|`-as-generate-precompiled-data`|Ignore precompiled script cache, compile script from source and write a new cache file during startup.|
|`-as-ignore-precompiled-data`|Ignore precompiled script cache, compile scripts from source.|
|`-as-exit-on-error`|Let the process exit with a non-zero exit code if an error was detected while compiling the scripts (instead of popping up the error message window).|
|`-ScriptDirectory=<path>`|Override the main AngelScript directory.|
|`-as-basedir-scripts`|Load scripts from the base directory (when started via `-basedir=`).|

See [Getting started with AngelScript](../../getting-started/angelscript-setup/) and [Mod package](../../getting-started/mod-package/) for usage details.

## Game

|Command|Description|
|------|------------|
|`-g1r-story-exclude=<a,b,...>`|Exclude the given stories from compilation (comma-separated list).|
|`-no-intro-cinematic`|Skip the intro cinematics when starting a new game.|
|`-StartLocation=<name>`|Set freepoint/interactionspot name to spawn the hero at when starting a new game|

## Tools

|Command|Description|
|------|------------|
|`-console`|Enable the Unreal command console|
|`-ingametools`|Enable ImGui IngameTool panels (hide via `gothic.ingametools.enabled 0` at runtime)|

## Localization

|Command|Description|
|------|------------|
|`-force-display-language-set=<set>`|Override the display (UI/text) language set|
|`-force-voiceover-language-set=<set>`|Override the voice-over language set|
|`-append-to-language-set=<english_new,german,...>`|Always append the given separated languages to the display language set. (comma separated list)|
|`-ignore-loca-cache`|Ignore the localization cache and reload all localization from source.|
