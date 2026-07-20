UCLASS()
class UGameplayAbility_CharacterAI_Bloodfly : UGameplayAbility_CreatureAI
{
    default ModeOfFleeOnUnfavorableCombat = EFleeOnUnfavorableCombatMode::OnUnfavorable_PredatorOnly;

    default InitialDailyRoutineClass = UDailyRoutine_Bloodfly::StaticClass();

    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Bloodfly::StaticClass());
}

class UDailyRoutine_Bloodfly : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Bloodfly_Living_Day(), Location::Spawnpoint, 1000.0f);
    default Schedule(23, 0, UAIState_Bloodfly_Living_Night(), Location::Spawnpoint, 1000.0f);
}

class UDailyRoutine_Bloodfly_Short : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Bloodfly_Living_Day(), Location::Spawnpoint, 700.0f);
    default Schedule(23, 0, UAIState_Bloodfly_Living_Night(), Location::Spawnpoint, 700.0f);
}

UCLASS()
class UAIState_Bloodfly_Living_Day : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.25f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, 0.15f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Roar, 0.15f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Hunt, 0.15f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Clean, 0.15f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Shake, 0.15f, 30.0f));

    default ChanceToDoActionOnSpot = 0.75f;
    default SpotReachRadius = 300.0f;
}

class UAIState_Bloodfly_Living_Night : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Sleep, 0.5f, InDurationSeconds = 30.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.5f, InDurationSeconds = 15.0f));
}