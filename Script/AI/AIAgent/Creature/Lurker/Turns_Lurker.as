UCLASS()
class UTurnOnSpotAssetConfig_Lurker : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_Lurker_TIPL30 : UTurnOnSpotAssetConfig_Lurker
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Stop/A_Lurker_StopWalkRun_Left.A_Lurker_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Lurker_TIPR30 : UTurnOnSpotAssetConfig_Lurker
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Stop/A_Lurker_StopWalkRun_Right.A_Lurker_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_Lurker_TIPL90 : UTurnOnSpotAssetConfig_Lurker
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Turn/A_Lurker_Turn90Left.A_Lurker_Turn90Left'";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Lurker_TIPR90 : UTurnOnSpotAssetConfig_Lurker
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Turn/A_Lurker_Turn90Right.A_Lurker_Turn90Right'";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Lurker_TIPL180 : UTurnOnSpotAssetConfig_Lurker
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Turn/A_Lurker_Turn180Left.A_Lurker_Turn180Left'";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_Lurker_TIPR180 : UTurnOnSpotAssetConfig_Lurker
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Turn/A_Lurker_Turn180Right.A_Lurker_Turn180Right'";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_Lurker : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Lurker_TIPL30::StaticClass();
	default m_TIPR30 = UTurnOnSpotAssetConfig_Lurker_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Lurker_TIPL90::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_Lurker_TIPR90::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_Lurker_TIPL180::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_Lurker_TIPR180::StaticClass();
}

UCLASS()
class UTurnOnSpotAssetConfig_Lurker_Combat_TIPL30 : UTurnOnSpotAssetConfig_Lurker
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Stop/A_Lurker_StopWalkRun_Left.A_Lurker_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Lurker_Combat_TIPR30 : UTurnOnSpotAssetConfig_Lurker
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Stop/A_Lurker_StopWalkRun_Right.A_Lurker_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_Lurker_Combat_TIPL90 : UTurnOnSpotAssetConfig_Lurker
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Combat/Movement/Grounded/N/Turn/A_Lurker_Idle_CombatTurn90Left.A_Lurker_Idle_CombatTurn90Left'";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Lurker_Combat_TIPR90 : UTurnOnSpotAssetConfig_Lurker
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Combat/Movement/Grounded/N/Turn/A_Lurker_Idle_CombatTurn90Right.A_Lurker_Idle_CombatTurn90Right'";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Lurker_Combat_TIPL180 : UTurnOnSpotAssetConfig_Lurker
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Combat/Movement/Grounded/N/Turn/A_Lurker_Idle_CombatTurn180Left.A_Lurker_Idle_CombatTurn180Left'";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_Lurker_Combat_TIPR180 : UTurnOnSpotAssetConfig_Lurker
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Combat/Movement/Grounded/N/Turn/A_Lurker_Idle_CombatTurn180Right.A_Lurker_Idle_CombatTurn180Right'";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_Lurker_Combat : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Lurker_Combat_TIPL30::StaticClass();
	default m_TIPR30 = UTurnOnSpotAssetConfig_Lurker_Combat_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Lurker_Combat_TIPL90::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_Lurker_Combat_TIPR90::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_Lurker_Combat_TIPL180::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_Lurker_Combat_TIPR180::StaticClass();
    //default m_TurnCheckMinAngle = 30;
}

UCLASS()
class UTurnsData_Lurker : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Lurker::StaticClass();

    //Pivots

	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Turn/A_Lurker_WalkTurn180.A_Lurker_WalkTurn180'";
    //default m_WalkPivots.Pivot180L.BlendOut = 0.2;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Turn/A_Lurker_WalkTurn180.A_Lurker_WalkTurn180'";
    //default m_WalkPivots.Pivot180R.BlendOut = 0.2;
	

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Turn/A_Lurker_RunTurn180.A_Lurker_RunTurn180'";
	//default m_RunPivots.Pivot180L.BlendOut = 0.2;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Turn/A_Lurker_RunTurn180.A_Lurker_RunTurn180'";
	//default m_RunPivots.Pivot180R.BlendOut = 0.2;


	FTurnDirections m_SprintPivots;
	default m_SprintPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Turn/A_Lurker_RunTurn180.A_Lurker_RunTurn180'";
    //default m_SprintPivots.Pivot180L.BlendOut = 0.2;
	default m_SprintPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Turn/A_Lurker_RunTurn180.A_Lurker_RunTurn180'";
    //default m_SprintPivots.Pivot180R.BlendOut = 0.2;
	

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Sprinting, m_SprintPivots);

    // Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Start/A_Lurker_StartWalkLeft.A_Lurker_StartWalkLeft'";
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Start/A_Lurker_StartWalkRight.A_Lurker_StartWalkRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Start/A_Lurker_StartTurn180Left.A_Lurker_StartTurn180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Start/A_Lurker_StartTurn180Right.A_Lurker_StartTurn180Right'";

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Start/A_Lurker_StartWalkLeft.A_Lurker_StartWalkLeft'";
	default m_RunStarts.Pivot90L.PlayRate = 1.25;
	default m_RunStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Start/A_Lurker_StartWalkRight.A_Lurker_StartWalkRight'";
	default m_RunStarts.Pivot90R.PlayRate = 1.25;
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Turn/A_Lurker_RunTurn180.A_Lurker_RunTurn180'";
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Turn/A_Lurker_RunTurn180.A_Lurker_RunTurn180'";

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Stop/A_Lurker_StopWalkRun_Left.A_Lurker_StopWalkRun_Left'";
	default m_WalkStops.QuickStopL.BlendOut = 0.2f;
	default m_WalkStops.QuickStopL.StartTime = 0.2f;
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Stop/A_Lurker_StopWalkRun_Right.A_Lurker_StopWalkRun_Right'";
	default m_WalkStops.QuickStopR.BlendOut = 0.2f;
	default m_WalkStops.QuickStopR.StartTime = 0.2f;
	
	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Stop/A_Lurker_StopSprint_Anim.A_Lurker_StopSprint_Anim'";
	default m_SprintStops.QuickStopL.BlendIn = 0.2f;
	default m_SprintStops.QuickStopL.BlendOut = 0.2f;
	default m_SprintStops.QuickStopL.StartTime = 0.35f;
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Stop/A_Lurker_StopSprint_Anim.A_Lurker_StopSprint_Anim'";
	default m_SprintStops.QuickStopR.BlendIn = 0.2f;
	default m_SprintStops.QuickStopR.BlendOut = 0.2f;
	default m_SprintStops.QuickStopR.StartTime = 0.2f;
	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
}

