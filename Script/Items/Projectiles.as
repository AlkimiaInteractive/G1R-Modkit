// ------- SPELL PROJECTILES ------ //
UCLASS()

//Common behaviours for the BallLightning 
class UBallLightningDefinition_Base : USpellProjectileDefinition
{
	default m_Name = "BallLightning_Base";
	default m_HitEffect = UGE_BallLightning_Damage::StaticClass();
	//default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Energy, 0.f); 
	default m_ExplosionPath = n"Blueprint'/Game/Items/Magic/BallLightning/BP_BallLightning_Explosion.BP_BallLightning_Explosion_C'";
	
	float m_CoolDownActorTime = 1.5f;
	
	default m_AimingAssistance.m_DetectionRadius = 80.f;
	default m_AimingAssistance.m_MaxTurnAngle = 45.f;
	default m_AimingAssistance.m_MinDistance = 800;
	default m_AimingAssistance.m_MaxDistance = 2000;
	default m_AimingAssistance.m_enableAimingAssistance = true;
	default m_MovementEffect = GameplayTag::FX_Magic_Projectile_LightningBall_Moving;
	default AddCollisionEffect(GameplayTag::FX_Magic_Projectile_LightningBall_Impact);
}

UCLASS()
//Specific behaviour for the BallLightning Level 1
class UBallLightningDefinition_Lvl1 : UBallLightningDefinition_Base
{
	default m_Name = "BallLightning_Lvl1";
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Energy, 70.0f);
	default m_Speed = 300.f;
	default m_Radius = 25.f;
	default m_LifeTime = 4.f;

	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Energy, GameplayTag::Skill_Mage_Circle_Fourth, 90.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Energy, GameplayTag::Skill_Mage_Circle_Fifth, 110.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Energy, GameplayTag::Skill_Mage_Circle_Sixth, 130.0f);
}

UCLASS()
class UBallLightningDefinition_Lvl2 : UBallLightningDefinition_Base
{
	default m_Name = "BallLightning_Lvl2";
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Energy, 90.0f);
	default m_Speed = 350.f;
	default m_Radius = 40.f;
	default m_LifeTime = 6.f;

	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Energy, GameplayTag::Skill_Mage_Circle_Fourth, 110.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Energy, GameplayTag::Skill_Mage_Circle_Fifth, 130.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Energy, GameplayTag::Skill_Mage_Circle_Sixth, 150.0f);
}
UCLASS()
class UBallLightningDefinition_Lvl3 : UBallLightningDefinition_Base
{
	default m_Name = "BallLightning_Lvl3";
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Energy, 110.0f);
	default m_Speed = 400.f;
	default m_Radius = 55.f;
	default m_LifeTime = 8.f;

	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Energy, GameplayTag::Skill_Mage_Circle_Fourth, 130.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Energy, GameplayTag::Skill_Mage_Circle_Fifth, 150.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Energy, GameplayTag::Skill_Mage_Circle_Sixth, 170.0f);
}
UCLASS()
class UBallLightningDefinition_Lvl4 : UBallLightningDefinition_Base
{
	default m_Name = "BallLightning_Lvl4";
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Energy, 150.0f);
	default m_Speed = 450.f;
	default m_Radius = 70.f;
	default m_LifeTime = 10.f;

	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Energy, GameplayTag::Skill_Mage_Circle_Fourth, 170.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Energy, GameplayTag::Skill_Mage_Circle_Fifth, 200.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Energy, GameplayTag::Skill_Mage_Circle_Sixth, 220.0f);
}

UCLASS()
class UIceBoltProjectileDefinition : USpellProjectileDefinition
{
	default m_Name = "IceBolt";
	default m_HitEffect = UGE_IceBolt_Damage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Ice, 20.0f);

	default m_CriticalWeakSpotsTags.AddTag(GameplayTag::Body_WeakSpot);
	default m_CriticalMultiplier = 1.5f;

	default m_ExplosionPath = n"Blueprint'/Game/Assets/VFX/Particles/GenericExplosions/Blueprints/BP_IceboltExplosion.BP_IceboltExplosion_C'";
	default m_Speed = 4000.f;

	default m_AimingAssistance.m_DetectionRadius = 50.f;
	default m_AimingAssistance.m_MaxTurnAngle = 45.f;
	default m_AimingAssistance.m_MinDistance = 1500;
	default m_AimingAssistance.m_MaxDistance = 4000;
	default m_AimingAssistance.m_enableAimingAssistance = true;
	default AddCollisionEffect(GameplayTag::FX_Magic_Projectile_IceBolt_Impact);
	default m_MovementEffect = GameplayTag::FX_Magic_Projectile_IceBolt_Moving;

	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Ice, GameplayTag::Skill_Mage_Circle_Second, 30.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Ice, GameplayTag::Skill_Mage_Circle_Fourth, 40.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Ice, GameplayTag::Skill_Mage_Circle_Sixth, 50.0f);
}


