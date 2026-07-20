
UCLASS()
class UJumpConfig_Minecrawler_Nymph : UJumpConfig
{
	default m_JumpZVelocity = 650;
	default m_FallGravityScale = 3;
};

UCLASS()
class UWallWalkingConfig_Minecrawler_Nymph : UWallWalkingConfig
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
class UWaterConfig_Minecrawler_Nymph : UWaterConfig_Creature
{
	default m_Buoyancy = 2;
	default m_RagdollUnderWaterHeight = 100;
};

UCLASS()
class USwimConfig_Minecrawler_Nymph : USwimConfig_Creature
{
	default m_SwimToDiveHeight = 200;
	default m_DiveToSwimHeight = 180;
	default m_WalkToSwimHeight = 140;
	default m_SwimToWalkHeight = 100;

	default m_SwimmingEffect 		= UGE_Swimming::StaticClass();
	default m_DivingEffect 			= UGE_Diving::StaticClass();
};

UCLASS()
class URagdollConfig_Minecrawler_Nymph : URagdollConfig
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
class ULocomotionConfig_Minecrawler_Nymph : ULocomotionConfig_Creature_Quadruped
{
	default m_SpeedConfig = USpeedConfig_Minecrawler_Nymph;
	default m_GroundConfig = UGroundConfig_Creature;
	default m_LandingConfig = ULandingConfig_Creature;
	default m_AirConfig = UAirConfig_Creature;
	default m_LookConfig = ULookConfig_Creature;
	default m_JumpConfig = UJumpConfig_Minecrawler_Nymph;
	default m_WaterConfig = UWaterConfig_Minecrawler_Nymph;
	default m_SwimConfig = USwimConfig_Minecrawler_Nymph;
	default m_WallWalkingConfig = UWallWalkingConfig_Minecrawler_Nymph;
    default m_RagdollConfig = URagdollConfig_Minecrawler_Nymph;
	
};

UCLASS()
class ULocomotionConfig_Minecrawler_Nymph_Player: ULocomotionConfig_Minecrawler_Nymph
{
    default m_CurveConfig = ULocomotionCurveConfig_Quadruped_Player::StaticClass();
};
