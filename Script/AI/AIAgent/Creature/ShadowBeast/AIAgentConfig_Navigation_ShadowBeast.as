UCLASS()
class UNavigationAreaFilter_ShadowBeast : UNavigationAreaFilter_Creature
{
    //default ExcludeWaterArea();
    default SetEnteringCostWater(100.0f);
}

UCLASS()
class UAIAgentConfig_Navigation_ShadowBeast : UAIAgentConfig_Navigation_Creature
{
	default m_NavigationQueryFilter = UNavigationAreaFilter_ShadowBeast::StaticClass();

    default m_PreferedNavigationType = ENavigationType::Walk;
    default m_NavDataTags.Add(ENavigationType::Walk, ENavigationAgent::LargeCreatue_NavMesh);
    default m_NavDataTags.Add(ENavigationType::Swim, ENavigationAgent::LargeCreatue_NavMesh);
    default DefaultPathfollowSettings.MoveFocusSettings.FocalPointDistance = 600.f;
    default DefaultPathfollowSettings.MoveFocusSettings.FocalPointHeightMultiplier = 0.8f;
}