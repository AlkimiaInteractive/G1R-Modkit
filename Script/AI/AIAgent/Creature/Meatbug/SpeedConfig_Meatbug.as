
// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Meatbug: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 20);
	default m_Speeds.Add(EWalkSpeed::Running, 50);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 100);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Meatbug: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Meatbug::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Meatbug: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Meatbug::StaticClass());
};

UCLASS()
class USpeedConfig_Meatbug: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Meatbug::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Meatbug::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Meatbug::StaticClass();
}