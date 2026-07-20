UCLASS()
class UTrollWeapon : UMeleeWeaponBase_Creature
{
    default m_Name = "Troll_Weapon";
    default m_OnEquipEffect = UGE_Troll_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Weapon_Jaw);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 9);
    default m_DamageReduction = 5.0;
	default m_SuperArmorDamageBase = 80.0f;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;
}

UCLASS()
class UTrollThrowGoblinProjectile : UProjectileDefinition
{
    default m_Name = "TrollThrowGoblinProjectile";
    default m_OnEquipEffect = UGE_Troll_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Projectile_Right);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);
     default AddItemSpec(GameplayTag::Item_Range_Long);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 20);
	default m_SuperArmorDamageBase = 40.0f;

	default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItAm_AdultTroll_Character_Projectile_Visual.BP_ItAm_AdultTroll_Character_Projectile_Visual_C'";
}

UCLASS()
class UTrollThrowRockProjectile : UProjectileDefinition
{
    default m_Name = "TrollThrowRockProjectile";
    default m_OnEquipEffect = UGE_Troll_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Projectile);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 20);
	default m_SuperArmorDamageBase = 40.0f;

	default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItAm_AdultTroll_Projectile_Visual.BP_ItAm_AdultTroll_Projectile_Visual_C'";
}

UCLASS()
class UTrollThrowBigRockProjectile : UProjectileDefinition
{
    default m_Name = "TrollThrowBigRockProjectile";
    default m_OnEquipEffect = UGE_Troll_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Projectile);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 20);
	default m_SuperArmorDamageBase = 50.0f;

	default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItAm_AdultTroll_ProjectileBig_Visual.BP_ItAm_AdultTroll_ProjectileBig_Visual_C'";
    
}