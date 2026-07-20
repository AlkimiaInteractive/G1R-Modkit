
// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Goblin: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 100);
	default m_Speeds.Add(EWalkSpeed::Running, 200);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 400);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Stand_Goblin: ULocomotionSpeedSettings_WalkSpeed
{
	//default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 165);
	//default m_Speeds.Add(EWalkSpeed::Sprinting, 150);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Goblin: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Swimming_Stand_Goblin::StaticClass());
	default m_Speeds.Add(EStance::Crouching, ULocomotionSpeedSettings_Swimming_Stand_Goblin::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Goblin: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Goblin::StaticClass());
};


UCLASS()
class ULocomotionSpeedSettings_Goblin: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Goblin::StaticClass());
	default m_Speeds.Add(EMovementState::Swimming, ULocomotionSpeedSettings_Swimming_Goblin::StaticClass());
};

UCLASS()
class USpeedConfig_Goblin: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Goblin::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Goblin::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Goblin::StaticClass();
}