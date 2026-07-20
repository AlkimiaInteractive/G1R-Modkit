
// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Golem: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 156);
	default m_Speeds.Add(EWalkSpeed::Running, 455);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 455);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Golem: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Golem::StaticClass());
};


UCLASS()
class ULocomotionSpeedSettings_Golem: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Golem::StaticClass());
};


UCLASS()
class USpeedConfig_Golem: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Golem::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Golem::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Golem::StaticClass();
}
