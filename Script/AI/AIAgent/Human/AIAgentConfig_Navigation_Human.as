UCLASS()
class UNavigationAreaFilter_Human : UNavigationAreaFilter
{
    // IMPORTANT: Epics UNavigationQueryFilter::InitializeFilter() forces default value to be at least 1.0f. That's why we need DefaultCost to be 2.0f, so that Road can be cheaper 
    const float DefaultCost = 4.0f; 
    const float RoadCost = 2.0f;
    const float WaterCost = 40.f;
    const float ObstacleEnteringBaseCost = 4000.f;

    // Roads have normal entering cost: Prevents agents from detouring when crossing a road
    default SetTravelCostOnNavArea(UNavArea_Road::StaticClass(), RoadCost);
    default SetEnteringCostOnNavArea(UNavArea_Road::StaticClass(), RoadCost);
    default SetTravelCostOnNavArea(UNavArea_RoadRoofed::StaticClass(), RoadCost);
    default SetEnteringCostOnNavArea(UNavArea_RoadRoofed::StaticClass(), RoadCost);
    
    // Obstacles have normal travel cost and high entering cost: Prevent sophisticating path costs, when startlocation is inside obstacle area
    default SetTravelCostOnNavArea(UNavArea_Obstacle::StaticClass(), DefaultCost * 1.5f); 
    default SetEnteringCostOnNavArea(UNavArea_Obstacle::StaticClass(), ObstacleEnteringBaseCost * DefaultCost);

    // Avoid areas should be bypassed if possible, but are still accessable (e.g. make agents walk around trees in greater distance) 
    default SetTravelCostOnNavArea(UNavArea_Avoid::StaticClass(), DefaultCost * 2.f);
    default SetEnteringCostOnNavArea(UNavArea_Avoid::StaticClass(), DefaultCost * 3.f);

    default SetTravelCostOnNavArea(UNavArea_NavLink_Parkour::StaticClass(), DefaultCost * 4.f);
    default SetEnteringCostOnNavArea(UNavArea_NavLink_Parkour::StaticClass(), DefaultCost * 5.f);

    default SetTravelCostOnNavArea(UNavArea_DefaultRoofed::StaticClass(), DefaultCost);
    default SetEnteringCostOnNavArea(UNavArea_DefaultRoofed::StaticClass(), DefaultCost);
    
    default OverrideDefaultNavAreaCost(DefaultCost);
    default SetTravelCostOnNavArea(UNavArea_Default::StaticClass(), DefaultCost);
    default SetEnteringCostOnNavArea(UNavArea_Default::StaticClass(), DefaultCost);

    default SetTravelCostOnNavArea(UNavArea_DefaultSecondary::StaticClass(), DefaultCost);
    default SetEnteringCostOnNavArea(UNavArea_DefaultSecondary::StaticClass(), DefaultCost);

    default SetTravelCostOnNavArea(UNavArea_Water::StaticClass(), WaterCost);
    default SetEnteringCostOnNavArea(UNavArea_Water::StaticClass(), WaterCost * 5);
       
    default SetTravelCostOnNavArea(UNavArea_Water_Deep::StaticClass(), WaterCost);
    default SetEnteringCostOnNavArea(UNavArea_Water_Deep::StaticClass(), WaterCost * 5);
   
    default SetTravelCostOnNavArea(UNavArea_Water_Shallow::StaticClass(), WaterCost);
    default SetEnteringCostOnNavArea(UNavArea_Water_Shallow::StaticClass(), WaterCost * 5);

    default SetTravelCostOnNavArea(UNavArea_MiltenSleeperFight::StaticClass(), DefaultCost);
    default SetEnteringCostOnNavArea(UNavArea_MiltenSleeperFight::StaticClass(), DefaultCost);

    default SetTravelCostOnNavArea(UNavArea_BossArena::StaticClass(), DefaultCost);
    default SetEnteringCostOnNavArea(UNavArea_BossArena::StaticClass(), DefaultCost);

