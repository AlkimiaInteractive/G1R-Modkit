UCLASS()
class UGameplayAbility_CharacterAI_OrcDog : UGameplayAbility_CreatureAI
{
    default ModeOfFleeOnUnfavorableCombat = EFleeOnUnfavorableCombatMode::OnUnfavorable_PredatorOnly;
    default InitialDailyRoutineClass = UDailyRoutine_OrcDog::StaticClass();
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_OrcDog::StaticClass());
}

class UDailyRoutine_OrcDog : UAIState_DailyRoutine_Creature
{
    float radius = 2000.0f;

    UDailyRoutine_OrcDog(float Inradius)
    {
        radius = Inradius;
    }

    default Schedule(6, 0, UAIState_OrcDog_Living_Day(), Location::Spawnpoint, radius);
    default Schedule(23, 55, UAIState_OrcDog_Living_Night(), Location::Spawnpoint, radius);
}

UCLASS()
class UAIState_OrcDog_Living_Day : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Dig, 0.1f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Roar, 0.1f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink, 10.15f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_ScratchEar, 0.15f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.1f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Pee, 0.15f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Shake, 0.05f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.10f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Smell, 0.15f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_LookAround, 0.15f, 20.0f));

    default ChanceToDoActionOnSpot = 0.75f;
    default SpotReachRadius = 300.0f;
}

class UAIState_OrcDog_Living_Night : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Sleep, 0.6f, InDurationSeconds = 120.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.4f, InDurationSeconds = 15.0f));
}
