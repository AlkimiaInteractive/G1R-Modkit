UCLASS()
class UTurnOnSpotAssetConfig_ShadowBeast : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_ShadowBeast_TIPL30 : UTurnOnSpotAssetConfig_ShadowBeast
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Stop/A_Shadow_Beast_StopWalkRun_Left.A_Shadow_Beast_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_ShadowBeast_TIPR30 : UTurnOnSpotAssetConfig_ShadowBeast
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Stop/A_Shadow_Beast_StopWalkRun_Right.A_Shadow_Beast_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_ShadowBeast_TIPL90 : UTurnOnSpotAssetConfig_ShadowBeast
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Turn/A_Shadow_Beast_Turn90Left.A_Shadow_Beast_Turn90Left'";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_ShadowBeast_TIPR90 : UTurnOnSpotAssetConfig_ShadowBeast
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Turn/A_Shadow_Beast_Turn90Right.A_Shadow_Beast_Turn90Right'";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_ShadowBeast_TIPL180 : UTurnOnSpotAssetConfig_ShadowBeast
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Turn/A_Shadow_Beast_Turn180Left.A_Shadow_Beast_Turn180Left'";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_ShadowBeast_TIPR180 : UTurnOnSpotAssetConfig_ShadowBeast
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Turn/A_Shadow_Beast_Turn180Right.A_Shadow_Beast_Turn180Right'";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_Shadow_Beast : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_ShadowBeast_TIPL30::StaticClass();
	default m_TIPR30 = UTurnOnSpotAssetConfig_ShadowBeast_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_ShadowBeast_TIPL90::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_ShadowBeast_TIPR90::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_ShadowBeast_TIPL180::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_ShadowBeast_TIPR180::StaticClass();
}

UCLASS()
class UTurnOnSpotAssetConfig_ShadowBeast_Combat_TIPL30 : UTurnOnSpotAssetConfig_ShadowBeast
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Stop/A_Shadow_Beast_StopWalkRun_Left.A_Shadow_Beast_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_ShadowBeast_Combat_TIPR30 : UTurnOnSpotAssetConfig_ShadowBeast
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Stop/A_Shadow_Beast_StopWalkRun_Right.A_Shadow_Beast_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_ShadowBeast_Combat_TIPL90 : UTurnOnSpotAssetConfig_ShadowBeast
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Movement/Grounded/N/Turn/A_Shadow_Beast_Idle_CombatTurn90Left.A_Shadow_Beast_Idle_CombatTurn90Left'";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_ShadowBeast_Combat_TIPR90 : UTurnOnSpotAssetConfig_ShadowBeast
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Movement/Grounded/N/Turn/A_Shadow_Beast_Idle_CombatTurn90Right.A_Shadow_Beast_Idle_CombatTurn90Right'";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_ShadowBeast_Combat_TIPL180 : UTurnOnSpotAssetConfig_ShadowBeast
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Movement/Grounded/N/Turn/A_Shadow_Beast_Idle_CombatTurn180Left.A_Shadow_Beast_Idle_CombatTurn180Left'";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_ShadowBeast_Combat_TIPR180 : UTurnOnSpotAssetConfig_ShadowBeast
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Movement/Grounded/N/Turn/A_Shadow_Beast_Idle_CombatTurn180Right.A_Shadow_Beast_Idle_CombatTurn180Right'";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_Shadow_Beast_Combat : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_ShadowBeast_Combat_TIPL30::StaticClass();
	default m_TIPR30 = UTurnOnSpotAssetConfig_ShadowBeast_Combat_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_ShadowBeast_Combat_TIPL90::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_ShadowBeast_Combat_TIPR90::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_ShadowBeast_Combat_TIPL180::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_ShadowBeast_Combat_TIPR180::StaticClass();
    //default m_TurnCheckMinAngle = 30;
}

