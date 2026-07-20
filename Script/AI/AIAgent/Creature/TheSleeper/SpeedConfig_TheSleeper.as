
// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_TheSleeper: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 200);
	default m_Speeds.Add(EWalkSpeed::Running, 200);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 200);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_TheSleeper: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_TheSleeper::StaticClass());
};


UCLASS()
class ULocomotionSpeedSettings_TheSleeper: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_TheSleeper::StaticClass());
};
