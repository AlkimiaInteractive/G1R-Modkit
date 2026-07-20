UCLASS()
class UTurnOnSpotAssetConfig_Molerat : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_Molerat_TIPL30 : UTurnOnSpotAssetConfig_Molerat
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Stop/A_Molerat_StopWalkRun_Left.A_Molerat_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Molerat_TIPR30 : UTurnOnSpotAssetConfig_Molerat
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Stop/A_Molerat_StopWalkRun_Right.A_Molerat_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_Molerat_TIPL90 : UTurnOnSpotAssetConfig_Molerat
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Turn/A_Molerat_Turn90Left.A_Molerat_Turn90Left'";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Molerat_TIPR90 : UTurnOnSpotAssetConfig_Molerat
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Turn/A_Molerat_Turn90Right.A_Molerat_Turn90Right'";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Molerat_TIPL180 : UTurnOnSpotAssetConfig_Molerat
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Turn/A_Molerat_Turn180Left.A_Molerat_Turn180Left'";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_Molerat_TIPR180 : UTurnOnSpotAssetConfig_Molerat
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Turn/A_Molerat_Turn180Right.A_Molerat_Turn180Right'";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_Molerat : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Molerat_TIPL30::StaticClass();
	default m_TIPR30 = UTurnOnSpotAssetConfig_Molerat_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Molerat_TIPL90::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_Molerat_TIPR90::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_Molerat_TIPL180::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_Molerat_TIPR180::StaticClass();
}

UCLASS()
class UTurnOnSpotAssetConfig_Molerat_Combat_TIPL30 : UTurnOnSpotAssetConfig_Molerat
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Stop/A_Molerat_StopWalkRun_Left.A_Molerat_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Molerat_Combat_TIPR30 : UTurnOnSpotAssetConfig_Molerat
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Stop/A_Molerat_StopWalkRun_Right.A_Molerat_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_Molerat_Combat_TIPL90 : UTurnOnSpotAssetConfig_Molerat
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Grounded/N/Turn/A_Molerat_Idle_CombatTurn90Left.A_Molerat_Idle_CombatTurn90Left'";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Molerat_Combat_TIPR90 : UTurnOnSpotAssetConfig_Molerat
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Grounded/N/Turn/A_Molerat_Idle_CombatTurn90Right.A_Molerat_Idle_CombatTurn90Right'";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Molerat_Combat_TIPL180 : UTurnOnSpotAssetConfig_Molerat
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Grounded/N/Turn/A_Molerat_Idle_CombatTurn180Left.A_Molerat_Idle_CombatTurn180Left'";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_Molerat_Combat_TIPR180 : UTurnOnSpotAssetConfig_Molerat
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Grounded/N/Turn/A_Molerat_Idle_CombatTurn180Right.A_Molerat_Idle_CombatTurn180Right'";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_Molerat_Combat : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Molerat_Combat_TIPL30::StaticClass();
	default m_TIPR30 = UTurnOnSpotAssetConfig_Molerat_Combat_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Molerat_Combat_TIPL90::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_Molerat_Combat_TIPR90::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_Molerat_Combat_TIPL180::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_Molerat_Combat_TIPR180::StaticClass();
    //default m_TurnCheckMinAngle = 30;
}

