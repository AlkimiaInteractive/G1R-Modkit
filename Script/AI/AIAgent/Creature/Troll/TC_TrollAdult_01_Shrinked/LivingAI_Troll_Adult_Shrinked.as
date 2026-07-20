
UCLASS()
class UGameplayAbility_CharacterAI_Troll_Adult_Shrinked : UGameplayAbility_CreatureAI
{
    default InitialDailyRoutineClass = UDailyRoutine_Troll_Adult_Shrinked_Base::StaticClass();
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Troll_Adult::StaticClass());
}

UCLASS()
class UGameplayAbility_CharacterAI_Troll_Adult_Shrinked_Test_Flee : UGameplayAbility_CreatureAI
{
    default InitialDailyRoutineClass = UDailyRoutine_Troll_Adult_Shrinked_Base::StaticClass();
}

class UDailyRoutine_Troll_Adult_Shrinked_Base : UAIState_DailyRoutine_Creature
{
    default Schedule(7, 0, UAIState_Troll_Adult_Shrinked_Living_Day(), Location::Spawnpoint,200);
}

UCLASS()
class UAIState_Troll_Adult_Shrinked_Living_Day : UAIState_RandomInteractions
{
    default Interactions.Add(FInteraction(GameplayTag::Action_Ambient_Eat, InDurationSeconds = 120.0f));
}

