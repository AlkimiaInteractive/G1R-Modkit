UCLASS()
class USwampsharkJaw : UMeleeWeaponBase_Creature
{
    default m_Name = "Swampshark_Jaw";
    default m_OnEquipEffect = UGE_Swampshark_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Weapon_Jaw);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);
	// default AddItemSpec(GameplayTag::Item_Property_Environment_Water);
	// default AddItemSpec(GameplayTag::Item_Property_Environment_Water_Swimming_Underwater);
	// default AddItemSpec(GameplayTag::Item_Property_Environment_Water_Walking);
	// default AddItemSpec(GameplayTag::Item_Property_Environment_Water_Swimming_Surface);


    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 9);
    default m_DamageReduction = 5.0;
	default m_SuperArmorDamageBase = 70.0f;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;
}