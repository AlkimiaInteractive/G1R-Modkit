UCLASS()
class UClimbingAnimConfig_Human_Reach: UClimbingAnimConfig
{
	FClimbingMontages ClimbingAction;
	default ClimbingAction.m_LeftMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/Climbing/Reach/A_Man_N_Reach_Montage.A_Man_N_Reach_Montage'";
	default ClimbingAction.m_PositionCorrectionCurve = n"CurveVector'/Game/AnimLibrary/Data/Curves/MantleCurves/Mantle_2m.Mantle_2m'";
	
	default AddMontage(ClimbingAction);
	default m_PlayRate = 1;
	default m_AnimStartingOffset = FVector(0.0, 0.0, 0.0);
	default m_MinHeight = 100.0;
	default m_MaxHeight = 500.0;
	default m_NextStepRequestWindowStart = 0.0;
	default m_NextStepRequestWindowSize = 0.0;
	default m_RelativeMovement = false;
		
	default m_ClimbingType = EClimbType::High;
};

UCLASS()
class UClimbingAnimConfig_Human_Vault: UClimbingAnimConfig
{
	FClimbingMontages ClimbingAction;
	default ClimbingAction.m_LeftMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/Climbing/Vault/A_Man_N_Vault_L_Montage.A_Man_N_Vault_L_Montage'";
	default ClimbingAction.m_RightMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/Climbing/Vault/A_Man_N_Vault_R_Montage.A_Man_N_Vault_R_Montage'";
	default ClimbingAction.m_PositionCorrectionCurve = n"CurveVector'/Game/AnimLibrary/Data/Curves/MantleCurves/Mantle_1m.Mantle_1m'";
	
	default AddMontage(ClimbingAction, EWalkSpeed::Walking, true);
	default m_PlayRate = 1;
	default m_AnimStartingOffset = FVector(0.0, 0.0, 0.0);
	default m_MinHeight = 100.0;
	default m_MaxHeight = 160.0;
	default m_NextStepRequestWindowStart = 0.0;
	default m_NextStepRequestWindowSize = 0.0;
	default m_RelativeMovement = true;
	
	default m_ClimbingType = EClimbType::Mid;
};

UCLASS()
class UClimbingAnimConfig_Human_StepUp: UClimbingAnimConfig
{
	FClimbingMontages StepUpWalk;
	default StepUpWalk.m_LeftMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/Climbing/StepUp/Man_N_Run_StepUp_Up_L_Montage.Man_N_Run_StepUp_Up_L_Montage'";
	default StepUpWalk.m_RightMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/Climbing/StepUp/Man_N_Run_StepUp_Up_R_Montage.Man_N_Run_StepUp_Up_R_Montage'";
	
	FClimbingMontages StepUpRun;
	default StepUpRun.m_LeftMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/Climbing/StepUp/Man_N_Run_StepUp_Up_L_Montage.Man_N_Run_StepUp_Up_L_Montage'";
	default StepUpRun.m_RightMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/Climbing/StepUp/Man_N_Run_StepUp_Up_R_Montage.Man_N_Run_StepUp_Up_R_Montage'";

	default AddMontage(StepUpWalk, EWalkSpeed::Walking, true);
	default AddMontage(StepUpRun, EWalkSpeed::Running, true);
	default m_PlayRate = 1.0;
	default m_AnimStartingOffset = FVector(0.0, 0.0, 0.0);
	default m_MinHeight = 20.0;
	default m_MaxHeight = 100.0;
	default m_NextStepRequestWindowStart = 0.0;
	default m_NextStepRequestWindowSize = 0.0;
	default m_RelativeMovement = true;
	
	default m_ClimbingType = EClimbType::Low;
};

UCLASS()
class UClimbingAnimConfig_Human_OverFence: UClimbingAnimConfig
{
	FClimbingMontages OverFence;
	default OverFence.m_LeftMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/Climbing/OverFence/A_Man_HighOverFence_L_Montage.A_Man_HighOverFence_L_Montage'";
	default OverFence.m_RightMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/Climbing/OverFence/A_Man_HighOverFence_L_Montage.A_Man_HighOverFence_L_Montage'";


	default AddMontage(OverFence);
	default m_PlayRate = 1.0;
	default m_AnimStartingOffset = FVector(0.0, 00.0, 0.0);
	default m_MinHeight = 70.0;
	default m_MaxHeight = 125.0;
	default m_NextStepRequestWindowStart = 0.0;
	default m_NextStepRequestWindowSize = 0.0;
	default m_RelativeMovement = false;
	default m_MovementState = EMovementState::Traversing;
	
	default m_ClimbingType = EClimbType::Fence;
};

UCLASS()
class UClimbingAnimConfig_Human_OverFence_High: UClimbingAnimConfig
{
	FClimbingMontages OverFence;
	default OverFence.m_LeftMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/Climbing/OverFence/A_Man_OverFence_L_Montage.A_Man_OverFence_L_Montage'";
	default OverFence.m_RightMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/Climbing/OverFence/A_Man_OverFence_L_Montage.A_Man_OverFence_L_Montage'";


