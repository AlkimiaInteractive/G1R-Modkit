UCLASS()
class UHeatedState_FireGolem : USpellProjectileDefinition
{
	default m_Name = "HeatedState_FireGolem";

	default m_HitEffect = UGE_HeatedStateDamage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 50.00f);

	default m_SuperArmorDamageBase = 0.0f;

	UPROPERTY()
	float m_SphereRadius = 100.0f;


}

class UGE_HeatedStateDamage : UGE_Damage_Fire_Infinite
{
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_FireStack::StaticClass()));
	//default m_ElementalEffectStack = UGE_FireStack::StaticClass();
}