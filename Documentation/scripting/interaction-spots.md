---
title: "Interaction Spots"
description: "Add new character InteractionSpots throughout the world"
sidebar:
  order: 6
---

InteractionSpots mark locations in the world where characters can do certain ambient interactions. This applies mostly to NPCs, although there are some interactions that also the player can do (ie. sitting on a chair).
In original Gothic1/2 ZenGin terms, this would be most similar to a Freepoint. However, in *Gothic 1 Remake*, an InteractionSpot describes both freely placed points *and* the entries into an InteractiveObject.

# LevelStreaming and DailyRoutine simulation

Since *Gothic 1 Remake* uses Unreal's WorldPartition LevelStreaming system, only a small part of the world around the player is loaded and present. Therefore, we cannot rely purely on Actors and Components if we need information about
currently unloaded parts of the world.

The InteractionSpot-system serves as global and always present base of the daily routine simulation system. During cooking, all relevant actors and points are collected and written into a `.json` file.

InteractionSpots that belong to an InteractiveObjectActor will exist there too, even if the Actor they belong to is not loaded.

Together with the Waynet-system (a global always present navigation network), NPCs daily routines can be simulated, even if they are in parts of the world that are not loaded.

Building the Waynet between InteractionSpots is a pre-build step and cannot easily be done at runtime, so for now - unfortunately - NPC routine simulation between spots added via mod will not work. 
They will still be usable by the NPCs though and work normally while the world around them is loaded.

:::note
InteractiveObjectActors will automatically register new spots when they load into the level, so they will work even if they were not present in the global spot list.
:::

# Adding a new InteractionSpot via .json

Create a new folder `InteractionSpots/Mainmap/` in your ModPackage and a new `InteractionSpots_MyModName.json` file to it.

You can then list multiple InteractionSpots inside. For example, this one adds the point where Drax is lurking (by the Scavengers) in the Nyras Demo:
```json
{
    "interactionSpots": [
		{
            "name": "MyMod_SpotA",
			"location":
			{
				"x": -3842,
				"y": 1863,
				"z": 100
			},
			"rotation":
			{
				"pitch": 0,
				"yaw": -21,
				"roll": 0
			},
			"possibleActions":
			{
				"gameplayTags": [
					{
						"tagName": "Action.Ambient.Lurk"
					}
				]
			},
			"bAllowAnyOrientationWhenUsing": false,
			"bAllowChainingActions": true,
			"entryDirection": "Front",
			"areaRadius": 40,
			"numAllowedUsers": 1,
			"priority": 1,
			"actorToInteractWith": "None",
			"dataLayer": "/Game/Maps/MainMap/DataLayers/MainMap/FreePoints.FreePoints",
			"cooldownDuration": 0,
			"customRequirements": [
				"/Script/G1R.CharacterSpeciesRequirements(AllowedSpecies=(GameplayTags=((TagName=\"Species.Human\"))))",
				"/Script/G1R.WeatherRequirements(RequireWeatherCondition=\"/Script/AngelscriptCode.ASClass'/Script/Angelscript.WeatherCondition_NoRain'\")"
			]
		}
    ]
}
```

:::note
Many of these properties are optional, just put those that you actually need if you want.
:::

Create a `Game.ini` file under your mods `Config/` folder, and add the following to reference your new file:

```ini
[/Script/G1R.InteractionSubsystem]
+InteractionSpotSourceFiles="/InteractionSpots/{MapName}/InteractionSpots_MyModName.json"
```

The `{MapName}`-part will be replaced by the currently loaded level's name. For *Gothic 1 Remake*, this will always be `MainMap`. If your mod takes place in your own map, use that maps name instead.

:::note
The actual path is not too important and can be chosen rather freely. The game will loop through all loaded mod packages base-directories and look for a matching file. You should take care that
your mod doesn't easily collide with other mods files, though. Adding your mod-name somewhere to the path should be enough.
:::


# Adding a new InteractionSpot via AngelScript

If you don't plan on adding too many new InteractionSpots, you may also add them through AngelScript. To do this, you need to register them to the `UInteractionSubsystem` before the game starts. You can do this with a `UGothicModExt_WorldSubsystem`:

```cpp
class UGothicModExt_WorldExtensions_MyMod : UGothicModExt_WorldSubsystem
{
    UFUNCTION(BlueprintOverride)
    void HandleRegisterInteractionSpots()
    {
        FInteractionSpot SpotB;
        SpotB.Name = n"MyMod_SpotB";
        SpotB.Location = FVector(-3742, 1863, 100);
        SpotB.PossibleActions.AddTag(GameplayTag::Action_Ambient_Lurk);

        InteractionSpots.AddSpot(SpotB);
    }
} 
```