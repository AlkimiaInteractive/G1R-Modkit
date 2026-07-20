class UWorldDrownWeapon : UWorldImpactWeapon
{
	default m_Name = "UWorldDrownWeapon";

    default SetItemType(GameplayTag::Item_Weapon_Environment_Water_Drown);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);
    default m_HitEffect = UGE_Damage::StaticClass();

    default m_DamageBase.Add(GameplayTag::Item_Damage_Environment_Drown, 2);
}