
UCLASS()
class UWaterConfig_Lizard: UWaterConfig_Creature
{
	default m_Buoyancy = 1.95;
	default m_RagdollUnderWaterHeight = 140;
};

UCLASS()
class UWaterConfig_Lizard_Fire: UWaterConfig_Creature
{
	default m_Buoyancy = 2.1;
	default m_RagdollUnderWaterHeight = 140;
};

UCLASS()
class USwimConfig_Lizard: USwimConfig_Creature
{
	default m_SwimToDiveHeight = 75;
	default m_DiveToSwimHeight = 150;
	default m_WalkToSwimHeight = 60;
	default m_SwimToWalkHeight = 50;
	default m_CrouchableWaterHeight = 30;
	default m_CapsuleSwimmingHalfHeight = 45;
};

UCLASS()
class UJumpConfig_Lizard: UJumpConfig
{
	default m_JumpZVelocity = 480;
	default m_FallGravityScale = 3.0;
}

UCLASS()
class URagdollConfig_Lizard: URagdollConfig
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
class ULocomotionConfig_Lizard: ULocomotionConfig_Creature_Quadruped
{
	default m_SpeedConfig = USpeedConfig_Lizard::StaticClass();
	default m_GroundConfig = UGroundConfig_Creature::StaticClass();
	default m_LandingConfig = ULandingConfig_Creature::StaticClass();
	default m_AirConfig = UAirConfig_Creature::StaticClass();
	default m_LookConfig = ULookConfig_Creature::StaticClass();
	default m_JumpConfig = UJumpConfig_Lizard::StaticClass();
	default m_WaterConfig = UWaterConfig_Lizard::StaticClass();
	default m_SwimConfig = USwimConfig_Lizard::StaticClass();
    default m_RagdollConfig = URagdollConfig_Lizard::StaticClass();
	default m_ClimbingConfig = UClimbingConfig_Lizard::StaticClass();
};

UCLASS()
class ULocomotionConfig_Lizard_Player: ULocomotionConfig_Lizard
{
    default m_CurveConfig = ULocomotionCurveConfig_Quadruped_Player::StaticClass();
};

UCLASS()
class ULocomotionConfig_Lizard_Fire: ULocomotionConfig_Lizard
{
	default m_ClimbingConfig = UClimbingConfig_Lizard_Fire::StaticClass();
	default m_WaterConfig = UWaterConfig_Lizard_Fire::StaticClass();
};

UCLASS()
class ULocomotionConfig_Lizard_Fire_Player: ULocomotionConfig_Lizard_Fire
{
    default m_CurveConfig = ULocomotionCurveConfig_Quadruped_Player::StaticClass();
};