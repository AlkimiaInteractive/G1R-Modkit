UCLASS()
class UClimbingAnimConfig_OrcM_Reach: UClimbingAnimConfig
{
	FClimbingMontages ClimbingAction;
	default ClimbingAction.m_LeftMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Traversal/A_OrcM_N_Reach_Montage.A_OrcM_N_Reach_Montage'";
	default ClimbingAction.m_PositionCorrectionCurve = n"CurveVector'/Game/AnimLibrary/Data/Curves/MantleCurves/Mantle_2m.Mantle_2m'";
	
	default AddMontage(ClimbingAction);
	default m_PlayRate = 1;
	default m_AnimStartingOffset = FVector(0.0, 0.0, 0.0);
	default m_MinHeight = 225.0;
	default m_MaxHeight = 450.0;
	default m_NextStepRequestWindowStart = 0.0;
	default m_NextStepRequestWindowSize = 0.0;
	default m_RelativeMovement = false;
		
	default m_ClimbingType = EClimbType::High;
};

UCLASS()
class UClimbingAnimConfig_OrcM_Vault: UClimbingAnimConfig
{
	FClimbingMontages ClimbingAction;
	default ClimbingAction.m_LeftMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Traversal/A_OrcM_N_Vault_L_Montage.A_OrcM_N_Vault_L_Montage'";
	default ClimbingAction.m_PositionCorrectionCurve = n"CurveVector'/Game/AnimLibrary/Data/Curves/MantleCurves/Mantle_1m.Mantle_1m'";
	
	default AddMontage(ClimbingAction);
	default m_PlayRate = 1;
	default m_AnimStartingOffset = FVector(0.0, 0, 0.0);
	default m_MinHeight = 100.0;
	default m_MaxHeight = 225.0;
	default m_NextStepRequestWindowStart = 0.0;
	default m_NextStepRequestWindowSize = 0.0;
	default m_RelativeMovement = true;
	
	default m_ClimbingType = EClimbType::Mid;
};

UCLASS()
class UClimbingAnimConfig_OrcM_StepUp: UClimbingAnimConfig
{
	FClimbingMontages StepUpRun;
	default StepUpRun.m_LeftMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Traversal/A_OrcM_N_Run_StepUp_L_Montage.A_OrcM_N_Run_StepUp_L_Montage'";
	default StepUpRun.m_RightMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Traversal/A_OrcM_N_Run_StepUp_R_Montage.A_OrcM_N_Run_StepUp_R_Montage'";
	default StepUpRun.m_PositionCorrectionCurve = n"CurveVector'/Game/AnimLibrary/Data/Curves/MantleCurves/Mantle_StepUp_Run_2.Mantle_StepUp_Run_2'";

	default AddMontage(StepUpRun);
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
class UClimbingAnimConfig_OrcM_Water: UClimbingAnimConfig
{
	FClimbingMontages Water;
	default Water.m_LeftMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Traversal/A_OrcM_N_Vault_L_Montage.A_OrcM_N_Vault_L_Montage'";
	default Water.m_PositionCorrectionCurve = n"CurveVector'/Game/AnimLibrary/Data/Curves/MantleCurves/Mantle_1m.Mantle_1m'";
	
	default AddMontage(Water);
	default m_PlayRate = 1.0;
	default m_AnimStartingOffset = FVector(0.0, 0, 0.0);
	default m_MinHeight = 0.0;
	default m_MaxHeight = 250.0;
	default m_NextStepRequestWindowStart = 0.0;
	default m_NextStepRequestWindowSize = 0.0;

	default m_ClimbingType = EClimbType::Water;
};

UCLASS()
class UClimbingAnimConfig_OrcM_StepDown: UClimbingAnimConfig
{
	FClimbingMontages StepDown;
	default StepDown.m_LeftMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Traversal/StepDown/OrcM_Stepdown_L_Montage.OrcM_Stepdown_L_Montage'";
	default StepDown.m_RightMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Traversal/StepDown/OrcM_Stepdown_R_Montage.OrcM_Stepdown_R_Montage'";
	
	default AddMontage(StepDown);
	default m_PlayRate = 1.0;

	default m_ClimbingType = EClimbType::StepDown;
};

UCLASS()
class UClimbingAnimConfig_OrcM_JumpGap: UClimbingAnimConfig
{
	FClimbingMontages JumpGap;
	default JumpGap.m_LeftMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Traversal/JumpGap/OrcM_JumpGap_Montage.OrcM_JumpGap_Montage'";
	
	default AddMontage(JumpGap);
	default m_PlayRate = 1.0;

	default m_ClimbingType = EClimbType::JumpGap;
};

UCLASS()
class UClimbingConfig_Orc: UClimbingConfig
{
	default AddClimbingAction(EClimbType::High, UClimbingAnimConfig_OrcM_Reach::StaticClass());
	default AddClimbingAction(EClimbType::Mid, UClimbingAnimConfig_OrcM_Vault::StaticClass());
	default AddClimbingAction(EClimbType::Low, UClimbingAnimConfig_OrcM_StepUp::StaticClass());
	default AddClimbingAction(EClimbType::Water, UClimbingAnimConfig_OrcM_Water::StaticClass());
	default AddClimbingAction(EClimbType::StepDown, UClimbingAnimConfig_OrcM_StepDown::StaticClass());
	default AddClimbingAction(EClimbType::JumpGap, UClimbingAnimConfig_OrcM_JumpGap::StaticClass());
	// default AddClimbingAction(EClimbType::Acrobatic, UClimbingAnimConfig_OrcM_Acrobatic::StaticClass());
	default m_PositionCorrectionBlendCurve = n"CurveFloat'/Game/AnimLibrary/Data/Curves/MantleCurves/Mantle_Timeline.Mantle_Timeline'";

	default m_GroundSearchEdgeSettings.m_MaxAutoClimbHeight = 150;
	default m_GroundSearchEdgeSettings.m_MaxEdgeHeight = 450;
    default m_GroundSearchEdgeSettings.m_MinEdgeHeight = 50;
    default m_GroundSearchEdgeSettings.m_ReachDistance = 120;
    default m_GroundSearchEdgeSettings.m_ForwardTraceRadius = 30;
    default m_GroundSearchEdgeSettings.m_DownwardTraceRadius = 30;

    default m_AirSearchEdgeSettings.m_MaxEdgeHeight = 150;
    default m_AirSearchEdgeSettings.m_MinEdgeHeight = 50;
    default m_AirSearchEdgeSettings.m_ReachDistance = 70;
    default m_AirSearchEdgeSettings.m_ForwardTraceRadius = 30;
    default m_AirSearchEdgeSettings.m_DownwardTraceRadius = 30;

	default m_SwimmingSearchEdgeSettings.m_MaxAutoClimbHeight = 150;
    default m_SwimmingSearchEdgeSettings.m_MaxEdgeHeight = 250;
    default m_SwimmingSearchEdgeSettings.m_MinEdgeHeight = 0;
    default m_SwimmingSearchEdgeSettings.m_ReachDistance = 50;
    default m_SwimmingSearchEdgeSettings.m_ForwardTraceRadius = 30;
    default m_SwimmingSearchEdgeSettings.m_DownwardTraceRadius = 30;

    default m_CheckCapsuleStartTraceOffset = -35;
    default m_CheckSphereEndTraceOffset = -15;
};