UCLASS()
class UFireBoltProjectileDefinition : USpellProjectileDefinition
{
	default m_Name = "FireBolt";
	default m_HitEffect = UGE_FireBolt_Damage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 35.0f);

	default m_CriticalWeakSpotsTags.AddTag(GameplayTag::Body_WeakSpot);
	default m_CriticalMultiplier = 1.5f;

	default m_SuperArmorDamageBase = 30.0f;
	default m_Speed = 4000.0f;
	default m_ExplosionPath = n"Blueprint'/Game/Assets/VFX/Particles/FireExplosions/Blueprints/BP_Firebolt_Explosion.BP_Firebolt_Explosion_C'";

	default m_AimingAssistance.m_DetectionRadius = 50.f;
	default m_AimingAssistance.m_MaxTurnAngle = 45.f;
	default m_AimingAssistance.m_MinDistance = 1500;
	default m_AimingAssistance.m_MaxDistance = 4000;
	default m_AimingAssistance.m_enableAimingAssistance = true;
	
	//default AddCollisionEffect(GameplayTag::FX_Magic_Projectile_IceBolt_Impact);
	//default m_MovementEffect = GameplayTag::FX_Magic_Projectile_IceBolt_Moving;

	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Fire, GameplayTag::Skill_Mage_Circle_Second, 40.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Fire, GameplayTag::Skill_Mage_Circle_Fourth, 50.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Fire, GameplayTag::Skill_Mage_Circle_Sixth, 65.0f);
}

UCLASS()
class UFireBallProjectileDefinition_Base : USpellProjectileDefinition
{
	UPROPERTY(BlueprintReadOnly, VisibleAnywhere)
	float m_RadiusHitSphere = 10.0f;
}

UCLASS()
class UFireBallProjectileDefinition_Lvl1 : UFireBallProjectileDefinition_Base
{
	default m_Name = "FireBall_lvl1";
	default m_HitEffect = UGE_FireBall_Lvl1_Damage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 90.0f);

	default m_CriticalWeakSpotsTags.AddTag(GameplayTag::Body_WeakSpot);
	default m_CriticalMultiplier = 1.5f;

	default m_SuperArmorDamageBase = 20.0f;
	default m_Speed = 3000.0f;
	//Explosion firebolt is little than fireball explosion, so at level 1 and level 2 we put the firebolt explosion
	default m_ExplosionPath = n"Blueprint'/Game/Assets/VFX/Particles/FireExplosions/Blueprints/BP_Fireball_Explosion.BP_Fireball_Explosion_C'";
	default m_Radius = 10.0f;
	default m_RadiusHitSphere = 10.0f;
	default m_DefaultTargetDistance = 100000;

	default m_AimingAssistance.m_DetectionRadius = 70.f;
	default m_AimingAssistance.m_MaxTurnAngle = 45.f;
	default m_AimingAssistance.m_MinDistance = 1000;
	default m_AimingAssistance.m_MaxDistance = 2500;
	default m_AimingAssistance.m_enableAimingAssistance = true;
	default AddCollisionEffect(GameplayTag::FX_Magic_Projectile_FireBall_Level1_Impact);
	default m_MovementEffect = GameplayTag::FX_Magic_Projectile_FireBall_Level1_Moving;

	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Fire, GameplayTag::Skill_Mage_Circle_Fourth, 110.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Fire, GameplayTag::Skill_Mage_Circle_Fifth, 130.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Fire, GameplayTag::Skill_Mage_Circle_Sixth, 150.0f);
}

