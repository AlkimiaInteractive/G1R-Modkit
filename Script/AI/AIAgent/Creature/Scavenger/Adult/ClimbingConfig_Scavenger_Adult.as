UCLASS()
class UClimbingAnimConfig_Scavenger_Adult_Water: UClimbingAnimConfig
{
	FClimbingMontages Water;
	default Water.m_LeftMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/Swim/Surface/Scavenger_Adult_ClimbOutWater_Montage.Scavenger_Adult_ClimbOutWater_Montage'";
	default Water.m_PositionCorrectionCurve = n"CurveVector'/Game/AnimLibrary/Data/Curves/MantleCurves/Mantle_2m.Mantle_2m'";
	
	default AddMontage(Water);
	default m_PlayRate = 1.0;
	default m_AnimStartingOffset = FVector(0.0, 0, 0.0);
	default m_MinHeight = 125.0;
	default m_MaxHeight = 250.0;
	default m_NextStepRequestWindowStart = 0.0;
	default m_NextStepRequestWindowSize = 0.0;

    default m_ClimbingType = EClimbType::Water;
};

UCLASS()
class UClimbingAnimConfig_Scavenger_Adult_JumpGap: UClimbingAnimConfig
{
	FClimbingMontages JumpGap;
	default JumpGap.m_LeftMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Movement/InAir/JumpGap/Scavenger_Adult_JumpGap_Montage.Scavenger_Adult_JumpGap_Montage'";
	
	default AddMontage(JumpGap);
	default m_PlayRate = 1.0;

	default m_ClimbingType = EClimbType::JumpGap;
};

UCLASS()
class UClimbingConfig_Scavenger_Adult : UClimbingConfig
{
	default AddClimbingAction(EClimbType::Water, UClimbingAnimConfig_Scavenger_Adult_Water::StaticClass());
    default AddClimbingAction(EClimbType::JumpGap, UClimbingAnimConfig_Scavenger_Adult_JumpGap::StaticClass());
	default m_PositionCorrectionBlendCurve = n"CurveFloat'/Game/AnimLibrary/Data/Curves/MantleCurves/Mantle_Timeline.Mantle_Timeline'";

	default m_GroundSearchEdgeSettings.m_MaxEdgeHeight = 450;
    default m_GroundSearchEdgeSettings.m_MinEdgeHeight = 50;
    default m_GroundSearchEdgeSettings.m_ReachDistance = 75;
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