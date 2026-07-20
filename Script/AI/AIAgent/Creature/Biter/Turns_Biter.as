UCLASS()
class UTurnOnSpotAssetConfig_Biter : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_Biter_TIPL30 : UTurnOnSpotAssetConfig_Biter
{
    default m_Animation =  n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Stop/A_Biter_StopWalkRun_Left.A_Biter_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Biter_TIPR30 : UTurnOnSpotAssetConfig_Biter
{
    default m_Animation =  n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Stop/A_Biter_StopWalkRun_Right.A_Biter_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_Biter_TIPL90 : UTurnOnSpotAssetConfig_Biter
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Turn/A_Biter_Turn90Left.A_Biter_Turn90Left'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Biter_TIPR90 : UTurnOnSpotAssetConfig_Biter
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Turn/A_Biter_Turn90Right.A_Biter_Turn90Right'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Biter_TIPL180 : UTurnOnSpotAssetConfig_Biter
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Turn/A_Biter_Turn180Left.A_Biter_Turn180Left'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Biter_TIPR180 : UTurnOnSpotAssetConfig_Biter
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Turn/A_Biter_Turn180Right.A_Biter_Turn180Right'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.0;
}

UCLASS()
class UTurnOnSpotConfig_Biter : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Biter_TIPL30::StaticClass();
   	default m_TIPR30 = UTurnOnSpotAssetConfig_Biter_TIPR30::StaticClass();
  	default m_TIPL90 = UTurnOnSpotAssetConfig_Biter_TIPL90::StaticClass();
   	default m_TIPR90 = UTurnOnSpotAssetConfig_Biter_TIPR90::StaticClass();
   	default m_TIPL180 = UTurnOnSpotAssetConfig_Biter_TIPL180::StaticClass();
   	default m_TIPR180 = UTurnOnSpotAssetConfig_Biter_TIPR180::StaticClass();
}

UCLASS()
class UTurnOnSpotAssetConfig_Biter_Combat_TIPL30 : UTurnOnSpotAssetConfig_Biter
{
    default m_Animation =  n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Stop/A_Biter_StopWalkRun_Left.A_Biter_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Biter_Combat_TIPR30 : UTurnOnSpotAssetConfig_Biter
{
    default m_Animation =  n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Stop/A_Biter_StopWalkRun_Right.A_Biter_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_Biter_Combat_TIPL90 : UTurnOnSpotAssetConfig_Biter
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Combat/Movement/Grounded/N/Turn/A_Biter_Idle_CombatTurn90Left.A_Biter_Idle_CombatTurn90Left'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Biter_Combat_TIPR90 : UTurnOnSpotAssetConfig_Biter
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Combat/Movement/Grounded/N/Turn/A_Biter_Idle_CombatTurn90Right.A_Biter_Idle_CombatTurn90Right'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Biter_Combat_TIPL180 : UTurnOnSpotAssetConfig_Biter
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Combat/Movement/Grounded/N/Turn/A_Biter_Idle_CombatTurn180Left.A_Biter_Idle_CombatTurn180Left'";
	default m_AnimatedAngle = -180;
	
}
UCLASS()
class UTurnOnSpotAssetConfig_Biter_Combat_TIPR180 : UTurnOnSpotAssetConfig_Biter
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Combat/Movement/Grounded/N/Turn/A_Biter_Idle_CombatTurn180Right.A_Biter_Idle_CombatTurn180Right'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.0;
}

UCLASS()
class UTurnOnSpotConfig_Biter_Combat : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Biter_Combat_TIPL30::StaticClass();
   	default m_TIPR30 = UTurnOnSpotAssetConfig_Biter_Combat_TIPR30::StaticClass();
   	default m_TIPL90 = UTurnOnSpotAssetConfig_Biter_Combat_TIPL90::StaticClass();
   	default m_TIPR90 = UTurnOnSpotAssetConfig_Biter_Combat_TIPR90::StaticClass();
   	default m_TIPL180 = UTurnOnSpotAssetConfig_Biter_Combat_TIPL180::StaticClass();
   	default m_TIPR180 = UTurnOnSpotAssetConfig_Biter_Combat_TIPR180::StaticClass();
}

