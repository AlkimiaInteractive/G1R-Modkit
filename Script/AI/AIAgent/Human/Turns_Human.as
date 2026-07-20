UCLASS()
class UTurnOnSpotAssetConfig_Human : UTurnOnSpotAssetConfig
{
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = true;
	default m_SlotName = n"(N) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPL30 : UTurnOnSpotAssetConfig_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Turn/A_Man_NPC_Turn90Left.A_Man_NPC_Turn90Left'";
	default m_AnimatedAngle = -30;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPR30 : UTurnOnSpotAssetConfig_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Turn/A_Man_NPC_Turn90Right.A_Man_NPC_Turn90Right'";
	default m_AnimatedAngle = 30;
	default m_PlayRate = 1.0;
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPL90 : UTurnOnSpotAssetConfig_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Turn/A_Man_NPC_Turn90Left.A_Man_NPC_Turn90Left'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.5;
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPR90 : UTurnOnSpotAssetConfig_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Turn/A_Man_NPC_Turn90Right.A_Man_NPC_Turn90Right'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.5;
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPL180 : UTurnOnSpotAssetConfig_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Turn/A_Man_NPC_Turn180Left.A_Man_NPC_Turn180Left'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.5;
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPR180 : UTurnOnSpotAssetConfig_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement_NPC/Grounded/N/Turn/A_Man_NPC_Turn180Right.A_Man_NPC_Turn180Right'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.5;
}

///
//CROUCH
///

UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPCL90 : UTurnOnSpotAssetConfig_Human
{
	default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/C/Turn/ALS_CLF_TurnIP_L90_NLH.ALS_CLF_TurnIP_L90_NLH'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = false;
	default m_SlotName = n"(CLF) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPCR90 : UTurnOnSpotAssetConfig_Human
{
	default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/C/Turn/ALS_CLF_TurnIP_R90_NLH.ALS_CLF_TurnIP_R90_NLH'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = false;
	default m_SlotName = n"(CLF) Turn/Rotate";
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPCL180 : UTurnOnSpotAssetConfig_Human
{
	default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/C/Turn/ALS_CLF_TurnIP_L180.ALS_CLF_TurnIP_L180'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = false;
	default m_SlotName = n"(CLF) Turn/Rotate";
}
UCLASS()
class UTurnOnSpotAssetConfig_Human_TIPCR180 : UTurnOnSpotAssetConfig_Human
{
	default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/C/Turn/ALS_CLF_TurnIP_R180.ALS_CLF_TurnIP_R180'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.0;
	default m_ScaleTurnAngle = false;
	default m_SlotName = n"(CLF) Turn/Rotate";
}

////////////--------------------------------------------------------------
////////////---------------PLAYER--------------------
////////////--------------------------------------------------------------
UCLASS()
class UTurnOnSpotAssetConfig_Player_TIPL30 : UTurnOnSpotAssetConfig_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/N/Turn/A_Man_MM_N_TurnInPlace30L.A_Man_MM_N_TurnInPlace30L'";
	default m_AnimatedAngle = -30;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Player_TIPR30 : UTurnOnSpotAssetConfig_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/N/Turn/A_Man_MM_N_TurnInPlace30R.A_Man_MM_N_TurnInPlace30R'";
	default m_AnimatedAngle = 30;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Player_TIPL90 : UTurnOnSpotAssetConfig_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/N/Turn/A_Man_MM_N_TurnInPlace90L.A_Man_MM_N_TurnInPlace90L'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Player_TIPR90 : UTurnOnSpotAssetConfig_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/N/Turn/A_Man_MM_N_TurnInPlace90R.A_Man_MM_N_TurnInPlace90R'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.2;
}
UCLASS()
class UTurnOnSpotAssetConfig_Player_TIPL180 : UTurnOnSpotAssetConfig_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/N/Turn/A_Man_MM_N_TurnInPlace180L.A_Man_MM_N_TurnInPlace180L'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.25;
}
UCLASS()
class UTurnOnSpotAssetConfig_Player_TIPR180 : UTurnOnSpotAssetConfig_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Movement/Grounded/N/Turn/A_Man_MM_N_TurnInPlace180R.A_Man_MM_N_TurnInPlace180R'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.25;
}

