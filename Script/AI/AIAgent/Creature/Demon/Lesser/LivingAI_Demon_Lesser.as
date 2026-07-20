UCLASS()
class UGameplayAbility_CharacterAI_Demon_Lesser : UGameplayAbility_CreatureAI 
{
    default InitialDailyRoutineClass = UDailyRoutine_Demon_Lesser::StaticClass();
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Demon_Lesser::StaticClass());
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_TurnToAttacker, UAIState_TurnToAttacker_NoDisengage);
}

class UDailyRoutine_Demon_Lesser : UAIState_DailyRoutine_Creature
{
    // default Schedule(6, 0, UAIState_OrcDog_Living_Day(), Location::Spawnpoint, 2000.0f);
    // default Schedule(23, 55, UAIState_OrcDog_Living_Night(), Location::Spawnpoint, 2000.0f);
}