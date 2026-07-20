UCLASS()
class UGameplayAbility_CharacterAI_Minecrawler_Nymph : UGameplayAbility_CreatureAI
{
    default InitialDailyRoutineClass = UDailyRoutine_Minecrawler;
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Minecrawler_Nymph);
}