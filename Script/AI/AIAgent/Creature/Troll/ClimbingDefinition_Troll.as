UCLASS()
class UClimbingAnimConfig_JuvenileTroll_JumpGap: UClimbingAnimConfig
{
	FClimbingMontages JumpGap;
	default JumpGap.m_LeftMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/JuvenileTroll/Movement/InAir/JumpGap/JuvenileTroll_JumpHigh_Montage.JuvenileTroll_JumpHigh_Montage'";
	
	default AddMontage(JumpGap);
	default m_PlayRate = 1.0;

	default m_ClimbingType = EClimbType::JumpGap;
};

UCLASS()
class UClimbingConfig_JuvenileTroll: UClimbingConfig
{
    default AddClimbingAction(EClimbType::JumpGap, UClimbingAnimConfig_JuvenileTroll_JumpGap::StaticClass());
	default m_PositionCorrectionBlendCurve = n"CurveFloat'/Game/AnimLibrary/Data/Curves/MantleCurves/Mantle_Timeline.Mantle_Timeline'";

	default m_GroundSearchEdgeSettings.m_MaxEdgeHeight = 750;
    default m_GroundSearchEdgeSettings.m_MinEdgeHeight = 50;
    default m_GroundSearchEdgeSettings.m_ReachDistance = 95;
    default m_GroundSearchEdgeSettings.m_ForwardTraceRadius = 30;
    default m_GroundSearchEdgeSettings.m_DownwardTraceRadius = 30;

    default m_AirSearchEdgeSettings.m_MaxEdgeHeight = 150;
    default m_AirSearchEdgeSettings.m_MinEdgeHeight = 50;
    default m_AirSearchEdgeSettings.m_ReachDistance = 70;
    default m_AirSearchEdgeSettings.m_ForwardTraceRadius = 30;
    default m_AirSearchEdgeSettings.m_DownwardTraceRadius = 30;

	default m_SwimmingSearchEdgeSettings.m_MaxAutoClimbHeight = 150;
    default m_SwimmingSearchEdgeSettings.m_MaxEdgeHeight = 350;
    default m_SwimmingSearchEdgeSettings.m_MinEdgeHeight = 0;
    default m_SwimmingSearchEdgeSettings.m_ReachDistance = 90;
    default m_SwimmingSearchEdgeSettings.m_ForwardTraceRadius = 30;
    default m_SwimmingSearchEdgeSettings.m_DownwardTraceRadius = 30;

    default m_CheckCapsuleStartTraceOffset = -35;
    default m_CheckSphereEndTraceOffset = -15;
};