class UFireBallDefinition_Base_Orc : UFireBallProjectileDefinition_Lvl3 
{
	default m_Name = "FireBall_Base";
	// default m_HitEffect = UGE_BallLightning_Damage::StaticClass();
	default m_HitEffect = UGE_FireBall_Lvl1_Damage::StaticClass();
	//default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Energy, 0.f); 
	default m_Speed = 2600.f;
	// default m_ExplosionPath = n"Blueprint'/Game/Items/Magic/BallLightning/BP_BallLightning_Explosion.BP_BallLightning_Explosion_C'";
	default m_ExplosionPath = n"Blueprint'/Game/Assets/VFX/Particles/FireExplosions/Blueprints/BP_Fireball_Explosion.BP_Fireball_Explosion_C'";
	//default m_CoolDownActorTime = 1.5f;
	
}


UCLASS()
class UFireBallDefinition_Orc_Lvl4 : UFireBallDefinition_Base_Orc
{
	default m_Name = "FireBall_Orc_Lvl4";
	default m_HitEffect = UGE_FireBall_Lvl3_Damage::StaticClass();
	default m_DamageBase.Empty();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 120.0f);
	default m_SuperArmorDamageBase = 100.0f;
	default m_Speed = 3000.0f;
	default m_ExplosionPath = n"Blueprint'/Game/Assets/VFX/Particles/FireExplosions/Blueprints/BP_Fireball_Explosion.BP_Fireball_Explosion_C'";
	default m_Radius = 50.0f;
	default m_RadiusHitSphere = 25.0f;
	default m_DefaultTargetDistance = 100000;
}