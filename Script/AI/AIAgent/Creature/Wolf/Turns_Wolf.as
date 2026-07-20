UCLASS()
class UTurnOnSpotAssetConfig_Wolf : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}
UCLASS()
class UTurnOnSpotAssetConfig_Wolf_TIPL30 : UTurnOnSpotAssetConfig_Wolf
{
    default m_Animation =  n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Stop/A_Wolf_StopWalkRun_Left.A_Wolf_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Wolf_TIPR30 : UTurnOnSpotAssetConfig_Wolf
{
    default m_Animation =  n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Stop/A_Wolf_StopWalkRun_Right.A_Wolf_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Wolf_TIPL90 : UTurnOnSpotAssetConfig_Wolf
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Turn/A_Wolf_Turn90Left.A_Wolf_Turn90Left'";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Wolf_TIPR90 : UTurnOnSpotAssetConfig_Wolf
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Turn/A_Wolf_Turn90Right.A_Wolf_Turn90Right'";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Wolf_TIPL180 : UTurnOnSpotAssetConfig_Wolf
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Turn/A_Wolf_Turn180Left.A_Wolf_Turn180Left'";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_Wolf_TIPR180 : UTurnOnSpotAssetConfig_Wolf
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Turn/A_Wolf_Turn180Right.A_Wolf_Turn180Right'";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_Wolf : UTurnOnSpotConfig
{
    default m_TIPL30 = UTurnOnSpotAssetConfig_Wolf_TIPL30::StaticClass();
	default m_TIPR30 = UTurnOnSpotAssetConfig_Wolf_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Wolf_TIPL90::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_Wolf_TIPR90::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_Wolf_TIPL180::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_Wolf_TIPR180::StaticClass();
}
UCLASS()
class UTurnOnSpotAssetConfig_Wolf_Combat_TIPL30 : UTurnOnSpotAssetConfig_Wolf
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Stop/A_Wolf_StopWalkRun_Left.A_Wolf_StopWalkRun_Left'";
	default m_PlayRate = 1.25;
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Wolf_Combat_TIPR30 : UTurnOnSpotAssetConfig_Wolf
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Stop/A_Wolf_StopWalkRun_Right.A_Wolf_StopWalkRun_Right'";
	default m_PlayRate = 1.25;
	default m_AnimatedAngle = 30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Wolf_Combat_TIPL90 : UTurnOnSpotAssetConfig_Wolf
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Turn/A_Wolf_Idle_CombatTurn90Left.A_Wolf_Idle_CombatTurn90Left'";
	default m_PlayRate = 1.25;
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Wolf_Combat_TIPR90 : UTurnOnSpotAssetConfig_Wolf
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Turn/A_Wolf_Idle_CombatTurn90Right.A_Wolf_Idle_CombatTurn90Right'";
	default m_PlayRate = 1.25;
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Wolf_Combat_TIPL180 : UTurnOnSpotAssetConfig_Wolf
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Turn/A_Wolf_Idle_CombatTurn180Left.A_Wolf_Idle_CombatTurn180Left'";
	default m_PlayRate = 1.25;
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_Wolf_Combat_TIPR180 : UTurnOnSpotAssetConfig_Wolf
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Turn/A_Wolf_Idle_CombatTurn180Right.A_Wolf_Idle_CombatTurn180Right'";
	default m_PlayRate = 1.25;
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_Wolf_Combat : UTurnOnSpotConfig
{
    default m_TIPL30 = UTurnOnSpotAssetConfig_Wolf_Combat_TIPL30::StaticClass();
	default m_TIPR30 = UTurnOnSpotAssetConfig_Wolf_Combat_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Wolf_Combat_TIPL90::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_Wolf_Combat_TIPR90::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_Wolf_Combat_TIPL180::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_Wolf_Combat_TIPR180::StaticClass();
    //default m_TurnCheckMinAngle = 30;
}

UCLASS()
class UTurnsData_Wolf : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Wolf::StaticClass();

    //Pivots

	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Turn/A_Wolf_WalkTurn180.A_Wolf_WalkTurn180'";
    default m_WalkPivots.Pivot180L.BlendOut = 0.2f;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Turn/A_Wolf_WalkTurn180.A_Wolf_WalkTurn180'";
    default m_WalkPivots.Pivot180R.BlendOut = 0.2f;
	

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Turn/A_Wolf_RunTurn180.A_Wolf_RunTurn180'";
	default m_RunPivots.Pivot180L.BlendOut = 0.2f;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Turn/A_Wolf_RunTurn180.A_Wolf_RunTurn180'";
	default m_RunPivots.Pivot180R.BlendOut = 0.2f;


	FTurnDirections m_SprintPivots;
	default m_SprintPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Turn/A_Wolf_RunTurn180.A_Wolf_RunTurn180'";
    default m_SprintPivots.Pivot180L.BlendOut = 0.2f;
	default m_SprintPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Turn/A_Wolf_RunTurn180.A_Wolf_RunTurn180'";
    default m_SprintPivots.Pivot180R.BlendOut = 0.2f;

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Sprinting, m_SprintPivots);

    // Start Moving - OLD
    // default m_StartMoving90R = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Start/Wolf_StartMoving90R_Montage.Wolf_StartMoving90R_Montage'";
    // default m_StartMoving90L = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Start/Wolf_StartMoving90L_Montage.Wolf_StartMoving90L_Montage'";
    // default m_StartMoving180R = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Start/Wolf_StartMoving180R_Montage.Wolf_StartMoving180R_Montage'";
    // default m_StartMoving180L = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Start/Wolf_StartMoving180L_Montage.Wolf_StartMoving180L_Montage'";
	
	FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Start/A_Wolf_StartWalkLeft.A_Wolf_StartWalkLeft'";
	default m_WalkStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Start/A_Wolf_StartWalkRight.A_Wolf_StartWalkRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Start/A_Wolf_Start180Left.A_Wolf_Start180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Start/A_Wolf_Start180Right.A_Wolf_Start180Right'";

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Start/A_Wolf_StartWalkLeft.A_Wolf_StartWalkLeft'";
	default m_RunStarts.Pivot90L.BlendIn = 0.1f;
	default m_RunStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Start/A_Wolf_StartWalkRight.A_Wolf_StartWalkRight'";
	default m_RunStarts.Pivot90R.BlendIn = 0.1f;
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Turn/A_Wolf_RunTurn180.A_Wolf_RunTurn180'";
	default m_RunStarts.Pivot180L.BlendIn = 0.35f;
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Turn/A_Wolf_RunTurn180.A_Wolf_RunTurn180'";
	default m_RunStarts.Pivot180R.BlendIn = 0.35f;

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Stop/A_Wolf_StopWalkRun_Left.A_Wolf_StopWalkRun_Left'";
	/*default m_WalkStops.QuickStopL.BlendIn = 0.4f;
	default m_WalkStops.QuickStopL.BlendOut = 0.2f;*/
	default m_WalkStops.QuickStopL.StartTime = 0.35f;
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Stop/A_Wolf_StopWalkRun_Right.A_Wolf_StopWalkRun_Right'";
	/*default m_WalkStops.QuickStopR.BlendIn = 0.4f;
	default m_WalkStops.QuickStopR.BlendOut = 0.2f;*/
	default m_WalkStops.QuickStopR.StartTime = 0.32f;
	
	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Stop/A_Wolf_StopSprint_Anim.A_Wolf_StopSprint_Anim'";
	default m_SprintStops.QuickStopL.StartTime = 0.15f;
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Stop/A_Wolf_StopSprint_Anim.A_Wolf_StopSprint_Anim'";
	default m_SprintStops.QuickStopR.StartTime = 0.15f;
	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
}

UCLASS()
class UTurnsData_Wolf_Combat : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Wolf_Combat::StaticClass();

	// Stops
	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Stop/A_Wolf_StopWalkRun_Left.A_Wolf_StopWalkRun_Left'";
	default m_WalkStops.QuickStopL.StartTime = 0.35f;
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Stop/A_Wolf_StopWalkRun_Right.A_Wolf_StopWalkRun_Right'";
	default m_WalkStops.QuickStopR.StartTime = 0.32f;
	
	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Stop/A_Wolf_StopSprint_Anim.A_Wolf_StopSprint_Anim'";
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Stop/A_Wolf_StopSprint_Anim.A_Wolf_StopSprint_Anim'";
	
	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);

    // Pivots
    
    FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Turn/A_Wolf_RunCombatTurn180.A_Wolf_RunCombatTurn180'";
	default m_RunPivots.Pivot180L.StartTime = 0.2f;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Turn/A_Wolf_RunCombatTurn180.A_Wolf_RunCombatTurn180'";
	default m_RunPivots.Pivot180R.StartTime = 0.2f;

	default m_Pivots.Add(EWalkSpeed::Walking, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);

    // Start Moving
    //default m_StartMoving90R = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Start/Wolf_StartMoving90R_Montage.Wolf_StartMoving90R_Montage'";
    //default m_StartMoving90L = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Start/Wolf_StartMoving90L_Montage.Wolf_StartMoving90L_Montage'";
    //default m_StartMoving180R = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Start/Wolf_StartMoving180R_Montage.Wolf_StartMoving180R_Montage'";
    //default m_StartMoving180L = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Start/Wolf_StartMoving180L_Montage.Wolf_StartMoving180L_Montage'";
	
	FStartTurnDirections m_CombatWalkStarts;
	default m_CombatWalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Start/A_Wolf_StartWalkCombatLeft.A_Wolf_StartWalkCombatLeft'";
	default m_CombatWalkStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Start/A_Wolf_StartWalkCombatRight.A_Wolf_StartWalkCombatRight'";
	default m_CombatWalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Start/A_Wolf_StartWalkCombat180Left.A_Wolf_StartWalkCombat180Left'";
	default m_CombatWalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Start/A_Wolf_StartWalkCombat180Right.A_Wolf_StartWalkCombat180Right'";

	FStartTurnDirections m_CombatRunStarts;
	default m_CombatRunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Start/A_Wolf_StartWalkCombatLeft.A_Wolf_StartWalkCombatLeft'";
	default m_CombatRunStarts.Pivot90R.Sequence =  n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Start/A_Wolf_StartWalkCombatRight.A_Wolf_StartWalkCombatRight'";
	default m_CombatRunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Turn/A_Wolf_RunCombatTurn180.A_Wolf_RunCombatTurn180'";
	default m_CombatRunStarts.Pivot180L.BlendOut = 0.0f;
	default m_CombatRunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Combat/Movement/Grounded/N/Turn/A_Wolf_RunCombatTurn180.A_Wolf_RunCombatTurn180'";
	default m_CombatRunStarts.Pivot180R.BlendOut = 0.0f;

	default m_Starts.Add(EWalkSpeed::Walking, m_CombatWalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_CombatRunStarts);
}