
UCLASS()
class UWaterConfig_Scavenger_Young: UWaterConfig_Creature
{
	default m_Buoyancy = 1.5;  
	default m_RagdollUnderWaterHeight = 90;
};

UCLASS()
class USwimConfig_Scavenger_Young: USwimConfig_Creature
{
	default m_SwimToDiveHeight = 110;
	default m_DiveToSwimHeight = 150;
	default m_WalkToSwimHeight = 60;
	default m_SwimToWalkHeight = 50;
};

UCLASS()
class UJumpConfig_Scavenger_Young: UJumpConfig
{
	default m_JumpZVelocity = 400;
};

UCLASS()
class URagdollConfig_Scavenger_Young: URagdollConfig
{
    default m_FloatRagdollCurve = n"CurveVector'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/RagdollFloatMovement.RagdollFloatMovement'";
    default m_GetUpPlayRate = 1;
    default m_RagdollStartBlendOutTime = 0.2;
    default m_StopBonesMovementOnStart = false;
    default m_WaterResistance = 0.05f;
    default m_BuySimStrength = 1.0f;
};

UCLASS()
class ULocomotionConfig_Scavenger_Young: ULocomotionConfig_Creature
{
	default m_SpeedConfig = USpeedConfig_Scavenger_Young::StaticClass();
	default m_GroundConfig = UGroundConfig_Creature::StaticClass();
	default m_LandingConfig = ULandingConfig_Creature::StaticClass();
	default m_AirConfig = UAirConfig_Creature::StaticClass();
	default m_LookConfig = ULookConfig_Creature::StaticClass();
	default m_JumpConfig = UJumpConfig_Scavenger_Young::StaticClass();
	default m_WaterConfig = UWaterConfig_Scavenger_Young::StaticClass();
	default m_SwimConfig = USwimConfig_Scavenger_Young::StaticClass();
    default m_RagdollConfig = URagdollConfig_Scavenger_Young::StaticClass();
	default m_ClimbingConfig = UClimbingConfig_Scavenger_Young::StaticClass();
};
