UCLASS()
class UGameplayAbility_CharacterAI_Scavenger : UGameplayAbility_CreatureAI
{
    default ModeOfFleeOnUnfavorableCombat = EFleeOnUnfavorableCombatMode::Always_PredatorOnly;

    default InitialDailyRoutineClass = UDailyRoutine_Scavenger::StaticClass();
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Scavenger_Young);
}

UCLASS()
class UGameplayAbility_CharacterAI_Scavenger_Medium : UGameplayAbility_CreatureAI
{
    default ModeOfFleeOnUnfavorableCombat = EFleeOnUnfavorableCombatMode::Always_PredatorOnly;

    default InitialDailyRoutineClass = UDailyRoutine_Scavenger::StaticClass();
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Scavenger_Medium::StaticClass());
    default SetAIStateClassForType(GameplayTag::AIState_InteractWithItem_Meatbug, UAIState_InteractWithMeatbug);

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        Super::SetupPerceptions(Perception);
        
        // BindAssessmentToPerception(Perception.SeenMeatbug(), WhenGained = GameplayTag::AIEvent_Seen_Meatbug);
    }
}

UCLASS()
class UGameplayAbility_CharacterAI_Scavenger_Adult : UGameplayAbility_CreatureAI
{
    default ModeOfFleeOnUnfavorableCombat = EFleeOnUnfavorableCombatMode::Always_PredatorOnly;

    default InitialDailyRoutineClass = UDailyRoutine_Scavenger::StaticClass();
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Scavenger_Adult::StaticClass());   
}

class UDailyRoutine_Scavenger : UAIState_DailyRoutine_Creature
{
    UPROPERTY()
    float WaypointRadius = 1500.0f;
 
    UDailyRoutine_Scavenger(float InWaypointRadius)
    {
        WaypointRadius = InWaypointRadius;
    }
    default Schedule(7, 0, UAIState_Scavenger_Living_Day(), Location::Spawnpoint, WaypointRadius);
    default Schedule(23, 0, UAIState_Scavenger_Living_Night(), Location::Spawnpoint, WaypointRadius);
}

UCLASS()
class UAIState_Scavenger_Living_Day : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.70f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink, 0.10f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Roar, 0.1f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Shake, 0.05f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_ScratchEar, 0.05f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Dig, 0.1f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.1f, 15.0f));


    default ChanceToDoActionOnSpot = 0.75f;
    default SpotReachRadius = 300.0f;

    // if character wants to go to a spot with one of these tags, it will always start a random interaction here. 
    // If you want this specific interaction to start, only add this tag as PossibleAction to the spot
    default AlwaysStartInteractionOnSpotWithInteractions.AddTag(GameplayTag::Action_Ambient_Eat);
}

class UAIState_Scavenger_Living_Night : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Sleep, InDurationSeconds = 120.0f));
}
