UCLASS()
class UTurnOnSpotAssetConfig_Snapper : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_Snapper_TIPL30 : UTurnOnSpotAssetConfig_Snapper
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Stop/A_Snapper_StopWalkRun_Left.A_Snapper_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Snapper_TIPR30 : UTurnOnSpotAssetConfig_Snapper
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Stop/A_Snapper_StopWalkRun_Right.A_Snapper_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
	default m_PlayRate = 1.0;
}

UCLASS()
class UTurnOnSpotAssetConfig_Snapper_TIPL90 : UTurnOnSpotAssetConfig_Snapper
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Turn/A_Snapper_Turn90Left.A_Snapper_Turn90Left'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Snapper_TIPR90 : UTurnOnSpotAssetConfig_Snapper
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Turn/A_Snapper_Turn90Right.A_Snapper_Turn90Right'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Snapper_TIPL180 : UTurnOnSpotAssetConfig_Snapper
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Turn/A_Snapper_Turn180Left.A_Snapper_Turn180Left'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Snapper_TIPR180 : UTurnOnSpotAssetConfig_Snapper
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Turn/A_Snapper_Turn180Right.A_Snapper_Turn180Right'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.0;
}

UCLASS()
class UTurnOnSpotConfig_Snapper : UTurnOnSpotConfig
{
    default m_TIPL30 = UTurnOnSpotAssetConfig_Snapper_TIPL30::StaticClass();
    default m_TIPR30 = UTurnOnSpotAssetConfig_Snapper_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Snapper_TIPL90::StaticClass();
    default m_TIPR90 = UTurnOnSpotAssetConfig_Snapper_TIPR90::StaticClass();
    default m_TIPL180 = UTurnOnSpotAssetConfig_Snapper_TIPL180::StaticClass();
    default m_TIPR180 = UTurnOnSpotAssetConfig_Snapper_TIPR180::StaticClass();
}

UCLASS()
class UTurnOnSpotAssetConfig_Snapper_Combat_TIPL30 : UTurnOnSpotAssetConfig_Snapper
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Stop/A_Snapper_StopWalkRun_Left.A_Snapper_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Snapper_Combat_TIPR30 : UTurnOnSpotAssetConfig_Snapper
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Stop/A_Snapper_StopWalkRun_Right.A_Snapper_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
	default m_PlayRate = 1.0;
}

UCLASS()
class UTurnOnSpotAssetConfig_Snapper_Combat_TIPL90 : UTurnOnSpotAssetConfig_Snapper
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Combat/Movement/Grounded/N/Turn/A_Snapper_Idle_CombatTurn90Left.A_Snapper_Idle_CombatTurn90Left'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Snapper_Combat_TIPR90 : UTurnOnSpotAssetConfig_Snapper
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Combat/Movement/Grounded/N/Turn/A_Snapper_Idle_CombatTurn90Right.A_Snapper_Idle_CombatTurn90Right'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Snapper_Combat_TIPL180 : UTurnOnSpotAssetConfig_Snapper
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Combat/Movement/Grounded/N/Turn/A_Snapper_Idle_CombatTurn180Left.A_Snapper_Idle_CombatTurn180Left'";
	default m_AnimatedAngle = -180;
	
}
UCLASS()
class UTurnOnSpotAssetConfig_Snapper_Combat_TIPR180 : UTurnOnSpotAssetConfig_Snapper
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Combat/Movement/Grounded/N/Turn/A_Snapper_Idle_CombatTurn180Right.A_Snapper_Idle_CombatTurn180Right'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.0;
}

UCLASS()
class UTurnOnSpotConfig_Snapper_Combat : UTurnOnSpotConfig
{
    default m_TIPL30 = UTurnOnSpotAssetConfig_Snapper_Combat_TIPL30::StaticClass();
    default m_TIPR30 = UTurnOnSpotAssetConfig_Snapper_Combat_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Snapper_Combat_TIPL90::StaticClass();
    default m_TIPR90 = UTurnOnSpotAssetConfig_Snapper_Combat_TIPR90::StaticClass();
    default m_TIPL180 = UTurnOnSpotAssetConfig_Snapper_Combat_TIPL180::StaticClass();
    default m_TIPR180 = UTurnOnSpotAssetConfig_Snapper_Combat_TIPR180::StaticClass();
}

