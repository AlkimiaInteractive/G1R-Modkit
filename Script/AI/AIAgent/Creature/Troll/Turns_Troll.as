UCLASS()
class UTurnOnSpotAssetConfig_Troll : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_Troll_TIPL30 : UTurnOnSpotAssetConfig_Troll
{
    default m_Animation =  n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Stop/A_AdultTroll_StopWalkRun_Left.A_AdultTroll_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Troll_TIPR30 : UTurnOnSpotAssetConfig_Troll
{
    default m_Animation =  n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Stop/A_AdultTroll_StopWalkRun_Right.A_AdultTroll_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_Troll_TIPL90 : UTurnOnSpotAssetConfig_Troll
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Turn/A_AdultTroll_Turn90Left.A_AdultTroll_Turn90Left'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Troll_TIPR90 : UTurnOnSpotAssetConfig_Troll
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Turn/A_AdultTroll_Turn90Right.A_AdultTroll_Turn90Right'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Troll_TIPL180 : UTurnOnSpotAssetConfig_Troll
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Turn/A_AdultTroll_Turn180Left.A_AdultTroll_Turn180Left'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Troll_TIPR180 : UTurnOnSpotAssetConfig_Troll
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Turn/A_AdultTroll_Turn180Right.A_AdultTroll_Turn180Right'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.2;
}

UCLASS()
class UTurnOnSpotConfig_Troll : UTurnOnSpotConfig
{
    default m_TIPL30 = UTurnOnSpotAssetConfig_Troll_TIPL30::StaticClass();
    default m_TIPR30 = UTurnOnSpotAssetConfig_Troll_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Troll_TIPL90::StaticClass();
    default m_TIPR90 = UTurnOnSpotAssetConfig_Troll_TIPR90::StaticClass();
    default m_TIPL180 = UTurnOnSpotAssetConfig_Troll_TIPL180::StaticClass();
    default m_TIPR180 = UTurnOnSpotAssetConfig_Troll_TIPR180::StaticClass();
}

UCLASS()
class UTurnsData_Troll : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Troll::StaticClass();

    // Pivots
	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Turn/A_AdultTroll_WalkTurn180.A_AdultTroll_WalkTurn180'";
    //default m_WalkPivots.Pivot180L.BlendOut = 0.2;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Turn/A_AdultTroll_WalkTurn180.A_AdultTroll_WalkTurn180'";
    //default m_WalkPivots.Pivot180R.BlendOut = 0.2;
	

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Turn/A_AdultTroll_RunTurn180.A_AdultTroll_RunTurn180'";
	//default m_RunPivots.Pivot180L.BlendOut = 0.2;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Turn/A_AdultTroll_RunTurn180.A_AdultTroll_RunTurn180'";
	//default m_RunPivots.Pivot180R.BlendOut = 0.2;


	FTurnDirections m_SprintPivots;
	default m_SprintPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Turn/A_AdultTroll_RunTurn180.A_AdultTroll_RunTurn180'";
    default m_SprintPivots.Pivot180L.BlendOut = 0.2;
	default m_SprintPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Turn/A_AdultTroll_RunTurn180.A_AdultTroll_RunTurn180'";
    default m_SprintPivots.Pivot180R.BlendOut = 0.2;
    

    default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Sprinting, m_SprintPivots);

    // Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Start/A_AdultTroll_StartWalkLeft.A_AdultTroll_StartWalkLeft'";
	default m_WalkStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Start/A_AdultTroll_StartWalkRight.A_AdultTroll_StartWalkRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Start/A_AdultTroll_StartTurn180Left.A_AdultTroll_StartTurn180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Start/A_AdultTroll_StartTurn180Right.A_AdultTroll_StartTurn180Right'";

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Start/A_AdultTroll_StartWalkLeft.A_AdultTroll_StartWalkLeft'";
	default m_RunStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Start/A_AdultTroll_StartWalkRight.A_AdultTroll_StartWalkRight'";
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Turn/A_AdultTroll_RunTurn180.A_AdultTroll_RunTurn180'";
	default m_RunStarts.Pivot180L.BlendOut = 0.2;
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Turn/A_AdultTroll_RunTurn180.A_AdultTroll_RunTurn180'";
	default m_RunStarts.Pivot180R.BlendOut = 0.2;

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);

    FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Stop/A_AdultTroll_StopWalkRun_Left.A_AdultTroll_StopWalkRun_Left'";
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Stop/A_AdultTroll_StopWalkRun_Right.A_AdultTroll_StopWalkRun_Right'";

	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Stop/A_AdultTroll_StopSprint.A_AdultTroll_StopSprint'";
	default m_SprintStops.QuickStopL.StartTime = 0.22f;
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Stop/A_AdultTroll_StopSprint.A_AdultTroll_StopSprint'";
	default m_SprintStops.QuickStopR.StartTime = 0.22f;

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
	
}