UCLASS()
class UTurnsData_Shadow_Beast : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Shadow_Beast::StaticClass();

    // Pivots
    
    FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Turn/A_Shadow_Beast_WalkTurn180.A_Shadow_Beast_WalkTurn180'";
    default m_WalkPivots.Pivot180L.BlendOut = 0.2;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Turn/A_Shadow_Beast_WalkTurn180.A_Shadow_Beast_WalkTurn180'";
    default m_WalkPivots.Pivot180R.BlendOut = 0.2;
	

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Turn/A_Shadow_Beast_RunTurn180.A_Shadow_Beast_RunTurn180'";
	default m_RunPivots.Pivot180L.BlendOut = 0.0;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Turn/A_Shadow_Beast_RunTurn180.A_Shadow_Beast_RunTurn180'";
	default m_RunPivots.Pivot180R.BlendOut = 0.0;
	

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Sprinting, m_RunPivots);

    // Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Start/A_Shadow_Beast_StartWalkLeft.A_Shadow_Beast_StartWalkLeft'";
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Start/A_Shadow_Beast_StartWalkRight.A_Shadow_Beast_StartWalkRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Start/A_Shadow_Beast_StartTurn180Left.A_Shadow_Beast_StartTurn180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Start/A_Shadow_Beast_StartTurn180Right.A_Shadow_Beast_StartTurn180Right'";

	// Start Moving
    FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Start/A_Shadow_Beast_StartWalkLeft.A_Shadow_Beast_StartWalkLeft'";
	default m_RunPivots.Pivot90L.PlayRate = 1.2f;
	default m_RunStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Start/A_Shadow_Beast_StartWalkRight.A_Shadow_Beast_StartWalkRight'";
	default m_RunPivots.Pivot90R.PlayRate = 1.2f;
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Turn/A_Shadow_Beast_RunTurn180.A_Shadow_Beast_RunTurn180'";
	default m_RunStarts.Pivot180R.BlendOut = 0.0;
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Turn/A_Shadow_Beast_RunTurn180.A_Shadow_Beast_RunTurn180'";
	default m_RunStarts.Pivot180R.BlendOut = 0.0;

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Stop/A_Shadow_Beast_StopWalkRun_Left.A_Shadow_Beast_StopWalkRun_Left'";
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Stop/A_Shadow_Beast_StopWalkRun_Right.A_Shadow_Beast_StopWalkRun_Right'";
	
	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Stop/A_Shadow_Beast_StopSprint_Anim.A_Shadow_Beast_StopSprint_Anim'";
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Stop/A_Shadow_Beast_StopSprint_Anim.A_Shadow_Beast_StopSprint_Anim'";

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
}

UCLASS()
class UTurnsData_Shadow_Beast_Combat : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Shadow_Beast_Combat::StaticClass();

    // Pivots
    
    FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Movement/Grounded/N/Turn/A_Shadow_Beast_RunCombatTurn180.A_Shadow_Beast_RunCombatTurn180'";
	//default m_RunPivots.Pivot180L.StartTime = 0.2;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Movement/Grounded/N/Turn/A_Shadow_Beast_RunCombatTurn180.A_Shadow_Beast_RunCombatTurn180'";
	//default m_RunPivots.Pivot180R.StartTime = 0.2;

	default m_Pivots.Add(EWalkSpeed::Walking, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);

	// Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Movement/Grounded/N/Start/A_Shadow_Beast_StartWalkCombatLeft.A_Shadow_Beast_StartWalkCombatLeft'";
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Movement/Grounded/N/Start/A_Shadow_Beast_StartWalkCombatRight.A_Shadow_Beast_StartWalkCombatRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Movement/Grounded/N/Start/A_Shadow_Beast_StartWalkCombat180Left.A_Shadow_Beast_StartWalkCombat180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Movement/Grounded/N/Start/A_Shadow_Beast_StartWalkCombat180Right.A_Shadow_Beast_StartWalkCombat180Right'";

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Movement/Grounded/N/Start/A_Shadow_Beast_StartWalkCombatLeft.A_Shadow_Beast_StartWalkCombatLeft'";
	default m_RunPivots.Pivot90L.PlayRate = 1.2f;
	default m_RunStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Movement/Grounded/N/Start/A_Shadow_Beast_StartWalkCombatRight.A_Shadow_Beast_StartWalkCombatRight'";
	default m_RunPivots.Pivot90R.PlayRate = 1.2f;
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Movement/Grounded/N/Turn/A_Shadow_Beast_RunCombatTurn180.A_Shadow_Beast_RunCombatTurn180'";
	default m_RunPivots.Pivot180L.StartTime = 0.35f;
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Combat/Movement/Grounded/N/Turn/A_Shadow_Beast_RunCombatTurn180.A_Shadow_Beast_RunCombatTurn180'";
	default m_RunPivots.Pivot180R.StartTime = 0.35f;

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Stop/A_Shadow_Beast_StopWalkRun_Left.A_Shadow_Beast_StopWalkRun_Left'";
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Stop/A_Shadow_Beast_StopWalkRun_Right.A_Shadow_Beast_StopWalkRun_Right'";
	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Stop/A_Shadow_Beast_StopSprint_Anim.A_Shadow_Beast_StopSprint_Anim'";
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Shadow_Beast/Movement/Grounded/N/Stop/A_Shadow_Beast_StopSprint_Anim.A_Shadow_Beast_StopSprint_Anim'";

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
}