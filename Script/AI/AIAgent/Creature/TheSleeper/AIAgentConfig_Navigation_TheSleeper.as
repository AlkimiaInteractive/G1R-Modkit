UCLASS()
class UNavigationAreaFilter_TheSleeper : UNavigationAreaFilter_Creature
{
    default ExcludeWaterArea();
}

UCLASS()
class UAIAgentConfig_Navigation_TheSleeper : UAIAgentConfig_Navigation_Creature
{
    default m_NavigationQueryFilter = UNavigationAreaFilter_TheSleeper::StaticClass();

    default m_PreferedNavigationType = ENavigationType::Walk;
    default m_NavDataTags.Add(ENavigationType::Walk, ENavigationAgent::LargeCreatue_NavMesh);
}