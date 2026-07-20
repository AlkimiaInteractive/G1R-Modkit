UCLASS()
class UTurnOnSpotAssetConfig_Bloodhound : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_Bloodhound_TIPL30 : UTurnOnSpotAssetConfig_Bloodhound
{
    default m_Animation =  n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Stop/A_Bloodhound_StopWalkRun_Left.A_Bloodhound_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Bloodhound_TIPR30 : UTurnOnSpotAssetConfig_Bloodhound
{
    default m_Animation =  n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Stop/A_Bloodhound_StopWalkRun_Right.A_Bloodhound_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_Bloodhound_TIPL90 : UTurnOnSpotAssetConfig_Bloodhound
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Turn/A_Bloodhound_Turn90Left.A_Bloodhound_Turn90Left'";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Bloodhound_TIPR90 : UTurnOnSpotAssetConfig_Bloodhound
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Turn/A_Bloodhound_Turn90Right.A_Bloodhound_Turn90Right'";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Bloodhound_TIPL180 : UTurnOnSpotAssetConfig_Bloodhound
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Turn/A_Bloodhound_Turn180Left.A_Bloodhound_Turn180Left'";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_Bloodhound_TIPR180 : UTurnOnSpotAssetConfig_Bloodhound
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Turn/A_Bloodhound_Turn180Right.A_Bloodhound_Turn180Right'";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_Bloodhound : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Bloodhound_TIPL30::StaticClass();
	default m_TIPR30 = UTurnOnSpotAssetConfig_Bloodhound_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Bloodhound_TIPL90::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_Bloodhound_TIPR90::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_Bloodhound_TIPL180::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_Bloodhound_TIPR180::StaticClass();
}

UCLASS()
class UTurnOnSpotAssetConfig_Bloodhound_Combat_TIPL30 : UTurnOnSpotAssetConfig_Bloodhound
{
    default m_Animation =  n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Stop/A_Bloodhound_StopWalkRun_Left.A_Bloodhound_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Bloodhound_Combat_TIPR30 : UTurnOnSpotAssetConfig_Bloodhound
{
    default m_Animation =  n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Stop/A_Bloodhound_StopWalkRun_Right.A_Bloodhound_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_Bloodhound_Combat_TIPL90 : UTurnOnSpotAssetConfig_Bloodhound
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Movement/Grounded/N/Turn/A_Bloodhound_Idle_CombatTurn90Left.A_Bloodhound_Idle_CombatTurn90Left'";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Bloodhound_Combat_TIPR90 : UTurnOnSpotAssetConfig_Bloodhound
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Movement/Grounded/N/Turn/A_Bloodhound_Idle_CombatTurn90Right.A_Bloodhound_Idle_CombatTurn90Right'";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Bloodhound_Combat_TIPL180 : UTurnOnSpotAssetConfig_Bloodhound
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Movement/Grounded/N/Turn/A_Bloodhound_Idle_CombatTurn180Left.A_Bloodhound_Idle_CombatTurn180Left'";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_Bloodhound_Combat_TIPR180 : UTurnOnSpotAssetConfig_Bloodhound
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Movement/Grounded/N/Turn/A_Bloodhound_Idle_CombatTurn180Right.A_Bloodhound_Idle_CombatTurn180Right'";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_Bloodhound_Combat : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Bloodhound_Combat_TIPL30::StaticClass();
	default m_TIPR30 = UTurnOnSpotAssetConfig_Bloodhound_Combat_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Bloodhound_Combat_TIPL90::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_Bloodhound_Combat_TIPR90::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_Bloodhound_Combat_TIPL180::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_Bloodhound_Combat_TIPR180::StaticClass();
    //default m_TurnCheckMinAngle = 30;
}

UCLASS()
class UTurnsData_Bloodhound : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Bloodhound::StaticClass();

    // Pivots
    
    FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Turn/A_Bloodhound_WalkTurn180.A_Bloodhound_WalkTurn180'";
    default m_WalkPivots.Pivot180L.BlendOut = 0.2;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Turn/A_Bloodhound_WalkTurn180.A_Bloodhound_WalkTurn180'";
    default m_WalkPivots.Pivot180R.BlendOut = 0.2;
	

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Turn/A_Bloodhound_RunTurn180.A_Bloodhound_RunTurn180'";
	default m_RunPivots.Pivot180L.BlendOut = 0.2;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Turn/A_Bloodhound_RunTurn180.A_Bloodhound_RunTurn180'";
	default m_RunPivots.Pivot180R.BlendOut = 0.2;


	FTurnDirections m_SprintPivots;
	default m_SprintPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Turn/A_Bloodhound_RunTurn180.A_Bloodhound_RunTurn180'";
    default m_SprintPivots.Pivot180L.BlendOut = 0.2;
	default m_SprintPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Turn/A_Bloodhound_RunTurn180.A_Bloodhound_RunTurn180'";
    default m_SprintPivots.Pivot180R.BlendOut = 0.2;
	

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Sprinting, m_SprintPivots);

