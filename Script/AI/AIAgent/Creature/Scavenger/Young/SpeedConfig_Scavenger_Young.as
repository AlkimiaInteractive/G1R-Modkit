UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Scavenger_Young: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 60);
	default m_Speeds.Add(EWalkSpeed::Running, 175);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 288);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Stand_Scavenger_Young: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 60);
	default m_Speeds.Add(EWalkSpeed::Running, 175);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 288);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Crouch_Scavenger_Young: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 60);
	default m_Speeds.Add(EWalkSpeed::Running, 175);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 288);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Scavenger_Young: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Swimming_Stand_Scavenger_Young::StaticClass());
	default m_Speeds.Add(EStance::Crouching, ULocomotionSpeedSettings_Swimming_Crouch_Scavenger_Young::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Scavenger_Young: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Scavenger_Young::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Scavenger_Young: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Scavenger_Young::StaticClass());
	default m_Speeds.Add(EMovementState::Swimming, ULocomotionSpeedSettings_Swimming_Scavenger_Young::StaticClass());
};

UCLASS()
class USpeedConfig_Scavenger_Young: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Scavenger_Young::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Scavenger_Young::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Scavenger_Young::StaticClass();
}