UCLASS()
class UFireBallProjectileDefinition_Lvl2 : UFireBallProjectileDefinition_Base
{
	default m_Name = "FireBall_lvl2";
	default m_HitEffect = UGE_FireBall_Lvl2_Damage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 110.0f);

	default m_CriticalWeakSpotsTags.AddTag(GameplayTag::Body_WeakSpot);
	default m_CriticalMultiplier = 1.5f;

	default m_SuperArmorDamageBase = 50.0f;
	default m_Speed = 3000.0f;
	//Explosion firebolt is little than fireball explosion, so at level 1 and level 2 we put the firebolt explosion
	default m_ExplosionPath = n"Blueprint'/Game/Assets/VFX/Particles/FireExplosions/Blueprints/BP_Fireball_Explosion.BP_Fireball_Explosion_C'";
	default m_Radius = 20.0f;
	default m_RadiusHitSphere = 10.0f;
	default m_DefaultTargetDistance = 100000;

	default m_AimingAssistance.m_DetectionRadius = 70.f;
	default m_AimingAssistance.m_MaxTurnAngle = 45.f;
	default m_AimingAssistance.m_MinDistance = 1000;
	default m_AimingAssistance.m_MaxDistance = 2500;
	default m_AimingAssistance.m_enableAimingAssistance = true;
	default AddCollisionEffect(GameplayTag::FX_Magic_Projectile_FireBall_Level2_Impact);
	default m_MovementEffect = GameplayTag::FX_Magic_Projectile_FireBall_Level2_Moving;

	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Fire, GameplayTag::Skill_Mage_Circle_Fourth, 130.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Fire, GameplayTag::Skill_Mage_Circle_Fifth, 150.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Fire, GameplayTag::Skill_Mage_Circle_Sixth, 170.0f);
}

class UFireBallProjectileDefinition_Lvl3 : UFireBallProjectileDefinition_Base
{
	default m_Name = "FireBall_lvl3";
	default m_HitEffect = UGE_FireBall_Lvl3_Damage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 130.0f);

	default m_CriticalWeakSpotsTags.AddTag(GameplayTag::Body_WeakSpot);
	default m_CriticalMultiplier = 1.5f;

	default m_SuperArmorDamageBase = 100.0f;
	default m_Speed = 3000.0f;
	default m_ExplosionPath = n"Blueprint'/Game/Assets/VFX/Particles/FireExplosions/Blueprints/BP_Fireball_Explosion.BP_Fireball_Explosion_C'";
	default m_Radius = 40.0f;
	default m_RadiusHitSphere = 15.0f;
	default m_DefaultTargetDistance = 100000;
	default m_AimingAssistance.m_DetectionRadius = 70.f;
	default m_AimingAssistance.m_MaxTurnAngle = 45.f;
	default m_AimingAssistance.m_MinDistance = 1000;
	default m_AimingAssistance.m_MaxDistance = 2500;
	default m_AimingAssistance.m_enableAimingAssistance = true;
	default AddCollisionEffect(GameplayTag::FX_Magic_Projectile_FireBall_Level3_Impact);
	default m_MovementEffect = GameplayTag::FX_Magic_Projectile_FireBall_Level3_Moving;

	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Fire, GameplayTag::Skill_Mage_Circle_Fourth, 150.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Fire, GameplayTag::Skill_Mage_Circle_Fifth, 170.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Fire, GameplayTag::Skill_Mage_Circle_Sixth, 200.0f);
}




// ------------------------------------------------ //

// ------- SPELL OBJECTS ------ //

UCLASS()
class UFireRainDefinition : USpellProjectileDefinition
{
	default m_Name = "FireRain";

	default m_HitEffect = UGE_FireRainDamage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 50.00f);

	default m_SuperArmorDamageBase = 0.0f;

	default m_LifeTime = 8.0f;

	UPROPERTY()
	float m_StormHeight = 800.f;

	UPROPERTY()
	float m_StormRadius = 2000.f;
	UPROPERTY()
	float m_PlayerProtectionRadius = 80.f;

	UPROPERTY()
	bool m_Enabled = true;
	UPROPERTY()
	bool m_Forced = false;
	UPROPERTY()
	int m_Probability = 2;

	UPROPERTY()
	int m_Min = 0;
	UPROPERTY()
	int m_Max = 100;

	UPROPERTY()
	int m_Key = 2;
	UPROPERTY()
	int m_Key2 = 4;

	UPROPERTY()
	int m_XOffset = 800;

	UPROPERTY()
	int m_YOffset = 800;
}

UCLASS()
class UInnosPrayDefinition : USpellProjectileDefinition
{
	default m_Name = "InnosPray";

	//default m_HitEffect = UGE_FireRainDamage::StaticClass();
	//default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 1.00f);

	default m_SuperArmorDamageBase = 0.0f;

