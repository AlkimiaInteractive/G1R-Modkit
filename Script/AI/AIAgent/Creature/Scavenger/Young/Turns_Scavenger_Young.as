UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Young : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Young_TIPL30 : UTurnOnSpotAssetConfig_Scavenger_Young
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Stop/A_Scavenger_StopWalkRun_Left.A_Scavenger_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Young_TIPR30 : UTurnOnSpotAssetConfig_Scavenger_Young
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Stop/A_Scavenger_StopWalkRun_Right.A_Scavenger_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
	default m_PlayRate = 1.0;
}

UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Young_TIPL90 : UTurnOnSpotAssetConfig_Scavenger_Young
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Turn/A_Scavenger_Turn90Left.A_Scavenger_Turn90Left'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Young_TIPR90 : UTurnOnSpotAssetConfig_Scavenger_Young
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Turn/A_Scavenger_Turn90Right.A_Scavenger_Turn90Right'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Young_TIPL180 : UTurnOnSpotAssetConfig_Scavenger_Young
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Turn/A_Scavenger_Turn180Left.A_Scavenger_Turn180Left'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Young_TIPR180 : UTurnOnSpotAssetConfig_Scavenger_Young
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Turn/A_Scavenger_Turn180Right.A_Scavenger_Turn180Right'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.0;
}

UCLASS()
class UTurnOnSpotConfig_Scavenger_Young : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Scavenger_Young_TIPL30::StaticClass();
   	default m_TIPR30 = UTurnOnSpotAssetConfig_Scavenger_Young_TIPR30::StaticClass();
   	default m_TIPL90 = UTurnOnSpotAssetConfig_Scavenger_Young_TIPL90::StaticClass();
   	default m_TIPR90 = UTurnOnSpotAssetConfig_Scavenger_Young_TIPR90::StaticClass();
   	default m_TIPL180 = UTurnOnSpotAssetConfig_Scavenger_Young_TIPL180::StaticClass();
   	default m_TIPR180 = UTurnOnSpotAssetConfig_Scavenger_Young_TIPR180::StaticClass();
}

UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Young_Combat_TIPL30 : UTurnOnSpotAssetConfig_Scavenger_Young
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Stop/A_Scavenger_StopWalkRun_Left.A_Scavenger_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Young_Combat_TIPR30 : UTurnOnSpotAssetConfig_Scavenger_Young
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Stop/A_Scavenger_StopWalkRun_Right.A_Scavenger_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
	default m_PlayRate = 1.0;
}

UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Young_Combat_TIPL90 : UTurnOnSpotAssetConfig_Scavenger_Young
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Movement/Grounded/N/Turn/A_Scavenger_Idle_CombatTurn90Left.A_Scavenger_Idle_CombatTurn90Left'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Young_Combat_TIPR90 : UTurnOnSpotAssetConfig_Scavenger_Young
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Movement/Grounded/N/Turn/A_Scavenger_Idle_CombatTurn90Right.A_Scavenger_Idle_CombatTurn90Right'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Young_Combat_TIPL180 : UTurnOnSpotAssetConfig_Scavenger_Young
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Movement/Grounded/N/Turn/A_Scavenger_Idle_CombatTurn180Left.A_Scavenger_Idle_CombatTurn180Left'";
	default m_AnimatedAngle = -180;
	
}
UCLASS()
class UTurnOnSpotAssetConfig_Scavenger_Young_Combat_TIPR180 : UTurnOnSpotAssetConfig_Scavenger_Young
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Movement/Grounded/N/Turn/A_Scavenger_Idle_CombatTurn180Right.A_Scavenger_Idle_CombatTurn180Right'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.0;
}

UCLASS()
class UTurnOnSpotConfig_Scavenger_Young_Combat : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Scavenger_Young_Combat_TIPL30::StaticClass();
   	default m_TIPR30 = UTurnOnSpotAssetConfig_Scavenger_Young_Combat_TIPR30::StaticClass();
  	default m_TIPL90 = UTurnOnSpotAssetConfig_Scavenger_Young_Combat_TIPL90::StaticClass();
   	default m_TIPR90 = UTurnOnSpotAssetConfig_Scavenger_Young_Combat_TIPR90::StaticClass();
   	default m_TIPL180 = UTurnOnSpotAssetConfig_Scavenger_Young_Combat_TIPL180::StaticClass();
   	default m_TIPR180 = UTurnOnSpotAssetConfig_Scavenger_Young_Combat_TIPR180::StaticClass();
}

