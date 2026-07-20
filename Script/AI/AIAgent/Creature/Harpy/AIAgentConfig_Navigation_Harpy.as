UCLASS()
class UAIAgentConfig_Navigation_Harpy : UAIAgentConfig_Navigation_Flying
{
	default m_NavigationQueryFilter = UNavigationAreaFilter_Creature_Flying::StaticClass();
    
    default m_PreferedNavigationType = ENavigationType::Walk;

    default m_NavDataTags.Add(ENavigationType::Walk, ENavigationAgent::Human_NavMesh);
    default m_NavDataTags.Add(ENavigationType::Fly, ENavigationAgent::Flying_NavMesh);

    default NavShotQueryDistance = 4000.f;


    default DefaultPathfollowSettings.FlyDiveSettings.AdaptToCollisionSampleZDistance = 150.f;
    default DefaultPathfollowSettings.FlyDiveSettings.SetFlyDiveModeToDivergeHybrid(300.f, 200.f);
    //default DefaultPathfollowSettings.FlyDiveSettings.SetFlyDiveModeToAlwaysFly();
    default DefaultPathfollowSettings.FlyDiveSettings.SetAdaptHeightRelativeToNavGround(200.f);
    default DefaultPathfollowSettings.FlyDiveSettings.MinFocusSampleDistance = 500.f;
}