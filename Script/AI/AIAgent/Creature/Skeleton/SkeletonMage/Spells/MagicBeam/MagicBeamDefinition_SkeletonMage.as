UCLASS()
class UMagicBeamDefinition_SkeletonMage : USpellProjectileDefinition
{
	default m_Name = "MagicBeamDefinition_SkeletonMage";

	default m_HitEffect = UGE_LavaStreamDamage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Energy, 50.00f);

	default m_SuperArmorDamageBase = 0.0f;


	UPROPERTY()
	float m_CapsuleRadius = 30.f;
	UPROPERTY()
	float m_CapsuleHalfHeight = 1500.f;

	UPROPERTY()
	float m_LifeSpan = 10.f;


}
