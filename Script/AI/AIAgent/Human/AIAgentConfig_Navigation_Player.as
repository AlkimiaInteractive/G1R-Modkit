UCLASS()
class UAIAgentConfig_Navigation_Player : UAIAgentConfig_Navigation
{
    // player does not use Weather-Meta-Filter, because he should behave the same in every situation
    default m_NavigationQueryFilter = UNavigationAreaFilter_Human::StaticClass();

    default m_PreferedNavigationType = ENavigationType::Walk;
    default m_NavDataTags.Add(ENavigationType::Walk, ENavigationAgent::Human_NavMesh);
    default m_NavDataTags.Add(ENavigationType::Swim, ENavigationAgent::Human_NavMesh);

    default DefaultPathfollowSettings.CrowdIdleBehaviour = ECrowdIdleBehaviour::TryAvoidMe;
    default NavShotQueryDistance = 1000.f;
    default GlobalMetaRepathRadius = 200.f;
}
