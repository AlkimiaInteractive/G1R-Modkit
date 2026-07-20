
UCLASS()
class UNavigationAreaFilter_Scavenger : UNavigationAreaFilter_Creature
{
    default SetTravelCostWater(WaterCost);
}

UCLASS()
class UAIAgentConfig_Navigation_Scavenger : UAIAgentConfig_Navigation_Creature
{
    default m_NavigationQueryFilter = UNavigationAreaFilter_Scavenger::StaticClass();

    default m_PreferedNavigationType = ENavigationType::Walk;
    default m_NavDataTags.Add(ENavigationType::Walk, ENavigationAgent::Human_NavMesh);
    default m_NavDataTags.Add(ENavigationType::Swim, ENavigationAgent::Human_NavMesh);

    default DefaultPathfollowSettings.AgentHalfHeightMultiplier = 2.0f;
}