
UCLASS()
class UWaterConfig_Snapper: UWaterConfig_Creature
{
	default m_Buoyancy = 1.5;
	default m_RagdollUnderWaterHeight = 140;
};

UCLASS()
class USwimConfig_Snapper: USwimConfig_Creature
{
	default m_SwimToDiveHeight = 120;
	default m_DiveToSwimHeight = 180;
	default m_WalkToSwimHeight = 60;
	default m_SwimToWalkHeight = 50;
	default m_CrouchableWaterHeight = 30;
	default m_CapsuleSwimmingHalfHeight = 70;
};

UCLASS()
class UJumpConfig_Snapper: UJumpConfig
{
	default m_JumpZVelocity = 480;
	//default m_FallGravityScale = 3;
};

UCLASS()
class URagdollConfig_Snapper: URagdollConfig
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
class ULocomotionConfig_Snapper: ULocomotionConfig_Creature_Dinosaurs
{
	default m_SpeedConfig = USpeedConfig_Snapper::StaticClass();
	default m_GroundConfig = UGroundConfig_Creature::StaticClass();
	default m_LandingConfig = ULandingConfig_Creature::StaticClass();
	default m_AirConfig = UAirConfig_Creature::StaticClass();
	default m_LookConfig = ULookConfig_Creature::StaticClass();
	default m_JumpConfig = UJumpConfig_Snapper::StaticClass();
	default m_WaterConfig = UWaterConfig_Snapper::StaticClass();
	default m_SwimConfig = USwimConfig_Snapper::StaticClass();
    default m_RagdollConfig = URagdollConfig_Snapper::StaticClass();
	default m_ClimbingConfig = UClimbingConfig_Snapper::StaticClass();
};

UCLASS()
class ULocomotionConfig_Snapper_Player: ULocomotionConfig_Snapper
{
    default m_CurveConfig = ULocomotionCurveConfig_Dinosaurs_Player::StaticClass();
};
