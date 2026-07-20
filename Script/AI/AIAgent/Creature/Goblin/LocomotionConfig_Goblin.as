
UCLASS()
class UWaterConfig_Goblin: UWaterConfig_Creature
{
	default m_Buoyancy = 2.8;  
	default m_RagdollUnderWaterHeight = 90;
};

UCLASS()
class USwimConfig_Goblin: USwimConfig_Creature
{
	default m_SwimToDiveHeight = 60;
	default m_DiveToSwimHeight = 110;
	default m_WalkToSwimHeight = 60;
	default m_SwimToWalkHeight = 50;
};

UCLASS()
class UJumpConfig_Goblin: UJumpConfig
{
	default m_JumpZVelocity = 400;
};

UCLASS()
class URagdollConfig_Goblin: URagdollConfig
{
    default m_FloatRagdollCurve = n"CurveVector'/Game/AnimLibrary/Data/Curves/CharacterMovementCurves/RagdollFloatMovement.RagdollFloatMovement'";
	default m_GetUpBackAnimMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Movement/Grounded/N/GetUp/A_GreenGoblin_N_GetUp_Back_Combat_Montage.A_GreenGoblin_N_GetUp_Back_Combat_Montage'";
	default m_GetUpFrontAnimMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Movement/Grounded/N/GetUp/A_GreenGoblin_N_GetUp_Front_Combat_Montage.A_GreenGoblin_N_GetUp_Front_Combat_Montage'";
    
    default m_GetUpPlayRate = 1;
    default m_RagdollStartBlendOutTime = 0.2;
    default m_StopBonesMovementOnStart = false;
    default m_WaterResistance = 0.05f;
    default m_BuySimStrength = 1.0f;
};

UCLASS()
class ULocomotionConfig_Goblin: ULocomotionConfig_Creature
{
	default m_SpeedConfig = USpeedConfig_Goblin::StaticClass();
	default m_GroundConfig = UGroundConfig_Creature::StaticClass();
	default m_LandingConfig = ULandingConfig_Creature::StaticClass();
	default m_AirConfig = UAirConfig_Creature::StaticClass();
	default m_LookConfig = ULookConfig_Creature::StaticClass();
	default m_JumpConfig = UJumpConfig_Goblin::StaticClass();
	default m_WaterConfig = UWaterConfig_Goblin::StaticClass();
	default m_SwimConfig = USwimConfig_Goblin::StaticClass();
    default m_RagdollConfig = URagdollConfig_Goblin::StaticClass();
	default m_ClimbingConfig = UClimbingConfig_Goblin::StaticClass();
	default m_CurveConfig = ULocomotionCurveConfig_Biped_Creatures::StaticClass();
};
