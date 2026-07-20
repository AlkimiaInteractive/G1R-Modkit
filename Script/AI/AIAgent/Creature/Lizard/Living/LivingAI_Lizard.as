UCLASS()
class UGameplayAbility_CharacterAI_Lizard : UGameplayAbility_CreatureAI
{
    default ModeOfFleeOnUnfavorableCombat = EFleeOnUnfavorableCombatMode::OnUnfavorable_PredatorOnly;
    default InitialDailyRoutineClass = UDailyRoutine_Lizard::StaticClass();
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Lizard::StaticClass());
}

class UDailyRoutine_Lizard : UAIState_DailyRoutine_Creature
{
    float radius = 2000.0f;

    UDailyRoutine_Lizard(float Inradius)
    {
        radius = Inradius;
    }
    
    default Schedule(7, 0, UAIState_Lizard_Living_Day(), Location::Spawnpoint, radius);
    default Schedule(23, 0, UAIState_Lizard_Living_Night(), Location::Spawnpoint, radius);
}

UCLASS()
class UAIState_Lizard_Living_Day : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Dig, 0.2f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Roar, 0.2f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.35f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink, 0.15f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.15f, 20.0f));

    default ChanceToDoActionOnSpot = 0.75f;
    default SpotReachRadius = 300.0f;
}

class UAIState_Lizard_Living_Night : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Sleep, 0.6f, InDurationSeconds = 120.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.4f, InDurationSeconds = 20.0f));
}