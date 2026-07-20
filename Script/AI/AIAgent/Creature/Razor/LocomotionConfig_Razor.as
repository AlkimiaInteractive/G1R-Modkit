
UCLASS()
class UWaterConfig_Razor: UWaterConfig_Creature
{
	default m_Buoyancy = 1.35;  
	default m_RagdollUnderWaterHeight = 90;
};

UCLASS()
class USwimConfig_Razor: USwimConfig_Creature
{
	default m_SwimToDiveHeight = 160;
	default m_DiveToSwimHeight = 140;
	default m_WalkToSwimHeight = 60;
	default m_SwimToWalkHeight = 50;
	default m_CrouchableWaterHeight = 30;
	default m_CapsuleSwimmingHalfHeight = 95;
};

UCLASS()
class UJumpConfig_Razor: UJumpConfig
{
	default m_JumpZVelocity = 480;
};

UCLASS()
class URagdollConfig_Razor: URagdollConfig
{
    default m_FloatRagdollCurve = n"CurveVector'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/RagdollFloatMovement.RagdollFloatMovement'";
    default m_GetUpPlayRate = 1;
    default m_RagdollStartBlendOutTime = 0.2;
    default m_StopBonesMovementOnStart = false;
    default m_WaterResistance = 0.05f;
    default m_BuySimStrength = 1.0f;
};

UCLASS()
class ULocomotionConfig_Razor: ULocomotionConfig_Creature_Dinosaurs
{
	default m_SpeedConfig = USpeedConfig_Razor::StaticClass();
	default m_GroundConfig = UGroundConfig_Creature::StaticClass();
	default m_LandingConfig = ULandingConfig_Creature::StaticClass();
	default m_AirConfig = UAirConfig_Creature::StaticClass();
	default m_LookConfig = ULookConfig_Creature::StaticClass();
	default m_JumpConfig = UJumpConfig_Razor::StaticClass();
	default m_WaterConfig = UWaterConfig_Razor::StaticClass();
	default m_RagdollConfig = URagdollConfig_Razor::StaticClass();
	default m_SwimConfig = USwimConfig_Razor::StaticClass();
	default m_ClimbingConfig = UClimbingConfig_Razor::StaticClass();
};

UCLASS()
class ULocomotionConfig_Razor_Player: ULocomotionConfig_Razor
{
	default m_CurveConfig = ULocomotionCurveConfig_Dinosaurs_Player::StaticClass();
}