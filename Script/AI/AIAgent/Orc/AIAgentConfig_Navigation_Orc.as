UCLASS()
class UAIAgentConfig_Navigation_Orc : UAIAgentConfig_Navigation
{
    default m_NavigationQueryFilter = UNavigationAreaFilter_Human::StaticClass();

    default m_PreferedNavigationType = ENavigationType::Walk;
    default m_NavDataTags.Add(ENavigationType::Walk, ENavigationAgent::Human_NavMesh);
    default m_NavDataTags.Add(ENavigationType::Swim, ENavigationAgent::Human_NavMesh); 

    default DefaultPathfollowSettings.CrowdGroupsBehaviour = ECrowdGroupsBehaviour::AvoidAllAgents;  
    default DefaultPathfollowSettings.CrowdIdleBehaviour = ECrowdIdleBehaviour::TryAvoidMe;

    default DefaultPathfollowSettings.CrowdAgentRadiusMultiplier = 1.3f;
    default DefaultPathfollowSettings.CrowdAgentSeparationWeight = 25.f;
    default DefaultPathfollowSettings.ModifyAvoidVelocitySettings.MediumRangeVelocityMultiplier = 0.6f;
    default DefaultPathfollowSettings.ModifyAvoidVelocitySettings.ShortRangeVelocityMultiplier = 0.5f;
}

UCLASS()
class UAIAgentConfig_Navigation_Orc_SleeperBossArena : UAIAgentConfig_Navigation_Orc
{
    default m_NavigationQueryFilter = UNavigationAreaFilter_BossArena::StaticClass();
}