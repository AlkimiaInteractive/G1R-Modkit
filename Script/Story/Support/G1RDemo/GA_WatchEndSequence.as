class UGA_WatchEndSequence : UGameplayAbility_AI
{
    default ActivationOwnedTags.AddTag(GameplayTag::State_NoInput_Character);
    default ActivationOwnedTags.AddTag(GameplayTag::State_PartOfCinematic);
    default ActivationOwnedTags.AddTag(GameplayTag::State_Movement_OverrideSpeedVolume);
    default ActivationOwnedTags.AddTag(GameplayTag::State_ForcedConversation_Ignore);
    default ActivationOwnedTags.AddTag(GameplayTag::State_Movement_PreferStrafe);

    FName TopicToAct = n"Campfire_Drax_RatFord_Initial";

    UFUNCTION(BlueprintOverride)
    void ActivateAbility()
    {
        auto MoveTask = UAbilityTask_MoveRotateToLocation::MoveRotateToInteractiveObject(this, NAME_None, FInteractionSpotHandle(n"IO_EZ_CHAIR_4").Transform);
        MoveTask.OnTaskEnded.AddUFunction(this, n"HandleBenchReached");
        MoveTask.ReadyForActivation();

    }

    UFUNCTION()
    private void HandleBenchReached(UAbilityTaskGeneric Task, EGenericTaskResult Result)
    {
        if (Result != EGenericTaskResult::Success)
        {
            PrintError(f"{this.GetName()}: Character could not reach bench - did player not start NavMesh?", 15.f);
        }
        
        auto SitOnBench = TaskInteractWithSpot(this, FInteractionSpotHandle(n"IO_EZ_CHAIR_4"), GameplayTag::Action_Interact_Sit_Chair_Demo, -1.0f);
        SitOnBench.ReadyForActivation();

        auto WaitSeconds = TaskWaitSeconds(this, 3.0f);
        WaitSeconds.OnTaskEnded.AddUFunction(this, n"HandleStartedSitting");
        WaitSeconds.ReadyForActivation();
    }

    UFUNCTION()
    private void HandleStartedSitting(UAbilityTaskGeneric Task, EGenericTaskResult Result)
    {
        auto Drax = AGothicCharacterState::FindByUniqueName(n"G1R_Demo_0040_NC_Drax_0040");
        auto Ratford = AGothicCharacterState::FindByUniqueName(n"G1R_DEMO_0030_NC_RATFORD_0030");

        auto ActConversation = TaskAmbientConversation(Drax.AI, Ratford, UConversationTopic::FindTopicClassByName(TopicToAct));
        ActConversation.ReadyForActivation();
    }
}