UCLASS()
class UTurnsData_Biter : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Biter::StaticClass();

    // Pivots

    FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Turn/A_Biter_WalkTurn180.A_Biter_WalkTurn180'";
    default m_WalkPivots.Pivot180L.BlendOut = 0.2;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Turn/A_Biter_WalkTurn180.A_Biter_WalkTurn180'";
    default m_WalkPivots.Pivot180R.BlendOut = 0.2;
	

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Turn/A_Biter_RunTurn180.A_Biter_RunTurn180'";
	default m_RunPivots.Pivot180L.BlendOut = 0.2;
	default m_RunPivots.Pivot180L.StartTime = 0.0;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Turn/A_Biter_RunTurn180.A_Biter_RunTurn180'";
	default m_RunPivots.Pivot180R.BlendOut = 0.2;
	default m_RunPivots.Pivot180R.StartTime = 0.0;


	FTurnDirections m_SprintPivots;
	default m_SprintPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Turn/A_Biter_RunTurn180.A_Biter_RunTurn180'";
    default m_SprintPivots.Pivot180L.BlendOut = 0.2;
	default m_SprintPivots.Pivot180L.StartTime = 0.0;
	default m_SprintPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Turn/A_Biter_RunTurn180.A_Biter_RunTurn180'";
    default m_SprintPivots.Pivot180R.BlendOut = 0.2;
	default m_SprintPivots.Pivot180R.StartTime = 0.0;
	

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Sprinting, m_SprintPivots);

    // Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Start/A_Biter_StartWalkLeft.A_Biter_StartWalkLeft'";
	default m_WalkStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Start/A_Biter_StartWalkRight.A_Biter_StartWalkRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Start/A_Biter_StartTurn180Left.A_Biter_StartTurn180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Start/A_Biter_StartTurn180Right.A_Biter_StartTurn180Right'";

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Start/A_Biter_StartWalkLeft.A_Biter_StartWalkLeft'";
	default m_RunPivots.Pivot90L.PlayRate = 1.25f;
	default m_RunStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Start/A_Biter_StartWalkRight.A_Biter_StartWalkRight'";
	default m_RunPivots.Pivot90R.PlayRate = 1.25f;
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Start/A_Biter_StartTurn180Left.A_Biter_StartTurn180Left'";
	default m_RunPivots.Pivot180L.PlayRate = 1.25f;
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Start/A_Biter_StartTurn180Right.A_Biter_StartTurn180Right'";
	default m_RunPivots.Pivot180R.PlayRate = 1.25f;

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Stop/A_Biter_StopWalkRun_Left.A_Biter_StopWalkRun_Left'";
	default m_WalkStops.QuickStopL.BlendIn = 0.35;
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Stop/A_Biter_StopWalkRun_Right.A_Biter_StopWalkRun_Right'";
	default m_WalkStops.QuickStopR.BlendIn = 0.35;
	
	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Stop/A_Biter_StopSprint.A_Biter_StopSprint'";
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Stop/A_Biter_StopSprint.A_Biter_StopSprint'";

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
}
UCLASS()
class UTurnsData_Biter_Combat : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Biter_Combat::StaticClass();


    // Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Combat/Movement/Grounded/N/Start/A_Biter_StartWalkCombatLeft.A_Biter_StartWalkCombatLeft'";
	default m_WalkStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Combat/Movement/Grounded/N/Start/A_Biter_StartWalkCombatRight.A_Biter_StartWalkCombatRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Combat/Movement/Grounded/N/Start/A_Biter_StartWalkCombat180Left.A_Biter_StartWalkCombat180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Combat/Movement/Grounded/N/Start/A_Biter_StartWalkCombat180Right.A_Biter_StartWalkCombat180Right'";

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_WalkStarts);

	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Combat/Movement/Grounded/N/Turn/A_Biter_WalkCombatTurn180.A_Biter_WalkCombatTurn180'";
	default m_WalkPivots.Pivot180L.BlendIn = 0.5;
    default m_WalkPivots.Pivot180L.BlendOut = 0.2;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Combat/Movement/Grounded/N/Turn/A_Biter_WalkCombatTurn180.A_Biter_WalkCombatTurn180'";
	default m_WalkPivots.Pivot180L.BlendIn = 0.5;
    default m_WalkPivots.Pivot180R.BlendOut = 0.2;
	
    FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Combat/Movement/Grounded/N/Turn/A_Biter_RunCombatTurn180.A_Biter_RunCombatTurn180'";
	default m_RunPivots.Pivot180L.StartTime = 0.1;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Combat/Movement/Grounded/N/Turn/A_Biter_RunCombatTurn180.A_Biter_RunCombatTurn180'";
	default m_RunPivots.Pivot180R.StartTime = 0.1;

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);

	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Stop/A_Biter_StopWalkRun_Left.A_Biter_StopWalkRun_Left'";
	default m_WalkStops.QuickStopL.BlendIn = 0.35;
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Stop/A_Biter_StopWalkRun_Right.A_Biter_StopWalkRun_Right'";
	default m_WalkStops.QuickStopR.BlendIn = 0.35;
	
	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Stop/A_Biter_StopSprint.A_Biter_StopSprint'";
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Biter/Movement/Grounded/N/Stop/A_Biter_StopSprint.A_Biter_StopSprint'";

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
}