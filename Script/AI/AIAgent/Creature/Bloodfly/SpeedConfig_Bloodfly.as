
// GROUND
UCLASS()
class ULocomotionSpeedSettings_Air_Stand_Bloodfly: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 300);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 550);
};

UCLASS()
class ULocomotionSpeedSettings_Air_Bloodfly: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Air_Stand_Bloodfly::StaticClass());
};


UCLASS()
class ULocomotionSpeedSettings_Bloodfly: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Floating, ULocomotionSpeedSettings_Air_Bloodfly::StaticClass());
	default m_Speeds.Add(EMovementState::Flying, ULocomotionSpeedSettings_Air_Bloodfly::StaticClass());
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Air_Bloodfly::StaticClass());
};

UCLASS()
class USpeedConfig_Bloodfly: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Bloodfly::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Bloodfly::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Bloodfly::StaticClass();
}