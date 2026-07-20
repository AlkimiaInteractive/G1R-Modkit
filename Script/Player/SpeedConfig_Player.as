
//-- GROUND
//---- Stand
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Player: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 120);
	default m_Speeds.Add(EWalkSpeed::Running, 350);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 500);
};

//---- Crouch
UCLASS()
class ULocomotionSpeedSettings_Ground_Crouch_Player: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 80);
	default m_Speeds.Add(EWalkSpeed::Running, 130);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 300);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Player: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Player::StaticClass());
	default m_Speeds.Add(EStance::Crouching, ULocomotionSpeedSettings_Ground_Crouch_Player::StaticClass());
};

//-- Swim
UCLASS()
class ULocomotionSpeedSettings_Swim_Laying_Player: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 100);
	default m_Speeds.Add(EWalkSpeed::Running, 150);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 220);
};

UCLASS()
class ULocomotionSpeedSettings_Swim_Player: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Laying, ULocomotionSpeedSettings_Swim_Laying_Player::StaticClass());
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Swim_Laying_Player::StaticClass());
};

UCLASS()
class UAS_LocomotionSpeedModifierSettings_InWater_Ground_Player: ULocomotionSpeedModifierSettings_InWater
{
	default m_SpeedModifier = 0.6f;
	default m_InWaterDepthThreshold = 60.0f;
}

UCLASS()
class ULocomotionSpeedSettings_Player: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Player::StaticClass());
	default m_Speeds.Add(EMovementState::Swimming, ULocomotionSpeedSettings_Swim_Player::StaticClass());
	default m_Speeds.Add(EMovementState::Falling, ULocomotionSpeedSettings_Ground_Player::StaticClass());
	default m_Speeds.Add(EMovementState::RagDoll, ULocomotionSpeedSettings_Ground_Player::StaticClass());
	default m_Speeds.Add(EMovementState::Interaction, ULocomotionSpeedSettings_Ground_Player::StaticClass());
	default m_Speeds.Add(EMovementState::Riding, ULocomotionSpeedSettings_Ground_Player::StaticClass());
	//default m_WaterSpeedModifiers.Add(EMovementState::Grounded, UAS_LocomotionSpeedModifierSettings_InWater_Ground_Player::StaticClass());
};

UCLASS()
class USpeedConfig_Player: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Player::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Player::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Player::StaticClass();
}

