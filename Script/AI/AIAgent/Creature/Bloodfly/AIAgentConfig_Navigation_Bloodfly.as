UCLASS()
class UAIAgentConfig_Navigation_Bloodfly : UAIAgentConfig_Navigation_Flying
{
    default m_NavigationQueryFilter = UNavigationAreaFilter_Creature_Flying::StaticClass();
    
    default m_PreferedNavigationType = ENavigationType::Fly;
    default m_NavDataTags.Add(ENavigationType::Fly, ENavigationAgent::Human_NavMesh);

    default DefaultPathfollowSettings.FlyDiveSettings.AdaptToCollisionSampleZDistance = 100.f;
    default DefaultPathfollowSettings.FlyDiveSettings.SetFlyDiveModeToAlwaysFly();
    default DefaultPathfollowSettings.FlyDiveSettings.SetAdaptHeightRelativeToNavGround(3.f);
    default DefaultPathfollowSettings.FlyDiveSettings.MinFocusSampleDistance = 50.f;
}