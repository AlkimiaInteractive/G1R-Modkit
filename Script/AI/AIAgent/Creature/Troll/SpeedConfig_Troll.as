
// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Troll: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 300);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 600);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Troll: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Troll::StaticClass());
};


UCLASS()
class ULocomotionSpeedSettings_Troll: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Troll::StaticClass());
};
