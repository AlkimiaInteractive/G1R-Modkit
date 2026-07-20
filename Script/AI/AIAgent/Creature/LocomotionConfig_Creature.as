
UCLASS()
class UJumpConfig_Creature: UJumpConfig
{
	default m_JumpZVelocity = 200;
};


UCLASS()
class UAirConfig_Creature: UAirConfig
{
    default m_InAirRotationSpeedLimit = 100;
    default m_MaxFallingSpeed = -4000;
    default m_MinFallingSpeed = -200;
};

UCLASS()
class UGroundConfig_Creature: UGroundConfig
{
	default m_UpdateRotationMinimumSpeed = 150;
	default m_TargetInterpSpeedInteractuablesRotation = 200;
	default m_TargetInterpSpeedVelocityDirection = 10;
	default m_TargetInterpSpeedLookingDirection = 50;
	default m_TargetInterpSpeedAiming = 50;
	default m_ActorInterpSpeedFallingAiming = 15;
	default m_ActorInterpFalling = 100;
	default m_GroundedRotationRate_Aiming = 600;
	default m_GroundedRotationRate_Roll = 300;
	default m_GroundedRotationRate_Dodge = 300;
	default m_VelocityBlendInterpSpeed = 12;
	default m_GroundedLeanInterpSpeed = 4;
	default m_SmoothedAimingRotationInterpSpeed = 100;
	default m_InputYawOffsetInterpSpeed = 8.f;
	default m_MovementInputMinimumAmountToSprint = 0.9f;
	default m_MovementInputMaximumYawToSprint = 50;
	default m_UpdateGaitSpeedOffset = 10;
	default m_MaxStepHeightNormal = 80;
	default m_MaxStepHeightStrafe = 80;
};

UCLASS()
class ULandingConfig_Creature: ULandingConfig
{
	default m_BrakingFrictionFactorStrong = 3;
	default m_BrakingFrictionFactorWeak = 0.5;
	default m_BrakingFrictionFactorResetTime = 0.5;
	default m_StopResetTimeWeak = 0.0f;
	default m_StopResetTimeStrong = 0.4f;
	default m_MaxFallingStrongStopHeight = 200;
};

UCLASS()
class ULookConfig_Creature: ULookConfig
{
	default m_LookUpDownRate = 1.25;
	default m_LookRightLeftRate = 1.25;
};

UCLASS()
class UWaterConfig_Creature: UWaterConfigBase
{
	default m_Buoyancy = 2;
	default m_RagdollUnderWaterHeight = 140;

	default m_WaterMovementTag = FGameplayTag::Empty;

	default m_SurfaceWaterEffect = UGE_SurfaceWater_Creature::StaticClass();
    default m_MidWaterEffect = UGE_MidWater_Creature::StaticClass();
    default m_DeepWaterEffect = UGE_DeepWater_Creature::StaticClass();
};

UCLASS()
class UWaterConfig_Creature_SwampShark : UWaterConfig_Creature
{
	default m_SurfaceWaterEffect = UGE_SurfaceWater_SwampShark::StaticClass();
    default m_MidWaterEffect = UGE_MidWater_SwampShark::StaticClass();
    default m_DeepWaterEffect = UGE_DeepWater_SwampShark::StaticClass();
};

UCLASS()
class UWaterConfig_Creature_Flying: UWaterConfig_Creature
{
	default m_SurfaceWaterEffect = UGE_SurfaceWater_Flying::StaticClass();
    default m_MidWaterEffect = UGE_MidWater_Flying::StaticClass();
    default m_DeepWaterEffect = UGE_DeepWater_Flying::StaticClass();
};

UCLASS()
class ULocomotionConfig_Creature: ULocomotionConfig
{
	default m_SpeedConfig = USpeedConfig_Creature::StaticClass();
	default m_GroundConfig = UGroundConfig_Creature::StaticClass();
	default m_LandingConfig = ULandingConfig_Creature::StaticClass();
	default m_AirConfig = UAirConfig_Creature::StaticClass();
	default m_LookConfig = ULookConfig_Creature::StaticClass();
	default m_JumpConfig = UJumpConfig_Creature::StaticClass();
	default m_WaterConfig = UWaterConfig_Creature::StaticClass();
	default m_SwimConfig = USwimConfig_Creature::StaticClass();
	default m_CurveConfig = ULocomotionCurveConfig_Biped::StaticClass();
};

UCLASS()
class ULocomotionConfig_Creature_Golems: ULocomotionConfig_Creature
{
    default m_CurveConfig = ULocomotionCurveConfig_Golems::StaticClass();
};

UCLASS()
class ULocomotionConfig_Creature_Quadruped: ULocomotionConfig_Creature
{
    default m_CurveConfig = ULocomotionCurveConfig_Quadruped::StaticClass();
};
UCLASS()
class ULocomotionConfig_Creature_Wolf: ULocomotionConfig_Creature_Quadruped
{
    default m_CurveConfig = ULocomotionCurveConfig_Wolf::StaticClass();
};

UCLASS()
class ULocomotionConfig_Creature_Dinosaurs: ULocomotionConfig_Creature
{
    default m_CurveConfig = ULocomotionCurveConfig_Dinosaurs::StaticClass();
};

UCLASS()
class ULocomotionConfig_Creature_Flying : ULocomotionConfig_Creature
{
	default m_WaterConfig = UWaterConfig_Creature_Flying::StaticClass();

    // collision profile will change in ability fly to Gothic_Character_Flying, 
	// but we need to set it here to Gothic_Character as default like other creatures for 
	// when it exits Fly Ability. Or they will think water is ground.
    default m_CollisionProfileName = n"Gothic_Character";

	// only flying characters need to detect the water surface as ground.
	// walking, swimming and diving characters do not need this
	default m_GroundDetectionProfileName = n"DetectGround_Flying";
};

UCLASS()
class ULocomotionConfig_Creature_Harpy: ULocomotionConfig_Creature_Flying
{
    default m_CurveConfig = ULocomotionCurveConfig_Harpy::StaticClass();
};

UCLASS()
class ULocomotionConfig_Creature_IgnoreWater: ULocomotionConfig_Creature
{
	// collision profile that ignores water and continue on ground
    default m_CollisionProfileName = n"Gothic_Character_IgnoreWater";
};

UCLASS()
class ULocomotionConfig_Creature_Swampshark: ULocomotionConfig_Creature_IgnoreWater
{
    default m_CurveConfig = ULocomotionCurveConfig_Swampshark::StaticClass();
};

UCLASS()
class ULocomotionConfig_Creature_Skeleton: ULocomotionConfig_Creature_IgnoreWater
{
    
};

UCLASS()
class ULocomotionConfig_Creature_Zombie: ULocomotionConfig_Creature_IgnoreWater
{
    
};