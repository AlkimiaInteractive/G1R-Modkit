
// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_OrcDog: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 400);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 700);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_OrcDog: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_OrcDog::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Stand_OrcDog: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 232);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 310);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Crouch_OrcDog: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 232);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 310);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_OrcDog: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Swimming_Stand_OrcDog::StaticClass());
	default m_Speeds.Add(EStance::Crouching, ULocomotionSpeedSettings_Swimming_Crouch_OrcDog::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_OrcDog: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_OrcDog::StaticClass());
    default m_Speeds.Add(EMovementState::Swimming, ULocomotionSpeedSettings_Swimming_OrcDog::StaticClass());
};

UCLASS()
class USpeedConfig_OrcDog: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_OrcDog::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_OrcDog::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_OrcDog::StaticClass();
}