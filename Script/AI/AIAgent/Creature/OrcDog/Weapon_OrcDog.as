
UCLASS()
class UOrcDogJaw : UMeleeWeaponBase_Creature
{
    default m_Name = "OrcDog_Jaw";
    default m_OnEquipEffect = UGE_OrcDog_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Weapon_Jaw);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 17); // 9);
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 17); // 9);
    default m_DamageReduction = 5.0;
	default m_SuperArmorDamageBase = 30.0f;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;
}