UCLASS()
class UNavigationAreaFilter_SwimmingCreature : UNavigationAreaFilter_Creature
{
    default SetTravelCostOnNavArea(UNavArea_Water::StaticClass(), DefaultCost);
    default SetEnteringCostOnNavArea(UNavArea_Water::StaticClass(), DefaultCost);
   
    default SetTravelCostOnNavArea(UNavArea_Water_Deep::StaticClass(), DefaultCost);
    default SetEnteringCostOnNavArea(UNavArea_Water_Deep::StaticClass(), DefaultCost);
   
    default SetTravelCostOnNavArea(UNavArea_Water_Shallow::StaticClass(), DefaultCost);
    default SetEnteringCostOnNavArea(UNavArea_Water_Shallow::StaticClass(), DefaultCost);
}

UCLASS()
class UAIAgentConfig_Navigation_Lurker : UAIAgentConfig_Navigation_Diving
{
    default m_NavigationQueryFilter = UNavigationAreaFilter_SwimmingCreature::StaticClass();

    default m_PreferedNavigationType = ENavigationType::Swim;
    default m_NavDataTags.Add(ENavigationType::Walk, ENavigationAgent::LargeCreatue_NavMesh);
    default m_NavDataTags.Add(ENavigationType::Swim, ENavigationAgent::LargeCreatue_NavMesh);

    default DefaultPathfollowSettings.FlyDiveSettings.SetAdaptHeightRelativeToNavGround(250.f);

    // GroundedMoveBeforeGoalDistance == -1.f prevents that lurker swims up to the surface near the paths goal
    default DefaultPathfollowSettings.FlyDiveSettings.SetFlyDiveModeToDivergeHybrid(100.f, -1.0f);
    default DefaultPathfollowSettings.FlyDiveSettings.AdaptToCollisionSampleZDistance = 150.f;
    default DefaultPathfollowSettings.FlyDiveSettings.MinFocusSampleDistance = 300.f;

    default DefaultPathfollowSettings.AgentHalfHeightMultiplier = 2.5f;
}