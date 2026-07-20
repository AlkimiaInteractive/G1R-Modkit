class UWorldFallImpactWeapon : UWorldImpactWeapon
{
	default m_Name = "UWorldFallImpactWeapon";

    default SetItemType(GameplayTag::Item_Weapon_Environment_Impact_Fall);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);

    default m_HitEffect = UGE_WorldFallDamage::StaticClass();
    default m_DamageBase.Add(GameplayTag::Item_Damage_Impact_Falling, 1);
	//default m_SuperArmorDamageBase = 20.0f;  
}