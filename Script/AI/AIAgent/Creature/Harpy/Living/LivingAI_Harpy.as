UCLASS()
class UGameplayAbility_CharacterAI_Harpy : UGameplayAbility_CreatureAI
{
    default ModeOfFleeOnUnfavorableCombat = EFleeOnUnfavorableCombatMode::OnUnfavorable_PredatorOnly;  
    default InitialDailyRoutineClass = UDailyRoutine_Harpy;
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Harpy);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Warning_Threat, UAIState_Warning_Harpy);

    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_UseFlyingWeapon());
}

UCLASS()
class UGameplayAbility_CharacterAI_Harpy_Sleeper : UGameplayAbility_CharacterAI_Harpy
{
    default ModeOfFleeOnUnfavorableCombat = EFleeOnUnfavorableCombatMode::Never;
    default EngageConflictDistance = 50000;
}

class UDailyRoutine_Harpy : UAIState_DailyRoutine_Creature
{
    UPROPERTY()
    float WaypointRadius = 1000.0f;
    
    UDailyRoutine_Harpy(float InWaypointRadius)
    {
        WaypointRadius = InWaypointRadius;
    }

    default Schedule(2, 0, UAIState_Harpy_Living_Day(), Location::Spawnpoint, WaypointRadius);
    default Schedule(14, 0, UAIState_Harpy_Living_Afternoon(), Location::Spawnpoint, WaypointRadius);
    //default Schedule(20, 0, UAIState_HarpySniffRoute(), Location::Spawnpoint);
}

UCLASS()
class UAIState_Harpy_Living_Day :UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.05f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_LayDown, 0.05f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.4f, 19.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Roar, 0.4f, 3.20f));

    default ChanceToDoActionOnSpot = 0.75f;
    default SpotReachRadius = 300.0f;
}

UCLASS()
class UAIState_Harpy_Living_Afternoon : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.05f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_LayDown, 0.05f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.4f, 19.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Roar, 0.4f, 3.20f));

    default ChanceToDoActionOnSpot = 0.75f;
    default SpotReachRadius = 300.0f;
}

UCLASS()
class UAIState_Harpy_Living_Night : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.05f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_LayDown, 0.05f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.4f, 19.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Roar, 0.4f, 3.20f));

    default ChanceToDoActionOnSpot = 0.75f;
    default SpotReachRadius = 300.0f;
}