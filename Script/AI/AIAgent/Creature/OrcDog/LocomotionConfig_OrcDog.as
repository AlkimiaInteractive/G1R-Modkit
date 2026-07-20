
UCLASS()
class UWaterConfig_OrcDog: UWaterConfig_Creature
{
	default m_Buoyancy = 1.8;
	default m_RagdollUnderWaterHeight = 140;
};

UCLASS()
class USwimConfig_OrcDog: USwimConfig_Creature
{
	default m_SwimToDiveHeight = 110;
	default m_DiveToSwimHeight = 140;
	default m_WalkToSwimHeight = 90;
	default m_SwimToWalkHeight = 70;
	default m_CrouchableWaterHeight = 30;
	default m_CapsuleSwimmingHalfHeight = 70;
};

UCLASS()
class UJumpConfig_OrcDog: UJumpConfig
{
	default m_JumpZVelocity = 480;
	//default m_FallGravityScale = 3;
};

UCLASS()
class URagdollConfig_OrcDog: URagdollConfig
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
class ULocomotionConfig_OrcDog: ULocomotionConfig_Creature_Quadruped
{
	default m_SpeedConfig = USpeedConfig_OrcDog::StaticClass();
	default m_GroundConfig = UGroundConfig_Creature::StaticClass();
	default m_LandingConfig = ULandingConfig_Creature::StaticClass();
	default m_AirConfig = UAirConfig_Creature::StaticClass();
	default m_LookConfig = ULookConfig_Creature::StaticClass();
	default m_JumpConfig = UJumpConfig_OrcDog::StaticClass();
	default m_WaterConfig = UWaterConfig_OrcDog::StaticClass();
	default m_SwimConfig = USwimConfig_OrcDog::StaticClass();
    default m_RagdollConfig = URagdollConfig_OrcDog::StaticClass();
	default m_ClimbingConfig = UClimbingConfig_OrcDog::StaticClass();
};

UCLASS()
class ULocomotionConfig_OrcDog_Player: ULocomotionConfig_OrcDog
{
    default m_CurveConfig = ULocomotionCurveConfig_Quadruped_Player::StaticClass();
};
