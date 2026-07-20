UCLASS()
class UAIGroup_StateEvent : UGothicAIGroup
{
    UPROPERTY()
    const int MaximumMembers = 3;

    UPROPERTY()
    const float MaximumPathLength = 3000.0f;

    UPROPERTY()
    const bool bAllowJoiningAfterActionHasStarted = true;

    UPROPERTY()
    const TSet<TSubclassOf<UAIGroup_StateEvent>> AllowTransitionFromGroups;

    UPROPERTY()
    const TSet<TSubclassOf<UAIGroup_StateEvent>> ShareMemberCountWithGroups;

    UPROPERTY()
    TSet<AGothicCharacterState> TargetedCharacterStates;

    UPROPERTY()
    AGothicCharacterState SourceCharacterState;

    UPROPERTY()
    AGothicCharacterState Leader;

    UPROPERTY()
    bool bAssociatedActionHasStarted = false;

    UFUNCTION(BlueprintOverride)
    bool IsCharacterAllowedToJoin(AGothicCharacter Character)
    {
        if (MaximumMembers > 0 && JoinedCharacters.Num() >= MaximumMembers)
            return false;
        
        return bAllowJoiningAfterActionHasStarted || !bAssociatedActionHasStarted;
    }

    UFUNCTION(BlueprintCallable)
    bool IsCharacterAllowedToJoinForTarget(AGothicCharacter Character, AGothicCharacter Target)
    {
        // Find all groups of the shared classes of the required group
        TArray<UGothicAIGroup> TransitionGroups;
        for (auto TransitionGroupClass : AllowTransitionFromGroups)
        {
            TransitionGroups.Append(UGothicAIGroup::GetAllActiveGroupsOfClass(TransitionGroupClass));
        }

        // If joining character is in any relevant group from which transitions are allowed, return true
        for (auto Group : TransitionGroups)
        {
            UAIGroup_StateEvent StateEventGroup = Cast<UAIGroup_StateEvent>(Group);
            if (!IsValid(StateEventGroup) ||(IsValid(Target) && !StateEventGroup.TargetedCharacterStates.Contains(Target.CharacterState)))
                continue;

            if (!StateEventGroup.IsCharacterAlreadyInGroup(Character))
                continue;

            return true;
        }
        
        if (!IsCharacterAllowedToJoin(Character))
            return false;

        // Find all groups of the shared classes of the required group
        TArray<UGothicAIGroup> SharedMemberCountGroups;
        for (auto SharedGroupClass : ShareMemberCountWithGroups)
        {
            SharedMemberCountGroups.Append(UGothicAIGroup::GetAllActiveGroupsOfClass(SharedGroupClass));
        }

        // If any relevant group with shared member counts makes this group full, return false
        for (auto Group : SharedMemberCountGroups)
        {
            UAIGroup_StateEvent StateEventGroup = Cast<UAIGroup_StateEvent>(Group);
            if (!IsValid(StateEventGroup) || (IsValid(Target) && !StateEventGroup.TargetedCharacterStates.Contains(Target.CharacterState)))
                continue;

            if (!StateEventGroup.IsCharacterAllowedToJoin(Character))
                return false;

            if (MaximumMembers > 0 && JoinedCharacters.Num() + StateEventGroup.JoinedCharacters.Num() >= MaximumMembers)
                return false;
        }

        return true;
    }

    UFUNCTION(BlueprintCallable)
    bool IsAnyRelevantSharedGroupActive()
    {
        // Find all groups of the shared classes of the required group
        TArray<UGothicAIGroup> SharedMemberCountGroups;
        for (auto SharedGroupClass : ShareMemberCountWithGroups)
        {
            SharedMemberCountGroups.Append(UGothicAIGroup::GetAllActiveGroupsOfClass(SharedGroupClass));
        }

        // If any relevant group with shared member counts makes this group full, return false
        for (auto Group : SharedMemberCountGroups)
        {
            UAIGroup_StateEvent StateEventGroup = Cast<UAIGroup_StateEvent>(Group);
            if (!IsValid(StateEventGroup) || (IsValid(SourceCharacterState) && !StateEventGroup.TargetedCharacterStates.Contains(SourceCharacterState)))
                continue;

            return true;
        }

        return false;
    }

    UFUNCTION(BlueprintCallable)
    bool IsCharacterAlreadyInGroup(AGothicCharacter Character)
    {
        return JoinedCharacters.Contains(Character);
    }

    UFUNCTION(BlueprintCallable)
    float CalculatePriorityForCharacter(AGothicCharacter Character)
    {
        return 1.0f;
    }

    UFUNCTION(BlueprintCallable)
    float GetDistanceOfCharacterToSourceCharacter(AGothicCharacter Character)
    {
        if (!IsValid(SourceCharacterState))
            return MAX_flt;

        float32 PathLength = MAX_flt;        
        if (UNavigationSystemV1::DoesPathExistWithinLengthLimit(Character, Character.NavAgentLocation, SourceCharacterState.Character.NavAgentLocation, MAX_flt, PathLength))
            return PathLength;

        return MAX_flt;
    }

    UFUNCTION(BlueprintCallable)
    float GetDistanceOfClosestMemberToSourceCharacter()
    {
        float Distance = MAX_flt;

        for (auto Member : JoinedCharacters)
        {
            float MemberDistance = GetDistanceOfCharacterToSourceCharacter(Member);
            if (MemberDistance >= MAX_flt)
                continue;

            Distance = MemberDistance;
        }

        return Distance;
    }

    UFUNCTION(BlueprintOverride)
    void HandleMemberJoined(AGothicCharacter Character)
    {
        // NEW MEMBER JOINED
    }

    UFUNCTION(BlueprintOverride)
    void HandleMemberLeft(AGothicCharacter Character)
    {
        if (Character.CharacterState == Leader)
        {
            Leader = nullptr;
        }
    }

    UFUNCTION(BlueprintOverride)
    TArray<AActor> GetGroupTargets() const
    {
        TArray<AActor> Targets;

        for (auto CharacterState : TargetedCharacterStates)
        {
            Targets.Add(CharacterState.Character);
        }

        return Targets;
    }
}