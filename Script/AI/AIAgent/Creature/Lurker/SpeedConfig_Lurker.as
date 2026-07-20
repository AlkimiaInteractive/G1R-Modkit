
// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Lurker: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 170);
	default m_Speeds.Add(EWalkSpeed::Running, 300);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 500);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Lurker: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Lurker::StaticClass());
};


UCLASS()
class ULocomotionSpeedSettings_Swimming_Stand_Lurker: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 332);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 360);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Crouch_Lurker: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 232);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 310);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Lurker: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Swimming_Stand_Lurker::StaticClass());
	default m_Speeds.Add(EStance::Crouching, ULocomotionSpeedSettings_Swimming_Crouch_Lurker::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Lurker: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Lurker::StaticClass());
    default m_Speeds.Add(EMovementState::Swimming, ULocomotionSpeedSettings_Swimming_Lurker::StaticClass());
};

UCLASS()
class USpeedConfig_Lurker: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Lurker::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Lurker::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Lurker::StaticClass();
}