///
//CROUCH
///
UCLASS()
class UTurnOnSpotAssetConfig_Player_TIPCL30 : UTurnOnSpotAssetConfig_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/TurnInPlace/A_Man_MM_STL_TurnIP_30_L.A_Man_MM_STL_TurnIP_30_L'";
	default m_AnimatedAngle = -30;
	default m_SlotName = n"(CLF) Turn/Rotate";
}
UCLASS()
class UTurnOnSpotAssetConfig_Player_TIPCR30 : UTurnOnSpotAssetConfig_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/TurnInPlace/A_Man_MM_STL_TurnIP_30_R.A_Man_MM_STL_TurnIP_30_R'";
	default m_AnimatedAngle = 30;
	default m_SlotName = n"(CLF) Turn/Rotate";
}
UCLASS()
class UTurnOnSpotAssetConfig_Player_TIPCL90 : UTurnOnSpotAssetConfig_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/TurnInPlace/A_Man_MM_STL_TurnIP_90_L.A_Man_MM_STL_TurnIP_90_L'";
	default m_AnimatedAngle = -90;
	default m_PlayRate = 1.35f;
	default m_SlotName = n"(CLF) Turn/Rotate";
}
UCLASS()
class UTurnOnSpotAssetConfig_Player_TIPCR90 : UTurnOnSpotAssetConfig_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/TurnInPlace/A_Man_MM_STL_TurnIP_90_R.A_Man_MM_STL_TurnIP_90_R'";
	default m_AnimatedAngle = 90;
	default m_PlayRate = 1.35f;
	default m_SlotName = n"(CLF) Turn/Rotate";
}
UCLASS()
class UTurnOnSpotAssetConfig_Player_TIPCL180 : UTurnOnSpotAssetConfig_Human
{
    default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/TurnInPlace/A_Man_MM_STL_TurnIP_180_L.A_Man_MM_STL_TurnIP_180_L'";
	default m_AnimatedAngle = -180;
	default m_PlayRate = 1.35f;
	default m_SlotName = n"(CLF) Turn/Rotate";
}
UCLASS()
class UTurnOnSpotAssetConfig_Player_TIPCR180 : UTurnOnSpotAssetConfig_Human
{
	default m_Animation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/TurnInPlace/A_Man_MM_STL_TurnIP_180_R.A_Man_MM_STL_TurnIP_180_R'";
	default m_AnimatedAngle = 180;
	default m_PlayRate = 1.35f;
	default m_SlotName = n"(CLF) Turn/Rotate";
}

UCLASS()
class UTurnOnSpotConfig_Human : UTurnOnSpotConfig
{
   default m_TIPL30 = UTurnOnSpotAssetConfig_Human_TIPL30::StaticClass();
   default m_TIPR30 = UTurnOnSpotAssetConfig_Human_TIPR30::StaticClass();
   default m_TIPL90 = UTurnOnSpotAssetConfig_Human_TIPL90::StaticClass();
   default m_TIPR90 = UTurnOnSpotAssetConfig_Human_TIPR90::StaticClass();
   default m_TIPL180 = UTurnOnSpotAssetConfig_Human_TIPL180::StaticClass();
   default m_TIPR180 = UTurnOnSpotAssetConfig_Human_TIPR180::StaticClass(); 
   
   default m_TIPCL90 = UTurnOnSpotAssetConfig_Human_TIPCL90::StaticClass();
   default m_TIPCR90 = UTurnOnSpotAssetConfig_Human_TIPCR90::StaticClass();
   default m_TIPCL180 = UTurnOnSpotAssetConfig_Human_TIPCL180::StaticClass();
   default m_TIPCR180 = UTurnOnSpotAssetConfig_Human_TIPCR180::StaticClass(); 
}

