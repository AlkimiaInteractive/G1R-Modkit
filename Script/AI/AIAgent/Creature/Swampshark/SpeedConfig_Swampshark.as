
// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Swampshark: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 300);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 500);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Swampshark: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Swampshark::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Swampshark : ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Swimming_Stand_Swampshark::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Stand_Swampshark: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 232);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 310);
};

UCLASS()
class ULocomotionSpeedSettings_Swampshark: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Swampshark::StaticClass());
	default m_Speeds.Add(EMovementState::Swimming, ULocomotionSpeedSettings_Swimming_Swampshark::StaticClass());
};


//////////////////////////////////////////////////////////

UCLASS()
class USpeedConfig_Swampshark: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Swampshark::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Swampshark::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Swampshark::StaticClass();
}
