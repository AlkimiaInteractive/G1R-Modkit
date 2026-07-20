
UCLASS()
class UWaterConfig_Wolf: UWaterConfig_Creature
{
	default m_Buoyancy = 1.8; // same as player buoyancy
	default m_RagdollUnderWaterHeight = 140;

	default m_SurfaceWaterMinHeight = 0.1f;
    default m_MidWaterMinHeight = 70.f;
    default m_DeepWaterMinHeight = 70.f;
};

UCLASS()
class USwimConfig_Wolf: USwimConfig_Creature
{
	// These values are basically the USwimConfig_Player values divided by two as the wolf capsule height is the player capsule height divided by two
	// default m_SwimToDiveHeight = 85;
	// default m_DiveToSwimHeight = 80;
	// default m_WalkToSwimHeight = 70;
	// default m_SwimToWalkHeight = 60;
	// default m_CrouchableWaterHeight = 30;
	// default m_CapsuleSwimmingHalfHeight = 45;
	default m_SwimToDiveHeight = 85;
	default m_DiveToSwimHeight = 80;
	default m_WalkToSwimHeight = 70;
	default m_SwimToWalkHeight = 60;
	default m_CrouchableWaterHeight = 30;
	default m_CapsuleSwimmingHalfHeight = 45;
};

UCLASS()
class UJumpConfig_Wolf: UJumpConfig
{
	default m_JumpZVelocity = 475.0;
	//default m_FallGravityScale = 3;
};

UCLASS()
class URagdollConfig_Wolf: URagdollConfig
{
    default m_FloatRagdollCurve = n"CurveVector'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/RagdollFloatMovement.RagdollFloatMovement'";
    // default m_GetUpBackAnimMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/ALS/Animations/Actions/ALS_CLF_GetUp_Back_Montage_2H_NLH.ALS_CLF_GetUp_Back_Montage_2H_NLH'";
    // default m_GetUpFrontAnimMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/ALS/Animations/Actions/ALS_CLF_GetUp_Front_Montage_2H_NLH.ALS_CLF_GetUp_Front_Montage_2H_NLH'";
    default m_GetUpPlayRate = 1;
    default m_RagdollStartBlendOutTime = 0.2;
    default m_StopBonesMovementOnStart = false;
    default m_WaterResistance = 0.05f;
    default m_BuySimStrength = 1.0f;
};

UCLASS()
class ULocomotionConfig_Wolf: ULocomotionConfig_Creature_Wolf
{
	default m_SpeedConfig = USpeedConfig_Wolf::StaticClass();
	default m_GroundConfig = UGroundConfig_Creature::StaticClass();
	default m_LandingConfig = ULandingConfig_Creature::StaticClass();
	default m_AirConfig = UAirConfig_Creature::StaticClass();
	default m_LookConfig = ULookConfig_Creature::StaticClass();
	default m_JumpConfig = UJumpConfig_Wolf::StaticClass();
	default m_WaterConfig = UWaterConfig_Wolf::StaticClass();
	default m_SwimConfig = USwimConfig_Wolf::StaticClass();
    default m_RagdollConfig = URagdollConfig_Wolf::StaticClass();
	default m_ClimbingConfig = UClimbingConfig_Wolf::StaticClass();
};

UCLASS()
class ULocomotionConfig_Wolf_Alpha: ULocomotionConfig_Creature_Quadruped
{
	default m_SpeedConfig = USpeedConfig_Wolf_Alpha::StaticClass();
	default m_GroundConfig = UGroundConfig_Creature::StaticClass();
	default m_LandingConfig = ULandingConfig_Creature::StaticClass();
	default m_AirConfig = UAirConfig_Creature::StaticClass();
	default m_LookConfig = ULookConfig_Creature::StaticClass();
	default m_JumpConfig = UJumpConfig_Wolf::StaticClass();
	default m_WaterConfig = UWaterConfig_Wolf::StaticClass();
	default m_SwimConfig = USwimConfig_Wolf::StaticClass();
    default m_RagdollConfig = URagdollConfig_Wolf::StaticClass();
	default m_ClimbingConfig = UClimbingConfig_Wolf::StaticClass();
};

UCLASS()
class ULocomotionConfig_Wolf_Player: ULocomotionConfig_Wolf
{
    default m_CurveConfig = ULocomotionCurveConfig_Wolf_Player::StaticClass();
};
