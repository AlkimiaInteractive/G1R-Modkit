
//-- GROUND
//---- Untrained
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Player_Mace1H_Untrained: ULocomotionSpeedSettings_Ground_Stand_Player
{
	default m_Speeds.Add(EWalkSpeed::Walking, 120);
	default m_Speeds.Add(EWalkSpeed::Running, 350);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 400);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Player_Mace1H_Untrained: ULocomotionSpeedSettings_Ground_Player
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Player_Mace1H_Untrained::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Player_Mace1H_Untrained: ULocomotionSpeedSettings_Player
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Player_Mace1H_Untrained::StaticClass());
};

UCLASS()
class USpeedConfig_Player_Mace1H_Untrained: USpeedConfig_Player
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Player_Mace1H_Untrained::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Player_Mace1H_Untrained::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Player_Mace1H_Untrained::StaticClass();
}

//---- Trained
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Player_Mace1H_Trained: ULocomotionSpeedSettings_Ground_Stand_Player
{
	default m_Speeds.Add(EWalkSpeed::Walking, 120);
	default m_Speeds.Add(EWalkSpeed::Running, 350);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 425);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Player_Mace1H_Trained: ULocomotionSpeedSettings_Ground_Player
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Player_Mace1H_Trained::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Player_Mace1H_Trained: ULocomotionSpeedSettings_Player
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Player_Mace1H_Trained::StaticClass());
};

UCLASS()
class USpeedConfig_Player_Mace1H_Trained: USpeedConfig_Player
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Player_Mace1H_Trained::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Player_Mace1H_Trained::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Player_Mace1H_Trained::StaticClass();
}

//---- Master
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Player_Mace1H_Master: ULocomotionSpeedSettings_Ground_Stand_Player
{
	default m_Speeds.Add(EWalkSpeed::Walking, 120);
	default m_Speeds.Add(EWalkSpeed::Running, 350);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 450);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Player_Mace1H_Master: ULocomotionSpeedSettings_Ground_Player
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Player_Mace1H_Master::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Player_Mace1H_Master: ULocomotionSpeedSettings_Player
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Player_Mace1H_Master::StaticClass());
};

UCLASS()
class USpeedConfig_Player_Mace1H_Master: USpeedConfig_Player
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Player_Mace1H_Master::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Player_Mace1H_Master::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Player_Mace1H_Master::StaticClass();
}



