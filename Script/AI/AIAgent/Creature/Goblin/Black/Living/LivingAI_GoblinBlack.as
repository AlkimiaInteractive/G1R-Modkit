UCLASS()
class UGameplayAbility_CharacterAI_Goblin_Black : UGameplayAbility_CharacterAI_Goblin
{
    default ModeOfFleeOnUnfavorableCombat = EFleeOnUnfavorableCombatMode::OnUnfavorable_PredatorOnly;  
    default InitialDailyRoutineClass = UDailyRoutine_GoblinBlack::StaticClass();
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Goblin_Black::StaticClass());
}

class UDailyRoutine_GoblinBlack : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_GoblinBlack_Living_Day(), Location::Spawnpoint, 2000.0f);
    default Schedule(23, 0, UAIState_GoblinBlack_Living_Night(), Location::Spawnpoint, 2000.0f);
}

UCLASS()
class UAIState_GoblinBlack_Living_Day : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.20f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Howl, 0.10f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_ScratchEar, 0.10f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Pee, 0.15f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink, 0.15f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Interact_Sit_Chair, 0.15f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Smell, 0.2f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_LookAround, 0.2f, 20.0f));

    default ChanceToDoActionOnSpot = 0.75f;
    default SpotReachRadius = 300.0f;
}

UCLASS()
class UAIState_GoblinBlack_Living_Night : UAIState_Roam
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Sleep, 0.85f, InDurationSeconds = 120.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Pee, 0.15f, InDurationSeconds = 15.0f));
}