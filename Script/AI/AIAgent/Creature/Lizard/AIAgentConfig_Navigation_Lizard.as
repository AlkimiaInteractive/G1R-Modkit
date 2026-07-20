UCLASS()
class UNavigationAreaFilter_Lizard : UNavigationAreaFilter_Creature
{
}

UCLASS()
class UAIAgentConfig_Navigation_Lizard : UAIAgentConfig_Navigation_Creature
{
    default m_NavigationQueryFilter = UNavigationAreaFilter_Lizard::StaticClass();
    default m_PreferedNavigationType = ENavigationType::Walk;
    default m_NavDataTags.Add(ENavigationType::Walk, ENavigationAgent::Human_NavMesh);
    default m_NavDataTags.Add(ENavigationType::Swim, ENavigationAgent::Human_NavMesh);

    default DefaultPathfollowSettings.AgentHalfHeightMultiplier = 2.0f;
}