UCLASS()
class UTurnOnSpotConfig_Player : UTurnOnSpotConfig_Human
{
   default m_TIPL30 = UTurnOnSpotAssetConfig_Player_TIPL30::StaticClass();
   default m_TIPR30 = UTurnOnSpotAssetConfig_Player_TIPR30::StaticClass();
   default m_TIPL90 = UTurnOnSpotAssetConfig_Player_TIPL90::StaticClass();
   default m_TIPR90 = UTurnOnSpotAssetConfig_Player_TIPR90::StaticClass();
   default m_TIPL180 = UTurnOnSpotAssetConfig_Player_TIPL180::StaticClass();
   default m_TIPR180 = UTurnOnSpotAssetConfig_Player_TIPR180::StaticClass();
   
   default m_TIPCL30 = UTurnOnSpotAssetConfig_Player_TIPCL30::StaticClass();
   default m_TIPCR30 = UTurnOnSpotAssetConfig_Player_TIPCR30::StaticClass();
   default m_TIPCL90 = UTurnOnSpotAssetConfig_Player_TIPCL90::StaticClass();
   default m_TIPCR90 = UTurnOnSpotAssetConfig_Player_TIPCR90::StaticClass();
   default m_TIPCL180 = UTurnOnSpotAssetConfig_Player_TIPCL180::StaticClass();
   default m_TIPCR180 = UTurnOnSpotAssetConfig_Player_TIPCR180::StaticClass(); 
}