	default AddMontage(OverFence);
	default m_PlayRate = 1.0;
	default m_AnimStartingOffset = FVector(0.0, 00.0, 0.0);
	default m_MinHeight = 70.0;
	default m_MaxHeight = 175.0;
	default m_NextStepRequestWindowStart = 0.0;
	default m_NextStepRequestWindowSize = 0.0;
	default m_RelativeMovement = false;
	default m_MovementState = EMovementState::Traversing;
	
	default m_ClimbingType = EClimbType::HighFence;
};

UCLASS()
class UClimbingAnimConfig_Human_FallingLow: UClimbingAnimConfig
{
	FClimbingMontages ClimbingAction;
	default ClimbingAction.m_LeftMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/Climbing/Vault/A_Man_N_Vault_Falling_L_Montage.A_Man_N_Vault_Falling_L_Montage'";
	default ClimbingAction.m_RightMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/Climbing/Vault/A_Man_N_Vault_Falling_L_Montage.A_Man_N_Vault_Falling_L_Montage'";
	
	default AddMontage(ClimbingAction, EWalkSpeed::Walking, true);
	default m_PlayRate = 1;
	default m_AnimStartingOffset = FVector(0.0, 40, 0.0);
	default m_MinHeight = -80.0;
	default m_MaxHeight = -10.0;
	default m_NextStepRequestWindowStart = 0.0;
	default m_NextStepRequestWindowSize = 0.0;
	default m_RelativeMovement = true;
	
	default m_ClimbingType = EClimbType::FallingLow;
};

UCLASS()
class UClimbingAnimConfig_Human_FallingHigh: UClimbingAnimConfig
{
	FClimbingMontages Falling;
	default Falling.m_LeftMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/Climbing/Reach/A_Man_N_ReachFalling_Montage.A_Man_N_ReachFalling_Montage'";
	default Falling.m_RightMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/Climbing/Reach/A_Man_N_ReachFalling_Montage.A_Man_N_ReachFalling_Montage'";
	default Falling.m_PositionCorrectionCurve = n"CurveVector'/Game/AnimLibrary/Data/Curves/MantleCurves/Mantle_2m.Mantle_2m'";
	
	default AddMontage(Falling);

	default m_PlayRate = 1;
	default m_AnimStartingOffset = FVector(0.0, 0.0, 0.0);
	default m_MinHeight = 30.0;
	default m_MaxHeight = 230.0;
	default m_NextStepRequestWindowStart = 0.0;
	default m_NextStepRequestWindowSize = 0.0;
	default m_RelativeMovement = false;
	
	default m_ClimbingType = EClimbType::FallingHigh;
};

UCLASS()
class UClimbingAnimConfig_Human_FallingImpact: UClimbingAnimConfig
{
	FClimbingMontages Falling;
	default Falling.m_LeftMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/Climbing/Reach/A_Man_N_ReachFallingImpact_Montage.A_Man_N_ReachFallingImpact_Montage'";
	
	default AddMontage(Falling);

	default m_PlayRate = 1;
	default m_AnimStartingOffset = FVector(0.0, 0.0, 115.0);
	default m_MaxHeight = 20.0;
	default m_NextStepRequestWindowStart = 0.0;
	default m_NextStepRequestWindowSize = 0.0;
	default m_RelativeMovement = false;
	
	default m_ClimbingType = EClimbType::FallingImpact;
};

UCLASS()
class UClimbingAnimConfig_Human_Water: UClimbingAnimConfig
{
	FClimbingMontages Water;
	default Water.m_LeftMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/Climbing/Reach/A_Man_N_Reach_Montage.A_Man_N_Reach_Montage'";
	default Water.m_PositionCorrectionCurve = n"CurveVector'/Game/AnimLibrary/Data/Curves/MantleCurves/Mantle_2m.Mantle_2m'";
	
	default AddMontage(Water);
	default m_PlayRate = 1.2;
	default m_AnimStartingOffset = FVector(0.0, 0.0, 0.0);
	default m_MinHeight = 125.0;
	default m_MaxHeight = 250.0;
	default m_NextStepRequestWindowStart = 0.0;
	default m_NextStepRequestWindowSize = 0.0;
	default m_RelativeMovement = false;

	default m_ClimbingType = EClimbType::WaterLow;
};

UCLASS()
class UClimbingAnimConfig_Human_WaterLow: UClimbingAnimConfig
{
	FClimbingMontages Water;
	default Water.m_LeftMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/Climbing/Vault/A_Man_N_Vault_L_Montage.A_Man_N_Vault_L_Montage'";
	default Water.m_PositionCorrectionCurve = n"CurveVector'/Game/AnimLibrary/Data/Curves/MantleCurves/Mantle_1m.Mantle_1m'";
	
	default AddMontage(Water);
	default m_PlayRate = 1;
	default m_AnimStartingOffset = FVector(0.0, 0.0, 0.0);
	default m_MinHeight = 70.0;
	default m_MaxHeight = 250.0;
	default m_NextStepRequestWindowStart = 0.0;
	default m_NextStepRequestWindowSize = 0.0;
	default m_RelativeMovement = false;

