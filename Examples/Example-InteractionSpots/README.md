---
title: "Interaction Spots"
description: "How to add new InteractionSpots (Freepoints) via an InteractionSpots.json file and via AngelScript."
sidebar:
  order: 15
---

This example adds two new InteractionSpots (Freepoints) to the world, one through each of the supported methods:

* **SpotA** is added via a `.json` file. `InteractionSpots/Mainmap/InteractionSpots_ExampleInteractionSpots.json` describes the spot, and `Config/Game.ini` registers that file with the `UInteractionSubsystem`.
* **SpotB** is added via AngelScript. `Script/Example-InteractionSpots/InteractionSpots.as` registers the spot from a `UGothicModExt_WorldSubsystem` extension before the game starts.

Both spots sit next to the Scavengers (where Drax lurks in the Nyras Demo) and offer an `Action.Ambient.Lurk` interaction.

See the [Interaction Spots](../../scripting/interaction-spots/) documentation for details on the available properties.

[View this example on GitHub](https://github.com/AlkimiaInteractive/G1R-Modkit/tree/main/Examples/Example-InteractionSpots)