UCLASS()
class UTurnsData_Default_Human : UTurnsData
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Player::StaticClass();

    // Pivots
	FTurnDirections m_WalkPivots;
	default m_WalkPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Walk/Plants_180/A_Man_MM_N_Walk_Plants_180_03.A_Man_MM_N_Walk_Plants_180_03'";
	default m_WalkPivots.Pivot180L.StartTime = 0.18f;
	default m_WalkPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Walk/Plants_180/A_Man_MM_N_Walk_Plants_180_04.A_Man_MM_N_Walk_Plants_180_04'";
	default m_WalkPivots.Pivot180L.StartTime = 0.1f;

	FTurnDirections m_RunPivots;
	default m_RunPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Run/Plants_180/A_Man_MM_N_Run_Plants_180_01.A_Man_MM_N_Run_Plants_180_01'";
	default m_RunPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Run/Plants_180/A_Man_MM_N_Run_Plants_180_03.A_Man_MM_N_Run_Plants_180_03'";

	FTurnDirections m_SprintPivots;
	default m_SprintPivots.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Sprint/Plants_180/A_Man_MM_N_Sprint_Plants_180_01.A_Man_MM_N_Sprint_Plants_180_01'";
	default m_SprintPivots.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Sprint/Plants_180/A_Man_MM_N_Sprint_Plants_180_03.A_Man_MM_N_Sprint_Plants_180_03'";

	default m_Pivots.Add(EWalkSpeed::Walking, m_WalkPivots);
	default m_Pivots.Add(EWalkSpeed::Running, m_RunPivots);
	default m_Pivots.Add(EWalkSpeed::Sprinting, m_RunPivots);

	// Start Moving
	FStartTurnDirections m_WalkStarts;
	default m_WalkStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Walk/Start_Turns/A_Man_MM_N_Walk_StartTurns_180_L.A_Man_MM_N_Walk_StartTurns_180_L'";
	default m_WalkStarts.Pivot180L.PlayRate = 1.2f;
	default m_WalkStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Walk/Start_Turns/A_Man_MM_N_Walk_StartTurns_180_L.A_Man_MM_N_Walk_StartTurns_180_L'";
	default m_WalkStarts.Pivot180R.PlayRate = 1.2f;
	default m_WalkStarts.Pivot135L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Walk/Start_Turns/A_Man_MM_N_Walk_StartTurns_135_L.A_Man_MM_N_Walk_StartTurns_135_L'";
	default m_WalkStarts.Pivot135L.PlayRate = 1.2f;
	default m_WalkStarts.Pivot135R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Walk/Start_Turns/A_Man_MM_N_Walk_StartTurns_135_R.A_Man_MM_N_Walk_StartTurns_135_R'";
	default m_WalkStarts.Pivot135R.PlayRate = 1.2f;
	default m_WalkStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Walk/Start_Turns/A_Man_MM_N_Walk_StartTurns_90_L.A_Man_MM_N_Walk_StartTurns_90_L'";
	default m_WalkStarts.Pivot90L.PlayRate = 1.2f;
	default m_WalkStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Walk/Start_Turns/A_Man_MM_N_Walk_StartTurns_90_R.A_Man_MM_N_Walk_StartTurns_90_R'";
	default m_WalkStarts.Pivot90R.PlayRate = 1.2f;
	FStartTurnDirections m_RunStarts;
	default m_RunStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Run/StartTurns/A_Man_MM_N_Run_StartTurns_180_L.A_Man_MM_N_Run_StartTurns_180_L'";
	default m_RunStarts.Pivot180L.StartTime = 0.0f;
	default m_RunStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Run/StartTurns/A_Man_MM_N_Run_StartTurns_180_R.A_Man_MM_N_Run_StartTurns_180_R'";
	default m_RunStarts.Pivot180R.StartTime = 0.0f;
	default m_RunStarts.Pivot135L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Run/StartTurns/A_Man_MM_N_Run_StartTurns_135_L.A_Man_MM_N_Run_StartTurns_135_L'";
	default m_RunStarts.Pivot135R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Run/StartTurns/A_Man_MM_N_Run_StartTurns_135_R.A_Man_MM_N_Run_StartTurns_135_R'";
	default m_RunStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Run/StartTurns/A_Man_MM_N_Run_StartTurns_90_L.A_Man_MM_N_Run_StartTurns_90_L'";
	default m_RunStarts.Pivot90L.StartTime = 0.2f;
	default m_RunStarts.Pivot90L.PlayRate = 1.0f;
	default m_RunStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Run/StartTurns/A_Man_MM_N_Run_StartTurns_90_R.A_Man_MM_N_Run_StartTurns_90_R'";
	default m_RunStarts.Pivot90R.StartTime = 0.2f;
	default m_RunStarts.Pivot90R.PlayRate = 1.0f;
	FStartTurnDirections m_SprintStarts;
	default m_SprintStarts.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Sprint/StartTurns/A_Man_MM_N_Sprint_StartTurns_180_L.A_Man_MM_N_Sprint_StartTurns_180_L'";
	default m_SprintStarts.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Sprint/StartTurns/A_Man_MM_N_Sprint_StartTurns_180_R.A_Man_MM_N_Sprint_StartTurns_180_R'";
	default m_SprintStarts.Pivot135L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Sprint/StartTurns/A_Man_MM_N_Sprint_StartTurns_135_L.A_Man_MM_N_Sprint_StartTurns_135_L'";
	default m_SprintStarts.Pivot135R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Sprint/StartTurns/A_Man_MM_N_Sprint_StartTurns_135_R.A_Man_MM_N_Sprint_StartTurns_135_R'";
	default m_SprintStarts.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Sprint/StartTurns/A_Man_MM_N_Sprint_StartTurns_90_L.A_Man_MM_N_Sprint_StartTurns_90_L'";
	default m_SprintStarts.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Sprint/StartTurns/A_Man_MM_N_Sprint_StartTurns_90_R.A_Man_MM_N_Sprint_StartTurns_90_R'";

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStarts);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStarts);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_SprintStarts);

	FQuickStops m_WalkStops;
	default m_WalkStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Walk/Stops/A_Man_MM_N_Walk_Stop_LeftFoot_01.A_Man_MM_N_Walk_Stop_LeftFoot_01'";
	default m_WalkStops.QuickStopL.BlendIn = 0.6f;
	default m_WalkStops.QuickStopL.BlendOut = 0.2f;
	default m_WalkStops.QuickStopL.StartTime = 0.2f;
	default m_WalkStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Walk/Stops/A_Man_MM_N_Walk_Stop_RightFoot_01.A_Man_MM_N_Walk_Stop_RightFoot_01'";
	default m_WalkStops.QuickStopR.BlendIn = 0.6f;
	default m_WalkStops.QuickStopR.BlendOut = 0.4f;
	default m_WalkStops.QuickStopR.StartTime = 0.0f;
	FQuickStops m_RunStops;
	default m_RunStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Run/Stops/A_Man_MM_N_Run_Stop_RightFoot.A_Man_MM_N_Run_Stop_RightFoot'";
	default m_RunStops.QuickStopL.BlendIn = 0.2f;
	default m_RunStops.QuickStopL.BlendOut = 0.2f;
	default m_RunStops.QuickStopL.StartTime = 0.15f;
	default m_RunStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Run/Stops/A_Man_MM_N_Run_Stop_RightFoot.A_Man_MM_N_Run_Stop_RightFoot'";
	default m_RunStops.QuickStopR.BlendIn = 0.2f;
	default m_RunStops.QuickStopR.BlendOut = 0.2f;
	default m_RunStops.QuickStopR.StartTime = 0.0f;
	FQuickStops m_SprintStops;
	default m_SprintStops.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Sprint/Stops/A_Man_MM_N_Sprint_Stop_LeftFoot.A_Man_MM_N_Sprint_Stop_LeftFoot'";
	default m_SprintStops.QuickStopL.BlendIn = 0.2f;
	default m_SprintStops.QuickStopL.BlendOut = 0.2f;
	default m_SprintStops.QuickStopL.StartTime = 0.6f;
	default m_SprintStops.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Locomotion/MM_05_05_2023/Sprint/Stops/A_Man_MM_N_Sprint_Stop_LeftFoot.A_Man_MM_N_Sprint_Stop_LeftFoot'";
	default m_SprintStops.QuickStopR.BlendIn = 0.2f;
	default m_SprintStops.QuickStopR.BlendOut = 0.2f;
	default m_SprintStops.QuickStopR.StartTime = 0.6f;
	default m_QuickStops.Add(EWalkSpeed::Walking, m_WalkStops);
	default m_QuickStops.Add(EWalkSpeed::Running, m_RunStops);
	default m_QuickStops.Add(EWalkSpeed::Sprinting, m_SprintStops);

	//-------------------------------
	//	CROUCH
	//-------------------------------

	//Pivots
	FTurnDirections m_RunPivotsCrouch;
	default m_RunPivotsCrouch.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/Plants/A_Man_MM_STL_Run_Plant_180L.A_Man_MM_STL_Run_Plant_180L'";
	default m_RunPivotsCrouch.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/Plants/A_Man_MM_STL_Run_Plant_180R.A_Man_MM_STL_Run_Plant_180R'";

	default m_PivotsCrouch.Add(EWalkSpeed::Walking, m_RunPivotsCrouch);
	default m_PivotsCrouch.Add(EWalkSpeed::Running, m_RunPivotsCrouch);

	// Start Moving
	FStartTurnDirections m_RunStartsCrouch;
	default m_RunStartsCrouch.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/StartTurns/A_Man_MM_STL_Run_StartTurns_90_L.A_Man_MM_STL_Run_StartTurns_90_L'";
	default m_RunStartsCrouch.Pivot90L.StartTime = 0.15f;
	default m_RunStartsCrouch.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/StartTurns/A_Man_MM_STL_Run_StartTurns_90_R.A_Man_MM_STL_Run_StartTurns_90_R'";
	default m_RunStartsCrouch.Pivot90R.StartTime = 0.15f;
	default m_RunStartsCrouch.Pivot90R.BlendIn = 0.3f;
	//default m_RunStartsCrouch.Pivot135L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/StartTurns/A_Man_MM_STL_Run_StartTurns_135_L.A_Man_MM_STL_Run_StartTurns_135_L'";
	//default m_RunStartsCrouch.Pivot135R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/StartTurns/A_Man_MM_STL_Run_StartTurns_135_R.A_Man_MM_STL_Run_StartTurns_135_R'";
	default m_RunStartsCrouch.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/StartTurns/A_Man_MM_STL_Run_StartTurns_180_L.A_Man_MM_STL_Run_StartTurns_180_L'";
	default m_RunStartsCrouch.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/StartTurns/A_Man_MM_STL_Run_StartTurns_180_R.A_Man_MM_STL_Run_StartTurns_180_R'";

	default m_StartsCrouch.Add(EWalkSpeed::Walking, m_RunStartsCrouch);
	default m_StartsCrouch.Add(EWalkSpeed::Running, m_RunStartsCrouch);
	
	FQuickStops m_RunStopsCrouch;
	default m_RunStopsCrouch.QuickStopL.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/Stops/A_Man_MM_STL_Run_Stop_R.A_Man_MM_STL_Run_Stop_R'";
	default m_RunStopsCrouch.QuickStopR.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/MotionMatching/Stealth/STL240115/Stops/A_Man_MM_STL_Run_Stop_L.A_Man_MM_STL_Run_Stop_L'";
	default m_RunStopsCrouch.QuickStopL.BlendIn = 0.5f;
	default m_RunStopsCrouch.QuickStopR.BlendIn = 0.5f;
	default m_RunStopsCrouch.QuickStopL.BlendOut = 0.5f;
	default m_RunStopsCrouch.QuickStopR.BlendOut = 0.5f;

	default m_QuickStopsCrouch.Add(EWalkSpeed::Walking, m_RunStopsCrouch);
	default m_QuickStopsCrouch.Add(EWalkSpeed::Running, m_RunStopsCrouch);
}

