UCLASS()
class UTurnOnSpotAssetConfig_Bloodfly : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_Bloodfly_TIPL30 : UTurnOnSpotAssetConfig_Bloodfly
{
    default m_Animation =  n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Stop/A_Bloodfly_StopWalkRun_Left.A_Bloodfly_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Bloodfly_TIPR30 : UTurnOnSpotAssetConfig_Bloodfly
{
    default m_Animation =  n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Stop/A_Bloodfly_StopWalkRun_Right.A_Bloodfly_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_Bloodfly_TIPL90 : UTurnOnSpotAssetConfig_Bloodfly
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Turn/A_Bloodfly_Turn90Left.A_Bloodfly_Turn90Left'";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Bloodfly_TIPR90 : UTurnOnSpotAssetConfig_Bloodfly
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Turn/A_Bloodfly_Turn90Right.A_Bloodfly_Turn90Right'";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Bloodfly_TIPL180 : UTurnOnSpotAssetConfig_Bloodfly
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Turn/A_Bloodfly_Turn180Left.A_Bloodfly_Turn180Left'";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_Bloodfly_TIPR180 : UTurnOnSpotAssetConfig_Bloodfly
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Turn/A_Bloodfly_Turn180Right.A_Bloodfly_Turn180Right'";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_Bloodfly : UTurnOnSpotConfig
{
    default m_TIPL30 = UTurnOnSpotAssetConfig_Bloodfly_TIPL30::StaticClass();
	default m_TIPR30 = UTurnOnSpotAssetConfig_Bloodfly_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Bloodfly_TIPL90::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_Bloodfly_TIPR90::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_Bloodfly_TIPL180::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_Bloodfly_TIPR180::StaticClass();
}

UCLASS()
class UTurnOnSpotAssetConfig_Bloodfly_Combat_TIPL30 : UTurnOnSpotAssetConfig_Bloodfly
{
    default m_Animation =  n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Stop/A_Bloodfly_StopWalkRun_Left.A_Bloodfly_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Bloodfly_Combat_TIPR30 : UTurnOnSpotAssetConfig_Bloodfly
{
    default m_Animation =  n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Stop/A_Bloodfly_StopWalkRun_Right.A_Bloodfly_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_Bloodfly_Combat_TIPL90 : UTurnOnSpotAssetConfig_Bloodfly
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Movement/Grounded/N/Turn/A_Bloodfly_Idle_CombatTurn90Left.A_Bloodfly_Idle_CombatTurn90Left'";
	default m_AnimatedAngle = -90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Bloodfly_Combat_TIPR90 : UTurnOnSpotAssetConfig_Bloodfly
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Movement/Grounded/N/Turn/A_Bloodfly_Idle_CombatTurn90Right.A_Bloodfly_Idle_CombatTurn90Right'";
	default m_AnimatedAngle = 90;
}
UCLASS()
class UTurnOnSpotAssetConfig_Bloodfly_Combat_TIPL180 : UTurnOnSpotAssetConfig_Bloodfly
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Movement/Grounded/N/Turn/A_Bloodfly_Idle_CombatTurn180Left.A_Bloodfly_Idle_CombatTurn180Left'";
	default m_AnimatedAngle = -180;
}
UCLASS()
class UTurnOnSpotAssetConfig_Bloodfly_Combat_TIPR180 : UTurnOnSpotAssetConfig_Bloodfly
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Movement/Grounded/N/Turn/A_Bloodfly_Idle_CombatTurn180Right.A_Bloodfly_Idle_CombatTurn180Right'";
	default m_AnimatedAngle = 180;
}

UCLASS()
class UTurnOnSpotConfig_Bloodfly_Combat : UTurnOnSpotConfig
{
    default m_TIPL30 = UTurnOnSpotAssetConfig_Bloodfly_Combat_TIPL30::StaticClass();
	default m_TIPR30 = UTurnOnSpotAssetConfig_Bloodfly_Combat_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Bloodfly_Combat_TIPL90::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_Bloodfly_Combat_TIPR90::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_Bloodfly_Combat_TIPL180::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_Bloodfly_Combat_TIPR180::StaticClass();
    //default m_TurnCheckMinAngle = 30;
}

UCLASS()
class UTurnsData_Bloodfly : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Bloodfly::StaticClass();

