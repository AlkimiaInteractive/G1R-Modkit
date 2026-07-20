UCLASS()
class UWaterConfig_Scavenger_Adult_Rideable : UWaterConfig_Creature
{
	default m_Buoyancy = 1.95;  
	default m_RagdollUnderWaterHeight = 90;
	
	default m_SurfaceWaterEffect = UGE_SurfaceWater_Player::StaticClass();
    default m_MidWaterEffect = UGE_MidWater_Player::StaticClass();
    default m_DeepWaterEffect = UGE_DeepWater_Player::StaticClass();
};

UCLASS()
class USwimConfig_Scavenger_Adult_Rideable : USwimConfig_Creature
{
	default m_SwimToDiveHeight = MAX_flt;
	default m_DiveToSwimHeight = MAX_flt;
	default m_WalkToSwimHeight = 60;
	default m_SwimToWalkHeight = 50;
	default m_CapsuleSwimmingHalfHeight = 85;

	default m_WaterImpactFrictionMultiplier = 5;
	default m_WaterImpactDragMultiplier = 5;
};

UCLASS()
class UJumpConfig_Scavenger_Adult_Rideable : UJumpConfig
{
	default m_JumpZVelocity = 480;
};

UCLASS()
class ULocomotionConfig_Scavenger_Adult_Rideable : ULocomotionConfig_Scavenger_Adult
{
	default m_WaterConfig = UWaterConfig_Scavenger_Adult_Rideable::StaticClass();
	default m_SwimConfig = USwimConfig_Scavenger_Adult_Rideable::StaticClass();
	
	default m_CurveConfig = ULocomotionCurveConfig_Dinosaurs_Player::StaticClass();
};