UCLASS()
class UTurnsData_Snapper : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Snapper::StaticClass();

    // Pivots
    FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Turn/A_Snapper_WalkTurn180.A_Snapper_WalkTurn180'";
    default m_WalkPivots.Pivot180L.BlendOut = 0.2;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Turn/A_Snapper_WalkTurn180.A_Snapper_WalkTurn180'";
    default m_WalkPivots.Pivot180R.BlendOut = 0.2;
	

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Turn/A_Snapper_RunTurn180.A_Snapper_RunTurn180'";
	default m_RunPivots.Pivot180L.BlendOut = 0.2;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Turn/A_Snapper_RunTurn180.A_Snapper_RunTurn180'";
	default m_RunPivots.Pivot180R.BlendOut = 0.2;


	FTurnDirections m_SprintPivots;
	default m_SprintPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Turn/A_Snapper_RunTurn180.A_Snapper_RunTurn180'";
    default m_SprintPivots.Pivot180L.BlendOut = 0.2;
	default m_SprintPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Turn/A_Snapper_RunTurn180.A_Snapper_RunTurn180'";
    default m_SprintPivots.Pivot180R.BlendOut = 0.2;
	

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Sprinting, m_SprintPivots);

    // Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Start/A_Snapper_StartWalkLeft.A_Snapper_StartWalkLeft'";
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Start/A_Snapper_StartWalkRight.A_Snapper_StartWalkRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Start/A_Snapper_StartTurn180Left.A_Snapper_StartTurn180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Start/A_Snapper_StartTurn180Right.A_Snapper_StartTurn180Right'";

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Start/A_Snapper_StartWalkLeft.A_Snapper_StartWalkLeft'";
	default m_RunStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Start/A_Snapper_StartWalkRight.A_Snapper_StartWalkRight'";
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Turn/A_Snapper_RunTurn180.A_Snapper_RunTurn180'";
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Turn/A_Snapper_RunTurn180.A_Snapper_RunTurn180'";

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Stop/A_Snapper_StopWalkRun_Left.A_Snapper_StopWalkRun_Left'";
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Stop/A_Snapper_StopWalkRun_Right.A_Snapper_StopWalkRun_Right'";
	
	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Stop/A_Snapper_StopSprint.A_Snapper_StopSprint'";
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Stop/A_Snapper_StopSprint.A_Snapper_StopSprint'";

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);

}
UCLASS()
class UTurnsData_Snapper_Combat : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Snapper_Combat::StaticClass();

    // Pivots
    FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Combat/Movement/Grounded/N/Turn/A_Snapper_WalkCombatTurn180.A_Snapper_WalkCombatTurn180'";
    default m_WalkPivots.Pivot180L.BlendOut = 0.2;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Combat/Movement/Grounded/N/Turn/A_Snapper_WalkCombatTurn180.A_Snapper_WalkCombatTurn180'";
    default m_WalkPivots.Pivot180R.BlendOut = 0.2;
	

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Combat/Movement/Grounded/N/Turn/A_Snapper_RunCombatTurn180.A_Snapper_RunCombatTurn180'";
	//default m_RunPivots.Pivot180L.BlendOut = 0.2;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Combat/Movement/Grounded/N/Turn/A_Snapper_RunCombatTurn180.A_Snapper_RunCombatTurn180'";
	//default m_RunPivots.Pivot180R.BlendOut = 0.2;


	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);

    // Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Combat/Movement/Grounded/N/Start/A_Snapper_StartWalkCombatLeft.A_Snapper_StartWalkCombatLeft'";
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Combat/Movement/Grounded/N/Start/A_Snapper_StartWalkCombatRight.A_Snapper_StartWalkCombatRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Combat/Movement/Grounded/N/Start/A_Snapper_StartWalkCombat180Left.A_Snapper_StartWalkCombat180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Combat/Movement/Grounded/N/Start/A_Snapper_StartWalkCombat180Right.A_Snapper_StartWalkCombat180Right'";

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Combat/Movement/Grounded/N/Start/A_Snapper_StartWalkCombatLeft.A_Snapper_StartWalkCombatLeft'";
	default m_RunStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Combat/Movement/Grounded/N/Start/A_Snapper_StartWalkCombatRight.A_Snapper_StartWalkCombatRight'";
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Combat/Movement/Grounded/N/Turn/A_Snapper_RunCombatTurn180.A_Snapper_RunCombatTurn180'";
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Combat/Movement/Grounded/N/Turn/A_Snapper_RunCombatTurn180.A_Snapper_RunCombatTurn180'";

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Stop/A_Snapper_StopWalkRun_Left.A_Snapper_StopWalkRun_Left'";
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Stop/A_Snapper_StopWalkRun_Right.A_Snapper_StopWalkRun_Right'";

	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Stop/A_Snapper_StopSprint.A_Snapper_StopSprint'";
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Snapper/Movement/Grounded/N/Stop/A_Snapper_StopSprint.A_Snapper_StopSprint'";

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
}