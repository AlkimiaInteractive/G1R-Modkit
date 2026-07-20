
// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Troll_Adult_Shrinked: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 300);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 550);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Troll_Adult_Shrinked: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Troll_Adult_Shrinked::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Troll_Adult_Shrinked: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Troll_Adult_Shrinked::StaticClass());
};

UCLASS()
class USpeedConfig_Troll_Adult_Shrinked: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Troll_Adult_Shrinked::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Troll_Adult_Shrinked::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Troll_Adult_Shrinked::StaticClass();
}