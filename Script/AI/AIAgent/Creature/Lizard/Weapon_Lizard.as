
UCLASS()
class ULizardJaw : UMeleeWeaponBase_Creature
{
    default m_Name = "Lizard_Jaw";
    default m_OnEquipEffect = UGE_Lizard_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Weapon_Jaw);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 9);
	default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 9);
    default m_DamageReduction = 5.0;
	default m_SuperArmorDamageBase = 30.0f;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;
}

// UCLASS()
// class ULizardFire : UMeleeWeaponBase_Creature
// {
//     default m_Name = "Lizard_Fire";
//     default m_OnEquipEffect = UGE_Lizard_Equip::StaticClass();

//     default SetItemType(GameplayTag::Item_Weapon);
// 	default AddItemSpec(GameplayTag::Item_Property_NonLoot);

//     default m_HitEffect = UGE_Damage_Fire_Lizard::StaticClass();
// 	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 1.00f);
// 	default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 9);
// 	default m_SuperArmorDamageBase = 80.0f;

// 	// Super Armor
// 	default m_StartRegenerateSc = 5.0f;
// 	default m_HpRegenerateTick = 20.0f;
// 	default m_BlockSuperArmorMultiplier = 1.0f;
// }

UCLASS()
class UFireLizard_FlameThrower : UMeleeWeaponBase_Creature
{
    default m_Name = "FireLizard_FlameThrower";
    //default m_OnEquipEffect = UGE_Lizard_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Weapon);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);
	default AddItemSpec(GameplayTag::Item_Range_Long);
	default RemoveItemSpec(GameplayTag::Item_Range_Melee);

    default m_HitEffect = UGE_Damage_Fire_Lizard::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 1.00f);

	default m_SuperArmorDamageBase = 0.0f;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;
}