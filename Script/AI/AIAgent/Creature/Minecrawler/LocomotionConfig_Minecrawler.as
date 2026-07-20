
UCLASS()
class UJumpConfig_Minecrawler: UJumpConfig
{
	default m_JumpZVelocity = 650;
	default m_FallGravityScale = 3;
};

UCLASS()
class UWallWalkingConfig_Minecrawler: UWallWalkingConfig
{
	default m_CustomGravityAttraction = 10000000;
	default m_DistanceFactor = 300000;
	default m_RotationInterpSpeed = 30;
	default m_WallContactLostRotInterpSpeed = 0.1;
	default m_SensorRange = 250;
	default m_MinimumNormalDistToImpulse = 0.5;
	default m_RotInWallsDegreesPerSecond = 520;
	default m_RotImpulseHelper = 460;
	default m_JumpMontageAsset = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Combat/Dodges/Minecrawler_DodgeFwd_Montage.Minecrawler_DodgeFwd_Montage'";
};

UCLASS()
class UWaterConfig_Minecrawler: UWaterConfig_Creature
{
	default m_Buoyancy = 2;
	default m_RagdollUnderWaterHeight = 100;
};

UCLASS()
class URagdollConfig_Minecrawler: URagdollConfig
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
class ULocomotionConfig_Minecrawler: ULocomotionConfig_Creature_Quadruped
{
	default m_SpeedConfig = USpeedConfig_Minecrawler::StaticClass();
	default m_GroundConfig = UGroundConfig_Creature::StaticClass();
	default m_LandingConfig = ULandingConfig_Creature::StaticClass();
	default m_AirConfig = UAirConfig_Creature::StaticClass();
	default m_LookConfig = ULookConfig_Creature::StaticClass();
	default m_JumpConfig = UJumpConfig_Minecrawler::StaticClass();
	default m_WaterConfig = UWaterConfig_Minecrawler::StaticClass();
	default m_SwimConfig = USwimConfig_Creature::StaticClass();
	default m_WallWalkingConfig = UWallWalkingConfig_Minecrawler::StaticClass();
    default m_RagdollConfig = URagdollConfig_Minecrawler::StaticClass();
	
};

UCLASS()
class ULocomotionConfig_Minecrawler_Player: ULocomotionConfig_Minecrawler
{
    default m_CurveConfig = ULocomotionCurveConfig_Quadruped_Player::StaticClass();
};