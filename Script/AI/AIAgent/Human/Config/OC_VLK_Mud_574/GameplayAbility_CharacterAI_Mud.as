UCLASS()
class UGameplayAbility_CharacterAI_Mud : UGameplayAbility_CharacterAI_Human
{
    default ActivationOwnedTags.AddTag(GameplayTag::Memory_Crime_Character_AlwaysReactNegatively);
    default ActivationOwnedTags.AddTag(GameplayTag::Memory_Crime_Character_NoSynchronizing);

    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Flee, UAIState_Disengage);
}