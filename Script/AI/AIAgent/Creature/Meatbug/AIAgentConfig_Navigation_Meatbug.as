UCLASS()
class UNavigationAreaFilter_Meatbug : UNavigationAreaFilter_Creature
{
    default ExcludeWaterArea();
}


UCLASS()
class UAIAgentConfig_Navigation_Meatbug : UAIAgentConfig_Navigation_Creature
{
    default m_NavigationQueryFilter = UNavigationAreaFilter_Meatbug::StaticClass();

    default m_PreferedNavigationType = ENavigationType::Walk;
    default m_NavDataTags.Add(ENavigationType::Walk, ENavigationAgent::Human_NavMesh);
    
    default NavShotQueryDistance = 400.f;
    default GlobalMetaRepathRadius = 20.f;

    default DefaultPathfollowSettings.CrowdIdleBehaviour = ECrowdIdleBehaviour::TryAvoidMe;
    default DefaultPathfollowSettings.CrowdGroupsBehaviour = ECrowdGroupsBehaviour::IgnoreAllAgentsAndObstacles;

    default DefaultPathfollowSettings.AgentHalfHeightMultiplier = 8.f;
    default DefaultPathfollowSettings.AgentRadiusMultiplier = 2.f;
}