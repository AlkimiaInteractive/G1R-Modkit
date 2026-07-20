
// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_ShadowBeast: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 200);
	default m_Speeds.Add(EWalkSpeed::Running, 600);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 850);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_ShadowBeast: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_ShadowBeast::StaticClass());
};


UCLASS()
class ULocomotionSpeedSettings_Swimming_Stand_ShadowBeast: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 232);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 310);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Crouch_ShadowBeast: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 232);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 310);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_ShadowBeast: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Swimming_Stand_ShadowBeast::StaticClass());
	default m_Speeds.Add(EStance::Crouching, ULocomotionSpeedSettings_Swimming_Crouch_ShadowBeast::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_ShadowBeast: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_ShadowBeast::StaticClass());
    default m_Speeds.Add(EMovementState::Swimming, ULocomotionSpeedSettings_Swimming_ShadowBeast::StaticClass());
};

UCLASS()
class USpeedConfig_ShadowBeast: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_ShadowBeast::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_ShadowBeast::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_ShadowBeast::StaticClass();
}

