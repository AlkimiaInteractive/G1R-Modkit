---
title: "Unreal Project"
description: "How to use a stock UnrealEngine 5.4 to cook custom content."
sidebar:
  order: 1
---

This is a bit of an advanced topic, so unfortunately we won't go too deep into this here. However, here are some hints if you are familiar with Unreal Engine already:

## Overriding base game content via Package Chunking

You can have *Gothic 1 Remake* load a self-made .pak file containing your asset at the same path as the asset you want to override:

 1. Create a new empty Unreal project. 
 2. Import the piece of content that you would like to override and put it at *exactly* the same path as the asset you would like to override is in the base game package.
 3. Create a `PrimaryAssetLabel` Data-Asset in the folder that contains your piece of content (Right-click -> Miscellaneous -> Data Asset, then select `PrimaryAssetLabel`).
 4. Open this `PrimaryAssetLabel`:
    * Set a `Chunk ID` other than 0 or 1
    * Enable `Label Assets In My Directory`
 5. Cook your project for Windows

After cooking, you should have multiple .pak (and .ucas/.utoc) files in `Saved/StagedBuilds/[PlatformName]/[ProjectName]/Content/Paks`.

Copy and *rename* the files that have your `Chunk ID` to your mods Content folder they are under this path:

```
Mods/MyMod/Content/Paks/Windows/G1R-Windows_p.pak
Mods/MyMod/Content/Paks/Windows/G1R-Windows_p.ucas
Mods/MyMod/Content/Paks/Windows/G1R-Windows_p.utoc
```

This will make *Gothic 1 Remake* load your packages ontop of the basegame. Your assets will be under the `/Game/` virtual path.

See [Cooking and Chunking](https://dev.epicgames.com/documentation/unreal-engine/cooking-content-and-creating-chunks-in-unreal-engine) for more information.

## Cooking your mods own content as DLC

If you don't intend to override base game content, you can also cook your mod as a DLC, which have their own package and own virtual path.

To do this, 

 1. Create a new empty Unreal project. 
 2. Create a new Plugin, give it the same name as your Mod
 3. In your mods content folder, import your assets 

To cook this, you can invoke `RunUAT` like so:

```sh

# Replace 'path/to/your.uproject' with the path to your own .uproject file
# Replace YOUR-MODNAME with the name of your plugin

RunUAT BuildCookRun -project="path/to/your.uproject" -noP4 -platform=Win64 -configuration=Development -stage -build -compress -pak -manifests -stdout -dlcname=YOUR-MODNAME -cook -unversionedcookedcontent -BasedOnReleaseVersion=1.0 -AdditionalCookerOptions="-AllowUncookedAssetReferences" 
```

You can copy the generated .pak/.ucas/.utoc to your mods content folder then. *Gothic 1 Remake*  will load them automatically:

```
Mods/MyMod/Content/Paks/Windows/YourPackage-Windows.pak
Mods/MyMod/Content/Paks/Windows/YourPackage-Windows.ucas
Mods/MyMod/Content/Paks/Windows/YourPackage-Windows.utoc
```

Instead of `/Game/` your asset virtual paths will be mounted to `/Your-Modname/`.