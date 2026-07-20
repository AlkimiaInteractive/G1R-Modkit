
UCLASS()
class UGolemWeapon : UMeleeWeaponBase_Creature
{
    default m_Name = "Golem_Weapon";
    default m_OnEquipEffect = UGE_Golem_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Weapon_Jaw);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 20);
    default m_DamageReduction = 5.0;
	default m_SuperArmorDamageBase = 200.0f;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;

    default m_ItemVisual = n"Blueprint'/Game/Items/Magic/Golem/Weapon/BP_Golem_Keywords_Weapon_Visual.BP_Golem_Keywords_Weapon_Visual_C'";
}

UCLASS()
class UFireGolemWeapon : UGolemWeapon
{
    default m_Name = "Fire_Golem_Weapon";

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 20); //80);
    default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 20);
    default m_DamageReduction = 5.0;
	default m_SuperArmorDamageBase = 50.0f;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;

    default m_ActionsKeywords.Add(USpellActionKeywords_GolemWeapon_BreakFloor_FireGolem::StaticClass());
    //default m_OnEquipEffect = UGE_EquipAbilitiesWhen_GolemWeapon_BreakFloor_FireGolem::StaticClass(); // Only for test purposes 

    //default m_HitCueDataByDamageType.Add(GameplayTag::Item_Damage_Physical, GameplayTag::GameplayCue_Combat_MeleeHit_Golem_Fire);
}

UCLASS()
class UIceGolemWeapon : UGolemWeapon
{
    default m_Name = "Ice_Golem_Weapon";
    default m_OnEquipEffect = UGE_Golem_Equip::StaticClass();

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 20);
    default m_DamageReduction = 5.0;
	default m_SuperArmorDamageBase = 50.0f;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;

    default m_ActionsKeywords.Add(USpellActionKeywords_GolemWeapon_IceWave_IceGolem::StaticClass());
   	default m_ActionsKeywords.Add(USpellActionKeywords_GolemWeapon_IceBolt_IceGolem::StaticClass());
    //default m_OnEquipEffect = UGE_EquipAbilitiesWhen_GolemWeaponEquip_IceWave_IceGolem::StaticClass(); // Only for test purposes 
    //default m_OnEquipEffect = UGE_EquipAbilitiesWhen_GolemWeaponEquip_IceBolt_IceGolem::StaticClass(); // Only for test purposes 

    //default m_HitCueDataByDamageType.Add(GameplayTag::Item_Damage_Physical, GameplayTag::GameplayCue_Combat_MeleeHit_Golem_Ice);
}

UCLASS()
class UStoneGolemWeapon : UGolemWeapon
{
    default m_Name = "Stone_Golem_Weapon";
    default m_OnEquipEffect = UGE_Golem_Equip::StaticClass();

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 20);
    default m_DamageReduction = 5.0;
	default m_SuperArmorDamageBase = 50.0f;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;

    default m_ActionsKeywords.Add(USpellActionKeywords_GolemWeapon_StoneWave_StoneGolem::StaticClass());
    default m_ActionsKeywords.Add(USpellActionKeywords_GolemWeapon_Teleport_StoneGolem::StaticClass());
    //default m_OnEquipEffect = UGE_EquipAbilitiesWhen_GolemWeapon_StoneWave_StoneGolem::StaticClass(); // Only for test purposes 
    //default m_OnEquipEffect = UGE_EquipAbilitiesWhen_GolemWeaponEquip_Teleport_StoneGolem::StaticClass(); // Only for test purposes 

    //default m_HitCueDataByDamageType.Add(GameplayTag::Item_Damage_Physical, GameplayTag::GameplayCue_Combat_MeleeHit_Golem_Stone);
}

UCLASS()
class UStoneGolemWeapon_Small : UGolemWeapon
{
    default m_Name = "Stone_Golem_Weapon";
    default m_OnEquipEffect = UGE_Golem_Equip::StaticClass();

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 20);
    default m_DamageReduction = 5.0;
	default m_SuperArmorDamageBase = 50.0f;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;

    default m_ActionsKeywords.Add(USpellActionKeywords_GolemWeapon_StoneWave_StoneGolem_Small::StaticClass());
    default m_ActionsKeywords.Add(USpellActionKeywords_GolemWeapon_Teleport_StoneGolem::StaticClass());
    //default m_OnEquipEffect = UGE_EquipAbilitiesWhen_GolemWeapon_StoneWave_StoneGolem::StaticClass(); // Only for test purposes 
    //default m_OnEquipEffect = UGE_EquipAbilitiesWhen_GolemWeaponEquip_Teleport_StoneGolem::StaticClass(); // Only for test purposes 

    //default m_HitCueDataByDamageType.Add(GameplayTag::Item_Damage_Physical, GameplayTag::GameplayCue_Combat_MeleeHit_Golem_Stone);
}

UCLASS()
class UGolemStoneRock : UProjectileDefinition
{
    default m_Name = "GolemStone_Rock";
    default m_OnEquipEffect = UGE_Golem_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Projectile_Right);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default AddItemSpec(GameplayTag::Item_Range_Long);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 20);
	default m_SuperArmorDamageBase = 50.0f;

	default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItAm_GolemStone_Rock_Visual.BP_ItAm_GolemStone_Rock_Visual_C'";
}

UCLASS()
class UGolemFireRock : UProjectileDefinition
{
    default m_Name = "GolemFire_Rock";
    default m_OnEquipEffect = UGE_Golem_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Projectile_Right);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default AddItemSpec(GameplayTag::Item_Range_Long);

    default m_HitEffect = UGE_FireRock_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 20); //80);
    default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 10);
	default m_SuperArmorDamageBase = 40.0f;

	default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItAm_GolemFire_Rock_Visual.BP_ItAm_GolemFire_Rock_Visual_C'";
}

UCLASS()
class UGolemIceGrenade : UProjectileDefinition
{
    default m_Name = "GolemIce_Grenade";
    default m_OnEquipEffect = UGE_Golem_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Projectile_Right);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default AddItemSpec(GameplayTag::Item_Range_Long);

    default m_HitEffect = UGE_IceGrenade_Freeze_Damage::StaticClass();
    // default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 20);
    default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Ice, 1);
	default m_SuperArmorDamageBase = 0.0f;

	default m_ItemVisual = n"Blueprint'/Game/Items/Misc/BP_ItAm_GolemIce_Grenade_Visual.BP_ItAm_GolemIce_Grenade_Visual_C'";
}

UCLASS()
class UGolemStone_PHWave : UProjectileDefinition //To be deleted once wave works correctly
{
    default m_Name = "GolemStone_PHWave";
    default m_OnEquipEffect = UGE_Golem_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Projectile_Left);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default AddItemSpec(GameplayTag::Item_Range_Long);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 1);
	default m_SuperArmorDamageBase = 100.0f;

	default m_ItemVisual = n"Blueprint'/Game/AnimLibrary/Creatures/Stone_Golem/Combat/Attacks/Placeholders/PH_Golem_Stone_Wave.PH_Golem_Stone_Wave_C'";
}