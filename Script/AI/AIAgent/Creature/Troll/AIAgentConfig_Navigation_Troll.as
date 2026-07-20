UCLASS()
class UNavigationAreaFilter_Troll : UNavigationAreaFilter_Creature
{
    default ExcludeWaterArea();
}

UCLASS()
class UAIAgentConfig_Navigation_Troll : UAIAgentConfig_Navigation_Creature
{
    default m_NavigationQueryFilter = UNavigationAreaFilter_Troll::StaticClass();
    
    default m_PreferedNavigationType = ENavigationType::Walk;
    default m_NavDataTags.Add(ENavigationType::Walk, ENavigationAgent::LargeCreatue_NavMesh);
    default m_NavDataTags.Add(ENavigationType::Swim, ENavigationAgent::LargeCreatue_NavMesh);
 
    default DefaultPathfollowSettings.MoveFocusSettings.FocalPointDistance = 600.f;
    default DefaultPathfollowSettings.MoveFocusSettings.FocalPointHeightMultiplier = 0.8f;
}