UCLASS()
class UGameplayAbility_CharacterAI_Razor : UGameplayAbility_CreatureAI
{
    default ModeOfFleeOnUnfavorableCombat = EFleeOnUnfavorableCombatMode::OnUnfavorable_PredatorOnly;
    default InitialDailyRoutineClass = UDailyRoutine_Razor::StaticClass();
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Razor::StaticClass());
}

class UDailyRoutine_Razor : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Razor_Living_Day(), Location::Spawnpoint, 2000.0f);
    default Schedule(23, 0, UAIState_Razor_Living_Night(), Location::Spawnpoint, 2000.0f);
}

UCLASS()
class UAIState_Razor_Living_Day : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Dig, 0.2f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Roar, 0.2f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.1f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink, 0.13f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.12f, 40.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Shake, 0.15f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Smell, 0.75f, 15.0f));


    default ChanceToDoActionOnSpot = 0.75f;
    default SpotReachRadius = 300.0f;
}

class UAIState_Razor_Living_Night : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Sleep, 0.6f, InDurationSeconds = 120.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.4f, InDurationSeconds = 25.0f));
}
