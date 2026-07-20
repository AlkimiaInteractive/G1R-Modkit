UCLASS()
class USoulHarvest_Definition : USpellProjectileDefinition
{
	default m_Name = "SoulHarvest";
	default m_HitEffect = UGE_SoulHarvest_Damage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Energy, 60.0f);
	default m_ExplosionPath = n"Blueprint'/Game/Items/Magic/SkeletonMage/SoulHarvest/BP_SoulHarvest_Projectile_Explosion.BP_SoulHarvest_Projectile_Explosion_C'";
	default m_Speed = 340.f;
	UPROPERTY()
	float m_TurnSpeed = 20.f;

	UPROPERTY()
	float m_HeightTurnSpeed = 60.f;

	UPROPERTY()
	float m_HeightOffset = 20.f;

	default m_Radius = 1000.f;

	UPROPERTY()
	float m_MinSwitchTargetTime = 2.f;

	default m_LifeTime = 30.f;

	// default m_AimingAssistance.m_DetectionRadius = 60.f;
	// default m_AimingAssistance.m_MaxTurnAngle = 45.f;
	// default m_AimingAssistance.m_MinDistance = 200;
	// default m_AimingAssistance.m_MaxDistance = 2000;
	default m_AimingAssistance.m_enableAimingAssistance = false;

	UPROPERTY()
	bool m_EnableDebug = false;

}
