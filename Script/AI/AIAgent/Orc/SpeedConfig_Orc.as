
//-- GROUND
//---- Stand
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Orc: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 168);
	default m_Speeds.Add(EWalkSpeed::Running, 490);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 700);
};

//---- Crouch
UCLASS()
class ULocomotionSpeedSettings_Ground_Crouch_Orc: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 175);
	default m_Speeds.Add(EWalkSpeed::Running, 375);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 650);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Orc: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Orc::StaticClass());
	default m_Speeds.Add(EStance::Crouching, ULocomotionSpeedSettings_Ground_Crouch_Orc::StaticClass());
};

//-- Swim
UCLASS()
class ULocomotionSpeedSettings_Swim_Laying_Orc: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 175);
	default m_Speeds.Add(EWalkSpeed::Running, 375);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 650);
};

UCLASS()
class ULocomotionSpeedSettings_Swim_Orc: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Laying, ULocomotionSpeedSettings_Swim_Laying_Orc::StaticClass());
	//default m_Speeds.Add(EStance::Diving, ULocomotionSpeedSettings_Swim_Diving_Orc::StaticClass());
};

UCLASS()
class ULocomotionSpeedSettings_Orc: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Orc::StaticClass());
	default m_Speeds.Add(EMovementState::Swimming, ULocomotionSpeedSettings_Swim_Orc::StaticClass());
};

UCLASS()
class USpeedConfig_Orc: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Orc::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Orc::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Orc::StaticClass();
}