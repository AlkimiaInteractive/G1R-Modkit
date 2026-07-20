UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Adult : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Adult_TIPL30 : UTurnOnSpotAssetConfig_Scavenger_Adult
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Stop/A_Scavenger_Adult_StopWalkRun_Left.A_Scavenger_Adult_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Adult_TIPR30 : UTurnOnSpotAssetConfig_Scavenger_Adult
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Stop/A_Scavenger_Adult_StopWalkRun_Right.A_Scavenger_Adult_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
	default m_PlayRate = 1.0;
}

UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Adult_TIPL90 : UTurnOnSpotAssetConfig_Scavenger_Adult
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Turn/A_Scavenger_Adult_Turn90Left.A_Scavenger_Adult_Turn90Left'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Adult_TIPR90 : UTurnOnSpotAssetConfig_Scavenger_Adult
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Turn/A_Scavenger_Adult_Turn90Right.A_Scavenger_Adult_Turn90Right'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Adult_TIPL180 : UTurnOnSpotAssetConfig_Scavenger_Adult
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Turn/A_Scavenger_Adult_Turn180Left.A_Scavenger_Adult_Turn180Left'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Adult_TIPR180 : UTurnOnSpotAssetConfig_Scavenger_Adult
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Turn/A_Scavenger_Adult_Turn180Right.A_Scavenger_Adult_Turn180Right'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.0;
}

UCLASS()
class UTurnOnSpotConfig_Scavenger_Adult : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Scavenger_Adult_TIPL30::StaticClass();
   	default m_TIPR30 = UTurnOnSpotAssetConfig_Scavenger_Adult_TIPR30::StaticClass();
   	default m_TIPL90 = UTurnOnSpotAssetConfig_Scavenger_Adult_TIPL90::StaticClass();
   	default m_TIPR90 = UTurnOnSpotAssetConfig_Scavenger_Adult_TIPR90::StaticClass();
   	default m_TIPL180 = UTurnOnSpotAssetConfig_Scavenger_Adult_TIPL180::StaticClass();
   	default m_TIPR180 = UTurnOnSpotAssetConfig_Scavenger_Adult_TIPR180::StaticClass();
}

UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Adult_Combat_TIPL30 : UTurnOnSpotAssetConfig_Scavenger_Adult
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Stop/A_Scavenger_Adult_StopWalkRun_Left.A_Scavenger_Adult_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Adult_Combat_TIPR30 : UTurnOnSpotAssetConfig_Scavenger_Adult
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Stop/A_Scavenger_Adult_StopWalkRun_Right.A_Scavenger_Adult_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
	default m_PlayRate = 1.0;
}

UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Adult_Combat_TIPL90 : UTurnOnSpotAssetConfig_Scavenger_Adult
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Movement/Grounded/N/Turn/A_Scavenger_Adult_Idle_CombatTurn90Left.A_Scavenger_Adult_Idle_CombatTurn90Left'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Adult_Combat_TIPR90 : UTurnOnSpotAssetConfig_Scavenger_Adult
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Movement/Grounded/N/Turn/A_Scavenger_Adult_Idle_CombatTurn90Right.A_Scavenger_Adult_Idle_CombatTurn90Right'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Adult_Combat_TIPL180 : UTurnOnSpotAssetConfig_Scavenger_Adult
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Movement/Grounded/N/Turn/A_Scavenger_Adult_Idle_CombatTurn180Left.A_Scavenger_Adult_Idle_CombatTurn180Left'";
	default m_AnimatedAngle = -180;
	
}
UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Adult_Combat_TIPR180 : UTurnOnSpotAssetConfig_Scavenger_Adult
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Movement/Grounded/N/Turn/A_Scavenger_Adult_Idle_CombatTurn180Right.A_Scavenger_Adult_Idle_CombatTurn180Right'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.0;
}

UCLASS()
class UTurnOnSpotConfig_Scavenger_Adult_Combat : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Scavenger_Adult_Combat_TIPL30::StaticClass();
   	default m_TIPR30 = UTurnOnSpotAssetConfig_Scavenger_Adult_Combat_TIPR30::StaticClass();
   	default m_TIPL90 = UTurnOnSpotAssetConfig_Scavenger_Adult_Combat_TIPL90::StaticClass();
   	default m_TIPR90 = UTurnOnSpotAssetConfig_Scavenger_Adult_Combat_TIPR90::StaticClass();
   	default m_TIPL180 = UTurnOnSpotAssetConfig_Scavenger_Adult_Combat_TIPL180::StaticClass();
   	default m_TIPR180 = UTurnOnSpotAssetConfig_Scavenger_Adult_Combat_TIPR180::StaticClass();
}

