UCLASS()
class UAIState_Defeated : UAIState_Conflict
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_Defeated);
    default AIStateTag = GameplayTag::AIState_Conflict_Defeated;
    default AssessmentModuleClass = UAIARM_State_Defeated;

    UFUNCTION(BlueprintOverride)
    void DoTask()
    {
        auto ManagedFightSubsystem = UManagedFightSubsystem::Get();
        ManagedFightSubsystem.EndTrainingFightOf(CharacterState);

        Super::DoTask();
        
        while (Self.IsDefeated())
        {
            WaitOneTick();
        }

        /// Discard Enemy modifiers AFTER Defeated ends
        TArray<UActivePersonalRelationshipModifier> ToDiscard;
        for (auto Modifier : AI.Self.Relationship.ActivePersonalModifiers)
        {
            if (!Modifier.IsA(UActivePersonalRelationshipModifier_Enemy))
                continue;

            ToDiscard.Add(Modifier);
        }

        for (auto Modifier : ToDiscard)
        {
            Modifier.Discard();
        }

        /// Leave conflict
        AI.LeaveGroupsWithClass(UAIGroup_ConflictInstance);

        /// Finish State
        AI.AssessEvent(GameplayTag::AIEvent_State_Done, RememberedPerception);
        WaitSeconds(2.0f);
    }

    FString GetDisplayName() const override
    {
        return "Defeated State";
    }
}