UCLASS()
class UTurnOnSpotAssetConfig_Troll_Combat_TIPL30 : UTurnOnSpotAssetConfig_Troll
{
    default m_Animation =  n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Stop/A_AdultTroll_StopWalkRun_Left.A_AdultTroll_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Troll_Combat_TIPR30 : UTurnOnSpotAssetConfig_Troll
{
    default m_Animation =  n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Stop/A_AdultTroll_StopWalkRun_Right.A_AdultTroll_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_Troll_Combat_TIPL90 : UTurnOnSpotAssetConfig_Troll
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Grounded/N/Turn/A_AdultTroll_Idle_CombatTurn90Left.A_AdultTroll_Idle_CombatTurn90Left'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Troll_Combat_TIPR90 : UTurnOnSpotAssetConfig_Troll
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Grounded/N/Turn/A_AdultTroll_Idle_CombatTurn90Right.A_AdultTroll_Idle_CombatTurn90Right'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Troll_Combat_TIPL180 : UTurnOnSpotAssetConfig_Troll
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Grounded/N/Turn/A_AdultTroll_Idle_CombatTurn180Left.A_AdultTroll_Idle_CombatTurn180Left'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Troll_Combat_TIPR180 : UTurnOnSpotAssetConfig_Troll
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Grounded/N/Turn/A_AdultTroll_Idle_CombatTurn180Right.A_AdultTroll_Idle_CombatTurn180Right'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.2;
}

UCLASS()
class UTurnOnSpotConfig_Troll_Combat : UTurnOnSpotConfig
{
    default m_TIPL30 = UTurnOnSpotAssetConfig_Troll_Combat_TIPL30::StaticClass();
    default m_TIPR30 = UTurnOnSpotAssetConfig_Troll_Combat_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Troll_Combat_TIPL90::StaticClass();
    default m_TIPR90 = UTurnOnSpotAssetConfig_Troll_Combat_TIPR90::StaticClass();
    default m_TIPL180 = UTurnOnSpotAssetConfig_Troll_Combat_TIPL180::StaticClass();
    default m_TIPR180 = UTurnOnSpotAssetConfig_Troll_Combat_TIPR180::StaticClass();
}

UCLASS()
class UTurnsData_Troll_Combat : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Troll_Combat::StaticClass();

    // Pivots

    FTurnDirections m_RunPivots;
    default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Grounded/N/Turn/A_AdultTroll_RunCombatTurn180.A_AdultTroll_RunCombatTurn180'";
	default m_RunPivots.Pivot180L.StartTime = 0.0;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Grounded/N/Turn/A_AdultTroll_RunCombatTurn180.A_AdultTroll_RunCombatTurn180'";
	default m_RunPivots.Pivot180R.StartTime = 0.0;

	default m_Pivots.Add(EWalkSpeed::Walking, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);


    // Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Grounded/N/Start/A_AdultTroll_StartWalkCombatLeft.A_AdultTroll_StartWalkCombatLeft'";
	default m_WalkStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Grounded/N/Start/A_AdultTroll_StartWalkCombatRight.A_AdultTroll_StartWalkCombatRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Grounded/N/Start/A_AdultTroll_StartWalkCombat180Left.A_AdultTroll_StartWalkCombat180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Grounded/N/Start/A_AdultTroll_StartWalkCombat180Right.A_AdultTroll_StartWalkCombat180Right'";

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Grounded/N/Start/A_AdultTroll_StartWalkCombatLeft.A_AdultTroll_StartWalkCombatLeft'";
	default m_RunStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Grounded/N/Start/A_AdultTroll_StartWalkCombatRight.A_AdultTroll_StartWalkCombatRight'";
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Grounded/N/Turn/A_AdultTroll_RunCombatTurn180.A_AdultTroll_RunCombatTurn180'";
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Combat/Movement/Grounded/N/Turn/A_AdultTroll_RunCombatTurn180.A_AdultTroll_RunCombatTurn180'";

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);
	
    FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Stop/A_AdultTroll_StopWalkRun_Left.A_AdultTroll_StopWalkRun_Left'";
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Stop/A_AdultTroll_StopWalkRun_Right.A_AdultTroll_StopWalkRun_Right'";

	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Stop/A_AdultTroll_StopSprint.A_AdultTroll_StopSprint'";
	default m_SprintStops.QuickStopL.StartTime = 0.22f;
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/AdultTroll/Movements/Grounded/N/Stop/A_AdultTroll_StopSprint.A_AdultTroll_StopSprint'";
	default m_SprintStops.QuickStopR.StartTime = 0.22f;

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
	
}