	default m_LifeTime = 8.0f;

	UPROPERTY()
	float m_StormHeight = 800.f;

	UPROPERTY()
	float m_StormRadius = 1000.f;
	UPROPERTY()
	float m_PlayerProtectionRadius = 80.f;
}

UCLASS()
class UStormOfFireDefinition : USpellProjectileDefinition
{
	default m_Name = "StormFire";

	default m_HitEffect = UGE_StormOfFireDamage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 250.0f);
	default m_LifeTime = 8.0f;
	default m_ExplosionPath = n"Blueprint'/Game/Assets/VFX/Particles/FireExplosions/Blueprints/BP_StormOfFire_Explosion.BP_StormOfFire_Explosion_C'";
	default m_SuperArmorDamageBase = 10.0f;
	//default AddCollisionEffect(GameplayTag::FX_Magic_Projectile_Impact);

	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Fire, GameplayTag::Skill_Mage_Circle_Sixth, 300.0f);


	UPROPERTY()
	float InitialSpeed = 300.0f;

	default m_Speed = 300.0f;

	UPROPERTY()
	float SpawnOffset = 50.0f;
	UPROPERTY()
	float m_StormRadius = 100.f;
	UPROPERTY()
	float m_StormHeight = 800.f;

	UPROPERTY()
	float m_MovementCapsuleRadius = 35.f;
	UPROPERTY()
	float m_MovementCapsuleHeight = 50.f;

	UPROPERTY()
	float m_FloorOffset = 30.f;
}

UCLASS()
class ULightningRayDefinition_Base : USpellProjectileDefinition
{
	default m_Name = "LightingRay_Base";
	
	//default m_HitEffect = UGE_ChainLightning_Damage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Energy, 20.0f);

	UPROPERTY(BlueprintReadWrite, EditAnywhere)
	int m_MaxLinks = 3;

	UPROPERTY(BlueprintReadWrite, EditAnywhere)
	float m_FindLinkEachSeconds = 2.0f;

	UPROPERTY(BlueprintReadWrite, EditAnywhere)
	float m_AreaToFindNewTargetsCm = 500.0f;

	UPROPERTY(BlueprintReadWrite, EditAnywhere)
	float m_MaxDistanceRayCm = 1000.0f;

	UPROPERTY()
	TSubclassOf<UGameplayEffect> m_EffectOnRemoval = UGE_Paralyze_Cooldown::StaticClass();

	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Energy, GameplayTag::Skill_Mage_Circle_Fifth, 35.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Energy, GameplayTag::Skill_Mage_Circle_Sixth, 45.0f);
}

UCLASS()
class ULightningRayDefinition_WithParalysis : ULightningRayDefinition_Base
{
	default m_Name = "LightingRay_WithParalysis";
	
	default m_HitEffect = UGE_ChainLightning_WithParalysis_Damage::StaticClass();
}

UCLASS()
class ULightningRayDefinition_WithoutParalysis : ULightningRayDefinition_Base
{
	default m_Name = "LightingRay_WithoutParalysis";
	default m_HitEffect = UGE_ChainLightning_WithoutParalysis_Damage::StaticClass();
}

UCLASS()
class UWindProjectile_Base : USpellProjectileDefinition
{
}

UCLASS()
class UWindFistDefinition : UWindProjectile_Base
{
	default m_Name = "WindFist";

	default m_HitEffect = UGE_Wind_Damage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Impact_Wind, 20.0f);
	default m_LifeTime = 10.0f;

	default m_SuperArmorDamageBase = 200.f;

	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Impact_Wind, GameplayTag::Skill_Mage_Circle_Second, 30.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Impact_Wind, GameplayTag::Skill_Mage_Circle_Fourth, 40.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Impact_Wind, GameplayTag::Skill_Mage_Circle_Fifth, 50.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Impact_Wind, GameplayTag::Skill_Mage_Circle_Sixth, 70.0f);
}

UCLASS()
class UStormFistDefinition : UWindProjectile_Base
{
	default m_Name = "StormFist";

	default m_HitEffect = UGE_Wind_Damage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Impact_Wind, 120.0f);
	default m_LifeTime = 10.0f;
	default m_SuperArmorDamageBase = 250.f;

	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Impact_Wind, GameplayTag::Skill_Mage_Circle_Sixth, 160.0f);

}

UCLASS()
class UBreathOfDeathDefinition : UWindProjectile_Base
{
	default m_Name = "BreathOfDeath";

