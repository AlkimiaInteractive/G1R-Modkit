UCLASS()
class UFloorSinking_FireGolem : USpellProjectileDefinition
{
	default m_Name = "FloorSinking_FireGolem";

	default m_HitEffect = UGE_FloorSinkingDamage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 1.00f);

	default m_SuperArmorDamageBase = 0.0f;


	UPROPERTY()
	float m_CapsuleRadius = 50.f;
	UPROPERTY()
	float m_CapsuleHalfHeight = 200.f;

	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MinFloorHeight = -200.f;
	UPROPERTY(EditAnywhere, BlueprintReadWrite)
	float m_MaxFloorHeight = 50.f;

	default SetItemType(GameplayTag::Item_Weapon_Environment);


}

class UGE_FloorSinkingDamage : UGE_Damage_Fire_Infinite
{
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_FireStack::StaticClass()));
	//default m_ElementalEffectStack = UGE_FireStack::StaticClass();
}