	default m_ClimbingType = EClimbType::WaterLow;
};

UCLASS()
class UClimbingAnimConfig_Human_StepDown: UClimbingAnimConfig
{
	FClimbingMontages StepDown;
	default StepDown.m_LeftMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/JumpDown/StepDown/Man_StepDown_R_Montage.Man_StepDown_R_Montage'";
	default StepDown.m_RightMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/JumpDown/StepDown/Man_StepDown_L_Montage.Man_StepDown_L_Montage'";
	
	default AddMontage(StepDown);
	default m_PlayRate = 1.0;

	default m_ClimbingType = EClimbType::StepDown;
};

UCLASS()
class UClimbingAnimConfig_Human_JumpGap: UClimbingAnimConfig
{
	FClimbingMontages JumpGap;
	default JumpGap.m_LeftMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Traversal/Climbing/JumpGap/A_Man_N_JumpGap_L_Montage.A_Man_N_JumpGap_L_Montage'";
	
	default AddMontage(JumpGap);
	default m_PlayRate = 1.0;

	default m_ClimbingType = EClimbType::JumpGap;
};

UCLASS()
class UClimbingConfig_Human: UClimbingConfig
{
	default AddClimbingAction(EClimbType::High, UClimbingAnimConfig_Human_Reach::StaticClass());
	default AddClimbingAction(EClimbType::Mid, UClimbingAnimConfig_Human_Vault::StaticClass());
	default AddClimbingAction(EClimbType::Low, UClimbingAnimConfig_Human_StepUp::StaticClass());
	default AddClimbingAction(EClimbType::FallingLow, UClimbingAnimConfig_Human_FallingLow::StaticClass());
	default AddClimbingAction(EClimbType::FallingHigh, UClimbingAnimConfig_Human_FallingHigh::StaticClass());
	default AddClimbingAction(EClimbType::FallingImpact, UClimbingAnimConfig_Human_FallingImpact::StaticClass());
	default AddClimbingAction(EClimbType::Water, UClimbingAnimConfig_Human_Water::StaticClass());
	default AddClimbingAction(EClimbType::WaterLow, UClimbingAnimConfig_Human_WaterLow::StaticClass());
	default AddClimbingAction(EClimbType::Fence, UClimbingAnimConfig_Human_OverFence::StaticClass());
	default AddClimbingAction(EClimbType::HighFence, UClimbingAnimConfig_Human_OverFence_High::StaticClass());
	default AddClimbingAction(EClimbType::StepDown, UClimbingAnimConfig_Human_StepDown::StaticClass());
	default AddClimbingAction(EClimbType::JumpGap, UClimbingAnimConfig_Human_JumpGap::StaticClass());

	default m_PositionCorrectionBlendCurve = n"CurveFloat'/Game/AnimLibrary/Data/Curves/MantleCurves/Mantle_Timeline.Mantle_Timeline'";

	default m_GroundSearchEdgeSettings.m_MaxAutoClimbHeight = 150;
	default m_GroundSearchEdgeSettings.m_MaxEdgeHeight = 350;
    default m_GroundSearchEdgeSettings.m_MinEdgeHeight = 30;
    default m_GroundSearchEdgeSettings.m_ReachDistance = 200;
    default m_GroundSearchEdgeSettings.m_ForwardTraceRadius = 30;
    default m_GroundSearchEdgeSettings.m_DownwardTraceRadius = 30;
    default m_GroundSearchEdgeSettings.m_MaxFenceWidth = 50;
	
    default m_AirSearchEdgeSettings.m_MaxEdgeHeight = 150;
    default m_AirSearchEdgeSettings.m_MinEdgeHeight = 10;
    default m_AirSearchEdgeSettings.m_ReachDistance = 70;
    default m_AirSearchEdgeSettings.m_ForwardTraceRadius = 30;
    default m_AirSearchEdgeSettings.m_DownwardTraceRadius = 30;

	default m_SwimmingSearchEdgeSettings.m_MaxAutoClimbHeight = 150;
    default m_SwimmingSearchEdgeSettings.m_MaxEdgeHeight = 250;
    default m_SwimmingSearchEdgeSettings.m_MinEdgeHeight = 0;
    default m_SwimmingSearchEdgeSettings.m_ReachDistance = 50;
    default m_SwimmingSearchEdgeSettings.m_ForwardTraceRadius = 30;
    default m_SwimmingSearchEdgeSettings.m_DownwardTraceRadius = 30;

	default m_GroundJumpDownSearchSettings.m_StartForwardOffset = 20;
	default m_GroundJumpDownSearchSettings.m_MaxJumpDownHeight = 450;
	default m_GroundJumpDownSearchSettings.m_MinJumpDownHeight = 100;

    default m_CheckCapsuleStartTraceOffset = 0;
    default m_CheckSphereEndTraceOffset = 0;
    default m_limitClimbingAngle = 0.3;
    
    default m_MaxClimbableUnderWaterDepth = -95.0;
    default m_UnderWaterMidClimbHeight = 90;
};
