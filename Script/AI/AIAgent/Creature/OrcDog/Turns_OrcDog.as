UCLASS()
class UTurnOnSpotAssetConfig_OrcDog : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_OrcDog_TIPL30 : UTurnOnSpotAssetConfig_OrcDog
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Stop/A_OrcDog_StopWalkRun_Left.A_OrcDog_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_OrcDog_TIPR30 : UTurnOnSpotAssetConfig_OrcDog
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Stop/A_OrcDog_StopWalkRun_Right.A_OrcDog_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_OrcDog_TIPL90 : UTurnOnSpotAssetConfig_OrcDog
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Turn/A_OrcDog_Turn90Left.A_OrcDog_Turn90Left'";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_OrcDog_TIPR90 : UTurnOnSpotAssetConfig_OrcDog
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Turn/A_OrcDog_Turn90Right.A_OrcDog_Turn90Right'";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_OrcDog_TIPL180 : UTurnOnSpotAssetConfig_OrcDog
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Turn/A_OrcDog_Turn180Left.A_OrcDog_Turn180Left'";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_OrcDog_TIPR180 : UTurnOnSpotAssetConfig_OrcDog
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Turn/A_OrcDog_Turn180Right.A_OrcDog_Turn180Right'";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_OrcDog : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_OrcDog_TIPL30::StaticClass();
	default m_TIPR30 = UTurnOnSpotAssetConfig_OrcDog_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_OrcDog_TIPL90::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_OrcDog_TIPR90::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_OrcDog_TIPL180::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_OrcDog_TIPR180::StaticClass();
}

UCLASS()
class UTurnOnSpotAssetConfig_OrcDog_Combat_TIPL30 : UTurnOnSpotAssetConfig_OrcDog
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Stop/A_OrcDog_StopWalkRun_Left.A_OrcDog_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_OrcDog_Combat_TIPR30 : UTurnOnSpotAssetConfig_OrcDog
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Stop/A_OrcDog_StopWalkRun_Right.A_OrcDog_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_OrcDog_Combat_TIPL90 : UTurnOnSpotAssetConfig_OrcDog
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Combat/Movement/Grounded/N/Turn/A_OrcDog_Idle_CombatTurn90Left.A_OrcDog_Idle_CombatTurn90Left'";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_OrcDog_Combat_TIPR90 : UTurnOnSpotAssetConfig_OrcDog
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Combat/Movement/Grounded/N/Turn/A_OrcDog_Idle_CombatTurn90Right.A_OrcDog_Idle_CombatTurn90Right'";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_OrcDog_Combat_TIPL180 : UTurnOnSpotAssetConfig_OrcDog
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Combat/Movement/Grounded/N/Turn/A_OrcDog_Idle_CombatTurn180Left.A_OrcDog_Idle_CombatTurn180Left'";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_OrcDog_Combat_TIPR180 : UTurnOnSpotAssetConfig_OrcDog
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Combat/Movement/Grounded/N/Turn/A_OrcDog_Idle_CombatTurn180Right.A_OrcDog_Idle_CombatTurn180Right'";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_OrcDog_Combat : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_OrcDog_Combat_TIPL30::StaticClass();
	default m_TIPR30 = UTurnOnSpotAssetConfig_OrcDog_Combat_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_OrcDog_Combat_TIPL90::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_OrcDog_Combat_TIPR90::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_OrcDog_Combat_TIPL180::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_OrcDog_Combat_TIPR180::StaticClass();
    //default m_TurnCheckMinAngle = 30;
}

UCLASS()
class UTurnsData_OrcDog : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_OrcDog::StaticClass();

    //Pivots

	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Turn/A_OrcDog_WalkTurn180.A_OrcDog_WalkTurn180'";

	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Turn/A_OrcDog_WalkTurn180.A_OrcDog_WalkTurn180'";

	

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Turn/A_OrcDog_RunTurn180.A_OrcDog_RunTurn180'";
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Turn/A_OrcDog_RunTurn180.A_OrcDog_RunTurn180'";



	FTurnDirections m_SprintPivots;
	default m_SprintPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Turn/A_OrcDog_RunTurn180.A_OrcDog_RunTurn180'";
    default m_SprintPivots.Pivot180L.BlendOut = 0.0;
	default m_SprintPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Turn/A_OrcDog_RunTurn180.A_OrcDog_RunTurn180'";
    default m_SprintPivots.Pivot180R.BlendOut = 0.0;
	

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Sprinting, m_SprintPivots);

    // Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Start/A_OrcDog_StartWalkLeft.A_OrcDog_StartWalkLeft'";
	default m_WalkStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Start/A_OrcDog_StartWalkRight.A_OrcDog_StartWalkRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Start/A_OrcDog_StartTurn180Left.A_OrcDog_StartTurn180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Start/A_OrcDog_StartTurn180Right.A_OrcDog_StartTurn180Right'";

	// Start Moving
    FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Start/A_OrcDog_StartWalkLeft.A_OrcDog_StartWalkLeft'";
	default m_RunStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Start/A_OrcDog_StartWalkRight.A_OrcDog_StartWalkRight'";
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Start/A_OrcDog_StartTurn180Left.A_OrcDog_StartTurn180Left'";
	// default m_RunStarts.Pivot180L.BlendIn = 0.35;
	// default m_RunStarts.Pivot180L.StartTime = 0.15;
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Start/A_OrcDog_StartTurn180Right.A_OrcDog_StartTurn180Right'";
	// default m_RunStarts.Pivot180R.BlendIn = 0.35;
	// default m_RunStarts.Pivot180L.StartTime = 0.15;

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Stop/A_OrcDog_StopWalkRun_Left.A_OrcDog_StopWalkRun_Left'";
	default m_WalkStops.QuickStopL.BlendIn = 0.2f;
	default m_WalkStops.QuickStopL.BlendOut = 0.2f;
	default m_WalkStops.QuickStopL.StartTime = 0.7f;
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Stop/A_OrcDog_StopWalkRun_Right.A_OrcDog_StopWalkRun_Right'";
	default m_WalkStops.QuickStopR.BlendIn = 0.2f;
	default m_WalkStops.QuickStopR.BlendOut = 0.2f;
	default m_WalkStops.QuickStopR.StartTime = 0.7f;
	
	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Stop/A_OrcDog_StopSprint.A_OrcDog_StopSprint'";
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Stop/A_OrcDog_StopSprint.A_OrcDog_StopSprint'";

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
}

