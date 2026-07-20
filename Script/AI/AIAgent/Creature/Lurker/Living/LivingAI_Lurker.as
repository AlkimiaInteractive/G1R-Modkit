UCLASS()
class UGameplayAbility_CharacterAI_Lurker : UGameplayAbility_CreatureAI
{
    default ModeOfFleeOnUnfavorableCombat = EFleeOnUnfavorableCombatMode::OnUnfavorable_PredatorOnly;
    default InitialDailyRoutineClass = UDailyRoutine_Lurker::StaticClass();

    default bCanReachSwimmingTargetFromLand = true;
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Lurker::StaticClass());
}

class UDailyRoutine_Lurker : UAIState_DailyRoutine_Creature
{
    UPROPERTY()
    float WaypointRadius = 1200.0f;
    
    UDailyRoutine_Lurker(float InWaypointRadius)
    {
        WaypointRadius = InWaypointRadius;
    }

    default Schedule(2, 0, UAIState_Lurker_Living_Day(), Location::Spawnpoint, WaypointRadius);
    default Schedule(21, 0, UAIState_Lurker_Living_Night(), Location::Spawnpoint, WaypointRadius);
}

UCLASS()
class UAIState_Lurker_Living_Day : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Dig, 0.1f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Roar, 0.1f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.2f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_ScratchEar, 0.1f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.1f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink, 0.2f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Shake, 0.2f, 30.0f));

    default ChanceToDoActionOnSpot = 0.75f;
    default SpotReachRadius = 300.0f;
}

class UAIState_Lurker_Living_Night : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Sleep, 0.65f, InDurationSeconds = 120.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.35f, InDurationSeconds = 15.0f));
}