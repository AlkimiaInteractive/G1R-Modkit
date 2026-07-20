
UCLASS()
class UGameplayAbility_CharacterAI_Wolf : UGameplayAbility_CreatureAI
{
    default ModeOfFleeOnUnfavorableCombat = EFleeOnUnfavorableCombatMode::OnUnfavorable_PredatorOnly;
    default InitialDailyRoutineClass = UDailyRoutine_Wolf_Base::StaticClass();
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Wolf::StaticClass());
}

UCLASS()
class UGameplayAbility_CharacterAI_Wolf_Alpha : UGameplayAbility_CreatureAI
{
    default ModeOfFleeOnUnfavorableCombat = EFleeOnUnfavorableCombatMode::OnUnfavorable_PredatorOnly;
    default InitialDailyRoutineClass = UDailyRoutine_Wolf_Base::StaticClass();
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Wolf_Alpha::StaticClass());
}

class UDailyRoutine_Wolf_Base : UAIState_DailyRoutine_Creature
{
    UPROPERTY()
    float WaypointRadius = 1300.0f;
    
    UDailyRoutine_Wolf_Base(float InWaypointRadius)
    {
        WaypointRadius = InWaypointRadius;
    }

    default Schedule(2, 0, UAIState_Wolf_Sleep(), Location::Spawnpoint, WaypointRadius);
    default Schedule(8, 0, UAIState_Wolf_Living_Afternoon(), Location::Spawnpoint, WaypointRadius);
}

class UDailyRoutine_Wolf_Patrol : UAIState_DailyRoutine_Creature
{
    UPROPERTY()
    float WaypointRadius = 1300.0f;
    
    UDailyRoutine_Wolf_Patrol(float InWaypointRadius)
    {
        WaypointRadius = InWaypointRadius;
    }

    default Schedule(2, 0, UAIState_Wolf_Sleep(), Location::Spawnpoint, WaypointRadius);
    default Schedule(8, 0, UAIState_Wolf_Living_Afternoon(), Location::Spawnpoint, WaypointRadius);
    default Schedule(20, 0, UAIState_WolfHuntRoute(), Location::Spawnpoint, WaypointRadius);
}

class UDailyRoutine_Wolf_Lay: UAIState_DailyRoutine_Creature
{
    UPROPERTY()
    float WaypointRadius = 2000.0f;
    
    UDailyRoutine_Wolf_Lay(float InWaypointRadius)
    {
        WaypointRadius = InWaypointRadius;
    }

    default Schedule(8, 0, UAIState_Wolf_Lay(), Location::Spawnpoint, WaypointRadius);
    default Schedule(0, 30, UAIState_Wolf_Sleep(), Location::Spawnpoint, WaypointRadius);
}

class UDailyRoutine_Wolf_Cohsel: UAIState_DailyRoutine_Creature
{
    UPROPERTY()
    float WaypointRadius = 3500.0f;
    
    UDailyRoutine_Wolf_Cohsel(float InWaypointRadius)
    {
        WaypointRadius = InWaypointRadius;
    }

    default Schedule(0, 30, UAIState_Wolf_Sleep(), n"FP_UL_Sleep_Wolf_Cohsel");
    default Schedule(8, 30, UAIState_Wolf_Lay(), n"FP_UL_Lay_Wolf_Cohsel3");
    default Schedule(10, 0, UAIState_Wolf_Lay(), n"FP_UL_Lay_Wolf_Cohsel4");
    default Schedule(13, 30, UAIState_Wolf_Lay(), n"FP_UL_Lay_Wolf_Cohsel3");
    default Schedule(19, 30, UAIState_Wolf_Lay(), n"FP_UL_Lay_Wolf_Cohsel4");
    default Schedule(22, 30, UAIState_Wolf_Lay(), n"FP_UL_Lay_Wolf_Cohsel3");

    default ScheduleIfRaining(8, 0, UAIState_Wolf_Lay(), n"FP_UL_Lay_Wolf_Cohsel2", WaypointRadius);
    default ScheduleIfRaining(0, 30, UAIState_Wolf_Sleep(), n"FP_UL_Lay_Wolf_Cohsel2", WaypointRadius);
}

class UAIState_Wolf_Sleep : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Sleep, InDurationSeconds = 120.0f));
}

class UAIState_Wolf_Lay : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, InDurationSeconds = 120.0f));
}

UCLASS()
class UAIState_Wolf_Living_Afternoon : UAIState_Roam 
{
    //default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_StandAround, 0.95f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Dig, 0.25f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Howl, 0.25f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Pee, 0.15f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.15f, 15.0f));
    //default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Shake, 0.1f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink, 0.15f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.15f, 30.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Smell, 0.15f, 30.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_LookAround, 0.15f, 30.0f));


    default ChanceToDoActionOnSpot = 0.75f;
    default SpotReachRadius = 300.0f;
}

UCLASS()
class UAIState_WolfHuntRoute : UAIState_FollowBreadcrumbs
{
    default FollowSpotsWithTag = GameplayTag::Breadcrumb_Forest_Path;

    void HandleArrivedAtBreadcrumb(FInteractionSpotHandle Breadcrumb) override
    {
        if (Math::RandRange(0, 100) > 80)
        {
            AI.Howl(Duration = 3.0f);
        }
    }
}
