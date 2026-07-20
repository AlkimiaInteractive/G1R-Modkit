UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Scavenger_Medium: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 120);
	default m_Speeds.Add(EWalkSpeed::Running, 260);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 420);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Stand_Scavenger_Medium: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 120);
	default m_Speeds.Add(EWalkSpeed::Running, 260);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 420);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Crouch_Scavenger_Medium: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 120);
	default m_Speeds.Add(EWalkSpeed::Running, 260);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 420);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Scavenger_Medium: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Swimming_Stand_Scavenger_Medium::StaticClass());
	default m_Speeds.Add(EStance::Crouching, ULocomotionSpeedSettings_Swimming_Crouch_Scavenger_Medium::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Scavenger_Medium: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Scavenger_Medium::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Scavenger_Medium: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Scavenger_Medium::StaticClass());
	default m_Speeds.Add(EMovementState::Swimming, ULocomotionSpeedSettings_Swimming_Scavenger_Medium::StaticClass());
};

UCLASS()
class USpeedConfig_Scavenger_Medium: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Scavenger_Medium::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Scavenger_Medium::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Scavenger_Medium::StaticClass();
}

