
//-- GROUND
//---- Untrained
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Orc_Combat: ULocomotionSpeedSettings_Ground_Stand_Orc
{
	default m_Speeds.Add(EWalkSpeed::Walking, 168);
	default m_Speeds.Add(EWalkSpeed::Running, 510);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 700);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Orc_Combat: ULocomotionSpeedSettings_Ground_Orc
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Orc_Combat::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Orc_Combat: ULocomotionSpeedSettings_Orc
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Orc_Combat::StaticClass());
};

UCLASS()
class USpeedConfig_Orc_Combat: USpeedConfig_Orc
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Orc_Combat::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Orc_Combat::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Orc_Combat::StaticClass();
}