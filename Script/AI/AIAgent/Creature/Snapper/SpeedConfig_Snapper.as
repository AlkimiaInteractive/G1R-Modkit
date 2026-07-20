
// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Snapper: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 175);
	default m_Speeds.Add(EWalkSpeed::Running, 400);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 650);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Snapper: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Snapper::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Stand_Snapper: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 175);
	default m_Speeds.Add(EWalkSpeed::Running, 400);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 650);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Crouch_Snapper: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 175);
	default m_Speeds.Add(EWalkSpeed::Running, 400);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 650);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Snapper: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Swimming_Stand_Snapper::StaticClass());
	default m_Speeds.Add(EStance::Crouching, ULocomotionSpeedSettings_Swimming_Crouch_Snapper::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Snapper: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Snapper::StaticClass());
    default m_Speeds.Add(EMovementState::Swimming, ULocomotionSpeedSettings_Swimming_Snapper::StaticClass());
};

UCLASS()
class USpeedConfig_Snapper: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Snapper::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Snapper::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Snapper::StaticClass();
}