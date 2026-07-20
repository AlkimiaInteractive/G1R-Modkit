UCLASS()
class UIceBoltProjectileDefinition_IceGolem : UIceBoltProjectileDefinition
{
	default m_Name = "IceBolt_IceGolem";
	default m_HitEffect = UGE_IceBolt_Damage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Ice, 30.0f);
	default m_ExplosionPath = n"Blueprint'/Game/Assets/VFX/Particles/GenericExplosions/Blueprints/BP_IceboltExplosion.BP_IceboltExplosion_C'";
	default m_Speed = 2750.f;
	default m_Radius = 15.0f;

	default m_CriticalWeakSpotsTags.AddTag(GameplayTag::Body_WeakSpot);
	default m_CriticalMultiplier = 1.0f;

	default m_AimingAssistance.m_DetectionRadius = 250.f; //60
	default m_AimingAssistance.m_MaxTurnAngle = 10.f; //45
	default m_AimingAssistance.m_MinDistance = 2;
	default m_AimingAssistance.m_MaxDistance = 2000;
	default m_AimingAssistance.m_enableAimingAssistance = true;
}

UCLASS()
class UIceBoltProjectileDefinition_MiniIceGolem : UIceBoltProjectileDefinition
{
	default m_Name = "IceBolt_IceGolem";
	default m_HitEffect = UGE_IceBolt_Damage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Ice, 10.0f);
	default m_ExplosionPath = n"Blueprint'/Game/Assets/VFX/Particles/GenericExplosions/Blueprints/BP_IceboltExplosion.BP_IceboltExplosion_C'";
	default m_Speed = 2750.f;
	default m_Radius = 15.0f;

	default m_CriticalWeakSpotsTags.RemoveTag(GameplayTag::Body_WeakSpot);
	default m_CriticalMultiplier = 1.0f;

	default m_AimingAssistance.m_DetectionRadius = 250.f; //60
	default m_AimingAssistance.m_MaxTurnAngle = 10.f; //45
	default m_AimingAssistance.m_MinDistance = 2;
	default m_AimingAssistance.m_MaxDistance = 2000;
	default m_AimingAssistance.m_enableAimingAssistance = true;
}