
UCLASS()
class ULurkerJaw : UMeleeWeaponBase_Creature
{
    default m_Name = "Lurker_Jaw";
    default m_OnEquipEffect = UGE_Lurker_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Weapon_Jaw);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 9);
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 9);
    default m_DamageReduction = 5.0;
	default m_SuperArmorDamageBase = 25.0f;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;
}

UCLASS()
class ULurkerTail : UMeleeWeaponBase_Creature
{
    default m_Name = "Lurker_Tail";
    default m_OnEquipEffect = UGE_Lurker_Equip_Swimming::StaticClass();

    default SetItemType(GameplayTag::Item_Weapon_Swimming);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);
	default AddItemSpec(GameplayTag::Item_Property_Environment_Water_Swimming_Underwater);
	default AddItemSpec(GameplayTag::Item_Property_Environment_Water_Swimming_Surface);
    default AddItemSpec(GameplayTag::Item_Property_MustForceUnequip);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 9);
    default m_DamageReduction = 5.0;
	default m_SuperArmorDamageBase = 25.0f;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;
}