	default m_HitEffect = UGE_Wind_Damage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Impact_Wind, 150.0f);
	default m_LifeTime = 10.0f;

	default m_DeathEffect = UGE_BreathOfDeath_WeaponDeath::StaticClass();
}

UCLASS()
class UUrizielWaveOfDeathVisualDefinition :  USpellProjectileDefinition
{
	default m_Name = "UrizielWaveOfDeath";
	default m_HitEffect = UGE_UrizielWaveOfDeath_Damage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Energy, 90.0f);
	// default m_LifeTime = 10.0f;
	// float m_Force = 250.f;
    // float m_EffectDuration = 3.f;

	default m_DeathEffect = UGE_UrizielWaveOfDeath_WeaponDeath::StaticClass();
	//default AddCollisionEffect(GameplayTag::FX_Magic_Projectile_Impact);
}

UCLASS()
class UDeathToTheUndeadDefinition :  USpellProjectileDefinition
{
	default m_Name = "DeathToTheUndead";

	default m_HitEffect = UGE_DeathToTheUndead::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Energy, 500.0f);
	default m_LifeTime = 10.0f;
	float m_Force = 250.f;
	//default AddCollisionEffect(GameplayTag::FX_Magic_Projectile_Impact);
}

UCLASS()
class UIceWaveProjectileDefinition : USpellProjectileDefinition
{
	default m_Name = "IceWave";

	default m_HitEffect = UGE_IceWave_Freeze_Damage::StaticClass();//UGE_IceWave_Damage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Ice, 120.00f);
	
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Ice, GameplayTag::Skill_Mage_Circle_Sixth, 150.0f);
}

UCLASS()
class UIceBlockProjectileDefinition : USpellProjectileDefinition
{
	default m_Name = "IceBlock";

	default m_HitEffect = UGE_IceBlock_Freeze_Damage::StaticClass();//UGE_IceBlock_Damage::StaticClass();
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Ice, 60.00f);

	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Ice, GameplayTag::Skill_Mage_Circle_Fifth, 80.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Ice, GameplayTag::Skill_Mage_Circle_Sixth, 100.0f);
}

UCLASS()
class UPyrokinesisProjectileDefinitionBase : USpellProjectileDefinition
{
	default m_Name = "Pyrokinesis";
	
	default m_HitEffect = UGE_Pyrokinesis_Slowdown::StaticClass();

}

UCLASS()
class UPyrokinesisProjectileDefinition : UPyrokinesisProjectileDefinitionBase
{
	default m_DamageBase.Add(GameplayTag::Item_Damage_Elemental_Fire, 20.0f);
	default AddDamageForMagicCircle(GameplayTag::Item_Damage_Elemental_Fire, GameplayTag::Skill_Mage_Circle_Fifth, 35.0f);
}



// ------------------------------------------------ //

// ------- ARROW PROJECTILES ------ //

UCLASS()
class UCommonBolt : UBreakableProjectileDefinition
{
	default m_HitEffect = UGE_Damage::StaticClass();
	default m_Mass = 250.0f;
	default m_Radius = 1.5f;

