UCLASS()
class UTurnOnSpotAssetConfig_Golem_Fire : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_Golem_Fire_TIPL30 : UTurnOnSpotAssetConfig_Golem_Fire
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Stop/A_FireGolem_StopWalkRun_Left.A_FireGolem_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Golem_Fire_TIPR30 : UTurnOnSpotAssetConfig_Golem_Fire
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Stop/A_FireGolem_StopWalkRun_Right.A_FireGolem_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_Golem_Fire_TIPL90 : UTurnOnSpotAssetConfig_Golem_Fire
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Turn/A_FireGolem_Turn90Left.A_FireGolem_Turn90Left'";
	default m_AnimatedAngle = -90;
	//default m_PlayRate = 1.2;
	//default m_ScaleTurnAngle = true;
	//default m_SlotName = n"(N) Turn/Rotate";
}
UCLASS()
class UTurnOnSpotAssetConfig_Golem_Fire_TIPR90 : UTurnOnSpotAssetConfig_Golem_Fire
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Turn/A_FireGolem_Turn90Right.A_FireGolem_Turn90Right'";
	default m_AnimatedAngle = 90;
	//default m_PlayRate = 1.2;
	//default m_ScaleTurnAngle = true;
	//default m_SlotName = n"(N) Turn/Rotate";
}
UCLASS()
class UTurnOnSpotAssetConfig_Golem_Fire_TIPL180 : UTurnOnSpotAssetConfig_Golem_Fire
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Turn/A_FireGolem_Turn180Left.A_FireGolem_Turn180Left'";
	default m_AnimatedAngle = -180;
	//default m_PlayRate = 1.2;
	//default m_ScaleTurnAngle = true;
	//default m_SlotName = n"(N) Turn/Rotate";
}
UCLASS()
class UTurnOnSpotAssetConfig_Golem_Fire_TIPR180 : UTurnOnSpotAssetConfig_Golem_Fire
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Turn/A_FireGolem_Turn180Right.A_FireGolem_Turn180Right'";
	default m_AnimatedAngle = 180;
	//default m_PlayRate = 1.2;
	//default m_ScaleTurnAngle = true;
	//default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotConfig_Golem_Fire : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Golem_Fire_TIPL30::StaticClass();
	default m_TIPR30 = UTurnOnSpotAssetConfig_Golem_Fire_TIPR30::StaticClass();
    default m_TIPL90 = UTurnOnSpotAssetConfig_Golem_Fire_TIPL90::StaticClass();
	default m_TIPR90 = UTurnOnSpotAssetConfig_Golem_Fire_TIPR90::StaticClass();
	default m_TIPL180 = UTurnOnSpotAssetConfig_Golem_Fire_TIPL180::StaticClass();
	default m_TIPR180 = UTurnOnSpotAssetConfig_Golem_Fire_TIPR180::StaticClass();
}

