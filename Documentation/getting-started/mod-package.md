---
title: "Mod Packages"
description: "Structure of a mod package, its GothicMod.json descriptor and how to enable it."
sidebar:
  order: 3
---
*Gothic 1 Remake* can load custom content from Mod Packages placed under `G1R/Mods` or via the Steam Workshop.

:::note
Mods installed via SteamWorkshop are automatically detected and do not need to be placed manually. This is mainly useful during development or when installing manually downloaded mods.
:::

A *Mod Package* may contain:

 - **MODDesc:** JSON file describing and configuring the mod
 - **Config:** .ini files
 - **Content:** Cooked Assets, Blueprints, Levels
 - **Script:** New .as scripts
 - **ScriptPatches:** Patches applied to the base games script files
 - **Story:** Localization, Audio

These packages are loaded and injected into Unreal's Plugin-system early during engine init.

## Example Mod Package file structure

```
Config/
    Game.ini
    Engine.ini
Content/
    Assets1.pak
    Assets2.pak
Script/
    MyMod/
        Weapons.as
        NPCs.as
        Quests.as
ScriptPatches/
    Changes.patch

GothicMod.json
```

Each ModPackage must have a `GothicMod.json` descriptor file at root level which contains the following contents:

```json
{
    "name": "InternalModName",
    "title": "User Facing Fancy Mod Name",
    "author": "Your Name",
    "description": "User facing description text",
    "projectWebsiteURL": "https://example.com/",
    "modVersion": "0.0.1",

    // (optional) dependencies: This mod will only work, if you have these other mods installed
    "dependencies": [
        {
            "name": "G1R",
            "requiredVersion": "1.0.5a",
        },
        {
            "name": "OtherMod1",
            "requiredVersion": ">=1.0",
        },
        {
            "name": "OtherMod2",
            "requiredVersion": ">=1.0, <2.0",
        },
    ],

    // (optional) loadOrder: Defines in which order mod packages should be loaded.
    // Possible values:
    //  - first
	//  - early
	//  - normal
	//  - late
	//  - last
    "loadOrder": "normal",
}
```

## Dependency versioning

If your mod requires a certain game version or other mods to be present, you can use these version constraint patterns:

```  
"1.0.5"       exactly 1.0.5
">=1.0"       at least 1.0
"<2.0"        anything before 2.0
">=1.0 <2.0"  between 1.0 (inclusive) and 2.0 (exclusive)
"!=1.0.5a"    anything but 1.0.5a
"*" or ""     any version
```

Clauses are separated by spaces and/or commas and all of them have to hold. 
Supported operators are >=, <=, ==, =, !=, > and <. A clause without an operator means "==".

## Enabling a mod package via commandline

During development, it can be useful to always enable specific mod packages via commandline:

```cmd
G1R-Win64-Shipping.exe -Mods="Mod1,Mod2,Mod3"
```

The mods enabled like this will only be active for this session.

## Enabling a mod that is in some external folder

You can override the path that *Gothic 1 Remake* uses to search for mods. By default, it checks `G1R/Mods/` and the SteamWorkshop (if available). Pass the following commandline
to point it at e.g. your development repository:

```cmd
G1R-Win64-Shipping.exe -ModsDirectory="C:/Code/G1R-ModKit/Examples" -Mods="Example-HelloWorld"
```

## Example: Hello world

Find your games installation folder. Inside, you will find these files and folders:

```
Engine/
G1R/
G1R-Win64-Shipping.exe
```

Create the following new folders (if they don't exist already)

```
G1R/Mods
G1R/Mods/HelloWorld
```

inside the newly created `G1R/Mods/HelloWorld`, create a new textfile named `GothicMod.json` with the following content:
```json
{
    "name": "HelloWorld",
    "title": "Hello World - My first mod!",
    "author": "John Gothic",
    "description": "Very first mod",
    "modVersion": "0.0.1"
}
```

Then, create another folder:

```
G1R/Mods/HelloWorld/Script
```

and create a new textfile `DiegoExtension.as` inside, with the following content:

```cpp
class UChoiceDiego_HelloWorld : G1R::Conversation::UTopic_Hero__OC_STT_DIEGO
{
    default Caption = FText::FromString("Hello Diego!");
    
    UFUNCTION(BlueprintOverride)
    void Act()
    {
        Hero.AI.Say(FText::FromString("Hello Diego!"));
        Diego.AI.Say(FText::FromString("Hello World!"));
        Diego.AI.GiveItemTo(Hero, UItMi_Orenugget, 999);
    }
}
```

You should now have the following files:

```
G1R/Mods/HelloWorld/GothicMod.json
G1R/Mods/HelloWorld/Script/DiegoExtension.as
```

Launch *Gothic 1 Remake* with the following commandline flag:

```
-Mods=HelloWorld
```

Start a new game, notice how Diego has a generous new dialogue option.

:::note
See [Getting started with AngelScript](../angelscript-setup/) on how to properly set up script development.
:::
