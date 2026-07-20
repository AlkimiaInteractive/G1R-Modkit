---
title: "Blueprint Variant"
description: "Shows how to extend BlueprintAssets (Adds a FireSword based on an existing other sword's visual Blueprint)."
sidebar:
  order: 14
---

Shows how to extend BlueprintAssets (Adds a FireSword based on an existing other sword's visual Blueprint).

## Blueprint Variant

The main part of this example is how a BlueprintVariant is used to extend the Blueprint of an existing sword.

```cpp
class UBlueprintVariant_MyFireSwordVisual : UGothicModExt_BlueprintClassVariant
{
	default SourceClass = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Bastard_02_Visual.BP_ItMw_1H_Sword_Bastard_02_Visual_C'";

	UFUNCTION(BlueprintOverride)
	void ModifyVariant()
	{
    // ...

		UNiagaraComponent FireFX = AddComponentToTemplate(UNiagaraComponent, n"FireFX");

		FireFX.Asset = BlueprintVariantAssets::GetFireSystem();
		FireFX.RelativeLocation = FVector(0.0, 0.0, 40.0);
		FireFX.RelativeScale3D = FVector(1.0, 1.0, 5.0);
	}
}
```

This snipped loads the Blueprint given in `SourceClass`, creates a new BlueprintClass and calls `ModifyVariant`, which you can override to modify the newly generated class. Here, a new NiagaraComponent is added to the new BlueprintClass.

Keep in mind that this will create a *new* class, it will not modify the SourceClass in any way.

You can then access your newly created BlueprintClass via 

```cpp
UBlueprintVariant_MyFireSwordVisual.DefaultObject.VariantClassPath
```
[View this example on GitHub](https://github.com/AlkimiaInteractive/G1R-Modkit/tree/main/Examples/Example-BlueprintVariant)
