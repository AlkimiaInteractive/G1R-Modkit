
// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Demon_Lesser: ULocomotionSpeedSettings_WalkSpeed
{
    default m_Speeds.Add(EWalkSpeed::Walking, 200);
    default m_Speeds.Add(EWalkSpeed::Running, 350);
    default m_Speeds.Add(EWalkSpeed::Sprinting, 570);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Demon_Lesser: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Demon_Lesser::StaticClass());
};


UCLASS()
class ULocomotionSpeedSettings_Demon_Lesser: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Demon_Lesser::StaticClass());
    default m_Speeds.Add(EMovementState::Flying, ULocomotionSpeedSettings_Ground_Demon_Lesser::StaticClass());
};

UCLASS()
class USpeedConfig_Demon_Lesser: USpeedConfig_Demon
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Demon_Lesser::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Demon_Lesser::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Demon_Lesser::StaticClass();
}

