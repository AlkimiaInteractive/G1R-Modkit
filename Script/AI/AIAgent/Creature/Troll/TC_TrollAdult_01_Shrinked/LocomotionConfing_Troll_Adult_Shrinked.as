
UCLASS()
class UWaterConfig_Troll_Adult_Shrinked: UWaterConfig_Creature
{
	default m_Buoyancy = 1.5;
	default m_RagdollUnderWaterHeight = 140;
};

class URagdollConfig_Troll_Adult_Shrinked: URagdollConfig
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
class ULocomotionConfig_Troll_Adult_Shrinked: ULocomotionConfig_Creature
{
	default m_SpeedConfig = USpeedConfig_Troll_Adult_Shrinked::StaticClass();
	default m_GroundConfig = UGroundConfig_Creature::StaticClass();
	default m_LandingConfig = ULandingConfig_Creature::StaticClass();
	default m_AirConfig = UAirConfig_Creature::StaticClass();
	default m_LookConfig = ULookConfig_Creature::StaticClass();
	
	default m_WaterConfig = UWaterConfig_Troll_Adult_Shrinked::StaticClass();
	default m_RagdollConfig = URagdollConfig_Troll_Adult_Shrinked::StaticClass();
};