
// GROUND
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Harpy: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 114);
	default m_Speeds.Add(EWalkSpeed::Running, 350);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 400);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Harpy: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Harpy::StaticClass());
};

// FLY
UCLASS()
class ULocomotionSpeedSettings_Fly_Stand_Harpy: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 300);
	default m_Speeds.Add(EWalkSpeed::Running, 500);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 750);
};

UCLASS()
class ULocomotionSpeedSettings_Fly_Stand_Harpy_Debug : ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 170);
	default m_Speeds.Add(EWalkSpeed::Running, 200);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 500);
}

UCLASS()
class ULocomotionSpeedSettings_Fly_Harpy: ULocomotionSpeedSettings_Stance
{
    default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Fly_Stand_Harpy::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Harpy: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Harpy::StaticClass());
	default m_Speeds.Add(EMovementState::Flying, ULocomotionSpeedSettings_Fly_Harpy::StaticClass());
};

UCLASS()
class USpeedConfig_Harpy: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Harpy::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Harpy::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Harpy::StaticClass();
}

///------ PLAYER
UCLASS()
class ULocomotionSpeedSettings_Fly_Stand_Harpy_Player: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 500);
	default m_Speeds.Add(EWalkSpeed::Running, 1000);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 1650);
};

UCLASS()
class ULocomotionSpeedSettings_Fly_Harpy_Player: ULocomotionSpeedSettings_Stance
{
    default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Fly_Stand_Harpy_Player::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Harpy_Player: ULocomotionSpeedSettings_Harpy
{
	default m_Speeds.Add(EMovementState::Flying, ULocomotionSpeedSettings_Fly_Harpy_Player::StaticClass());
};

UCLASS()
class USpeedConfig_Harpy_Player: USpeedConfig_Harpy
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Harpy_Player::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Harpy_Player::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Harpy_Player::StaticClass();
}
