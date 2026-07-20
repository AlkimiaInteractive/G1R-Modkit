UCLASS()
class UTurnOnSpotAssetConfig_Orc : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_Orc_TIPL90 : UTurnOnSpotAssetConfig_Orc
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Movement/Grounded/N/Turn/A_OrcM_TurnIP_90Left.A_OrcM_TurnIP_90Left'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.35;
}
UCLASS()
class UTurnOnSpotAssetConfig_Orc_TIPR90 : UTurnOnSpotAssetConfig_Orc
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Movement/Grounded/N/Turn/A_OrcM_TurnIP_90Right.A_OrcM_TurnIP_90Right'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.35;
}
UCLASS()
class UTurnOnSpotAssetConfig_Orc_TIPL180 : UTurnOnSpotAssetConfig_Orc
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Movement/Grounded/N/Turn/A_OrcM_TurnIP_180Left.A_OrcM_TurnIP_180Left'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.4;
}
UCLASS()
class UTurnOnSpotAssetConfig_Orc_TIPR180 : UTurnOnSpotAssetConfig_Orc
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Movement/Grounded/N/Turn/A_OrcM_TurnIP_180Right.A_OrcM_TurnIP_180Right'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.4;
}

UCLASS()
class UTurnOnSpotConfig_Orc : UTurnOnSpotConfig
{
   default m_TIPL90 = UTurnOnSpotAssetConfig_Orc_TIPL90::StaticClass();
   default m_TIPR90 = UTurnOnSpotAssetConfig_Orc_TIPR90::StaticClass();
   default m_TIPL180 = UTurnOnSpotAssetConfig_Orc_TIPL180::StaticClass();
   default m_TIPR180 = UTurnOnSpotAssetConfig_Orc_TIPR180::StaticClass();
}

UCLASS()
class UTurnsData_Orc : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Orc::StaticClass();

    // Pivots
	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Movement/Grounded/N/Turn/A_OrcM_WalkTurn180Left.A_OrcM_WalkTurn180Left'"; 
	default m_WalkPivots.Pivot180L.BlendIn = 0.2;
	default m_WalkPivots.Pivot180L.BlendOut = 0.3f;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Movement/Grounded/N/Turn/A_OrcM_WalkTurn180Right.A_OrcM_WalkTurn180Right'";
	default m_WalkPivots.Pivot180R.BlendIn = 0.2;
	//default m_WalkPivots.Pivot180R.StartTime = 0.43;
	default m_WalkPivots.Pivot180R.BlendOut = 0.3f;

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Movement/Grounded/N/Turn/A_OrcM_RunTurn180.A_OrcM_RunTurn180'";
	default m_RunPivots.Pivot180L.StartTime = 0.26;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Movement/Grounded/N/Turn/A_OrcM_RunTurn180.A_OrcM_RunTurn180'";
	default m_RunPivots.Pivot180R.StartTime = 0.11;

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Sprinting, m_RunPivots);

	// Start Moving
	FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Movement/Grounded/N/Start/A_OrcM_StartWalkLeft.A_OrcM_StartWalkLeft'";
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Movement/Grounded/N/Start/A_OrcM_StartWalkRight.A_OrcM_StartWalkRight'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Movement/Grounded/N/Start/A_OrcM_StartTurn180Left.A_OrcM_StartTurn180Left'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Movement/Grounded/N/Start/A_OrcM_StartTurn180Right.A_OrcM_StartTurn180Right'";


	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Movement/Grounded/N/Start/A_OrcM_StartWalkLeft.A_OrcM_StartWalkLeft'";
	default m_RunStarts.Pivot90L.PlayRate = 1.35f;
	default m_RunStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Movement/Grounded/N/Start/A_OrcM_StartWalkRight.A_OrcM_StartWalkRight'";
	default m_RunStarts.Pivot90R.PlayRate = 1.35f;
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Movement/Grounded/N/Start/A_OrcM_StartTurn180Left.A_OrcM_StartTurn180Left'";
	default m_RunStarts.Pivot180L.PlayRate = 1.4f;
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Movement/Grounded/N/Start/A_OrcM_StartTurn180Right.A_OrcM_StartTurn180Right'";
	default m_RunStarts.Pivot180R.PlayRate = 1.4f;

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStarts);

	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"/Script/Engine.AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Movement/Grounded/N/Stops/A_OrcM_StopWalkRun_Left.A_OrcM_StopWalkRun_Left'";
	default m_WalkStops.QuickStopL.BlendIn = 0.2f;
	//default m_WalkStops.QuickStopL.BlendOut = 0.2f;
	default m_WalkStops.QuickStopL.StartTime = 0.8f;
	default m_WalkStops.QuickStopL.PlayRate = 0.75f;
	default m_WalkStops.QuickStopR.Sequence = n"/Script/Engine.AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Movement/Grounded/N/Stops/A_OrcM_StopWalkRun_Left.A_OrcM_StopWalkRun_Left'";
	default m_WalkStops.QuickStopR.BlendIn = 0.35f;
	//default m_WalkStops.QuickStopR.BlendOut = 0.2f;
	default m_WalkStops.QuickStopR.StartTime = 0.8f;
	default m_WalkStops.QuickStopR.PlayRate = 0.75f;

	FQuickStops m_RunStops;
	default m_RunStops.QuickStopL.Sequence = n"/Script/Engine.AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Movement/Grounded/N/Stops/A_OrcM_StopWalkRun_Left.A_OrcM_StopWalkRun_Left'";
	default m_RunStops.QuickStopL.BlendIn = 0.2f;
	//default m_RunStops.QuickStopL.BlendOut = 0.2f;
	default m_RunStops.QuickStopL.StartTime = 0.8f;
	default m_RunStops.QuickStopR.Sequence = n"/Script/Engine.AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Movement/Grounded/N/Stops/A_OrcM_StopWalkRun_Left.A_OrcM_StopWalkRun_Left'";
	default m_RunStops.QuickStopR.BlendIn = 0.2f;
	//default m_RunStops.QuickStopR.BlendOut = 0.2f;
	default m_RunStops.QuickStopR.StartTime = 0.4f;
	
	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Movement/Grounded/N/Stops/A_OrcM_StopSprint.A_OrcM_StopSprint'";
	default m_SprintStops.QuickStopL.BlendIn = 0.2f;
	default m_SprintStops.QuickStopL.BlendOut = 0.2f;
	default m_SprintStops.QuickStopL.StartTime = 1.5f;
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Movement/Grounded/N/Stops/A_OrcM_StopSprint.A_OrcM_StopSprint'";
	default m_SprintStops.QuickStopR.BlendIn = 0.2f;
	default m_SprintStops.QuickStopR.BlendOut = 0.2f;
	default m_SprintStops.QuickStopR.StartTime = 1.5f;

	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_RunStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);
}

