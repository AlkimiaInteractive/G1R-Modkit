UCLASS()
class UGameplayAbility_CharacterAI_ShadowBeast : UGameplayAbility_CreatureAI
{
    default InitialDailyRoutineClass = UDailyRoutine_ShadowBeast::StaticClass();
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_ShadowBeast::StaticClass());
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_TurnToAttacker, UAIState_TurnToAttacker_NoDisengage);
}

UCLASS()
class UGameplayAbility_CharacterAI_ShadowBeastPrime : UGameplayAbility_CreatureAI
{
    default InitialDailyRoutineClass = UDailyRoutine_ShadowBeast::StaticClass();
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_ShadowBeastPrime::StaticClass());
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_TurnToAttacker, UAIState_TurnToAttacker_NoDisengage);
}


class UDailyRoutine_ShadowBeast : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_ShadowBeast_Living_Day(), Location::Spawnpoint, 3000.0f);
    default Schedule(23, 0, UAIState_ShadowBeast_Living_Night(), Location::Spawnpoint, 3000.0f);
}

UCLASS()
class UAIState_ShadowBeast_Living_Day : UAIState_Roam 
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_SharpWeapon, 0.25f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Roar, 0.25f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Pee, 0.15f, 15.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Drink, 0.1f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Shake, 0.1f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Smell, 0.1f, 10.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.15f, 20.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_LookAround, 0.25f, 20.0f));

    default ChanceToDoActionOnSpot = 0.25f;
    default SpotReachRadius = 300.0f;
}

class UAIState_ShadowBeast_Living_Night : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Sleep, 0.6f, InDurationSeconds = 120.0f));
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Lay, 0.4f, InDurationSeconds = 15.0f));
}