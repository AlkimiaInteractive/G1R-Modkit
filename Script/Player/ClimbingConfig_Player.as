UCLASS()
class UClimbingConfig_Player: UClimbingConfig_Human
{
    default m_GroundSearchEdgeSettings.m_ReachDistance = 125;
	default m_GroundSearchEdgeSettings.m_MaxEdgeHeight = 300;

    default m_SwimmingSearchEdgeSettings.m_MaxAutoClimbHeight = 70;
};
