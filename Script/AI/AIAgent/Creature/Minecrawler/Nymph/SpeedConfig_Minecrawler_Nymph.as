
// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Minecrawler_Nymph : ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 236);
	default m_Speeds.Add(EWalkSpeed::Running, 340);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 438);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Minecrawler_Nymph : ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Minecrawler_Nymph);
};

UCLASS()
class ULocomotionSpeedSettings_Minecrawler_Nymph : ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Minecrawler_Nymph);
};

UCLASS()
class USpeedConfig_Minecrawler_Nymph : USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Minecrawler_Nymph;
    default m_LookingDirection = ULocomotionSpeedSettings_Minecrawler_Nymph;
    default m_Aiming = ULocomotionSpeedSettings_Minecrawler_Nymph;
}

