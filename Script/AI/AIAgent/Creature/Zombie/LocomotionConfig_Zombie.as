
UCLASS()
class UWaterConfig_Zombie: UWaterConfig_Creature
{
	default m_Buoyancy = 1.5;
	default m_RagdollUnderWaterHeight = 140;
};

UCLASS()
class USwimConfig_Zombie: USwimConfig_Creature
{
	default m_SwimToDiveHeight = 200;
	default m_DiveToSwimHeight = 180;
	default m_WalkToSwimHeight = 140;
	default m_SwimToWalkHeight = 100;
};


class URagdollConfig_Zombie: URagdollConfig
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
class ULocomotionConfig_Zombie: ULocomotionConfig_Creature_Zombie
{
	default m_SpeedConfig = USpeedConfig_Zombie::StaticClass();
	default m_GroundConfig = UGroundConfig_Creature::StaticClass();
	default m_LandingConfig = ULandingConfig_Creature::StaticClass();
	default m_AirConfig = UAirConfig_Creature::StaticClass();
	default m_LookConfig = ULookConfig_Creature::StaticClass();

	default m_WaterConfig = UWaterConfig_Zombie::StaticClass();
	default m_RagdollConfig = URagdollConfig_Zombie::StaticClass();
	default m_ClimbingConfig = UClimbingConfig_Zombie::StaticClass();
	default m_SwimConfig = USwimConfig_Zombie::StaticClass();
};
