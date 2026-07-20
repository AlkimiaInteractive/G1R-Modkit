
// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Rat: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 90);
	default m_Speeds.Add(EWalkSpeed::Running, 300);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 500);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Rat: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Rat::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Rat: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Rat::StaticClass());
};
