UCLASS()
class UGameplayAbility_CharacterAI_Goblin : UGameplayAbility_CreatureAI
{
    default MaximumRangedAttackHorizontalDistance = 1000.0f;
    default bRangedAttackRequiresRangedWeapon = false;

    default SetAIStateClassForType(GameplayTag::AIState_InteractWithItem_PickUp, UAIState_InteractWithItem_PickUp);

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        Super::SetupPerceptions(Perception);

        Perception.OnHeardShinyItem().PerceptionGained.BindUFunction(this, n"PerceptionEvent_HeardItem");        
        Perception.OnHeardBoozeItem().PerceptionGained.BindUFunction(this, n"PerceptionEvent_HeardItem");        
        Perception.OnHeardDrugItem().PerceptionGained.BindUFunction(this, n"PerceptionEvent_HeardItem");        
        Perception.OnSeenShinyItem().PerceptionGained.BindUFunction(this, n"PerceptionEvent_SeenValuableItem");        
        Perception.OnSeenBoozeItem().PerceptionGained.BindUFunction(this, n"PerceptionEvent_SeenValuableItem");        
        Perception.OnSeenDrugItem().PerceptionGained.BindUFunction(this, n"PerceptionEvent_SeenValuableItem");
    }

    UFUNCTION()
    private void PerceptionEvent_HeardItem(const FRememberedPerception&in Perception,
                                               const FPerceptionShortTermMemory&in Memory)
    {
        if (!IsValid(Perception.PerceivedObject.ItemDefinition))
            return;
        
        if (Perception.EventTag.MatchesTag(GameplayTag::Perception_Character_Interaction))
            return;

        if (IsValid(Perception.Origin.CharacterState))
            return;

        if (!WouldEatItem(Perception.PerceivedObject.ItemDefinition))
            return;

        AssessEvent(GameplayTag::AIEvent_Heard_Noise_Item, Perception);
    }

    UFUNCTION()
    private void PerceptionEvent_SeenValuableItem(const FRememberedPerception&in Perception,
                                                  const FPerceptionShortTermMemory&in Memory)
    {
        if (!IsValid(Perception.PerceivedObject.ItemDefinition))
            return;

        if (IsValid(Perception.Origin.CharacterState))
            return;

        AssessEvent(GameplayTag::AIEvent_Seen_Item_Valuable, Perception);
    }
}