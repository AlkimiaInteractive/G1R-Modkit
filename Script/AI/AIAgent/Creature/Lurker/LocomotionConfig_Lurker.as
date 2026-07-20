
UCLASS()
class UWaterConfig_Lurker: UWaterConfig_Creature
{
	default m_Buoyancy = 1.75;
	default m_RagdollUnderWaterHeight = 140;
};

UCLASS()
class USwimConfig_Lurker: USwimConfig_Creature
{
	default m_SwimToDiveHeight = 115;
	default m_DiveToSwimHeight = 180;
	default m_WalkToSwimHeight = 85;
	default m_SwimToWalkHeight = 75;
	default m_CapsuleSwimmingHalfHeight = 60;	// default is 45

	default m_DivingEffect = UGE_Diving_Lurker::StaticClass();
};

UCLASS()
class UJumpConfig_Lurker: UJumpConfig
{
	default m_JumpZVelocity = 540;
};

UCLASS()
class URagdollConfig_Lurker: URagdollConfig
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
class ULocomotionConfig_Lurker: ULocomotionConfig_Creature_Quadruped
{
	default m_GroundConfig = UGroundConfig_Creature::StaticClass();
	default m_LandingConfig = ULandingConfig_Creature::StaticClass();
	default m_AirConfig = UAirConfig_Creature::StaticClass();
	default m_LookConfig = ULookConfig_Creature::StaticClass();
	default m_SpeedConfig = USpeedConfig_Lurker::StaticClass();
	default m_JumpConfig = UJumpConfig_Lurker::StaticClass();
	default m_WaterConfig = UWaterConfig_Lurker::StaticClass();
	default m_SwimConfig = USwimConfig_Lurker::StaticClass();
    default m_RagdollConfig = URagdollConfig_Lurker::StaticClass();
	default m_ClimbingConfig = UClimbingConfig_Lurker::StaticClass();
};

UCLASS()
class ULocomotionConfig_Lurker_Player: ULocomotionConfig_Lurker
{
    default m_CurveConfig = ULocomotionCurveConfig_Quadruped_Player::StaticClass();
};