	default SetItemType(GameplayTag::Item_Projectile_Bolt);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);

	default m_AimingAssistance.m_DetectionRadius = 20.f;
	default m_AimingAssistance.m_MaxTurnAngle = 30.f;
	default m_AimingAssistance.m_MinDistance = 200;
	default m_AimingAssistance.m_MaxDistance = 4000;
	default m_AimingAssistance.m_enableAimingAssistance = true;

	default AddCollisionEffect(GameplayTag::FX_Arrow_Impact);

	UFUNCTION(BlueprintOverride)
	int CalculateBreakagePercentage_Scriptable(float distanceBetweenBowmanLocationAndHitLocation,
												   float surfaceHardness,
												   float kineticEnergyCoef,
												   const AActor hitActor,
												   EWeaponSkill weaponSkill) const
	{
		float breakablePercentage = 30.0f;
		
		//Distance
		if(distanceBetweenBowmanLocationAndHitLocation < 500 && surfaceHardness >= 0.6) //remember distance is in cm.
			breakablePercentage += 15.0f;

		//bowman level
		if(weaponSkill == EWeaponSkill::Trained)
			breakablePercentage += 15.0f;
		else if(weaponSkill == EWeaponSkill::Untrained)
			breakablePercentage += 30.0f;

		//Material
		if(surfaceHardness > 0.8f)
		{
			breakablePercentage += 30.0f;
		}

		const auto character = Cast<AGothicCharacter>(hitActor);
		if(character != nullptr)
		{
			//Armor
			const auto armorResistance = character.GetArmorAttribute_Resistance_Point();
			breakablePercentage += armorResistance;
		}
		
		breakablePercentage = Math::Clamp(breakablePercentage, 0.0f, 100.0f);
		
		return Math::TruncToInt(breakablePercentage + 20* kineticEnergyCoef);
	}

	UFUNCTION(BlueprintOverride)
	float CalculatePenetrationCoef_Scriptable(float kineticEnergyCoef, float surfaceHardness) const
	{
		auto newHardness = surfaceHardness;

		if(newHardness <= 0.0f)
		{
			newHardness = 0.01f;
		}
		auto penetrationCoef = kineticEnergyCoef / newHardness;

		
		const auto sign = 1 - 2 * Math::RandRange(0, 1);
		const auto randomVariation = Math::RandRange(0, 100) * 0.01f * sign;
	
		penetrationCoef += randomVariation;
		penetrationCoef = Math::GetMappedRangeValueClamped(FVector2D(0.0, 1.0), FVector2D(0.1, 0.4), penetrationCoef / 10.0f);
		
		return penetrationCoef;
	}
}

UCLASS()
class UCommonBowArrow : UBreakableProjectileDefinition
{
	default m_HitEffect = UGE_Damage::StaticClass();
	
	default m_Mass = 250.0f;
	default m_Radius = 1.5f;

	default SetItemType(GameplayTag::Item_Projectile_Arrow);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Throw);
	default m_ItemStatsTags.Add(GameplayTag::Stats_Magic_Hit_Percentage);

	default m_AimingAssistance.m_DetectionRadius = 20.f;
	default m_AimingAssistance.m_MaxTurnAngle = 30.f;
	default m_AimingAssistance.m_MinDistance = 200;
	default m_AimingAssistance.m_MaxDistance = 4000;
	default m_AimingAssistance.m_enableAimingAssistance = true;

	default AddCollisionEffect(GameplayTag::FX_Arrow_Impact);

	UFUNCTION(BlueprintOverride)
	int CalculateBreakagePercentage_Scriptable(float distanceBetweenBowmanLocationAndHitLocation,
												   float surfaceHardness,
												   float kineticEnergyCoef,
												   const AActor hitActor,
												   EWeaponSkill weaponSkill) const
	{
		float breakablePercentage = 30.0f;
		
		//Distance
		if(distanceBetweenBowmanLocationAndHitLocation < 500 && surfaceHardness >= 0.6) //remember distance is in cm.
			breakablePercentage += 15.0f;

		//bowman level
		if(weaponSkill == EWeaponSkill::Trained)
			breakablePercentage += 15.0f;
		else if(weaponSkill == EWeaponSkill::Untrained)
			breakablePercentage += 30.0f;

		//Material
		if(surfaceHardness > 0.8f)
		{
			breakablePercentage += 30.0f;
		}

		const auto character = Cast<AGothicCharacter>(hitActor);
		if(character != nullptr)
		{
			//Armor
			const auto armorResistance = character.GetArmorAttribute_Resistance_Point();
			breakablePercentage += armorResistance;
		}
		
		breakablePercentage = Math::Clamp(breakablePercentage, 0.0f, 100.0f);
		
		return Math::TruncToInt(breakablePercentage + 20 * kineticEnergyCoef);
	}

	UFUNCTION(BlueprintOverride)
	float CalculatePenetrationCoef_Scriptable(float kineticEnergyCoef, float surfaceHardness) const
	{
		auto newHardness = surfaceHardness;

		if(newHardness <= 0.0f)
		{
			newHardness = 0.01f;
		}else if(newHardness >= 0.6f)
		{
			newHardness = 1.0f;
		}
		auto penetrationCoef = kineticEnergyCoef / newHardness;

		
		const auto sign = 1 - 2 * Math::RandRange(0, 1);
		const auto randomVariation = Math::RandRange(0, 100) * 0.01f * sign;
	
		penetrationCoef += randomVariation;
		penetrationCoef = Math::GetMappedRangeValueClamped(FVector2D(0.0, 1.0), FVector2D(0.1, 0.4), penetrationCoef / 10.0f);
		
		return penetrationCoef;
	}
}
// ------------------------------------------------ //

