
// GROUND
/*UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Molerat: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 41);
	default m_Speeds.Add(EWalkSpeed::Running, 151);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 216);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Molerat: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Molerat::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Molerat: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Molerat::StaticClass());
};


UCLASS()
class USpeedConfig_Molerat: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Molerat::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Molerat::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Molerat::StaticClass();
}*/


////////////////// MOLERAT V2

UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Molerat: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 100);
	default m_Speeds.Add(EWalkSpeed::Running, 200);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 300);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_MotherMolerat: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 250);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 350);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Molerat: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Molerat::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Ground_MotherMolerat: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_MotherMolerat::StaticClass());
};


UCLASS()
class ULocomotionSpeedSettings_Swimming_Stand_Molerat: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 232);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 310);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Crouch_Molerat: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 150);
	default m_Speeds.Add(EWalkSpeed::Running, 232);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 310);
};

UCLASS()
class ULocomotionSpeedSettings_Swimming_Molerat: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Swimming_Stand_Molerat::StaticClass());
	default m_Speeds.Add(EStance::Crouching, ULocomotionSpeedSettings_Swimming_Crouch_Molerat::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Molerat: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Molerat::StaticClass());
    default m_Speeds.Add(EMovementState::Swimming, ULocomotionSpeedSettings_Swimming_Molerat::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_MotherMolerat: ULocomotionSpeedSettings_Molerat
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_MotherMolerat::StaticClass());
};

UCLASS()
class USpeedConfig_Molerat: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Molerat::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Molerat::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Molerat::StaticClass();
}

UCLASS()
class USpeedConfig_MotherMolerat: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_MotherMolerat::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_MotherMolerat::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_MotherMolerat::StaticClass();
}




