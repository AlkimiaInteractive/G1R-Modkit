UCLASS()
class UTurnOnSpotAssetConfig_Demon_Lesser : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_Demon_Lesser_TIPL30 : UTurnOnSpotAssetConfig_Demon_Lesser
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Stop/A_LesserDemon_StopWalkRun_Left.A_LesserDemon_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Demon_Lesser_TIPR30 : UTurnOnSpotAssetConfig_Demon_Lesser
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Stop/A_LesserDemon_StopWalkRun_Left.A_LesserDemon_StopWalkRun_Left'";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_Demon_Lesser_TIPL90 : UTurnOnSpotAssetConfig_Demon_Lesser
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Turn/A_LesserDemon_Turn90Left.A_LesserDemon_Turn90Left'";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Demon_Lesser_TIPR90 : UTurnOnSpotAssetConfig_Demon_Lesser
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Turn/A_LesserDemon_Turn90Right.A_LesserDemon_Turn90Right'";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Demon_Lesser_TIPL180 : UTurnOnSpotAssetConfig_Demon_Lesser
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Turn/A_LesserDemon_Turn180Left.A_LesserDemon_Turn180Left'";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_Demon_Lesser_TIPR180 : UTurnOnSpotAssetConfig_Demon_Lesser
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Turn/A_LesserDemon_Turn180Right.A_LesserDemon_Turn180Right'";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_Demon_Lesser : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Demon_Lesser_TIPL30::StaticClass();
	default m_TIPR30 = UTurnOnSpotAssetConfig_Demon_Lesser_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Demon_Lesser_TIPL90::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_Demon_Lesser_TIPR90::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_Demon_Lesser_TIPL180::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_Demon_Lesser_TIPR180::StaticClass();
}

UCLASS()
class UTurnOnSpotAssetConfig_Demon_Lesser_Combat_TIPL30 : UTurnOnSpotAssetConfig_Demon_Lesser
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Stop/A_LesserDemon_StopWalkRun_Left.A_LesserDemon_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Demon_Lesser_Combat_TIPR30 : UTurnOnSpotAssetConfig_Demon_Lesser
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Stop/A_LesserDemon_StopWalkRun_Left.A_LesserDemon_StopWalkRun_Left'";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_Demon_Lesser_Combat_TIPL90 : UTurnOnSpotAssetConfig_Demon_Lesser
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Movement/Grounded/N/Turn/A_LesserDemon_CombatTurn90Left.A_LesserDemon_CombatTurn90Left'";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Demon_Lesser_Combat_TIPR90 : UTurnOnSpotAssetConfig_Demon_Lesser
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Movement/Grounded/N/Turn/A_LesserDemon_CombatTurn90Right.A_LesserDemon_CombatTurn90Right'";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Demon_Lesser_Combat_TIPL180 : UTurnOnSpotAssetConfig_Demon_Lesser
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Movement/Grounded/N/Turn/A_LesserDemon_CombatTurn180Left.A_LesserDemon_CombatTurn180Left'";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_Demon_Lesser_Combat_TIPR180 : UTurnOnSpotAssetConfig_Demon_Lesser
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Movement/Grounded/N/Turn/A_LesserDemon_CombatTurn180Right.A_LesserDemon_CombatTurn180Right'";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_Demon_Lesser_Combat : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Demon_Lesser_Combat_TIPL30::StaticClass();
	default m_TIPR30 = UTurnOnSpotAssetConfig_Demon_Lesser_Combat_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Demon_Lesser_Combat_TIPL90::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_Demon_Lesser_Combat_TIPR90::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_Demon_Lesser_Combat_TIPL180::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_Demon_Lesser_Combat_TIPR180::StaticClass();
    //default m_TurnCheckMinAngle = 30;
}

