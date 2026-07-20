
// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Golem_Stone_Brige: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 120);
	default m_Speeds.Add(EWalkSpeed::Running, 350);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 500);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Golem_Stone_Brige: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Golem_Stone_Brige::StaticClass());
};


UCLASS()
class ULocomotionSpeedSettings_Golem_Stone_Brige: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Golem_Stone_Brige::StaticClass());
};


UCLASS()
class USpeedConfig_Golem_Stone_Brige: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Golem_Stone_Brige::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Golem_Stone_Brige::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Golem_Stone_Brige::StaticClass();
}
