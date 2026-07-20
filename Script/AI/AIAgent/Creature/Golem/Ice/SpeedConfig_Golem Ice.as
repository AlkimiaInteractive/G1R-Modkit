
// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Golem_Ice: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 110);
	default m_Speeds.Add(EWalkSpeed::Running, 225);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 350);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Golem_Ice: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Golem_Ice::StaticClass());
};


UCLASS()
class ULocomotionSpeedSettings_Golem_Ice: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Golem_Ice::StaticClass());
};


UCLASS()
class USpeedConfig_Golem_Ice: USpeedConfig_Golem
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Golem_Ice::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Golem_Ice::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Golem_Ice::StaticClass();
}
