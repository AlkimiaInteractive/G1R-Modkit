UCLASS()
class UTurnOnSpotAssetConfig_Goblin : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_Goblin_TIPL30 : UTurnOnSpotAssetConfig_Goblin
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Stop/A_GreenGoblin_StopWalkRun_Left.A_GreenGoblin_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Goblin_TIPR30 : UTurnOnSpotAssetConfig_Goblin
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Stop/A_GreenGoblin_StopWalkRun_Right.A_GreenGoblin_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
	default m_PlayRate = 1.0;
}

UCLASS()
class UTurnOnSpotAssetConfig_Goblin_TIPL90 : UTurnOnSpotAssetConfig_Goblin
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Turn/A_GreenGoblin_Turn90Left.A_GreenGoblin_Turn90Left'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Goblin_TIPR90 : UTurnOnSpotAssetConfig_Goblin
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Turn/A_GreenGoblin_Turn90Right.A_GreenGoblin_Turn90Right'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Goblin_TIPL180 : UTurnOnSpotAssetConfig_Goblin
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Turn/A_GreenGoblin_Turn180Left.A_GreenGoblin_Turn180Left'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Goblin_TIPR180 : UTurnOnSpotAssetConfig_Goblin
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Turn/A_GreenGoblin_Turn180Right.A_GreenGoblin_Turn180Right'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.0;
}

UCLASS()
class UTurnOnSpotConfig_Goblin : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Goblin_TIPL30::StaticClass();
   	default m_TIPR30 = UTurnOnSpotAssetConfig_Goblin_TIPR30::StaticClass();
   	default m_TIPL90 = UTurnOnSpotAssetConfig_Goblin_TIPL90::StaticClass();
   	default m_TIPR90 = UTurnOnSpotAssetConfig_Goblin_TIPR90::StaticClass();
   	default m_TIPL180 = UTurnOnSpotAssetConfig_Goblin_TIPL180::StaticClass();
   	default m_TIPR180 = UTurnOnSpotAssetConfig_Goblin_TIPR180::StaticClass();
}

UCLASS()
class UTurnsData_Goblin : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Goblin::StaticClass();

    //Pivots

	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Turn/A_GreenGoblin_WalkTurn180.A_GreenGoblin_WalkTurn180'";
    default m_WalkPivots.Pivot180L.BlendOut = 0.2;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Turn/A_GreenGoblin_WalkTurn180.A_GreenGoblin_WalkTurn180'";
    default m_WalkPivots.Pivot180R.BlendOut = 0.2;
	

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Turn/A_GreenGoblin_RunTurn180.A_GreenGoblin_RunTurn180'";
	default m_RunPivots.Pivot180L.BlendOut = 0.2;
	default m_RunPivots.Pivot180L.StartTime = 0.4;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Turn/A_GreenGoblin_RunTurn180.A_GreenGoblin_RunTurn180'";
	default m_RunPivots.Pivot180R.BlendOut = 0.2;
	default m_RunPivots.Pivot180R.StartTime = 0.4;


	FTurnDirections m_SprintPivots;
	default m_SprintPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Turn/A_GreenGoblin_RunTurn180.A_GreenGoblin_RunTurn180'";
    default m_SprintPivots.Pivot180L.BlendOut = 0.2;
	default m_SprintPivots.Pivot180L.StartTime = 0.0;
	default m_SprintPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Turn/A_GreenGoblin_RunTurn180.A_GreenGoblin_RunTurn180'";
    default m_SprintPivots.Pivot180R.BlendOut = 0.2;
	default m_SprintPivots.Pivot180R.StartTime = 0.0;
	

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Sprinting, m_SprintPivots);

	// Start Moving
	FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Start/A_GreenGoblin_StartTurn180Left.A_GreenGoblin_StartTurn180Left'";
	default m_WalkStarts.Pivot180L.PlayRate = 1.2f;
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Start/A_GreenGoblin_StartTurn180Right.A_GreenGoblin_StartTurn180Right'";
	default m_WalkStarts.Pivot180R.PlayRate = 1.2f;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Start/A_GreenGoblin_StartWalkLeft.A_GreenGoblin_StartWalkLeft'";
	default m_WalkStarts.Pivot90L.PlayRate = 1.2f; 
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Start/A_GreenGoblin_StartWalkRight.A_GreenGoblin_StartWalkRight'";
	default m_WalkStarts.Pivot90R.PlayRate = 1.2f;

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Turn/A_GreenGoblin_RunTurn180.A_GreenGoblin_RunTurn180'";
	default m_RunStarts.Pivot180L.BlendOut = 0.2f;
	default m_RunStarts.Pivot180R.StartTime = 0.35;
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Turn/A_GreenGoblin_RunTurn180.A_GreenGoblin_RunTurn180'";
	default m_RunStarts.Pivot180R.BlendOut = 0.2f;
	default m_RunStarts.Pivot180R.StartTime = 0.35;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Start/A_GreenGoblin_StartWalkLeft.A_GreenGoblin_StartWalkLeft'";
	default m_RunStarts.Pivot90L.PlayRate = 1.5f; 
	default m_RunStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Start/A_GreenGoblin_StartWalkRight.A_GreenGoblin_StartWalkRight'";
	default m_RunStarts.Pivot90R.PlayRate = 1.5f;

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);

	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Stop/A_GreenGoblin_StopWalkRun_Left.A_GreenGoblin_StopWalkRun_Left'";
	default m_WalkStops.QuickStopL.BlendIn = 0.3f;
	default m_WalkStops.QuickStopL.BlendOut = 0.1f;
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Stop/A_GreenGoblin_StopWalkRun_Right.A_GreenGoblin_StopWalkRun_Right'";
	default m_WalkStops.QuickStopR.BlendIn = 0.3f;
	default m_WalkStops.QuickStopR.BlendOut = 0.1f;

	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Stop/A_GreenGoblin_StopSprint.A_GreenGoblin_StopSprint'";
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Stop/A_GreenGoblin_StopSprint.A_GreenGoblin_StopSprint'";

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
}

