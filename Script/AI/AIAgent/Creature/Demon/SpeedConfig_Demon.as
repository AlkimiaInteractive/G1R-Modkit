
// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Demon: ULocomotionSpeedSettings_WalkSpeed
{
    default m_Speeds.Add(EWalkSpeed::Walking, 200);
    default m_Speeds.Add(EWalkSpeed::Running, 350);
    default m_Speeds.Add(EWalkSpeed::Sprinting, 570);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Demon: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Demon::StaticClass());
};


UCLASS()
class ULocomotionSpeedSettings_Demon: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Demon::StaticClass());
    default m_Speeds.Add(EMovementState::Flying, ULocomotionSpeedSettings_Ground_Demon::StaticClass());
};

UCLASS()
class USpeedConfig_Demon: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Demon::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Demon::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Demon::StaticClass();
}
