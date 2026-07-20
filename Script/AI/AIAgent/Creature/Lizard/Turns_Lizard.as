UCLASS()
class UTurnOnSpotAssetConfig_Lizard : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_Lizard_TIPL30 : UTurnOnSpotAssetConfig_Lizard
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Stop/A_Lizard_StopWalkRun_Left.A_Lizard_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Lizard_TIPR30 : UTurnOnSpotAssetConfig_Lizard
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Stop/A_Lizard_StopWalkRun_Right.A_Lizard_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_Lizard_TIPL90 : UTurnOnSpotAssetConfig_Lizard
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Turn/A_Lizard_Turn90Left.A_Lizard_Turn90Left'";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Lizard_TIPR90 : UTurnOnSpotAssetConfig_Lizard
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Turn/A_Lizard_Turn90Right.A_Lizard_Turn90Right'";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Lizard_TIPL180 : UTurnOnSpotAssetConfig_Lizard
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Turn/A_Lizard_Turn180Left.A_Lizard_Turn180Left'";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_Lizard_TIPR180 : UTurnOnSpotAssetConfig_Lizard
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Turn/A_Lizard_Turn180Right.A_Lizard_Turn180Right'";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_Lizard : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Lizard_TIPL30::StaticClass();
	default m_TIPR30 = UTurnOnSpotAssetConfig_Lizard_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Lizard_TIPL90::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_Lizard_TIPR90::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_Lizard_TIPL180::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_Lizard_TIPR180::StaticClass();
}

UCLASS()
class UTurnOnSpotAssetConfig_Lizard_Combat_TIPL30 : UTurnOnSpotAssetConfig_Lizard
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Stop/A_Lizard_StopWalkRun_Left.A_Lizard_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Lizard_Combat_TIPR30 : UTurnOnSpotAssetConfig_Lizard
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Stop/A_Lizard_StopWalkRun_Right.A_Lizard_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_Lizard_Combat_TIPL90 : UTurnOnSpotAssetConfig_Lizard
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Combat/Movement/Grounded/N/Turn/A_Lizard_Idle_CombatTurn90Left.A_Lizard_Idle_CombatTurn90Left'";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Lizard_Combat_TIPR90 : UTurnOnSpotAssetConfig_Lizard
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Combat/Movement/Grounded/N/Turn/A_Lizard_Idle_CombatTurn90Right.A_Lizard_Idle_CombatTurn90Right'";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Lizard_Combat_TIPL180 : UTurnOnSpotAssetConfig_Lizard
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Combat/Movement/Grounded/N/Turn/A_Lizard_Idle_CombatTurn180Left.A_Lizard_Idle_CombatTurn180Left'";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_Lizard_Combat_TIPR180 : UTurnOnSpotAssetConfig_Lizard
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Combat/Movement/Grounded/N/Turn/A_Lizard_Idle_CombatTurn180Right.A_Lizard_Idle_CombatTurn180Right'";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_Lizard_Combat : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Lizard_Combat_TIPL30::StaticClass();
	default m_TIPR30 = UTurnOnSpotAssetConfig_Lizard_Combat_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Lizard_Combat_TIPL90::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_Lizard_Combat_TIPR90::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_Lizard_Combat_TIPL180::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_Lizard_Combat_TIPR180::StaticClass();
    //default m_TurnCheckMinAngle = 30;
}