UCLASS()
class UTurnsData_Scavenger_Adult : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Scavenger_Adult::StaticClass();

   //Pivots

	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Turn/A_Scavenger_Adult_WalkTurn180.A_Scavenger_Adult_WalkTurn180'";
    //default m_WalkPivots.Pivot180L.BlendOut = 0.2;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Turn/A_Scavenger_Adult_WalkTurn180.A_Scavenger_Adult_WalkTurn180'";
    //default m_WalkPivots.Pivot180R.BlendOut = 0.2;
	

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Turn/A_Scavenger_Adult_RunTurn180.A_Scavenger_Adult_RunTurn180'";
	//default m_RunPivots.Pivot180L.BlendOut = 0.2;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Turn/A_Scavenger_Adult_RunTurn180.A_Scavenger_Adult_RunTurn180'";
	//default m_RunPivots.Pivot180R.BlendOut = 0.2;


	FTurnDirections m_SprintPivots;
	default m_SprintPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Turn/A_Scavenger_Adult_RunTurn180.A_Scavenger_Adult_RunTurn180'";
    //default m_SprintPivots.Pivot180L.BlendOut = 0.2;
	default m_SprintPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Turn/A_Scavenger_Adult_RunTurn180.A_Scavenger_Adult_RunTurn180'";
    //default m_SprintPivots.Pivot180R.BlendOut = 0.2;
	

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Sprinting, m_SprintPivots);

    // Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Start/A_Scavenger_Adult_StartTurn180Left.A_Scavenger_Adult_StartTurn180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Start/A_Scavenger_Adult_StartTurn180Right.A_Scavenger_Adult_StartTurn180Right'";
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Start/A_Scavenger_Adult_StartWalkLeft.A_Scavenger_Adult_StartWalkLeft'";
	default m_WalkStarts.Pivot90L.PlayRate = 1.0f; 
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Start/A_Scavenger_Adult_StartWalkRight.A_Scavenger_Adult_StartWalkRight'";
	default m_WalkStarts.Pivot90R.PlayRate = 1.0f;

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Start/A_Scavenger_Adult_StartTurn180Left.A_Scavenger_Adult_StartTurn180Left'";
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Start/A_Scavenger_Adult_StartTurn180Right.A_Scavenger_Adult_StartTurn180Right'";
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Start/A_Scavenger_Adult_StartWalkLeft.A_Scavenger_Adult_StartWalkLeft'";
	default m_RunStarts.Pivot90L.PlayRate = 1.5f; 
	default m_RunStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Start/A_Scavenger_Adult_StartWalkRight.A_Scavenger_Adult_StartWalkRight'";
	default m_RunStarts.Pivot90R.PlayRate = 1.5f;

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);

	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Stop/A_Scavenger_Adult_StopWalkRun_Left.A_Scavenger_Adult_StopWalkRun_Left'";
	default m_WalkStops.QuickStopL.BlendOut = 0.1f;
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Stop/A_Scavenger_Adult_StopWalkRun_Right.A_Scavenger_Adult_StopWalkRun_Right'";
	default m_WalkStops.QuickStopR.BlendOut = 0.1f;

	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Stop/A_Scavenger_Adult_StopSprint.A_Scavenger_Adult_StopSprint'";
	default m_SprintStops.QuickStopL.BlendIn = 0.2f;
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Stop/A_Scavenger_Adult_StopSprint.A_Scavenger_Adult_StopSprint'";
	default m_SprintStops.QuickStopR.BlendIn = 0.2f;


	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
}
UCLASS()
class UTurnsData_Scavenger_Adult_Combat : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Scavenger_Adult_Combat::StaticClass();

    // Pivots
	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Movement/Grounded/N/Turn/A_Scavenger_Adult_RunCombatTurn180.A_Scavenger_Adult_RunCombatTurn180'";
	default m_RunPivots.Pivot180L.StartTime = 0.3;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Movement/Grounded/N/Turn/A_Scavenger_Adult_RunCombatTurn180.A_Scavenger_Adult_RunCombatTurn180'";
	default m_RunPivots.Pivot180R.StartTime = 0.3;

	default m_Pivots.Add(EWalkSpeed::Walking, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);

    // Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Movement/Grounded/N/Start/A_Scavenger_Adult_StartWalkCombat180Left.A_Scavenger_Adult_StartWalkCombat180Left'";
	default m_WalkStarts.Pivot180L.PlayRate = 1.0f;
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Movement/Grounded/N/Start/A_Scavenger_Adult_StartWalkCombat180Right.A_Scavenger_Adult_StartWalkCombat180Right'";
	default m_WalkStarts.Pivot180R.PlayRate = 1.0f;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Movement/Grounded/N/Start/A_Scavenger_Adult_StartWalkCombatLeft.A_Scavenger_Adult_StartWalkCombatLeft'";
	default m_WalkStarts.Pivot90L.PlayRate = 1.0f; 
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Movement/Grounded/N/Start/A_Scavenger_Adult_StartWalkCombatRight.A_Scavenger_Adult_StartWalkCombatRight'";
	default m_WalkStarts.Pivot90R.PlayRate = 1.0f;

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Movement/Grounded/N/Turn/A_Scavenger_Adult_RunCombatTurn180.A_Scavenger_Adult_RunCombatTurn180'";
	default m_RunStarts.Pivot180L.StartTime = 0.3;
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Movement/Grounded/N/Turn/A_Scavenger_Adult_RunCombatTurn180.A_Scavenger_Adult_RunCombatTurn180'";
	default m_RunStarts.Pivot180R.StartTime = 0.3;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Movement/Grounded/N/Start/A_Scavenger_Adult_StartWalkCombatLeft.A_Scavenger_Adult_StartWalkCombatLeft'";
	default m_RunStarts.Pivot90L.PlayRate = 1.5f; 
	default m_RunStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Combat/Movement/Grounded/N/Start/A_Scavenger_Adult_StartWalkCombatRight.A_Scavenger_Adult_StartWalkCombatRight'";
	default m_RunStarts.Pivot90R.PlayRate = 1.5f;

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);

	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Stop/A_Scavenger_Adult_StopWalkRun_Left.A_Scavenger_Adult_StopWalkRun_Left'";
	default m_WalkStops.QuickStopL.BlendOut = 0.1f;
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Stop/A_Scavenger_Adult_StopWalkRun_Right.A_Scavenger_Adult_StopWalkRun_Right'";
	default m_WalkStops.QuickStopR.BlendOut = 0.1f;

	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Stop/A_Scavenger_Adult_StopSprint.A_Scavenger_Adult_StopSprint'";
	default m_SprintStops.QuickStopL.BlendIn = 0.2f;
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Grounded/N/Stop/A_Scavenger_Adult_StopSprint.A_Scavenger_Adult_StopSprint'";
	default m_SprintStops.QuickStopR.BlendIn = 0.2f;

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
	
}