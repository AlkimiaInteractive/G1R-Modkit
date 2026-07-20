UCLASS()
class UWaterConfig_Swampshark : UWaterConfig_Creature_SwampShark
{
	default m_Buoyancy = 3.2;
	default m_RagdollUnderWaterHeight = 140;
};

UCLASS()
class USwimConfig_Swampshark : USwimConfig_Creature
{
	default m_SwimToDiveHeight = 75;
	default m_DiveToSwimHeight = 90;
	default m_WalkToSwimHeight = 5000;
	default m_SwimToWalkHeight = 50;
	default m_CapsuleSwimmingHalfHeight = 60;	// default is 45
};

UCLASS()
class URagdollConfig_Swampshark: URagdollConfig
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
class ULocomotionConfig_Swampshark: ULocomotionConfig_Creature
{
	default m_SpeedConfig = USpeedConfig_Swampshark::StaticClass();
	default m_GroundConfig = UGroundConfig_Creature::StaticClass();
	default m_LandingConfig = ULandingConfig_Creature::StaticClass();
	default m_AirConfig = UAirConfig_Creature::StaticClass();
	default m_LookConfig = ULookConfig_Creature::StaticClass();
	default m_JumpConfig = UJumpConfig_Creature::StaticClass();
	default m_WaterConfig = UWaterConfig_Swampshark::StaticClass();
	default m_SwimConfig = USwimConfig_Swampshark::StaticClass();
	default m_RagdollConfig = URagdollConfig_Swampshark::StaticClass();
};

UCLASS()
class ULocomotionConfig_Swampshark_Player: ULocomotionConfig_Swampshark
{
    default m_CurveConfig = ULocomotionCurveConfig_Swampshark_Player::StaticClass();
};