UCLASS()
class UTurnsData_Golem_Fire : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Golem_Fire::StaticClass();

    //Pivots

	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Turn/A_FireGolem_WalkTurn180.A_FireGolem_WalkTurn180'";
    default m_WalkPivots.Pivot180L.BlendOut = 0.0;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Turn/A_FireGolem_WalkTurn180.A_FireGolem_WalkTurn180'";
    default m_WalkPivots.Pivot180R.BlendOut = 0.0;
	

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Turn/A_FireGolem_RunTurn180.A_FireGolem_RunTurn180'";
	default m_RunPivots.Pivot180L.BlendOut = 0.0;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Turn/A_FireGolem_RunTurn180.A_FireGolem_RunTurn180'";
	default m_RunPivots.Pivot180R.BlendOut = 0.0;


	FTurnDirections m_SprintPivots;
	default m_SprintPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Turn/A_FireGolem_RunTurn180.A_FireGolem_RunTurn180'";
    default m_SprintPivots.Pivot180L.BlendOut = 0.0;
	default m_SprintPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Turn/A_FireGolem_RunTurn180.A_FireGolem_RunTurn180'";
    default m_SprintPivots.Pivot180R.BlendOut = 0.0;
	

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Sprinting, m_SprintPivots);

    // Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Start/A_FireGolem_StartWalkLeft.A_FireGolem_StartWalkLeft'";
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Start/A_FireGolem_StartWalkRight.A_FireGolem_StartWalkRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Start/A_FireGolem_StartTurn180Left.A_FireGolem_StartTurn180Left'";
	default m_WalkStarts.Pivot180L.BlendOut = 0.0;
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Start/A_FireGolem_StartTurn180Right.A_FireGolem_StartTurn180Right'";

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Start/A_FireGolem_StartWalkLeft.A_FireGolem_StartWalkLeft'";
	default m_RunStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Start/A_FireGolem_StartWalkRight.A_FireGolem_StartWalkRight'";
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Turn/A_FireGolem_RunTurn180.A_FireGolem_RunTurn180'";
	default m_RunStarts.Pivot180L.BlendIn = 0.35;
	default m_RunStarts.Pivot180L.BlendOut = 0.0;
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Turn/A_FireGolem_RunTurn180.A_FireGolem_RunTurn180'";
	default m_RunStarts.Pivot180R.BlendIn = 0.35;
	default m_RunStarts.Pivot180R.BlendOut = 0.0;

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);


	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Stop/A_FireGolem_StopWalkRun_Left.A_FireGolem_StopWalkRun_Left'";
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Stop/A_FireGolem_StopWalkRun_Right.A_FireGolem_StopWalkRun_Right'";;
	
	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Stop/A_FireGolem_StopWalkRun_Left.A_FireGolem_StopWalkRun_Left'";
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Stop/A_FireGolem_StopWalkRun_Right.A_FireGolem_StopWalkRun_Right'";

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
}

UCLASS()
class UTurnOnSpotAssetConfig_Golem_Fire_Combat_TIPL30 : UTurnOnSpotAssetConfig_Golem_Fire
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Stop/A_FireGolem_StopWalkRun_Left.A_FireGolem_StopWalkRun_Left'";
	default m_AnimatedAngle = -30;
}
UCLASS()
class UTurnOnSpotAssetConfig_Golem_Fire_Combat_TIPR30 : UTurnOnSpotAssetConfig_Golem_Fire
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Stop/A_FireGolem_StopWalkRun_Right.A_FireGolem_StopWalkRun_Right'";
	default m_AnimatedAngle = 30;
}

UCLASS()
class UTurnOnSpotAssetConfig_Golem_Fire_Combat_TIPL90 : UTurnOnSpotAssetConfig_Golem_Fire
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Movement/Grounded/N/Turn/A_FireGolem_CombatTurn90Left.A_FireGolem_CombatTurn90Left'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Golem_Fire_Combat_TIPR90 : UTurnOnSpotAssetConfig_Golem_Fire
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Movement/Grounded/N/Turn/A_FireGolem_CombatTurn90Right.A_FireGolem_CombatTurn90Right'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Golem_Fire_Combat_TIPL180 : UTurnOnSpotAssetConfig_Golem_Fire
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Movement/Grounded/N/Turn/A_FireGolem_Combatturn180left.A_FireGolem_Combatturn180left'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Golem_Fire_Combat_TIPR180 : UTurnOnSpotAssetConfig_Golem_Fire
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Movement/Grounded/N/Turn/A_FireGolem_CombatTurn180Right.A_FireGolem_CombatTurn180Right'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.2;
}

