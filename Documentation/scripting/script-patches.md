---
title: "Script Patches"
description: "Apply unified-diff patches to the base game script sources."
sidebar:
  order: 4
---
Inside a Mod Package, you can easily add new AngelScript files and have them be loaded and compiled by the game on startup. Some script classes are automatically picked up and registered (like conversation topics), but sometimes, you may need to actually change something in the base games script code to get the behavior you want.

To do this - while still allowing compatibility to other mods being loaded by players at the same time - *Gothic 1 Remake* can automatically apply UnifiedDiff-style `.patch` files before compiling the scripts.

The recommended workflow uses Git and goes like this:

 1. Have the base games script in a Git repository  
    *This can be your own local repository, or cloned from the official GitHub repository*
 2. Create a branch for your mod
 3. Make the changes you need, commit them to your branch
 4. Create a `.patch` file by taking the diff between your branch and the main branch

:::note
If your changeset is small, you may just create a unified diff between the files using another tool. 

Using Git here scales better if you are making many changes and as you probably want version control for larger projects anyways, but it isn't required.
:::

## Detailed walkthrough using Git

Clone the official *Gothic 1 Remake* script sources from Github into a directory of your choice:

```bash
git clone https://github.com/AlkimiaInteractive/G1R-Modkit
```

:::note
You may also fork the official repository and clone your own while you're at it. That's not necessary to just get started though.
:::

Then, create a branch for your mod, we will call it `mymod` in this example:

```bash
git switch -c mymod
```

Edit the script files as you wish.

:::note
Try to keep the diffs as small as possible, so that the potential for conflicts is minimized when a player loads other mods that also have script patches or a game update is released.
:::

Then, Commit your work as usual:

```bash
git add .
git commit -m "Initial changes for my mod"
```

Now the key part: Create a diff against the `main` branch and write it to your mods package:

```bash
# Assuming your G1R installation is at C:/, change this to your actual path
# This will write MyChanges.patch into the MyMod mod package.

git diff main -- Script/ > C:/G1R/Mods/MyMod/ScriptPatches/MyChanges.patch


# if you are using a local repository, Git may have created a 'master' branch instead

git diff master -- Script/ > C:/G1R/Mods/MyMod/ScriptPatches/MyChanges.patch
```

This will write a patchfile with all the changes you made compared to the base game scripts. The game will apply all patch files automatically when the mod is loaded on startup.

:::note
Use the `-ScriptDirectory=` commandline parameter to point *Gothic 1 Remake* towards your local working copy of the scripts.
:::
