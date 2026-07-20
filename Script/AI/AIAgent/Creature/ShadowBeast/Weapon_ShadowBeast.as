UCLASS()
class UShadowBeastWeapon : UMeleeWeaponBase_Creature
{
    default m_Name = "ShadowBeast_Weapon";
    default m_OnEquipEffect = UGE_ShadowBeast_Equip::StaticClass();

    default SetItemType(GameplayTag::Item_Weapon_Jaw);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);

    default m_HitEffect = UGE_Damage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Blunt, 80);
    default m_DamageBase.Add(GameplayTag::Item_Damage_Physical_Edge, 60);
    default m_DamageReduction = 5.0;
	default m_SuperArmorDamageBase = 70.0f;

	// Super Armor
	default m_StartRegenerateSc = 5.0f;
	default m_HpRegenerateTick = 20.0f;
	default m_BlockSuperArmorMultiplier = 1.0f;
}