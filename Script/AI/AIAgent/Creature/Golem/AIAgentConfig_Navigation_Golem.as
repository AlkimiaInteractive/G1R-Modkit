UCLASS()
class UNavigationAreaFilter_Golem : UNavigationAreaFilter_Creature
{
    default ExcludeWaterArea();
}

UCLASS()
class UAIAgentConfig_Navigation_Golem : UAIAgentConfig_Navigation_Creature
{
    default m_NavigationQueryFilter = UNavigationAreaFilter_Golem;

    default m_PreferedNavigationType = ENavigationType::Walk;
    default m_NavDataTags.Add(ENavigationType::Walk, ENavigationAgent::LargeCreatue_NavMesh);

    default DefaultPathfollowSettings.MoveFocusSettings.FocalPointDistance = 600.f;
    default DefaultPathfollowSettings.MoveFocusSettings.FocalPointHeightMultiplier = 0.8f;
}

UCLASS()
class UAIAgentConfig_Navigation_Golem_Arena : UAIAgentConfig_Navigation_Creature
{
    default m_NavigationQueryFilter = UNavigationAreaFilter_BossArena;

    default m_PreferedNavigationType = ENavigationType::Walk;
    default m_NavDataTags.Add(ENavigationType::Walk, ENavigationAgent::LargeCreatue_NavMesh);

    default DefaultPathfollowSettings.MoveFocusSettings.FocalPointDistance = 600.f;
    default DefaultPathfollowSettings.MoveFocusSettings.FocalPointHeightMultiplier = 0.5f;
}