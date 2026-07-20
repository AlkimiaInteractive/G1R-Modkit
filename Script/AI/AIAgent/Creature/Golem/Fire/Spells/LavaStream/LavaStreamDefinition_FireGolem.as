UCLASS()
class ULavaStream_FireGolem : UWeaponDefinition
{
	default m_Name = "LavaStream_FireGolem";

	default m_HitEffect = UGE_LavaStreamDamage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 60.00f);

	default SetItemType(GameplayTag::Item_Weapon_Environment);
	default AddItemSpec(GameplayTag::Item_Property_NonLoot);

	default m_SuperArmorDamageBase = 0.0f;


	UPROPERTY()
	float m_CapsuleRadius = 100.f;
	UPROPERTY()
	float m_CapsuleHalfHeight = 150.f;


}

class UGE_LavaStreamDamage : UGE_Damage_Fire_Infinite
{
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_FireStack::StaticClass(), true));
	//default m_ElementalEffectStack = UGE_FireStack::StaticClass();
}