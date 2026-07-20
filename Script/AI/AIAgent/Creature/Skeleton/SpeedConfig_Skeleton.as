// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Skeleton: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 300);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 500);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Stand_Skeleton: ULocomotionSpeedSettings_WalkSpeed
{
	//default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 150);
	//default m_Speeds.Add(EWalkSpeed::Sprinting, 150);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Skeleton: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Swimming_Stand_Skeleton::StaticClass());
	default m_Speeds.Add(EStance::Crouching, ULocomotionSpeedSettings_Swimming_Stand_Skeleton::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Skeleton: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Skeleton::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Skeleton: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Skeleton::StaticClass());
    default m_Speeds.Add(EMovementState::Swimming, ULocomotionSpeedSettings_Swimming_Skeleton::StaticClass());
};

UCLASS()
class USpeedConfig_Skeleton: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Skeleton::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Skeleton::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Skeleton::StaticClass();
}