---
title: "Tutorial: First Mod"
description: "Create, build and run your first mod from the Mod Management UI."
sidebar:
  order: 5
---
## Step 1: Create a new empty mod

Start the game into *Mod Management UI* via Steam Launch Options or by passing the `-ModManagementUI` commandline flag.

On the lower left corner, select **New Mod**, then enter the following details:

 * **Title:** "My First Mod"
 * **Author:** Your name

Click **Create**. An explorer window should pop up, pointing to where your new empty mod has been created.

If not, it will be at the install-location of *Gothic 1 Remake*, under `G1R/Mods`. You can find this by using the "Explore local files" option in Steam.

:::note
If you like to have your work-in-progress mods in some other location, you can use the `-ModsDirectory=` commandline parameter to overwrite the local mods path.
:::

You should see a `GothicMod.json` file, along with some empty folders. 

## Step 2: Create a new AngelScript file

Create a new `HelloWorld.as` file inside the `Script/` folder, and put the following code inside:

```cpp
class UChoiceDiego_MyFirstMod_HelloWorld : G1R::Conversation::UTopic_Hero__OC_STT_DIEGO
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

## Step 3: Launch the game, Talk to Diego

Now after starting *Gothic 1 Remake*, you should see a small box on the top-right corner of the main menu, showing that one or more mods are active. Click it, verify your new mod is there.

Start a new game or load an existing savegame. Talk to Diego, notice he has a new "Hello Diego" choice.
