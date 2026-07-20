UCLASS()
class UNavigationAreaFilter_Waynet : UNavigationAreaFilter_Human
{
    default OverrideMaxSearchNodes(5000);

    default WaterCost = WaterCost * 0.33f;    // we want waynet in water, but not as preference
   
    default SetTravelCostWater(WaterCost);
    default SetEnteringCostWater(WaterCost);
        
    default IncludeNavArea(UNavArea_FlyingOnly);
    // make more expensive than NavArea_NavLink_Parkour, so that waynet prefers these on Navlinks
    default SetTravelCostOnNavArea(UNavArea_FlyingOnly, DefaultCost * 8.f); 
    default IncludeNavArea(UNavArea_BossArena);
    default SetTravelCostOnNavArea(UNavArea_BossArena, DefaultCost);
    default IncludeNavArea(UNavArea_LesterSleeperFight);
    default SetTravelCostOnNavArea(UNavArea_LesterSleeperFight, DefaultCost);
    default IncludeNavArea(UNavArea_MiltenSleeperFight);
    default SetTravelCostOnNavArea(UNavArea_MiltenSleeperFight, DefaultCost);
    default IncludeNavArea(UNavArea_OCArena_FightingArea);
    default SetTravelCostOnNavArea(UNavArea_OCArena_FightingArea, DefaultCost);
    default IncludeNavArea(UNavArea_SwampsharkSleeperFight);
    default SetTravelCostOnNavArea(UNavArea_SwampsharkSleeperFight, DefaultCost);
    default SetTravelCostOnNavArea(UNavArea_NavLink_Parkour::StaticClass(), DefaultCost * 10.f);
    default SetEnteringCostOnNavArea(UNavArea_NavLink_Parkour::StaticClass(), DefaultCost * 20.f);
}

UCLASS()
class UNavigationAreaFilter_Perception : UNavigationAreaFilter_Human
{
    default ExcludeNavLinks();    
}