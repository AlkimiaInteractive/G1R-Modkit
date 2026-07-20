UCLASS()
class UAIAgentConfig_Navigation_Skeleton_Mage : UAIAgentConfig_Navigation_Creature
{
    default m_NavigationQueryFilter = UNavigationAreaFilter_Creature_Flying::StaticClass();
    
    default m_PreferedNavigationType = ENavigationType::Fly;
    default m_NavDataTags.Add(ENavigationType::Fly, ENavigationAgent::Human_NavMesh);

    default DefaultPathfollowSettings.FlyDiveSettings.AdaptToCollisionSampleZDistance = 100.f;
    default DefaultPathfollowSettings.FlyDiveSettings.SetFlyDiveModeToAlwaysFly();
    default DefaultPathfollowSettings.FlyDiveSettings.SetAdaptHeightRelativeToNavGround(5.f);
    default DefaultPathfollowSettings.FlyDiveSettings.MinFocusSampleDistance = 150.f;
    
}