UCLASS()
class UTurnsData_Lizard : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Lizard::StaticClass();

    //Pivots

	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Turn/A_Lizard_WalkTurn180.A_Lizard_WalkTurn180'";
    //default m_WalkPivots.Pivot180L.BlendOut = 0.2;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Turn/A_Lizard_WalkTurn180.A_Lizard_WalkTurn180'";
    //default m_WalkPivots.Pivot180R.BlendOut = 0.2;
	

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Turn/A_Lizard_WalkTurn180.A_Lizard_WalkTurn180'";
	//default m_RunPivots.Pivot180L.BlendOut = 0.2;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Turn/A_Lizard_WalkTurn180.A_Lizard_WalkTurn180'";
	//default m_RunPivots.Pivot180R.BlendOut = 0.2;


	FTurnDirections m_SprintPivots;
	default m_SprintPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Turn/A_Lizard_RunTurn180.A_Lizard_RunTurn180'";
    //default m_SprintPivots.Pivot180L.BlendOut = 0.2;
	default m_SprintPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Turn/A_Lizard_RunTurn180.A_Lizard_RunTurn180'";
    //default m_SprintPivots.Pivot180R.BlendOut = 0.2;
	

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Sprinting, m_SprintPivots);

    // Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Start/A_Lizard_StartWalkLeft.A_Lizard_StartWalkLeft'";
	default m_WalkStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Start/A_Lizard_StartWalkRight.A_Lizard_StartWalkRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Start/A_Lizard_StartTurn180Left.A_Lizard_StartTurn180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Start/A_Lizard_StartTurn180Right.A_Lizard_StartTurn180Right'";

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Start/A_Lizard_StartWalkLeft.A_Lizard_StartWalkLeft'";
	default m_RunStarts.Pivot90L.PlayRate = 1.2;
	default m_RunStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Start/A_Lizard_StartWalkRight.A_Lizard_StartWalkRight'";
	default m_RunStarts.Pivot90R.PlayRate = 1.2;
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Turn/A_Lizard_RunTurn180.A_Lizard_RunTurn180'";
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Turn/A_Lizard_RunTurn180.A_Lizard_RunTurn180'";

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Stop/A_Lizard_StopWalkRun_Left.A_Lizard_StopWalkRun_Left'";
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Stop/A_Lizard_StopWalkRun_Right.A_Lizard_StopWalkRun_Right'";
	
	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Stop/A_Lizard_StopSprint.A_Lizard_StopSprint'";
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Stop/A_Lizard_StopSprint.A_Lizard_StopSprint'";

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
}

UCLASS()
class UTurnsData_Lizard_Combat : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Lizard_Combat::StaticClass();

    // Pivots

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Combat/Movement/Grounded/N/Turn/A_Lizard_RunCombatTurn180.A_Lizard_RunCombatTurn180'";
	//default m_RunPivots.Pivot180L.StartTime = 0.2;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Combat/Movement/Grounded/N/Turn/A_Lizard_RunCombatTurn180.A_Lizard_RunCombatTurn180'";
	//default m_RunPivots.Pivot180R.StartTime = 0.2;

	default m_Pivots.Add(EWalkSpeed::Walking, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);

	// Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Combat/Movement/Grounded/N/Start/A_Lizard_StartWalkCombatLeft.A_Lizard_StartWalkCombatLeft'";
	default m_WalkStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Combat/Movement/Grounded/N/Start/A_Lizard_StartWalkCombatRight.A_Lizard_StartWalkCombatRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Combat/Movement/Grounded/N/Start/A_Lizard_StartWalkCombat180Left.A_Lizard_StartWalkCombat180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Combat/Movement/Grounded/N/Start/A_Lizard_StartWalkCombat180Right.A_Lizard_StartWalkCombat180Right'";

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_WalkStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Stop/A_Lizard_StopWalkRun_Left.A_Lizard_StopWalkRun_Left'";
	/*default m_WalkStops.QuickStopL.BlendIn = 0.4f;
	default m_WalkStops.QuickStopL.BlendOut = 0.2f;*/
	//default m_WalkStops.QuickStopL.StartTime = 0.35f;
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Lizard/Movement/Grounded/N/Stop/A_Lizard_StopWalkRun_Right.A_Lizard_StopWalkRun_Right'";
	/*default m_WalkStops.QuickStopR.BlendIn = 0.4f;
	default m_WalkStops.QuickStopR.BlendOut = 0.2f;*/
	//default m_WalkStops.QuickStopR.StartTime = 0.32f;

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);

}