UCLASS()
class UTurnsData_Demon_Lesser : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Demon_Lesser::StaticClass();

    //Pivots

	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Turn/A_LesserDemon_WalkTurn180.A_LesserDemon_WalkTurn180'";
    //default m_WalkPivots.Pivot180L.BlendOut = 0.2;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Turn/A_LesserDemon_WalkTurn180.A_LesserDemon_WalkTurn180'";
    //default m_WalkPivots.Pivot180R.BlendOut = 0.2;
	

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Turn/A_LesserDemon_RunTurn180.A_LesserDemon_RunTurn180'";
	//default m_RunPivots.Pivot180L.BlendOut = 0.2;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Turn/A_LesserDemon_RunTurn180.A_LesserDemon_RunTurn180'";
	//default m_RunPivots.Pivot180R.BlendOut = 0.2;


	FTurnDirections m_SprintPivots;
	default m_SprintPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Turn/A_LesserDemon_RunTurn180.A_LesserDemon_RunTurn180'";
    //default m_SprintPivots.Pivot180L.BlendOut = 0.2;
	default m_SprintPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Turn/A_LesserDemon_RunTurn180.A_LesserDemon_RunTurn180'";
    //default m_SprintPivots.Pivot180R.BlendOut = 0.2;
	

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Sprinting, m_SprintPivots);

    // Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Start/A_LesserDemon_StartWalkLeft.A_LesserDemon_StartWalkLeft'";
	default m_WalkStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Start/A_LesserDemon_StartWalkRight.A_LesserDemon_StartWalkRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Start/A_LesserDemon_StartTurn180Left.A_LesserDemon_StartTurn180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Start/A_LesserDemon_StartTurn180Right.A_LesserDemon_StartTurn180Right'";

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Start/A_LesserDemon_StartWalkLeft.A_LesserDemon_StartWalkLeft'";
	default m_RunStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Start/A_LesserDemon_StartWalkRight.A_LesserDemon_StartWalkRight'";
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Turn/A_LesserDemon_RunTurn180.A_LesserDemon_RunTurn180'";
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Turn/A_LesserDemon_RunTurn180.A_LesserDemon_RunTurn180'";

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Stop/A_LesserDemon_StopWalkRun_Left.A_LesserDemon_StopWalkRun_Left'";
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Stop/A_LesserDemon_StopWalkRun_Left.A_LesserDemon_StopWalkRun_Left'";
	
	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Stop/A_LesserDemon_StopSprint.A_LesserDemon_StopSprint'";
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Stop/A_LesserDemon_StopSprint.A_LesserDemon_StopSprint'";
	
	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
}

UCLASS()
class UTurnsData_Demon_Lesser_Combat : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Demon_Lesser_Combat::StaticClass();

    //Pivots

	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Movement/Grounded/N/Turn/A_LesserDemon_WalkCombatTurn180.A_LesserDemon_WalkCombatTurn180'";
    //default m_WalkPivots.Pivot180L.BlendOut = 0.2;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Movement/Grounded/N/Turn/A_LesserDemon_WalkCombatTurn180.A_LesserDemon_WalkCombatTurn180'";
    //default m_WalkPivots.Pivot180R.BlendOut = 0.2;
	

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Movement/Grounded/N/Turn/A_LesserDemon_RunCombatTurn180.A_LesserDemon_RunCombatTurn180'";
	//default m_RunPivots.Pivot180L.BlendOut = 0.2;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Movement/Grounded/N/Turn/A_LesserDemon_RunCombatTurn180.A_LesserDemon_RunCombatTurn180'";
	//default m_RunPivots.Pivot180R.BlendOut = 0.2;


	FTurnDirections m_SprintPivots;
	default m_SprintPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Movement/Grounded/N/Turn/A_LesserDemon_RunCombatTurn180.A_LesserDemon_RunCombatTurn180'";
    //default m_SprintPivots.Pivot180L.BlendOut = 0.2;
	default m_SprintPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Combat/Movement/Grounded/N/Turn/A_LesserDemon_RunCombatTurn180.A_LesserDemon_RunCombatTurn180'";
    //default m_SprintPivots.Pivot180R.BlendOut = 0.2;
	

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Sprinting, m_SprintPivots);

    // Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"";
	default m_WalkStarts.Pivot90R.Sequence =  n"";
	default m_WalkStarts.Pivot180L.Sequence = n"";
	default m_WalkStarts.Pivot180R.Sequence = n"";

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_WalkStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Stop/A_LesserDemon_StopWalkRun_Left.A_LesserDemon_StopWalkRun_Left'";
	/*default m_WalkStops.QuickStopL.BlendIn = 0.4f;
	default m_WalkStops.QuickStopL.BlendOut = 0.2f;*/
	//default m_WalkStops.QuickStopL.StartTime = 0.35f;
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/LesserDemon/Movement/Grounded/N/Stop/A_LesserDemon_StopWalkRun_Left.A_LesserDemon_StopWalkRun_Left'";
	/*default m_WalkStops.QuickStopR.BlendIn = 0.4f;
	default m_WalkStops.QuickStopR.BlendOut = 0.2f;*/
	//default m_WalkStops.QuickStopR.StartTime = 0.32f;
	
	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	
}