
UCLASS()
class UWaterConfig_Skeleton: UWaterConfig_Creature
{
	default m_Buoyancy = 2.5;
	default m_RagdollUnderWaterHeight = 140;
};

UCLASS()
class USwimConfig_Skeleton: USwimConfig_Creature
{
	default m_SwimToDiveHeight = 100;
	default m_DiveToSwimHeight = 110;
	default m_WalkToSwimHeight = 100;
	default m_SwimToWalkHeight = 90;
	default m_CrouchableWaterHeight = 30;
	default m_CapsuleSwimmingHalfHeight = 90;
};

UCLASS()
class UJumpConfig_Skeleton: UJumpConfig
{
	default m_JumpZVelocity = 600;
};

class URagdollConfig_Skeleton: URagdollConfig
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
class ULocomotionConfig_Skeleton: ULocomotionConfig_Creature
{
	default m_SpeedConfig = USpeedConfig_Skeleton::StaticClass();
	default m_GroundConfig = UGroundConfig_Creature::StaticClass();
	default m_LandingConfig = ULandingConfig_Creature::StaticClass();
	default m_AirConfig = UAirConfig_Creature::StaticClass();
	default m_LookConfig = ULookConfig_Creature::StaticClass();
	
	default m_JumpConfig = UJumpConfig_Skeleton::StaticClass();
	default m_WaterConfig = UWaterConfig_Skeleton::StaticClass();
	default m_SwimConfig = USwimConfig_Skeleton::StaticClass();
	default m_RagdollConfig = URagdollConfig_Skeleton::StaticClass();
	default m_ClimbingConfig = UClimbingConfig_Skeleton::StaticClass();
	default m_CurveConfig = ULocomotionCurveConfig_Biped_Creatures::StaticClass();
};