UCLASS()
class UTurnOnSpotAssetConfig_Orc_Combat_TIPL90 : UTurnOnSpotAssetConfig_Orc
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Movement/Turn/A_OrcM_S1H_Turn_IP_90L.A_OrcM_S1H_Turn_IP_90L'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Orc_Combat_TIPR90 : UTurnOnSpotAssetConfig_Orc
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Movement/Turn/A_OrcM_S1H_Turn_IP_90R.A_OrcM_S1H_Turn_IP_90R'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Orc_Combat_TIPL180 : UTurnOnSpotAssetConfig_Orc
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Movement/Turn/A_OrcM_S1H_Turn_IP_180L.A_OrcM_S1H_Turn_IP_180L'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Orc_Combat_TIPR180 : UTurnOnSpotAssetConfig_Orc
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Movement/Turn/A_OrcM_S1H_Turn_IP_180R.A_OrcM_S1H_Turn_IP_180R'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.0;
}

UCLASS()
class UTurnOnSpotConfig_Orc_Combat : UTurnOnSpotConfig
{
   default m_TIPL90 = UTurnOnSpotAssetConfig_Orc_Combat_TIPL90::StaticClass();
   default m_TIPR90 = UTurnOnSpotAssetConfig_Orc_Combat_TIPR90::StaticClass();
   default m_TIPL180 = UTurnOnSpotAssetConfig_Orc_Combat_TIPL180::StaticClass();
   default m_TIPR180 = UTurnOnSpotAssetConfig_Orc_Combat_TIPR180::StaticClass();
}

UCLASS()
class UTurnsData_Orc_Combat : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Orc_Combat::StaticClass();

    // Pivots
	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Movement/Turn/A_OrcM_S1H_TurnWalk180L.A_OrcM_S1H_TurnWalk180L'";
	default m_WalkPivots.Pivot180L.StartTime = 0.26f;
	default m_WalkPivots.Pivot180L.BlendOut = 0.4f;
	default m_WalkPivots.Pivot180L.PlayRate = 1.0f;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Movement/Turn/A_OrcM_S1H_TurnWalk180R.A_OrcM_S1H_TurnWalk180R'";
	default m_WalkPivots.Pivot180R.StartTime = 0.92f;
	default m_WalkPivots.Pivot180R.BlendOut = 0.4f;
	default m_WalkPivots.Pivot180R.PlayRate = 1.2f;
	
	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Movement/Turn/A_OrcM_S1H_TurnWalk180L.A_OrcM_S1H_TurnWalk180L'";
	default m_RunPivots.Pivot180L.StartTime = 0.26f;
	default m_RunPivots.Pivot180L.BlendOut = 0.4f;
	default m_RunPivots.Pivot180L.PlayRate = 1.2f;
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Movement/Turn/A_OrcM_S1H_TurnWalk180R.A_OrcM_S1H_TurnWalk180R'";
	default m_RunPivots.Pivot180R.StartTime = 0.92f;
	default m_RunPivots.Pivot180R.BlendOut = 0.4f;
	default m_RunPivots.Pivot180R.PlayRate = 1.4f;

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);

	// Start Moving
	FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Movement/Starts/A_OrcM_S1H_StarTurn90L.A_OrcM_S1H_StarTurn90L'";
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Movement/Starts/A_OrcM_S1H_StarTurn90R.A_OrcM_S1H_StarTurn90R'";
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Movement/Starts/A_OrcM_S1H_StarTurn180L.A_OrcM_S1H_StarTurn180L'";
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Movement/Starts/A_OrcM_S1H_StarTurn180R.A_OrcM_S1H_StarTurn180R'";

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_WalkStarts);	
}