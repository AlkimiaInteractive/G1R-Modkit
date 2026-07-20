class UAIState_Conversation : UGothicCharacterAIState
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conversation);

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        while (!bShouldExitState)
        {
            WaitSeconds(0.25f);
        }
    }

    UFUNCTION(BlueprintOverride)
    void OnDestroy(bool bInOwnerFinished)
    {
        if (!bInOwnerFinished)
        {
            AbilitySystemComponent.SendGameplayEvent(GameplayTag::End_Action_Conversation, FGameplayEventData());
        }

        auto GothicAI = Cast<UGameplayAbility_CharacterAI_Gothic>(AI);
        if (IsValid(GothicAI))
        {
            auto Storage = GothicAI.SpawnedStorage(UAIValueSet_BlockingPath);
            if (IsValid(Storage))
            {
                Storage.BlockingPathFrustrationCount = 0;
                Storage.BlockingPathNoLongerBlockedBurstCount = 0;
                Storage.bPostConversationGraceActive = true;
                Storage.PostConversationGraceStart = FInGameTime::Now();
            }
        }
    }
}