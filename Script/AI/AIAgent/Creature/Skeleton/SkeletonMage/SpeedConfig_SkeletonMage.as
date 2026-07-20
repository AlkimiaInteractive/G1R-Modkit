// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_SkeletonMage: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 300);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 429);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_SkeletonMage: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_SkeletonMage::StaticClass());
};

// FLY
UCLASS()
class ULocomotionSpeedSettings_Fly_Stand_SkeletonMage: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 350);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 429);
};

UCLASS()
class ULocomotionSpeedSettings_Fly_SkeletonMage: ULocomotionSpeedSettings_Stance
{
    default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Fly_Stand_SkeletonMage::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_SkeletonMage: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_SkeletonMage::StaticClass());
	default m_Speeds.Add(EMovementState::Flying, ULocomotionSpeedSettings_Fly_SkeletonMage::StaticClass());
};

UCLASS()
class USpeedConfig_SkeletonMage: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_SkeletonMage::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_SkeletonMage::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_SkeletonMage::StaticClass();
}
