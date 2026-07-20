
// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Golem_Fire: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 156);
	default m_Speeds.Add(EWalkSpeed::Running, 455);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 650);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Golem_Fire: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Golem_Fire::StaticClass());
};


UCLASS()
class ULocomotionSpeedSettings_Golem_Fire: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Golem_Fire::StaticClass());
};


UCLASS()
class USpeedConfig_Golem_Fire: USpeedConfig_Golem
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Golem_Fire::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Golem_Fire::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Golem_Fire::StaticClass();
}
