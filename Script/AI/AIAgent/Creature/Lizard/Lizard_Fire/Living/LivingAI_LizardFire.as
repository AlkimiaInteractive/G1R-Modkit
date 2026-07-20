UCLASS()
class UGameplayAbility_CharacterAI_Lizard_Fire : UGameplayAbility_CharacterAI_Lizard
{
    default InitialDailyRoutineClass = UDailyRoutine_Lizard::StaticClass();    
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Lizard_Fire::StaticClass());
}

UCLASS()
class UGameplayAbility_CharacterAI_Lizard_Fire_Prime : UGameplayAbility_CharacterAI_Lizard
{
    default InitialDailyRoutineClass = UDailyRoutine_Lizard::StaticClass();    
    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Lizard_Fire::StaticClass());
}