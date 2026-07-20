
// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Zombie: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 100);
	default m_Speeds.Add(EWalkSpeed::Running, 200);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 400);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Zombie: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Zombie::StaticClass());
};


UCLASS()
class ULocomotionSpeedSettings_Zombie: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Zombie::StaticClass());
};

UCLASS()
class USpeedConfig_Zombie: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Zombie::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Zombie::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Zombie::StaticClass();
}