class UTurnOnSpotAssetConfig_Goblin_Combat_TIPL30 : UTurnOnSpotAssetConfig_Goblin
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Stop/A_GreenGoblin_StopWalkRun_Left.A_GreenGoblin_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Goblin_Combat_TIPR30 : UTurnOnSpotAssetConfig_Goblin
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Stop/A_GreenGoblin_StopWalkRun_Right.A_GreenGoblin_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
	default m_PlayRate = 1.0;
}

UCLASS()
class UTurnOnSpotAssetConfig_Goblin_Combat_TIPL90 : UTurnOnSpotAssetConfig_Goblin
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Movement/Grounded/N/Turn/A_GreenGoblin_Idle_CombatTurn90Left.A_GreenGoblin_Idle_CombatTurn90Left'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Goblin_Combat_TIPR90 : UTurnOnSpotAssetConfig_Goblin
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Movement/Grounded/N/Turn/A_GreenGoblin_Idle_CombatTurn90Right.A_GreenGoblin_Idle_CombatTurn90Right'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Goblin_Combat_TIPL180 : UTurnOnSpotAssetConfig_Goblin
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Movement/Grounded/N/Turn/A_Greengoblin_Idle_Combatturn180left.A_Greengoblin_Idle_Combatturn180left'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Goblin_Combat_TIPR180 : UTurnOnSpotAssetConfig_Goblin
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Movement/Grounded/N/Turn/A_GreenGoblin_Idle_CombatTurn180Right.A_GreenGoblin_Idle_CombatTurn180Right'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.0;
}

UCLASS()
class UTurnOnSpotConfig_Goblin_Combat : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Goblin_Combat_TIPL30::StaticClass();
   	default m_TIPR30 = UTurnOnSpotAssetConfig_Goblin_Combat_TIPR30::StaticClass();
   	default m_TIPL90 = UTurnOnSpotAssetConfig_Goblin_Combat_TIPL90::StaticClass();
   	default m_TIPR90 = UTurnOnSpotAssetConfig_Goblin_Combat_TIPR90::StaticClass();
   	default m_TIPL180 = UTurnOnSpotAssetConfig_Goblin_Combat_TIPL180::StaticClass();
   	default m_TIPR180 = UTurnOnSpotAssetConfig_Goblin_Combat_TIPR180::StaticClass();
}

UCLASS()
class UTurnsData_Goblin_Combat : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Goblin_Combat::StaticClass();
	
	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Movement/Grounded/N/Turn/A_GreenGoblin_WalkCombatTurn180.A_GreenGoblin_WalkCombatTurn180'";
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Movement/Grounded/N/Turn/A_GreenGoblin_WalkCombatTurn180.A_GreenGoblin_WalkCombatTurn180'";

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Movement/Grounded/N/Turn/A_GreenGoblin_RunCombatTurn180.A_GreenGoblin_RunCombatTurn180'";
	default m_RunPivots.Pivot180L.StartTime = 0.4;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Combat/Movement/Grounded/N/Turn/A_GreenGoblin_RunCombatTurn180.A_GreenGoblin_RunCombatTurn180'";
	default m_RunPivots.Pivot180R.StartTime = 0.4;

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);

	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Stop/A_GreenGoblin_StopWalkRun_Left.A_GreenGoblin_StopWalkRun_Left'";
	default m_WalkStops.QuickStopL.BlendIn = 0.3f;
	default m_WalkStops.QuickStopL.BlendOut = 0.1f;
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Stop/A_GreenGoblin_StopWalkRun_Right.A_GreenGoblin_StopWalkRun_Right'";
	default m_WalkStops.QuickStopR.BlendIn = 0.3f;
	default m_WalkStops.QuickStopR.BlendOut = 0.1f;

	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Stop/A_GreenGoblin_StopSprint.A_GreenGoblin_StopSprint'";
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Green_Goblin/Movement/Grounded/N/Stop/A_GreenGoblin_StopSprint.A_GreenGoblin_StopSprint'";

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
}