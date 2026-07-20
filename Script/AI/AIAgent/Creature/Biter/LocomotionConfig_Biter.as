
UCLASS()
class UWaterConfig_Biter: UWaterConfig_Creature
{
	default m_Buoyancy = 1.15;  
	default m_RagdollUnderWaterHeight = 90;
};

UCLASS()
class USwimConfig_Biter: USwimConfig_Creature
{
	default m_SwimToDiveHeight = 160;
	default m_DiveToSwimHeight = 175;
	default m_WalkToSwimHeight = 80;
	default m_SwimToWalkHeight = 75;
	default m_CrouchableWaterHeight = 30;
	default m_CapsuleSwimmingHalfHeight = 80;
};

UCLASS()
class UJumpConfig_Biter: UJumpConfig
{
	default m_JumpZVelocity = 400;
};

UCLASS()
class URagdollConfig_Biter: URagdollConfig
{
    default m_FloatRagdollCurve = n"CurveVector'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/RagdollFloatMovement.RagdollFloatMovement'";
    default m_GetUpPlayRate = 1;
    default m_RagdollStartBlendOutTime = 0.2;
    default m_StopBonesMovementOnStart = false;
    default m_WaterResistance = 0.05f;
    default m_BuySimStrength = 1.0f;
};

UCLASS()
class ULocomotionConfig_Biter: ULocomotionConfig_Creature_Dinosaurs
{
	default m_SpeedConfig = USpeedConfig_Biter::StaticClass();
	default m_GroundConfig = UGroundConfig_Creature::StaticClass();
	default m_LandingConfig = ULandingConfig_Creature::StaticClass();
	default m_AirConfig = UAirConfig_Creature::StaticClass();
	default m_LookConfig = ULookConfig_Creature::StaticClass();
	default m_JumpConfig = UJumpConfig_Biter::StaticClass();
	default m_WaterConfig = UWaterConfig_Biter::StaticClass();
	default m_RagdollConfig = URagdollConfig_Biter::StaticClass();
	default m_SwimConfig = USwimConfig_Biter::StaticClass();
	default m_ClimbingConfig = UClimbingConfig_Biter::StaticClass();
};

UCLASS()
class ULocomotionConfig_Biter_Player: ULocomotionConfig_Biter
{
	default m_CurveConfig = ULocomotionCurveConfig_Dinosaurs_Player::StaticClass();
}