namespace BlueprintVariantAssets
{
	UStaticMesh GetSwordMesh()
	{
		return Cast<UStaticMesh>(LoadObject(nullptr, "/Game/Assets/Items/Weapons/2Handed/SM_ItMw_2H_Uriziel.SM_ItMw_2H_Uriziel"));
	}

	UNiagaraSystem GetFireSystem()
	{
		return Cast<UNiagaraSystem>(LoadObject(nullptr, "/Game/Assets/VFX/Particles/FireExplosions/P_Torch_01_Opt_NS.P_Torch_01_Opt_NS"));
	}

	UMaterialInterface GetFireMaterial()
	{
		return Cast<UMaterialInterface>(LoadObject(nullptr, "/Game/Assets/Environment/World_Zones/GolemsZone/00_Materials/MI_FireGolemMagma_V2.MI_FireGolemMagma_V2"));
	}
}

// Held visual: mesh is the native MeshComp on AMeleeWeaponVisual, the fire FX gets added on top.
class UBlueprintVariant_MyFireSwordVisual : UGothicModExt_BlueprintClassVariant
{
	default SourceClass = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Bastard_02_Visual.BP_ItMw_1H_Sword_Bastard_02_Visual_C'";

	UFUNCTION(BlueprintOverride)
	void ModifyVariant()
	{
		UStaticMeshComponent Mesh = GetComponentFromTemplate(UStaticMeshComponent);

		if (IsValid(Mesh))
		{
			Mesh.StaticMesh = BlueprintVariantAssets::GetSwordMesh();
			Mesh.RelativeScale3D = FVector(5.0, 5.0, 5.0);

			for (int i = 0; i < Mesh.GetNumMaterials(); i++)
				Mesh.SetMaterial(i, BlueprintVariantAssets::GetFireMaterial());
		}

		// Inherited SCS component from the base Blueprint - goes through the ICH override path.
		UHitCapsuleCollisionComponent HitBox = GetComponentFromTemplate(UHitCapsuleCollisionComponent, n"HitBoxCollision_Weapon");

		if (IsValid(HitBox))
			HitBox.CapsuleRadius = 40.0f;

		UNiagaraComponent FireFX = AddComponentToTemplate(UNiagaraComponent, n"FireFX", Mesh.Name);

		FireFX.Asset = BlueprintVariantAssets::GetFireSystem();
		FireFX.RelativeLocation = FVector(0.0, 0.0, 40.0);
		FireFX.RelativeScale3D = FVector(1.0, 1.0, 5.0);
	}
}

// World visual: mesh is the native StaticMeshComponent inherited from AItemVisualWorld.
class UBlueprintVariant_MyFireSwordVisualWorld : UGothicModExt_BlueprintClassVariant
{
	default SourceClass = n"Blueprint'/Game/Items/Weapon/1Handed/BP_ItMw_1H_Sword_Bastard_02_World.BP_ItMw_1H_Sword_Bastard_02_World_C'";

	UFUNCTION(BlueprintOverride)
	void ModifyVariant()
	{
		UStaticMeshComponent Mesh = GetComponentFromTemplate(UStaticMeshComponent);

		if (IsValid(Mesh))
		{
			Mesh.StaticMesh = BlueprintVariantAssets::GetSwordMesh();

			for (int i = 0; i < Mesh.GetNumMaterials(); i++)
				Mesh.SetMaterial(i, BlueprintVariantAssets::GetFireMaterial());
		}

		UNiagaraComponent FireFX = AddComponentToTemplate(UNiagaraComponent, n"FireFX");

		FireFX.Asset = BlueprintVariantAssets::GetFireSystem();
		FireFX.SetRelativeLocation(FVector(0.0, 0.0, 40.0));
		FireFX.SetRelativeScale3D(FVector(1.0, 1.0, 5.0));
	}
}

UCLASS()
class UItMw_1H_Sword_BlueprintVariant_Example : USword1H
{
	default m_Name = FText::FromString("Comically Large Fire Sword");
	default m_Description = FText::FromString("Built via BlueprintClassVariant");
	default m_Value = 9999;
	default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 50.0f);
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 500.0f);
	default m_SuperArmorDamageBase = 25;
	default m_ItemVisual = UBlueprintVariant_MyFireSwordVisual.DefaultObject.VariantClassPath;
	default m_ItemVisualWorld = UBlueprintVariant_MyFireSwordVisualWorld.DefaultObject.VariantClassPath;
	default m_Icon = "/Game/UI/Textures/ItemIcons/T_ItemIcon_ItMw_1H_Sword_01.T_ItemIcon_ItMw_1H_Sword_01";
	default SetItemType(GameplayTag::Item_Weapon_Sword_OneHand);
	default AddItemSpec(GameplayTag::Item_Property_Equipable);
	default m_RequiredStats.Add(GetAttribute(UAttributeSet_Strength, n"Strength"), 1.0f);
}

// Inject into the base game player so the new sword is in the start inventory.
UCLASS(meta = (ReplaceParentClass))
class UG1RPlayer_ExampleBlueprintVariant : UG1RPlayer
{
	default AddToInventory(UItMw_1H_Sword_BlueprintVariant_Example);
}
