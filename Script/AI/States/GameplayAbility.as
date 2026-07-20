UCLASS()
class UGameplayAbility_CharacterAI_BaalLukor : UGameplayAbility_CharacterAI_Human
{

    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Warning_Threat, UAIState_Warning_Human);
    default SetAIStateClassForType(GameplayTag::AIState_Conflict_Combat, UAIState_Combat_Human_BaalLukor);
    default ItemActionScoringEntryManager.Add(UAIItemScoringEntry_Spell_IncreasePriorityWithTimeSinceLastUse());
}

UCLASS()
class UGameplayAbility_CharacterAI_Immortality : UGameplayAbility_CharacterAI_Human
{
    default ActivationOwnedTags.AddTag(GameplayTag::State_UnKillable);
}