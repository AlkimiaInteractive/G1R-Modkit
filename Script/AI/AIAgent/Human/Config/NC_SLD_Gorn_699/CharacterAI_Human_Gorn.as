UCLASS()
class UGameplayAbility_CharacterAI_Gorn : UGameplayAbility_CharacterAI_Human
{    
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Human_Gorn);
}