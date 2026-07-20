
UCLASS()
class URagdollConfig_Meatbug: URagdollConfig
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
class UWallWalkingConfig_Meatbug: UWallWalkingConfig
{
	default m_CustomGravityAttraction = 10000000;
	default m_DistanceFactor = 300000;
	default m_RotationInterpSpeed = 30;
	default m_WallContactLostRotInterpSpeed = 0.1;
	default m_SensorRange = 250;
	default m_MinimumNormalDistToImpulse = 0.5;
	default m_RotInWallsDegreesPerSecond = 520;
	default m_RotImpulseHelper = 460;
};

UCLASS()
class USwimConfig_Creature_Meatbug: USwimConfig
{
	default m_SwimToDiveHeight = 200;
	default m_DiveToSwimHeight = 180;
	default m_WalkToSwimHeight = 30;
	default m_SwimToWalkHeight = 100;

	default m_SwimmingEffect 		= UGE_Swimming::StaticClass();
	default m_DivingEffect 			= UGE_Diving::StaticClass();
};

UCLASS()
class ULocomotionConfig_Meatbug: ULocomotionConfig_Creature
{
	default m_SpeedConfig = USpeedConfig_Meatbug::StaticClass();
	default m_GroundConfig = UGroundConfig_Creature::StaticClass();
	default m_LandingConfig = ULandingConfig_Creature::StaticClass();
	default m_AirConfig = UAirConfig_Creature::StaticClass();
	default m_LookConfig = ULookConfig_Creature::StaticClass();
	default m_JumpConfig = UJumpConfig_Creature::StaticClass();
	default m_WaterConfig = UWaterConfig_Creature::StaticClass();
	default m_SwimConfig = USwimConfig_Creature_Meatbug::StaticClass();
	default m_RagdollConfig = URagdollConfig_Meatbug::StaticClass();
	default m_WallWalkingConfig = UWallWalkingConfig_Meatbug::StaticClass();
	default m_CollisionProfileName = n"Gothic_Character_IgnorePawn";
};