    default ExcludeNavArea(UNavArea_FlyingOnly);

    default OverrideMaxSearchNodes(3000);
}

UCLASS()
class UNavigationAreaFilter_Human_BadWeather : UNavigationAreaFilter_Human
{
    // rainy weather makes roofed areas more desirable
    const float DefaultCost_Roofed = 1.8f;
    const float RoadCost_Roofed = 1.2f;

    default SetTravelCostOnNavArea(UNavArea_RoadRoofed::StaticClass(), RoadCost_Roofed);
    default SetEnteringCostOnNavArea(UNavArea_RoadRoofed::StaticClass(), RoadCost_Roofed);

    default SetTravelCostOnNavArea(UNavArea_DefaultRoofed::StaticClass(), DefaultCost_Roofed);
    default SetEnteringCostOnNavArea(UNavArea_DefaultRoofed::StaticClass(), DefaultCost_Roofed);
}

/** Select a filter based on environmental conditions */
// UCLASS()
// class UMetaNavigationQueryFilter_Weather_Human : UMetaNavigationQueryFilter
// {
//     TSubclassOf<UNavigationQueryFilter> GoodWeatherNavigationQueryFilter = UNavigationAreaFilter_Human::StaticClass();
//     TSubclassOf<UNavigationQueryFilter> BadWeatherNavigationQueryFilter = UNavigationAreaFilter_Human_BadWeather::StaticClass();    

//     UFUNCTION(BlueprintOverride)
//     TSubclassOf<UNavigationQueryFilter> GetSimpleFilterForAgent(const UObject Querier) const
//     {
//         if (Querier.GetWorld().IsEditorWorld())
//             return GoodWeatherNavigationQueryFilter;
        
//         UWeatherSubsystem WeatherSubsystem = UWeatherSubsystem::Get();

//         if (!IsValid(WeatherSubsystem))
//             return GoodWeatherNavigationQueryFilter;
        
//         if (WeatherSubsystem.IsRaining(1))
//         {
//             return BadWeatherNavigationQueryFilter;
//         }
//         else
//         {
//             return GoodWeatherNavigationQueryFilter;
//         }
//     }
// }

UCLASS()
class UAIAgentConfig_Navigation_Human : UAIAgentConfig_Navigation
{
    default m_NavigationQueryFilter = UGothicMetaNavigationQueryFilter_Human;

    default m_PreferedNavigationType = ENavigationType::Walk;
    default m_NavDataTags.Add(ENavigationType::Walk, ENavigationAgent::Human_NavMesh);
    default m_NavDataTags.Add(ENavigationType::Swim, ENavigationAgent::Human_NavMesh);

    default DefaultPathfollowSettings.CrowdGroupsBehaviour = ECrowdGroupsBehaviour::AvoidAllAgents;
    default DefaultPathfollowSettings.CrowdAgentSeparationWeight = 3.f;  
}

/** Meta navigation filter for base humans - Sets default navigation query filter and a list of condition based query filters */
UCLASS()
class UGothicMetaNavigationQueryFilter_Human : UGothicMetaNavigationQueryFilter
{
    default DefaultNavigationQueryFilter = UNavigationAreaFilter_Human;

    default ConditionalFilters.Add(UConditionalNavigationQueryFilterHandle_DailyRoutine);
    default ConditionalFilters.Add(UConditionalNavigationQueryFilterHandle_Human_BadWeather);
}

//// CONDITION BASED QUERY FILTER SELECTOR
UCLASS(Abstract)
class UGothicMetaNavigationQueryFilter : UMetaNavigationQueryFilter
{
    UPROPERTY()
    TSubclassOf<UNavigationQueryFilter> DefaultNavigationQueryFilter;

    UPROPERTY()
    TArray<TSubclassOf<UConditionalNavigationQueryFilterHandle>> ConditionalFilters;

