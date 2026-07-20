UCLASS()
class UAIAgentConfig_Navigation_Rat : UAIAgentConfig_Navigation_Creature
{ 
    default m_NavigationQueryFilter = UNavigationAreaFilter_Creature::StaticClass();
   
    default m_PreferedNavigationType = ENavigationType::Walk;
    default NavShotQueryDistance = 300.f;

    default DefaultPathfollowSettings.CrowdIdleBehaviour = ECrowdIdleBehaviour::TryAvoidMe;
    default DefaultPathfollowSettings.CrowdGroupsBehaviour = ECrowdGroupsBehaviour::IgnoreAllAgentsAndObstacles;
}