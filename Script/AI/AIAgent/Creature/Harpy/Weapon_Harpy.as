UCLASS()
class UHarpyClaws_Grounded : UMeleeWeaponBase_Creature
{
    default m_Name = "HarpyClaws_Grounded";

    default m_OnEquipEffect = UGE_Harpy_Equip_Grounded::StaticClass();

    default SetItemType(GameplayTag::Item_Weapon_Claw_Grounded);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);
	default AddItemSpec(GameplayTag::Character_CantStrafe);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 9);
    default m_DamageReduction = 5.0;
	default m_SuperArmorDamageBase = 30.0f;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;
}

UCLASS()
class UHarpyClaws_Flying : UMeleeWeaponBase_Creature
{
    default m_Name = "HarpyClaws_Flying";

    default m_OnEquipEffect = UGE_Harpy_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Weapon_Claw_Flying);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);
	default AddItemSpec(GameplayTag::Item_Property_Environment_Air_Flying);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 9);
    default m_DamageReduction = 5.0;
	default m_SuperArmorDamageBase = 30.0f;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;
}


UCLASS()
class UHarpyThrowWing : UProjectileDefinition
{
    default m_Name = "Harpy_ThrowWing";
    default m_OnEquipEffect = UGE_Harpy_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Projectile);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Point, 9);
	default m_SuperArmorDamageBase = 20.0f;

	default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItAm_Harpy_Wing_Visual.BP_ItAm_Harpy_Wing_Visual_C'";
}