    UFUNCTION(BlueprintOverride)
    TSubclassOf<UNavigationQueryFilter> GetSimpleFilterForAgent(const UObject Querier) const
    {
        for (auto ConditionalFilterHandle : ConditionalFilters)
        {
            if (!IsValid(ConditionalFilterHandle))
                continue;

            if (!IsValid(ConditionalFilterHandle.DefaultObject.GetQueryFilter(Querier)))
                continue;

            if (!ConditionalFilterHandle.DefaultObject.DoesFilterApply(Querier))
                continue;

            return ConditionalFilterHandle.DefaultObject.GetQueryFilter(Querier);
        }

        return DefaultNavigationQueryFilter;
    }
}

//// CONDITION - QUERY FILTER
UCLASS(Abstract)
class UConditionalNavigationQueryFilterHandle
{
    UPROPERTY()
    protected const TSubclassOf<UNavigationQueryFilter> QueryFilter;

    UFUNCTION()
    TSubclassOf<UNavigationQueryFilter> GetQueryFilter(const UObject Querier) const
    {
        return QueryFilter;
    }

    UFUNCTION()
    bool DoesFilterApply(const UObject Querier) { return false; }
}

/** Query Filter used when scheduled daily routine has set an AIStateFilter */
UCLASS()
class UConditionalNavigationQueryFilterHandle_DailyRoutine : UConditionalNavigationQueryFilterHandle
{
    bool DoesFilterApply(const UObject Querier) override
    {
        auto AI = GetAIFromQuerier(Querier);
        UGothicCharacterAIState ScheduledAIState = Cast<UGothicCharacterAIState>(AI.ScheduledDailyRoutineAIStateTemplate);

        if (!IsValid(ScheduledAIState))
            return false;

        auto AIStateFilter = ScheduledAIState.GetNavigationQueryFilterForAgent(Querier);
        if (!IsValid(AIStateFilter))
            return false;

        return true;
    }

    TSubclassOf<UNavigationQueryFilter> GetQueryFilter(const UObject Querier) const override
    {
        auto AI = GetAIFromQuerier(Querier);
        if (!IsValid(AI))
            return nullptr;
        
        UGothicCharacterAIState ScheduledAIState = Cast<UGothicCharacterAIState>(AI.ScheduledDailyRoutineAIStateTemplate);

        if (!IsValid(ScheduledAIState))
            return nullptr;

        auto AIStateFilter = ScheduledAIState.GetNavigationQueryFilterForAgent(Querier);
        if (!IsValid(AIStateFilter))
            return nullptr;

        return AIStateFilter;
    }

    UGameplayAbility_CharacterAI_Gothic GetAIFromQuerier(const UObject Querier) const
    {
        AGothicCharacter Character = Cast<AGothicCharacter>(Querier);
        if (IsValid(Character))
            return Character.GetGothicAI();

        AGothicCharacterState CharacterState = Cast<AGothicCharacterState>(Querier);
        if (IsValid(CharacterState))
            return Cast<UGameplayAbility_CharacterAI_Gothic>(CharacterState.GetAI());

        AGothicAIController Controller = Cast<AGothicAIController>(Querier);
        if (IsValid(Controller))
            return Cast<UGameplayAbility_CharacterAI_Gothic>(Controller.AIAbility);

        return nullptr;
    }
}

/** Query Filter used when the weather is bad by humans */
UCLASS()
class UConditionalNavigationQueryFilterHandle_Human_BadWeather : UConditionalNavigationQueryFilterHandle
{
    default QueryFilter = UNavigationAreaFilter_Human_BadWeather;

    bool DoesFilterApply(const UObject Querier) override
    {
        if (Querier.GetWorld().IsEditorWorld())
            return false;
        
        UWeatherSubsystem WeatherSubsystem = UWeatherSubsystem::Get();

        if (!IsValid(WeatherSubsystem))
            return false;
        
        if (!WeatherSubsystem.IsRaining(1))
            return false;
        
        return true;
    }
}