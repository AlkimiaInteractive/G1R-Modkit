// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Bloodhound: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 550);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 900);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Bloodhound: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Bloodhound::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Stand_Bloodhound: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 232);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 310);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Crouch_Bloodhound: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 232);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 310);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Bloodhound: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Swimming_Stand_Bloodhound::StaticClass());
	default m_Speeds.Add(EStance::Crouching, ULocomotionSpeedSettings_Swimming_Crouch_Bloodhound::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Bloodhound: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Bloodhound::StaticClass());
    default m_Speeds.Add(EMovementState::Swimming, ULocomotionSpeedSettings_Swimming_Bloodhound::StaticClass());
};

UCLASS()
class USpeedConfig_Bloodhound: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Bloodhound::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Bloodhound::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Bloodhound::StaticClass();
}