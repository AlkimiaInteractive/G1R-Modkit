
// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Lizard: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 90);
	default m_Speeds.Add(EWalkSpeed::Running, 250);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 500);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Lizard: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Lizard::StaticClass());
};

// SWIM
UCLASS()
class ULocomotionSpeedSettings_Swim_Stand_Lizard: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 90);
	default m_Speeds.Add(EWalkSpeed::Running, 300);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 500);
};

UCLASS()
class ULocomotionSpeedSettings_Swim_Lizard: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Swim_Stand_Lizard::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Lizard: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Lizard::StaticClass());
	default m_Speeds.Add(EMovementState::Swimming, ULocomotionSpeedSettings_Swim_Lizard::StaticClass());
};

UCLASS()
class USpeedConfig_Lizard: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Lizard::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Lizard::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Lizard::StaticClass();
}
