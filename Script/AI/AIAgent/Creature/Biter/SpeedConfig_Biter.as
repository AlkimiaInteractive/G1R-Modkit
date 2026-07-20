
// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Biter: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 300);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 550);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Biter: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Biter::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Stand_Biter: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 300);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 550);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Crouch_Biter: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 300);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 550);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Biter: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Swimming_Stand_Biter::StaticClass());
	default m_Speeds.Add(EStance::Crouching, ULocomotionSpeedSettings_Swimming_Crouch_Biter::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Biter: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Biter::StaticClass());
	default m_Speeds.Add(EMovementState::Swimming, ULocomotionSpeedSettings_Swimming_Biter::StaticClass());
};

UCLASS()
class USpeedConfig_Biter: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Biter::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Biter::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Biter::StaticClass();
}