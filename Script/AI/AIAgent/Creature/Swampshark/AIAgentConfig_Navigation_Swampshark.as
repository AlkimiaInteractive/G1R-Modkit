UCLASS()
class UAIAgentConfig_Navigation_Swampshark : UAIAgentConfig_Navigation_Diving
{
    default m_NavigationQueryFilter = UNavigationAreaFilter_SwimmingCreature::StaticClass();

    default m_PreferedNavigationType = ENavigationType::Walk;
    default m_NavDataTags.Add(ENavigationType::Walk, ENavigationAgent::Human_NavMesh);
    default m_NavDataTags.Add(ENavigationType::Swim, ENavigationAgent::Human_NavMesh);

    default DefaultPathfollowSettings.FlyDiveSettings.SetAdaptHeightRelativeToNavGround(150.f);
    default DefaultPathfollowSettings.FlyDiveSettings.SetFlyDiveModeToDivergeHybrid(100.f, 0.f);
    default DefaultPathfollowSettings.FlyDiveSettings.AdaptToCollisionSampleZDistance = 100.f;
    default DefaultPathfollowSettings.AgentHalfHeightMultiplier = 2.5f;
    default DefaultPathfollowSettings.MoveFocusSettings.FocalPointDistance = 600.f;
}