UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Razor: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 420);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 600);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Razor: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Razor::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Stand_Razor: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 300);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 600);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Crouch_Razor: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 300);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 600);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Razor: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Swimming_Stand_Razor::StaticClass());
	default m_Speeds.Add(EStance::Crouching, ULocomotionSpeedSettings_Swimming_Crouch_Razor::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Razor: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Razor::StaticClass());
	default m_Speeds.Add(EMovementState::Swimming, ULocomotionSpeedSettings_Swimming_Razor::StaticClass());
};

UCLASS()
class USpeedConfig_Razor: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Razor::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Razor::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Razor::StaticClass();
}
