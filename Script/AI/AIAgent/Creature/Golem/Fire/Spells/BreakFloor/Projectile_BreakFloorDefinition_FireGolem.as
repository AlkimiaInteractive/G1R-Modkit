UCLASS()
class UBreakFloorDefinition_FireGolem_Base : USpellProjectileDefinition
{
	default m_Name = "BreakFloor_FireGolem";

	default m_HitEffect = UGE_BreakFloorDamage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 90.0f);
	// default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 0.00f);

	default m_SuperArmorDamageBase = 0.0f;

	default m_LifeTime = 7.0f;


	// UPROPERTY()
	// float  m_ConeLengthMeters = 1000.0f;
    // UPROPERTY()
	// float m_ConeHalfAngleDegrees = 5.0f; //25

	// UPROPERTY()
	// float m_ConeLengthSpeed = 700.0f; //400

}

UCLASS()
class UBreakFloorDefinition_FireGolem_Cone : UBreakFloorDefinition_FireGolem_Base
{

	UPROPERTY()
	float  m_ConeLengthMeters = 1000.0f;
    UPROPERTY()
	float m_ConeHalfAngleDegrees = 5.0f; //25

	UPROPERTY()
	float m_ConeLengthSpeed = 700.0f; //400

}

//@DE - We are using this version.
UCLASS()
class UBreakFloorDefinition_FireGolem_Box : UBreakFloorDefinition_FireGolem_Base
{

	UPROPERTY()
	FVector m_BoxExtent = FVector(540, 100, 40);

	UPROPERTY()
	float m_BoxGrowSpeed = 350.0f; //400

}


class UGE_BreakFloorDamage : UGE_Damage_Fire_Infinite
{
	default m_ElementalEffectStacks.Add(FElementalEffectStackData(UGE_FireStack::StaticClass()));
	//default m_ElementalEffectStack = UGE_FireStack::StaticClass();
}