UCLASS()
class UTurnsData_OrcDog_Combat : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_OrcDog_Combat::StaticClass();

    // Pivots
    
	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Combat/Movement/Grounded/N/Turn/A_OrcDog_RunCombatTurn180.A_OrcDog_RunCombatTurn180'";
	default m_WalkPivots.Pivot180L.BlendOut = 0.0;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Combat/Movement/Grounded/N/Turn/A_OrcDog_RunCombatTurn180.A_OrcDog_RunCombatTurn180'";
	default m_WalkPivots.Pivot180R.BlendOut = 0.0;

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Turn/A_OrcDog_RunTurn180.A_OrcDog_RunTurn180'";
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Turn/A_OrcDog_RunTurn180.A_OrcDog_RunTurn180'";

	FTurnDirections m_SprintPivots;
	default m_SprintPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Turn/A_OrcDog_RunTurn180.A_OrcDog_RunTurn180'";
    default m_SprintPivots.Pivot180L.BlendOut = 0.0;
	default m_SprintPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Turn/A_OrcDog_RunTurn180.A_OrcDog_RunTurn180'";
    default m_SprintPivots.Pivot180R.BlendOut = 0.0;
	
	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Sprinting, m_SprintPivots);

	// Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Combat/Movement/Grounded/N/Start/A_OrcDog_StartWalkCombatLeft.A_OrcDog_StartWalkCombatLeft'";
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Combat/Movement/Grounded/N/Start/A_OrcDog_StartWalkCombatRight.A_OrcDog_StartWalkCombatRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Combat/Movement/Grounded/N/Start/A_OrcDog_StartWalkCombat180Left.A_OrcDog_StartWalkCombat180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Combat/Movement/Grounded/N/Start/A_OrcDog_StartWalkCombat180Right.A_OrcDog_StartWalkCombat180Right'";

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Combat/Movement/Grounded/N/Start/A_OrcDog_StartWalkCombatLeft.A_OrcDog_StartWalkCombatLeft'";
	default m_RunPivots.Pivot90L.PlayRate = 1.2;
	default m_RunStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Combat/Movement/Grounded/N/Start/A_OrcDog_StartWalkCombatRight.A_OrcDog_StartWalkCombatRight'";
	default m_RunPivots.Pivot90R.PlayRate = 1.2;
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Combat/Movement/Grounded/N/Start/A_OrcDog_StartWalkCombat180Left.A_OrcDog_StartWalkCombat180Left'";
	default m_RunPivots.Pivot180R.StartTime = 0.0;
	default m_RunPivots.Pivot180R.BlendOut = 0.0;
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Combat/Movement/Grounded/N/Start/A_OrcDog_StartWalkCombat180Right.A_OrcDog_StartWalkCombat180Right'";
	default m_RunPivots.Pivot180R.StartTime = 0.0;
	default m_RunPivots.Pivot180R.BlendOut = 0.0;

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Stop/A_OrcDog_StopWalkRun_Left.A_OrcDog_StopWalkRun_Left'";
	default m_WalkStops.QuickStopL.BlendIn = 0.2f;
	default m_WalkStops.QuickStopL.BlendOut = 0.2f;
	default m_WalkStops.QuickStopL.StartTime = 0.7f;
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Stop/A_OrcDog_StopWalkRun_Right.A_OrcDog_StopWalkRun_Right'";
	default m_WalkStops.QuickStopR.BlendIn = 0.2f;
	default m_WalkStops.QuickStopR.BlendOut = 0.2f;
	default m_WalkStops.QuickStopR.StartTime = 0.7f;

	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Stop/A_OrcDog_StopSprint.A_OrcDog_StopSprint'";
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/OrcDog/Movement/Grounded/N/Stop/A_OrcDog_StopSprint.A_OrcDog_StopSprint'";

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
}