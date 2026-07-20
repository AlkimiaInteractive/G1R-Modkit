---
title: "Blueprint Variant Extensions"
description: "Extend Blueprint-defined visuals with UGothicModExt_BlueprintClassVariant."
sidebar:
  order: 5
---
For technical reasons, most of the visuals are defined in Blueprint Assets. Changing these outside of the UnrealEditor can be a hassle. To do this, you may use a `UGothicModExt_BlueprintClassVariant`.

## UGothicModExt_BlueprintClassVariant

This class basically does the following:

 * You assign a `SourceClass` (the blueprint you want to modify)
 * It then creates a new BlueprintClass which inherits from the given `SourceClass`
 * It calls `ModifyVariant`, which you can use to modify the new BlueprintClass Template
 * It lets you get a SoftClassPtr to your new class

Internally, Unreal has multiple ways to create and define Components, the API of this class wraps access to them nicely, so that you
don't need to bother whether a component is Native or defined via SimpleConstructionScript.

Inside `ModifyVariant`, use

 * `GetComponentFromTemplate` to modify a component that already exists on the Blueprint
 * `AddComponentToTemplate` to add a new component to the Blueprint (this can be your own custom script class to inject logic!)
 * `SetVariantProperty` to modify the value of a property via string based PropertyPath (for Properties created in BP)
 * `GetVariantDefaultObject` to access the variants CDO directly

All non-abstract classes inheriting from `UGothicModExt_BlueprintClassVariant` are collected and automatically created after script compilation finished.

### Example

```cpp
class UMyBlueprintClassVariant : UGothicModExt_BlueprintClassVariant
{
	default SourceClass = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Bastard_02_Visual.BP_ItMw_1H_Sword_Bastard_02_Visual_C'";

	UFUNCTION(BlueprintOverride)
	void ModifyVariant()
	{
		// Gets the first UStaticMeshComponent from the template (in this case a Native component)
		UStaticMeshComponent Mesh = GetComponentFromTemplate(UStaticMeshComponent);

		if (IsValid(Mesh))
		{
			Mesh.StaticMesh = SomeOtherStaticMesh;
			Mesh.RelativeScale3D = FVector(5.0, 5.0, 5.0);

			for (int i = 0; i < Mesh.GetNumMaterials(); i++)
			{
				Mesh.SetMaterial(i, SomeOtherMaterial);
			}
		}

		// Gets the first component with the given type + name (this component was purely defined in BP)
		UHitCapsuleCollisionComponent HitCollision = GetComponentFromTemplate(UHitCapsuleCollisionComponent, n"HitBoxCollision_Weapon");

		if (IsValid(HitCollision))
		{
			HitCollision.CapsuleRadius = 40.0;
		}

		// Adds a new component to the template
		UNiagaraComponent MyFX = AddComponentToTemplate(UNiagaraComponent, n"MyFX");

		MyFX.Asset = SomeNiagaraAsset;
		MyFX.RelativeLocation = FVector(0.0, 0.0, 40.0);
		MyFX.RelativeScale3D = FVector(1.0, 1.0, 5.0);
	}
}
```

To get the SoftClassPath to your new variant, use

```cpp
SomeBlueprintSoftClass = UMyBlueprintClassVariant.DefaultObject.VariantClassPath
```

This will output a stable `SoftClassPtr` that will be populated after the script compilation finished.