UCLASS()
class UTurnOnSpotConfig_Golem_Fire_Combat : UTurnOnSpotConfig
{
	default m_TIPL30 = UTurnOnSpotAssetConfig_Golem_Fire_Combat_TIPL30::StaticClass();
   	default m_TIPR30 = UTurnOnSpotAssetConfig_Golem_Fire_Combat_TIPR30::StaticClass();
   	default m_TIPL90 = UTurnOnSpotAssetConfig_Golem_Fire_Combat_TIPL90::StaticClass();
   	default m_TIPR90 = UTurnOnSpotAssetConfig_Golem_Fire_Combat_TIPR90::StaticClass();
   	default m_TIPL180 = UTurnOnSpotAssetConfig_Golem_Fire_Combat_TIPL180::StaticClass();
   	default m_TIPR180 = UTurnOnSpotAssetConfig_Golem_Fire_Combat_TIPR180::StaticClass();
}

UCLASS()
class UTurnsData_Golem_Fire_Combat : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Golem_Fire_Combat::StaticClass();

    // Pivots
	FTurnDirections m_WalkPivots;
    default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Movement/Grounded/N/Turn/A_FireGolem_WalkCombatTurn180.A_FireGolem_WalkCombatTurn180'";
	default m_WalkPivots.Pivot180L.StartTime = 0.0;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Movement/Grounded/N/Turn/A_FireGolem_WalkCombatTurn180.A_FireGolem_WalkCombatTurn180'";
	default m_WalkPivots.Pivot180R.StartTime = 0.0;

	FTurnDirections m_RunPivots;
    default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Movement/Grounded/N/Turn/A_FireGolem_FastCombatTurn180.A_FireGolem_FastCombatTurn180'";
	default m_RunPivots.Pivot180L.StartTime = 0.0;
	default m_RunPivots.Pivot180L.BlendOut = 0.0;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Movement/Grounded/N/Turn/A_FireGolem_FastCombatTurn180.A_FireGolem_FastCombatTurn180'";
	default m_RunPivots.Pivot180R.StartTime = 0.0;
	default m_RunPivots.Pivot180R.BlendOut = 0.0;

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);

    // Start Moving
    FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Movement/Grounded/N/Start/A_FireGolem_StartWalkCombatLeft.A_FireGolem_StartWalkCombatLeft'";
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Movement/Grounded/N/Start/A_FireGolem_StartWalkCombatRight.A_FireGolem_StartWalkCombatRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Movement/Grounded/N/Start/A_FireGolem_StartWalkCombat180Left.A_FireGolem_StartWalkCombat180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Movement/Grounded/N/Start/A_FireGolem_StartWalkCombat180Right.A_FireGolem_StartWalkCombat180Right'";

	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Movement/Grounded/N/Start/A_FireGolem_StartWalkCombatLeft.A_FireGolem_StartWalkCombatLeft'";
	default m_RunStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Movement/Grounded/N/Start/A_FireGolem_StartWalkCombatRight.A_FireGolem_StartWalkCombatRight'";
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Movement/Grounded/N/Turn/A_FireGolem_FastCombatTurn180.A_FireGolem_FastCombatTurn180'";
	default m_RunStarts.Pivot180L.StartTime = 0.35;
	default m_RunStarts.Pivot180L.BlendOut = 0.0;
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Combat/Movement/Grounded/N/Turn/A_FireGolem_FastCombatTurn180.A_FireGolem_FastCombatTurn180'";
	default m_RunStarts.Pivot180R.StartTime = 0.35;
	default m_RunStarts.Pivot180R.BlendOut = 0.0;

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);
    
	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Stop/A_FireGolem_StopWalkRun_Left.A_FireGolem_StopWalkRun_Left'";
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Stop/A_FireGolem_StopWalkRun_Right.A_FireGolem_StopWalkRun_Right'";;
	
	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Stop/A_FireGolem_StopWalkRun_Left.A_FireGolem_StopWalkRun_Left'";
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Creatures/Fire_Golem/Movement/Grounded/N/Stop/A_FireGolem_StopWalkRun_Right.A_FireGolem_StopWalkRun_Right'";

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_WalkStops);
}