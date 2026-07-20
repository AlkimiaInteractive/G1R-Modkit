UCLASS()
class UGameplayAbility_CharacterAI_Gomez : UGameplayAbility_CharacterAI_Human
{
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Warning_Threat, UAIState_Warning_Human::StaticClass());
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Human_Gomez::StaticClass());
}