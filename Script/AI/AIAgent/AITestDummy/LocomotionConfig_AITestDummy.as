
UCLASS()
class UWaterConfig_AITestDummy: UWaterConfigBase
{
	default m_Buoyancy = 1.5;
	default m_RagdollUnderWaterHeight = 140;
};

UCLASS()
class USwimConfig_AITestDummy: USwimConfig_Creature
{
	default m_SwimToDiveHeight = 150;
	default m_DiveToSwimHeight = 150;
	default m_WalkToSwimHeight = 100;
	default m_SwimToWalkHeight = 90;
};

UCLASS()
class UJumpConfig_AITestDummy: UJumpConfig
{
	default m_JumpZVelocity = 600;
};

class URagdollConfig_AITestDummy: URagdollConfig
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
class ULocomotionConfig_AITestDummy: ULocomotionConfig_Creature
{
	default m_SpeedConfig = USpeedConfig_Creature::StaticClass();
	default m_GroundConfig = UGroundConfig_Creature::StaticClass();
	default m_LandingConfig = ULandingConfig_Creature::StaticClass();
	default m_AirConfig = UAirConfig_Creature::StaticClass();
	default m_LookConfig = ULookConfig_Creature::StaticClass();
	
	default m_JumpConfig = UJumpConfig_AITestDummy::StaticClass();
	default m_WaterConfig = UWaterConfig_AITestDummy::StaticClass();
	default m_SwimConfig = USwimConfig_AITestDummy::StaticClass();
	default m_RagdollConfig = URagdollConfig_AITestDummy::StaticClass();
};
