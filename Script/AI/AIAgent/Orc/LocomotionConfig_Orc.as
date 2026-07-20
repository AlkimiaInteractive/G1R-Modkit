
UCLASS()
class UWaterConfig_Orc: UWaterConfigBase
{
	default m_Buoyancy = 1.25;
	default m_RagdollUnderWaterHeight = 140;

	default m_WaterMovementTag = FGameplayTag::Empty;
};

UCLASS()
class UJumpConfig_Orc: UJumpConfig
{
	default m_JumpZVelocity = 700;
};

UCLASS()
class ULandingConfig_Orc: ULandingConfig
{
	default m_BrakingFrictionFactorStrong = 3;
	default m_BrakingFrictionFactorWeak = 0.5;
	default m_BrakingFrictionFactorResetTime = 0.5;
};

UCLASS()
class ULookConfig_Orc: ULookConfig
{
	default m_LookUpDownRate = 1.25;
	default m_LookRightLeftRate = 1.25;
};

UCLASS()
class URagdollConfig_Orc: URagdollConfig
{
	default m_FloatRagdollCurve = n"CurveVector'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/RagdollFloatMovement.RagdollFloatMovement'";
	default m_GetUpBackAnimMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/ALS/Animations/Actions/ALS_CLF_GetUp_Back_Montage_2H_NLH.ALS_CLF_GetUp_Back_Montage_2H_NLH'";
	default m_GetUpFrontAnimMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/ALS/Animations/Actions/ALS_CLF_GetUp_Front_Montage_2H_NLH.ALS_CLF_GetUp_Front_Montage_2H_NLH'";
	default m_GetUpPlayRate = 1;
	default m_RagdollStartBlendOutTime = 0.2;
	default m_StopBonesMovementOnStart = false;
	
	default m_FallingRagdollAbility = UGA_FallingRagdoll::StaticClass();
};

UCLASS()
class USwimConfig_Orc: USwimConfig_Creature
{
	default m_SwimToDiveHeight = 200;
	default m_DiveToSwimHeight = 180;
	default m_WalkToSwimHeight = 140;
	default m_SwimToWalkHeight = 100;
};

UCLASS()
class UTransitionConfig_Orc: UTransitionConfig
{
	default m_DynTransitionBlendTime = 0.2;
	default m_DynTransitionPlayRate = 1.5;
	default m_DynTransitionStartTime = 0.8;
	default m_DynTransitionReTriggerDelay = 0.1f;
};

UCLASS()
class UGroundConfig_Orc: UGroundConfig
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
class UAirConfig_Orc: UAirConfig
{
	default m_InAirRotationSpeedLimit = 100;
	default m_MaxFallingSpeed = -4000;
	default m_MinFallingSpeed = -200;
};


UCLASS()
class ULocomotionConfig_Orc: ULocomotionConfig
{
	default m_ClimbingConfig = UClimbingConfig_Orc::StaticClass();
	default m_SpeedConfig = USpeedConfig_Orc::StaticClass();
	default m_GroundConfig = UGroundConfig_Orc::StaticClass();
	default m_LandingConfig = ULandingConfig_Orc::StaticClass();
	default m_AirConfig = UAirConfig_Orc::StaticClass();
	default m_LookConfig = ULookConfig_Orc::StaticClass();
	default m_TransitionConfig = UTransitionConfig_Orc::StaticClass();
	default m_SwimConfig = USwimConfig_Orc::StaticClass();
	default m_JumpConfig = UJumpConfig_Orc::StaticClass();
	default m_WaterConfig = UWaterConfig_Orc::StaticClass();
	default m_RagdollConfig = URagdollConfig_Orc::StaticClass();
	default m_CurveConfig = ULocomotionCurveConfig_Orc::StaticClass();
};
