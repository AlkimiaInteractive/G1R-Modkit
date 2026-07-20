---
title: "AngelScript Setup"
description: "Set up VSCode, script development mode and the debugger for AngelScript modding."
sidebar:
  order: 2
---
Most of the gameplay relevant settings such as AI, story and characters are defined in a text based scripting language that the game will load and recompile on startup. The language used is based on [AngelScript](https://www.angelcode.com/angelscript/), which has been around for more than 20 years. 

However the Hazelight fork that integrates AngelScript into Unreal (and which we are using for *Gothic 1 Remake*), heavily modifies the syntax and language features to fit more with Unreal's architecture. Therefore, we recommend ignoring AngelScript's original documentation and sticking to Hazelight's documentation here: https://angelscript.hazelight.se

:::note
You do not need to install their version of UnrealEngine for cooking content, a stock 5.4 from Epic Games will work fine. *Gothic 1 Remake* provides the AngelScript features here, not the UnrealEditor.
:::

Recommended toolchain:

 * [Visual Studio Code](https://code.visualstudio.com/download?_exp_download=fb315fc982)
 * [Unreal Angelscript extension by Hazelight](https://marketplace.visualstudio.com/items?itemName=Hazelight.unreal-angelscript)

The extension nicely integrates AngelScript into VSCode, including intellisense auto completion, error diagnostics and script debugger.

After installing the extension in VSCode, use `File` -> `Open Folder` and select the `Script/` folder. Start the game in *script development mode* (see below) at least once with VSCode open to have access to intellisense.

:::note
If your VSCode shows symbols that should be there as red text and intellisense doesn't know about base-game script types, make sure you have opened the correct path when doing "Open Folder".
You should be in the `Script/` folder, (that means you should not see `Script/` in VSCode.)
:::

:::note
If you need to work on multiple script-root folders (e.g. base game and your mod), you can create a new VSCode workspace and add all `Script/` roots there. Then they should all work at the same time.
:::


## Script development mode and Precompiled script cache

By default, *Gothic 1 Remake* will read all `.as` files from its `G1R/Script` directory. However, to speed up loading for the release build, it first will try to read from the precompiled script cache.

To get the game to actually read your changed script files, you have two options:

 1. Start *Gothic 1 Remake* in script development mode via a commandline flag (which disables reading the cache)
 2. Delete/move the precompiled script cache at (`G1R/Script/PrecompiledScript_Shipping.Cache`)

The cache can be re-built. Without cache, startup times increase by 10-20 seconds. 

## AngelScript related commandline flags

The *Gothic 1 Remake* executable accepts the following AngelScript related commandline flags:

|Command|Description|
|------|------------|
|`-as-development-mode`|Ignore precompiled script cache, compile script from source, act as language server for VSCode, enable hot-reload, listen for incoming debugger connections.|
|`-as-generate-precompiled-data`|Ignore precompiled script cache, compile script from source and write a new cache file during startup.|
|`-as-ignore-precompiled-data`|Ignore precompiled script cache, compile scripts from source.|
|`-as-exit-on-error`|Let the process exit with non-zero exit code if an error was detected while compiling the scripts (instead of popping up the error message window)|

Usually, passing `-as-development-mode` is enough to work on the scripts.

## Script Hot-reload

When working in the UnrealEditor, AngelScript can hot-reload changes without having to re-start everything. However, the big limitation here is that it can only hot-reload changes to function contents *while the game is running*. Changing class defaults, `UPROPERTY` layouts or adding new `UCLASS` classes is not supported while the game is running and requires a restart. 

Since *Gothic 1 Remake* will always be non-editor, you unfortunately will have to restart more often after making changes. 

## Connecting the VSCode Debugger

With the game started in *script development mode* via the `-as-development-mode` commandline flag, just press the F5 Key to attach VSCode's Debugger to the *Gothic 1 Remake* process. You can set breakpoints and check variable states as with any other debugger.

:::note
On coroutine-tasks, hitting a breakpoint and then stepping/continuing will have the game try to only hit the breakpoint again on the object instance that the breakpoint was hit on.
:::
