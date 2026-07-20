UCLASS()
class UNavigationAreaFilter_Bloodhound : UNavigationAreaFilter_Creature
{
    default SetEnteringCostWater(100.0f);
}

UCLASS()
class UAIAgentConfig_Navigation_Bloodhound : UAIAgentConfig_Navigation_Creature
{
    default m_NavigationQueryFilter = UNavigationAreaFilter_Bloodhound::StaticClass();

    default m_PreferedNavigationType = ENavigationType::Walk;
    default m_NavDataTags.Add(ENavigationType::Walk, ENavigationAgent::Human_NavMesh);
    default m_NavDataTags.Add(ENavigationType::Swim, ENavigationAgent::Human_NavMesh);

    default DefaultPathfollowSettings.AgentHalfHeightMultiplier = 2.5f;
}