    // Start Moving
	FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Start/A_Bloodhound_StartWalkLeft.A_Bloodhound_StartWalkLeft'";
	default m_WalkStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Start/A_Bloodhound_StartWalkRight.A_Bloodhound_StartWalkRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Start/A_Bloodhound_StartTurn180Left.A_Bloodhound_StartTurn180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Start/A_Bloodhound_StartTurn180Right.A_Bloodhound_StartTurn180Right'";

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Start/A_Bloodhound_StartWalkLeft.A_Bloodhound_StartWalkLeft'";
	default m_RunStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Start/A_Bloodhound_StartWalkRight.A_Bloodhound_StartWalkRight'";
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Turn/A_Bloodhound_RunTurn180.A_Bloodhound_RunTurn180'";
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Turn/A_Bloodhound_RunTurn180.A_Bloodhound_RunTurn180'";

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);

	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Stop/A_Bloodhound_StopWalkRun_Left.A_Bloodhound_StopWalkRun_Left'";
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Stop/A_Bloodhound_StopWalkRun_Right.A_Bloodhound_StopWalkRun_Right'";

	FQuickStops m_RunStops;
	default m_RunStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Stop/A_Bloodhound_StopSprint_Anim.A_Bloodhound_StopSprint_Anim'";
	default m_RunStops.QuickStopL.StartTime = 0.25f;
	default m_RunStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Stop/A_Bloodhound_StopSprint_Anim.A_Bloodhound_StopSprint_Anim'";
	default m_RunStops.QuickStopR.StartTime = 0.25f;
	
	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Stop/A_Bloodhound_StopSprint_Anim.A_Bloodhound_StopSprint_Anim'";
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Stop/A_Bloodhound_StopSprint_Anim.A_Bloodhound_StopSprint_Anim'";

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_RunStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
}

UCLASS()
class UTurnsData_Bloodhound_Combat : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Bloodhound_Combat::StaticClass();

    // Pivots
    FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Movement/Grounded/N/Turn/A_Bloodhound_WalkCombatTurn180.A_Bloodhound_WalkCombatTurn180'";
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Movement/Grounded/N/Turn/A_Bloodhound_WalkCombatTurn180.A_Bloodhound_WalkCombatTurn180'";
	
	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Movement/Grounded/N/Turn/A_Bloodhound_RunCombatTurn180.A_Bloodhound_RunCombatTurn180'";
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Movement/Grounded/N/Turn/A_Bloodhound_RunCombatTurn180.A_Bloodhound_RunCombatTurn180'";

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);

	// Start Moving
	FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Movement/Grounded/N/Start/A_Bloodhound_StartWalkCombatLeft.A_Bloodhound_StartWalkCombatLeft'";
	default m_WalkStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Movement/Grounded/N/Start/A_Bloodhound_StartWalkCombatRight.A_Bloodhound_StartWalkCombatRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Movement/Grounded/N/Start/A_Bloodhound_StartWalkCombat180Left.A_Bloodhound_StartWalkCombat180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Movement/Grounded/N/Start/A_Bloodhound_StartWalkCombat180Right.A_Bloodhound_StartWalkCombat180Right'";

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Movement/Grounded/N/Start/A_Bloodhound_StartWalkCombatLeft.A_Bloodhound_StartWalkCombatLeft'";
	default m_RunPivots.Pivot90L.PlayRate = 1.25;
	default m_RunStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Movement/Grounded/N/Start/A_Bloodhound_StartWalkCombatRight.A_Bloodhound_StartWalkCombatRight'";
	default m_RunPivots.Pivot90R.PlayRate = 1.25;
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Movement/Grounded/N/Turn/A_Bloodhound_RunCombatTurn180.A_Bloodhound_RunCombatTurn180'";
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Combat/Movement/Grounded/N/Turn/A_Bloodhound_RunCombatTurn180.A_Bloodhound_RunCombatTurn180'";

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);

	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Stop/A_Bloodhound_StopWalkRun_Left.A_Bloodhound_StopWalkRun_Left'";
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Stop/A_Bloodhound_StopWalkRun_Right.A_Bloodhound_StopWalkRun_Right'";

	FQuickStops m_RunStops;
	default m_RunStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Stop/A_Bloodhound_StopSprint_Anim.A_Bloodhound_StopSprint_Anim'";
	default m_RunStops.QuickStopL.StartTime = 0.4f;
	default m_RunStops.QuickStopL.BlendOut = 0.45f;
	default m_RunStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Stop/A_Bloodhound_StopSprint_Anim.A_Bloodhound_StopSprint_Anim'";
	default m_RunStops.QuickStopR.StartTime = 0.4f;
	default m_RunStops.QuickStopR.BlendOut = 0.45f;

	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Stop/A_Bloodhound_StopSprint_Anim.A_Bloodhound_StopSprint_Anim'";
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodhound/Movement/Grounded/N/Stop/A_Bloodhound_StopSprint_Anim.A_Bloodhound_StopSprint_Anim'";

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_RunStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
}