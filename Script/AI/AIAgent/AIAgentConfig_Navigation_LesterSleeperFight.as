UCLASS()
class UNavigationAreaFilter_LesterSleeper : UNavigationAreaFilter
{
    default ExcludeNavArea(UNavArea_Road::StaticClass());
    default ExcludeNavArea(UNavArea_Default::StaticClass());
    default ExcludeNavArea(UNavArea_RoadRoofed::StaticClass());
    default ExcludeNavArea(UNavArea_DefaultRoofed::StaticClass());
    default ExcludeNavArea(UNavArea_Avoid::StaticClass());
    default ExcludeNavArea(UNavArea_Water::StaticClass());
    default ExcludeNavArea(UNavArea_Water_Deep::StaticClass());
    default ExcludeNavArea(UNavArea_Water_Shallow::StaticClass());
    default ExcludeNavArea(UNavArea_SwampsharkSleeperFight::StaticClass());

    const float DefaultCost = 4.0f; 
    const float ObstacleEnteringBaseCost = 2000.f;
    
    default SetTravelCostOnNavArea(UNavArea_Obstacle::StaticClass(), DefaultCost * 1.5f); 
    default SetEnteringCostOnNavArea(UNavArea_Obstacle::StaticClass(), ObstacleEnteringBaseCost * DefaultCost);
    
    default SetTravelCostOnNavArea(UNavArea_LesterSleeperFight::StaticClass(), DefaultCost);
    default SetEnteringCostOnNavArea(UNavArea_LesterSleeperFight::StaticClass(), DefaultCost);

    default SetTravelCostOnNavArea(UNavArea_NavLink_Parkour::StaticClass(), DefaultCost * 4.f);
    default SetEnteringCostOnNavArea(UNavArea_NavLink_Parkour::StaticClass(), DefaultCost * 5.f);
}

UCLASS()
class UAIAgentConfig_Navigation_Lester_Sleeper : UAIAgentConfig_Navigation_Human
{
    default m_NavigationQueryFilter = UNavigationAreaFilter_LesterSleeper::StaticClass();
}