UCLASS()
class UTurnsData_Default_Player : UTurnsData_Default_Human
{
    // Turn in place
    default m_TurnOnSpotConfig = UTurnOnSpotConfig_Player::StaticClass();
}

UCLASS()
class UTurnsData_Default_Human_Woman : UTurnsData_Default_Human
{
    
	// Start Moving
	FStartTurnDirections m_WalkStart;
	default m_WalkStart.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Women/Movement/Grounded/N/Start/A_Woman_WalkFwdStart_L180.A_Woman_WalkFwdStart_L180'";
	default m_WalkStart.Pivot180L.PlayRate = 1.2f;
	default m_WalkStart.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Women/Movement/Grounded/N/Start/A_Woman_WalkFwdStart_R180.A_Woman_WalkFwdStart_R180'";
	default m_WalkStart.Pivot180R.PlayRate = 1.2f;
	default m_WalkStart.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Women/Movement/Grounded/N/Start/A_Woman_WalkFwdStart_L90.A_Woman_WalkFwdStart_L90'";
	default m_WalkStart.Pivot90L.PlayRate = 1.2f;
	default m_WalkStart.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Women/Movement/Grounded/N/Start/A_Woman_WalkFwdStart_R90.A_Woman_WalkFwdStart_R90'";
	default m_WalkStart.Pivot90R.PlayRate = 1.2f;
	FStartTurnDirections m_RunStart;
	default m_RunStart.Pivot180L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Women/Movement/Grounded/N/Start/A_Woman_RunFwdStart_L180.A_Woman_RunFwdStart_L180'";
	default m_RunStart.Pivot180L.StartTime = 0.0f;
	default m_RunStart.Pivot180R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Women/Movement/Grounded/N/Start/A_Woman_RunFwdStart_R180.A_Woman_RunFwdStart_R180'";
	default m_RunStart.Pivot180R.StartTime = 0.0f;
	default m_RunStart.Pivot90L.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Women/Movement/Grounded/N/Start/A_Woman_RunFwdStart_L90.A_Woman_RunFwdStart_L90'";
	default m_RunStart.Pivot90L.StartTime = 0.2f;
	default m_RunStart.Pivot90L.PlayRate = 1.0f;
	default m_RunStart.Pivot90R.Sequence = n"AnimSequence'/Game/AnimLibrary/Humanoid/Women/Movement/Grounded/N/Start/A_Woman_RunFwdStart_R90.A_Woman_RunFwdStart_R90'";
	default m_RunStart.Pivot90R.StartTime = 0.2f;
	default m_RunStart.Pivot90R.PlayRate = 1.0f;

	default m_Starts.Add(EWalkSpeed::Walking, m_WalkStart);
	default m_Starts.Add(EWalkSpeed::Running, m_RunStart);
	default m_Starts.Add(EWalkSpeed::Sprinting, m_RunStart);
}