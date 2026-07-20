UCLASS()
class UAIAgentConfig_Navigation_Flying : UAIAgentConfig_Navigation_Creature
{
    default DefaultPathfollowSettings.CrowdAgentHalfHeightMultiplier = 1.5f;
}

UCLASS()
class UAIAgentConfig_Navigation_Diving : UAIAgentConfig_Navigation_Creature
{
    default DefaultPathfollowSettings.CrowdAgentHalfHeightMultiplier = 1.5f;
    default DefaultPathfollowSettings.FlyDiveSettings.CharacterZDivergeOffset = 100.f;
}

UCLASS()
class UAIAgentConfig_Navigation_Quadruped : UAIAgentConfig_Navigation_Creature
{
    // cannot strafe, would make them run into each other
    default DefaultPathfollowSettings.bStrafeTurnToPotentialBlockingAgent = false;  

    // should not be too high, as they might have issues steering
    default DefaultPathfollowSettings.ModifyAvoidVelocitySettings.MediumRangeVelocityMultiplier = 0.6f;
    default DefaultPathfollowSettings.ModifyAvoidVelocitySettings.ShortRangeVelocityMultiplier = 0.3f;
    default DefaultPathfollowSettings.ModifyAvoidVelocitySettings.FastSpeedVelocityMultiplier = 0.5f;
}

UCLASS()
class UAIAgentConfig_Navigation_Creature : UAIAgentConfig_Navigation
{
    default NavShotQueryDistance = 3000.f;
    default DefaultPathfollowSettings.CrowdGroupsBehaviour = ECrowdGroupsBehaviour::AvoidAllAgents;
}

UCLASS()
class UNavigationAreaFilter_Creature : UNavigationAreaFilter
{
    // IMPORTANT: Epics UNavigationQueryFilter::InitializeFilter() forces default value to be at least 1.0f.
    const float DefaultCost = 2.0f; // make default cost higher than 1.f so that we could have cheaper areas 
    const float WaterCost = 20.f;
    const float ObstacleEnteringBaseCost = 2000.f;

    // Roads have normal entering cost: Prevents agents from detouring when crossing a road
    default SetTravelCostOnNavArea(UNavArea_Road::StaticClass(), DefaultCost);
    default SetEnteringCostOnNavArea(UNavArea_Road::StaticClass(), DefaultCost);
    default SetTravelCostOnNavArea(UNavArea_RoadRoofed::StaticClass(), DefaultCost);
    default SetEnteringCostOnNavArea(UNavArea_RoadRoofed::StaticClass(), DefaultCost);
    
    // Avoid areas should be bypassed if possible, but are still accessable (e.g. make agents walk around trees in greater distance) 
    default SetTravelCostOnNavArea(UNavArea_Avoid::StaticClass(), DefaultCost * 4.f);
    default SetEnteringCostOnNavArea(UNavArea_Avoid::StaticClass(), DefaultCost * 3.f);

    default SetTravelCostOnNavArea(UNavArea_NavLink_Parkour::StaticClass(), DefaultCost * 4.f);
    default SetEnteringCostOnNavArea(UNavArea_NavLink_Parkour::StaticClass(), DefaultCost * 5.f);

    // Obstacles have normal travel cost and high entering cost: Prevent sophisticating path costs, when startlocation is inside obstacle area
    default SetTravelCostOnNavArea(UNavArea_Obstacle::StaticClass(), DefaultCost * 1.5f); 
    default SetEnteringCostOnNavArea(UNavArea_Obstacle::StaticClass(), ObstacleEnteringBaseCost * DefaultCost);

    default SetTravelCostOnNavArea(UNavArea_DefaultRoofed::StaticClass(), DefaultCost);
    default SetEnteringCostOnNavArea(UNavArea_DefaultRoofed::StaticClass(), DefaultCost);
    
    default OverrideDefaultNavAreaCost(DefaultCost);
    default SetTravelCostOnNavArea(UNavArea_Default::StaticClass(), DefaultCost);
    default SetEnteringCostOnNavArea(UNavArea_Default::StaticClass(), DefaultCost);
    default SetTravelCostOnNavArea(UNavArea_DefaultSecondary::StaticClass(), DefaultCost);
    default SetEnteringCostOnNavArea(UNavArea_DefaultSecondary::StaticClass(), DefaultCost);

    default SetTravelCostOnNavArea(UNavArea_Water::StaticClass(), WaterCost);
    default SetEnteringCostOnNavArea(UNavArea_Water::StaticClass(), WaterCost * 2.f);
   
    default SetTravelCostOnNavArea(UNavArea_Water_Deep::StaticClass(), WaterCost);
    default SetEnteringCostOnNavArea(UNavArea_Water_Deep::StaticClass(), WaterCost * 2.f);
   
    default SetTravelCostOnNavArea(UNavArea_Water_Shallow::StaticClass(), WaterCost);
    default SetEnteringCostOnNavArea(UNavArea_Water_Shallow::StaticClass(), WaterCost * 2.f);

    default SetTravelCostOnNavArea(UNavArea_MiltenSleeperFight::StaticClass(), DefaultCost);
    default SetEnteringCostOnNavArea(UNavArea_MiltenSleeperFight::StaticClass(), DefaultCost);

    default SetTravelCostOnNavArea(UNavArea_BossArena::StaticClass(), DefaultCost);
    default SetEnteringCostOnNavArea(UNavArea_BossArena::StaticClass(), DefaultCost);

    default ExcludeNavArea(UNavArea_FlyingOnly);
}

UCLASS()
class UNavigationAreaFilter_Creature_Flying : UNavigationAreaFilter_Creature
{
    // flying creatures can fly over water areas
    default SetTravelCostOnNavArea(UNavArea_Water::StaticClass(), DefaultCost);
    default SetEnteringCostOnNavArea(UNavArea_Water::StaticClass(), DefaultCost);
   
    default SetTravelCostOnNavArea(UNavArea_Water_Deep::StaticClass(), DefaultCost);
    default SetEnteringCostOnNavArea(UNavArea_Water_Deep::StaticClass(), DefaultCost);
   
    default SetTravelCostOnNavArea(UNavArea_Water_Shallow::StaticClass(), DefaultCost);
    default SetEnteringCostOnNavArea(UNavArea_Water_Shallow::StaticClass(), DefaultCost);

    default IncludeNavArea(UNavArea_FlyingOnly);
    
    default SetTravelCostOnNavArea(UNavArea_FlyingOnly::StaticClass(), DefaultCost);
    default SetEnteringCostOnNavArea(UNavArea_FlyingOnly::StaticClass(), DefaultCost);
}


// Note: creatures dont have a UMetaNavigationQueryFilter class, because they do not care about weather now