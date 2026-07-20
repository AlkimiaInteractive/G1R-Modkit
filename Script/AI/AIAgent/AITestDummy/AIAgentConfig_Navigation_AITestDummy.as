UCLASS()
class UAIAgentConfig_Navigation_AITestDummy : UAIAgentConfig_Navigation
{
    default m_NavigationQueryFilter = UNavigationAreaFilter_Human::StaticClass();

    // Human_NavMesh should be used for all similar sized creatures too
    default m_PreferedNavigationType = ENavigationType::Walk;
    default m_NavDataTags.Add(ENavigationType::Walk, ENavigationAgent::Human_NavMesh);
    default m_NavDataTags.Add(ENavigationType::Swim, ENavigationAgent::Human_NavMesh);
}