
// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Creature: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 300);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 500);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Creature: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Creature::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Creature: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Creature::StaticClass());
    default m_Speeds.Add(EMovementState::Swimming, ULocomotionSpeedSettings_Ground_Creature::StaticClass());
};

UCLASS()
class USpeedConfig_Creature: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Creature::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Creature::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Creature::StaticClass();
}