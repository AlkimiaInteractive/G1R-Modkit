

//-- GROUND
//---- Stand
UCLASS()
class ULocomotionSpeedSettings_Ground_Stand_Human: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 120);
	default m_Speeds.Add(EWalkSpeed::Running, 350);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 500);
};

//---- Crouch
UCLASS()
class ULocomotionSpeedSettings_Ground_Crouch_Human: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 80);
	default m_Speeds.Add(EWalkSpeed::Running, 130);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 300);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Crouch_Aggressive_Human: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 80);
	default m_Speeds.Add(EWalkSpeed::Running, 130);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 300);
};

UCLASS()
class ULocomotionSpeedSettings_Ground_Human: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Ground_Stand_Human::StaticClass());
	default m_Speeds.Add(EStance::Crouching, ULocomotionSpeedSettings_Ground_Crouch_Human::StaticClass());
};

//-- Swim
UCLASS()
class ULocomotionSpeedSettings_Swim_Laying_Human: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 100);
	default m_Speeds.Add(EWalkSpeed::Running, 150);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 220);
};

UCLASS()
class ULocomotionSpeedSettings_Swim_Laying_Aggressive_Human: ULocomotionSpeedSettings_WalkSpeed
{
	default m_Speeds.Add(EWalkSpeed::Walking, 100);
	default m_Speeds.Add(EWalkSpeed::Running, 150);
	default m_Speeds.Add(EWalkSpeed::Sprinting, 220);
};

UCLASS()
class ULocomotionSpeedSettings_Swim_Human: ULocomotionSpeedSettings_Stance
{
	default m_Speeds.Add(EStance::Laying, ULocomotionSpeedSettings_Swim_Laying_Human::StaticClass());
	default m_Speeds.Add(EStance::Standing, ULocomotionSpeedSettings_Swim_Laying_Human::StaticClass());
	//default m_Speeds.Add(EStance::Diving, ULocomotionSpeedSettings_Swim_Diving_Human::StaticClass());
};



UCLASS()
class ULocomotionSpeedSettings_Human: ULocomotionSpeedSettings
{
	default m_Speeds.Add(EMovementState::Grounded, ULocomotionSpeedSettings_Ground_Human::StaticClass());
	default m_Speeds.Add(EMovementState::Swimming, ULocomotionSpeedSettings_Swim_Human::StaticClass());
};

///Base speed AI
UCLASS()
class USpeedConfig_Human: USpeedConfig
{
    default m_VelocityDirection = ULocomotionSpeedSettings_Human::StaticClass();
    default m_LookingDirection = ULocomotionSpeedSettings_Human::StaticClass();
    default m_Aiming = ULocomotionSpeedSettings_Human::StaticClass();
};