
// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Wolf: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 440);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 780);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Wolf_Alpha: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 210);
	default m_Speeds.Add(EWalkSpeed::Running, 520);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 980);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Wolf: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Wolf::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Wolf_Alpha: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Wolf_Alpha::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Stand_Wolf: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 232);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 310);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Wolf: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Swimming_Stand_Wolf::StaticClass());
	default m_Speeds.Add(EStance::Crouching, ULocomotionSpeedSettings_Swimming_Stand_Wolf::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Wolf: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Wolf::StaticClass());
    default m_Speeds.Add(EMovementState::Swimming, ULocomotionSpeedSettings_Swimming_Wolf::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Wolf_Alpha: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Wolf_Alpha::StaticClass());
    default m_Speeds.Add(EMovementState::Swimming, ULocomotionSpeedSettings_Swimming_Wolf::StaticClass());
};

UCLASS()
class USpeedConfig_Wolf: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Wolf::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Wolf::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Wolf::StaticClass();
}

UCLASS()
class USpeedConfig_Wolf_Alpha: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Wolf_Alpha::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Wolf_Alpha::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Wolf_Alpha::StaticClass();
}