UCLASS()
class UTurnsData_Scavenger_Young : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Scavenger_Young::StaticClass();

    //Pivots

	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Turn/A_Scavenger_WalkTurn180.A_Scavenger_WalkTurn180'";
    default m_WalkPivots.Pivot180L.BlendOut = 0.2;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Turn/A_Scavenger_WalkTurn180.A_Scavenger_WalkTurn180'";
	default m_WalkPivots.Pivot180R.BlendOut = 0.2;
	

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Turn/A_Scavenger_RunTurn180.A_Scavenger_RunTurn180'";
	default m_RunPivots.Pivot180L.BlendOut = 0.2;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Turn/A_Scavenger_RunTurn180.A_Scavenger_RunTurn180'";
	default m_RunPivots.Pivot180R.BlendOut = 0.2;


	FTurnDirections m_SprintPivots;
	default m_SprintPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Turn/A_Scavenger_RunTurn180.A_Scavenger_RunTurn180'";
    default m_SprintPivots.Pivot180L.BlendOut = 0.2;
	default m_SprintPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Turn/A_Scavenger_RunTurn180.A_Scavenger_RunTurn180'";
    default m_SprintPivots.Pivot180R.BlendOut = 0.2;
	

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Sprinting, m_SprintPivots);

    // Start Moving
	FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Start/A_Scavenger_StartWalkLeft.A_Scavenger_StartWalkLeft'";
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Start/A_Scavenger_StartWalkRight.A_Scavenger_StartWalkRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Start/A_Scavenger_StartTurn180Left.A_Scavenger_StartTurn180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Start/A_Scavenger_StartTurn180Right.A_Scavenger_StartTurn180Right'";

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Start/A_Scavenger_StartWalkLeft.A_Scavenger_StartWalkLeft'";
	default m_RunStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Start/A_Scavenger_StartWalkRight.A_Scavenger_StartWalkRight'";
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Turn/A_Scavenger_RunTurn180.A_Scavenger_RunTurn180'";
	default m_RunPivots.Pivot180L.BlendIn = 0.15f;
	default m_RunPivots.Pivot180L.StartTime = 0.1f;
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Turn/A_Scavenger_RunTurn180.A_Scavenger_RunTurn180'";
	default m_RunPivots.Pivot180R.BlendIn = 0.15f;
	default m_RunPivots.Pivot180R.StartTime = 0.1f;


	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Stop/A_Scavenger_StopWalkRun_Left.A_Scavenger_StopWalkRun_Left'";
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Stop/A_Scavenger_StopWalkRun_Right.A_Scavenger_StopWalkRun_Right'";
	
	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Stop/A_Scavenger_StopSprint.A_Scavenger_StopSprint'";
	default m_SprintStops.QuickStopL.StartTime = 0.2;
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Stop/A_Scavenger_StopSprint.A_Scavenger_StopSprint'";
	default m_SprintStops.QuickStopR.StartTime = 0.2;
	
	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
}
UCLASS()
class UTurnsData_Scavenger_Young_Combat : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Scavenger_Young_Combat::StaticClass();

    // Pivots
	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Movement/Grounded/N/Turn/A_Scavenger_RunCombatTurn180.A_Scavenger_RunCombatTurn180'";
	default m_RunPivots.Pivot180L.StartTime = 0.1f;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Movement/Grounded/N/Turn/A_Scavenger_RunCombatTurn180.A_Scavenger_RunCombatTurn180'";
	default m_RunPivots.Pivot180R.StartTime = 0.1f;

	default m_Pivots.Add(EWalkSpeed::Walking, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);

    // Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Movement/Grounded/N/Start/A_Scavenger_StartWalkCombatLeft.A_Scavenger_StartWalkCombatLeft'";
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Movement/Grounded/N/Start/A_Scavenger_StartWalkCombatRight.A_Scavenger_StartWalkCombatRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Movement/Grounded/N/Start/A_Scavenger_StartWalkCombat180Left.A_Scavenger_StartWalkCombat180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Movement/Grounded/N/Start/A_Scavenger_StartWalkCombat180Right.A_Scavenger_StartWalkCombat180Right'";

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Movement/Grounded/N/Start/A_Scavenger_StartWalkCombatLeft.A_Scavenger_StartWalkCombatLeft'";
	default m_RunPivots.Pivot90L.PlayRate = 1.2f;
	default m_RunStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Movement/Grounded/N/Start/A_Scavenger_StartWalkCombatRight.A_Scavenger_StartWalkCombatRight'";
	default m_RunPivots.Pivot90R.PlayRate = 1.2f;
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Movement/Grounded/N/Turn/A_Scavenger_RunCombatTurn180.A_Scavenger_RunCombatTurn180'";
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Combat/Movement/Grounded/N/Turn/A_Scavenger_RunCombatTurn180.A_Scavenger_RunCombatTurn180'";

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Stop/A_Scavenger_StopWalkRun_Left.A_Scavenger_StopWalkRun_Left'";
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Stop/A_Scavenger_StopWalkRun_Right.A_Scavenger_StopWalkRun_Right'";

	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Stop/A_Scavenger_StopSprint.A_Scavenger_StopSprint'";
	default m_SprintStops.QuickStopL.StartTime = 0.2;
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Scavenger/Young/Movement/Grounded/N/Stop/A_Scavenger_StopSprint.A_Scavenger_StopSprint'";
	default m_SprintStops.QuickStopR.StartTime = 0.2;
	
	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
}