UCLASS()
class UTurnsData_Lurker_Combat : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Lurker_Combat::StaticClass();

    // Pivots
    
	FTurnDirections m_RunPivots;

	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Combat/Movement/Grounded/N/Turn/A_Lurker_WalkCombatTurn180.A_Lurker_WalkCombatTurn180'";
    default m_WalkPivots.Pivot180L.BlendOut = 0.2;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Combat/Movement/Grounded/N/Turn/A_Lurker_WalkCombatTurn180.A_Lurker_WalkCombatTurn180'";
    default m_WalkPivots.Pivot180R.BlendOut = 0.2;

	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Combat/Movement/Grounded/N/Turn/A_Lurker_RunCombatTurn180.A_Lurker_RunCombatTurn180'";
	default m_RunPivots.Pivot180L.BlendOut = 0.2;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Combat/Movement/Grounded/N/Turn/A_Lurker_RunCombatTurn180.A_Lurker_RunCombatTurn180'";
	default m_RunPivots.Pivot180R.BlendOut = 0.2;

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);

	// Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Combat/Movement/Grounded/N/Start/A_Lurker_StartWalkCombatLeft.A_Lurker_StartWalkCombatLeft'";
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Combat/Movement/Grounded/N/Start/A_Lurker_StartWalkCombatRight.A_Lurker_StartWalkCombatRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Combat/Movement/Grounded/N/Start/A_Lurker_StartWalkCombat180Left.A_Lurker_StartWalkCombat180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Combat/Movement/Grounded/N/Start/A_Lurker_StartWalkCombat180Right.A_Lurker_StartWalkCombat180Right'";

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Combat/Movement/Grounded/N/Start/A_Lurker_StartWalkCombatLeft.A_Lurker_StartWalkCombatLeft'";
	default m_RunStarts.Pivot90L.PlayRate = 1.25;
	default m_RunStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Combat/Movement/Grounded/N/Start/A_Lurker_StartWalkCombatRight.A_Lurker_StartWalkCombatRight'";
	default m_RunStarts.Pivot90R.PlayRate = 1.25;
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Combat/Movement/Grounded/N/Turn/A_Lurker_RunCombatTurn180.A_Lurker_RunCombatTurn180'";
	default m_RunStarts.Pivot180L.BlendOut = 0.2;
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Combat/Movement/Grounded/N/Turn/A_Lurker_RunCombatTurn180.A_Lurker_RunCombatTurn180'";
	default m_RunStarts.Pivot180R.BlendOut = 0.2;

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Stop/A_Lurker_StopWalkRun_Left.A_Lurker_StopWalkRun_Left'";
	default m_WalkStops.QuickStopL.BlendOut = 0.2f;
	default m_WalkStops.QuickStopL.StartTime = 0.2f;
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Stop/A_Lurker_StopWalkRun_Right.A_Lurker_StopWalkRun_Right'";
	default m_WalkStops.QuickStopR.BlendOut = 0.2f;
	default m_WalkStops.QuickStopR.StartTime = 0.2f;
	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Stop/A_Lurker_StopSprint_Anim.A_Lurker_StopSprint_Anim'";
	default m_SprintStops.QuickStopL.BlendIn = 0.2f;
	default m_SprintStops.QuickStopL.BlendOut = 0.2f;
	default m_SprintStops.QuickStopL.StartTime = 0.35f;
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lurker/Movement/Grounded/N/Stop/A_Lurker_StopSprint_Anim.A_Lurker_StopSprint_Anim'";
	default m_SprintStops.QuickStopR.BlendIn = 0.2f;
	default m_SprintStops.QuickStopR.BlendOut = 0.2f;
	default m_SprintStops.QuickStopR.StartTime = 0.2f;

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
}