UCLASS()
class UTurnsData_Molerat : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Molerat::StaticClass();

    //Pivots

	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Turn/A_Molerat_WalkTurn180.A_Molerat_WalkTurn180'";
    //default m_WalkPivots.Pivot180L.BlendOut = 0.2;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Turn/A_Molerat_WalkTurn180.A_Molerat_WalkTurn180'";
    //default m_WalkPivots.Pivot180R.BlendOut = 0.2;
	

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Turn/A_Molerat_RunTurn180.A_Molerat_RunTurn180'";
	//default m_RunPivots.Pivot180L.BlendOut = 0.2;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Turn/A_Molerat_RunTurn180.A_Molerat_RunTurn180'";
	//default m_RunPivots.Pivot180R.BlendOut = 0.2;


	FTurnDirections m_SprintPivots;
	default m_SprintPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Turn/A_Molerat_RunTurn180.A_Molerat_RunTurn180'";
    //default m_SprintPivots.Pivot180L.BlendOut = 0.2;
	default m_SprintPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Turn/A_Molerat_RunTurn180.A_Molerat_RunTurn180'";
    //default m_SprintPivots.Pivot180R.BlendOut = 0.2;
	

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Sprinting, m_SprintPivots);

	// Start Moving
	FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Start/A_Molerat_StartTurn180Left.A_Molerat_StartTurn180Left'";
	default m_WalkStarts.Pivot180L.PlayRate = 1.2f;
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Start/A_Molerat_StartTurn180Right.A_Molerat_StartTurn180Right'";
	default m_WalkStarts.Pivot180R.PlayRate = 1.2f;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Start/A_Molerat_StartWalkLeft.A_Molerat_StartWalkLeft'";
	default m_WalkStarts.Pivot90L.PlayRate = 1.2f; 
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Start/A_Molerat_StartWalkRight.A_Molerat_StartWalkRight'";
	default m_WalkStarts.Pivot90R.PlayRate = 1.2f;

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Start/A_Molerat_StartTurn180Left.A_Molerat_StartTurn180Left'";
	default m_RunStarts.Pivot180L.PlayRate = 1.2f;
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Start/A_Molerat_StartTurn180Right.A_Molerat_StartTurn180Right'";
	default m_RunStarts.Pivot180R.PlayRate = 1.2f;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Start/A_Molerat_StartWalkLeft.A_Molerat_StartWalkLeft'";
	default m_RunStarts.Pivot90L.PlayRate = 1.2f; 
	default m_RunStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Start/A_Molerat_StartWalkRight.A_Molerat_StartWalkRight'";
	default m_RunStarts.Pivot90R.PlayRate = 1.2f;

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Stop/A_Molerat_StopWalkRun_Left.A_Molerat_StopWalkRun_Left'";
	default m_WalkStops.QuickStopL.BlendIn = 0.3f;
	default m_WalkStops.QuickStopL.BlendOut = 0.1f;
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Stop/A_Molerat_StopWalkRun_Right.A_Molerat_StopWalkRun_Right'";
	default m_WalkStops.QuickStopR.BlendIn = 0.3f;
	default m_WalkStops.QuickStopR.BlendOut = 0.1f;

	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Stop/A_Molerat_StopSprint.A_Molerat_StopSprint'";
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Stop/A_Molerat_StopSprint.A_Molerat_StopSprint'";

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
}

UCLASS()
class UTurnsData_Molerat_Combat : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Molerat_Combat::StaticClass();

    // Pivots

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Grounded/N/Turn/A_Molerat_RunCombatTurn180.A_Molerat_RunCombatTurn180'";
	//default m_RunPivots.Pivot180L.BlendOut = 0.2;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Grounded/N/Turn/A_Molerat_RunCombatTurn180.A_Molerat_RunCombatTurn180'";
	//default m_RunPivots.Pivot180R.BlendOut = 0.2;

	default m_Pivots.Add(EWalkSpeed::Walking, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);

	// Start Moving
	FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Grounded/N/Start/A_Molerat_StartWalkCombat180Left.A_Molerat_StartWalkCombat180Left'";
	default m_WalkStarts.Pivot180L.PlayRate = 1.0f;
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Grounded/N/Start/A_Molerat_StartWalkCombat180Right.A_Molerat_StartWalkCombat180Right'";
	default m_WalkStarts.Pivot180R.PlayRate = 1.0f;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Grounded/N/Start/A_Molerat_StartWalkCombatLeft.A_Molerat_StartWalkCombatLeft'";
	default m_WalkStarts.Pivot90L.PlayRate = 1.0f; 
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Grounded/N/Start/A_Molerat_StartWalkCombatRight.A_Molerat_StartWalkCombatRight'";
	default m_WalkStarts.Pivot90R.PlayRate = 1.0f;

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Grounded/N/Start/A_Molerat_StartWalkCombat180Left.A_Molerat_StartWalkCombat180Left'";
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Grounded/N/Start/A_Molerat_StartWalkCombat180Right.A_Molerat_StartWalkCombat180Right'";
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Grounded/N/Start/A_Molerat_StartWalkCombatLeft.A_Molerat_StartWalkCombatLeft'";
	default m_RunStarts.Pivot90L.PlayRate = 1.2f; 
	default m_RunStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Combat/Movement/Grounded/N/Start/A_Molerat_StartWalkCombatRight.A_Molerat_StartWalkCombatRight'";
	default m_RunStarts.Pivot90R.PlayRate = 1.2f;

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Stop/A_Molerat_StopWalkRun_Left.A_Molerat_StopWalkRun_Left'";
	default m_WalkStops.QuickStopL.BlendIn = 0.3f;
	default m_WalkStops.QuickStopL.BlendOut = 0.1f;
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Stop/A_Molerat_StopWalkRun_Right.A_Molerat_StopWalkRun_Right'";
	default m_WalkStops.QuickStopR.BlendIn = 0.3f;
	default m_WalkStops.QuickStopR.BlendOut = 0.1f;

	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Stop/A_Molerat_StopSprint.A_Molerat_StopSprint'";
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Molerat/Movement/Grounded/N/Stop/A_Molerat_StopSprint.A_Molerat_StopSprint'";

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
}