    //Pivots

	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Turn/A_Bloodfly_WalkTurn180.A_Bloodfly_WalkTurn180'";
    default m_WalkPivots.Pivot180L.BlendOut = 0.2;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Turn/A_Bloodfly_WalkTurn180.A_Bloodfly_WalkTurn180'";
    default m_WalkPivots.Pivot180R.BlendOut = 0.2;
	

	/*FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Turn/A_Wolf_RunTurn180.A_Wolf_RunTurn180'";
	default m_RunPivots.Pivot180L.BlendOut = 0.2;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Turn/A_Wolf_RunTurn180.A_Wolf_RunTurn180'";
	default m_RunPivots.Pivot180R.BlendOut = 0.2;


	FTurnDirections m_SprintPivots;
	default m_SprintPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Turn/A_Wolf_RunTurn180.A_Wolf_RunTurn180'";
    default m_SprintPivots.Pivot180L.BlendOut = 0.2;
	default m_SprintPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Wolf/Movement/Grounded/N/Turn/A_Wolf_RunTurn180.A_Wolf_RunTurn180'";
    default m_SprintPivots.Pivot180R.BlendOut = 0.2;*/

	//default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	//default m_Pivots.Add(EWalkSpeed::Running, m_WalkPivots);
	//default m_Pivots.Add(EWalkSpeed::Sprinting, m_WalkPivots);
	
	FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Start/A_Bloodfly_StartWalkLeft.A_Bloodfly_StartWalkLeft'";
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Start/A_Bloodfly_StartWalkRight.A_Bloodfly_StartWalkRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Start/A_Bloodfly_StartTurn180Left.A_Bloodfly_StartTurn180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Start/A_Bloodfly_StartTurn180Right.A_Bloodfly_StartTurn180Right'";

	//default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	//default m_Starts.Add(EWalkSpeed::Running, m_WalkStarts);
	//default m_Starts.Add(EWalkSpeed::Sprinting, m_WalkStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Stop/A_Bloodfly_StopWalkRun_Left.A_Bloodfly_StopWalkRun_Left'";
	/*default m_WalkStops.QuickStopL.BlendIn = 0.4f;
	default m_WalkStops.QuickStopL.BlendOut = 0.2f;*/
	default m_WalkStops.QuickStopL.StartTime = 0.35f;
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Stop/A_Bloodfly_StopWalkRun_Right.A_Bloodfly_StopWalkRun_Right'";
	/*default m_WalkStops.QuickStopR.BlendIn = 0.4f;
	default m_WalkStops.QuickStopR.BlendOut = 0.2f;*/
	default m_WalkStops.QuickStopR.StartTime = 0.32f;
	
	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Stop/A_Bloodfly_StopSprint.A_Bloodfly_StopSprint'";
	//default m_SprintStops.QuickStopL.BlendIn = 0.2f;
	//default m_SprintStops.QuickStopL.BlendOut = 0.2f;
	//default m_SprintStops.QuickStopL.StartTime = 0.6f;
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Stop/A_Bloodfly_StopSprint.A_Bloodfly_StopSprint'";
	//default m_SprintStops.QuickStopR.BlendIn = 0.2f;
	//default m_SprintStops.QuickStopR.BlendOut = 0.2f;
	//default m_SprintStops.QuickStopR.StartTime = 0.6f;
	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
}

UCLASS()
class UTurnsData_Bloodfly_Combat : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Bloodfly_Combat::StaticClass();

    // Pivots
    FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Turn/A_Bloodfly_WalkTurn180.A_Bloodfly_WalkTurn180'";
    default m_WalkPivots.Pivot180L.BlendOut = 0.2;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Movement/Grounded/N/Turn/A_Bloodfly_WalkTurn180.A_Bloodfly_WalkTurn180'";
    default m_WalkPivots.Pivot180R.BlendOut = 0.2;
	

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Movement/Grounded/N/Turn/A_Bloodfly_RunCombatTurn180.A_Bloodfly_RunCombatTurn180'";
	default m_RunPivots.Pivot180L.BlendOut = 0.2;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Bloodfly/Combat/Movement/Grounded/N/Turn/A_Bloodfly_RunCombatTurn180.A_Bloodfly_RunCombatTurn180'";
	default m_RunPivots.Pivot180R.BlendOut = 0.2;

	//default m_Pivots.Add(EWalkSpeed::Walking, m_RunPivots);
	//default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);
}