
UCLASS()
class UWeapon_Pyrolaser_Base : UMeleeWeaponBase_Creature
{
    default m_Name = "Weapon_Pyrolaser_Base";
    //default m_OnEquipEffect = UGE_Lizard_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Weapon);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);
	default AddItemSpec(GameplayTag::Item_Range_Long);
	
	default RemoveItemSpec(GameplayTag::Item_Range_Melee);
	

    default m_HitEffect = UGE_Pyrolaser_Damage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 50.00f);

	default m_SuperArmorDamageBase = 20.0f;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;
}