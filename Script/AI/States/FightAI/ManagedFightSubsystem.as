struct FManagedFightMemberHandle
{
    AGothicCharacterState CharacterState;
    int TeamId = 0;
}

struct FManagedFightGroup
{
    int GroupId = -1;
    TArray<FManagedFightMemberHandle> MemberHandles;
}

class UManagedFightSubsystem : UScriptWorldSubsystem
{
    private TArray<FManagedFightGroup> TrainingGroups;
    private TArray<FManagedFightGroup> PettyGroups;
    private int NextGroupId = 1;

    bool StartTrainingFight(AGothicCharacterState Starter, AGothicCharacterState Target,
        AGothicCharacterState Ally = nullptr)
    {
        if (!IsFreeOrNotInGroup(PettyGroups, Starter)
            || !IsFreeOrNotInGroup(PettyGroups, Target)
            || (IsValid(Ally) && !IsFreeOrNotInGroup(PettyGroups, Ally)))
        {
            // A participant is in a petty fight
            return false;
        }

        return StartManagedFight(TrainingGroups, Starter, Target, Ally);
    }

    bool StartPettyFight(AGothicCharacterState Starter, AGothicCharacterState Target,
        AGothicCharacterState Ally = nullptr)
    {
        if (!IsFreeOrNotInGroup(TrainingGroups, Starter)
            || !IsFreeOrNotInGroup(TrainingGroups, Target)
            || (IsValid(Ally) && !IsFreeOrNotInGroup(TrainingGroups, Ally)))
        {
            // A participant is in a training fight
            return false;
        }

        return StartManagedFight(PettyGroups, Starter, Target, Ally);
    }

    /**
    * Organic join exists ONLY for petty fights — there is deliberately no training
    * counterpart, so the "training fights can't be joined" rule is enforced by the
    * API surface, not by a check.
    */
    bool JoinPettyFightOf(AGothicCharacterState Joiner, AGothicCharacterState Member,
        bool bAsAlly)
    {
        if (IsInAnyManagedFight(Joiner))
            return false;

        return JoinManagedFightOf(PettyGroups, Joiner, Member, bAsAlly);
    }

    /**
     * Removes a single character from their petty fight. If the
     * remaining members would include no AI participants (or the group otherwise
     * stops being a fight: fewer than two members, or only one team left), the
     * whole fight ends.
     */
    void LeavePettyFight(const AGothicCharacterState CharacterState)
    {
        LeaveManagedFight(PettyGroups, CharacterState);
    }

    /**
     * Removes a single character from their training fight. If the
     * remaining members would include no AI participants (or the group otherwise
     * stops being a fight: fewer than two members, or only one team left), the
     * whole fight ends.
     */
    void LeaveTrainingFight(const AGothicCharacterState CharacterState)
    {
        LeaveManagedFight(TrainingGroups, CharacterState);
    }

    /** Ends the entire petty fight the character is part of */
    void EndPettyFightOf(AGothicCharacterState CharacterState)
    {
        EndManagedFightOf(PettyGroups, CharacterState);
    }

    /** Ends the entire training fight the character is part of */
    void EndTrainingFightOf(AGothicCharacterState CharacterState)
    {
        EndManagedFightOf(TrainingGroups, CharacterState);
    }

    /** True if the characterstate is currently in a Petty Fight group */
    bool IsInPettyFight(const AGothicCharacterState CharacterState) const
    {
        return IsInManagedFight(PettyGroups, CharacterState);
    }

    /** True if A and B are in the same petty fight on OPPOSING teams. */
    bool IsInPettyFightAgainst(const AGothicCharacterState CharacterStateA, const AGothicCharacterState CharacterStateB) const
    {
        return IsInManagedFightAgainst(PettyGroups, CharacterStateA, CharacterStateB);
    }

    /** True if CharacterStateA and CharacterStateB are in the same petty fight on the SAME team (allies). */
    bool IsInPettyFightWith(const AGothicCharacterState CharacterStateA, const AGothicCharacterState CharacterStateB) const
    {
        return IsInManagedFightWith(PettyGroups, CharacterStateA, CharacterStateB);
    }

    /** True if the characterstate is currently in a Training Fight group */
    bool IsInTrainingFight(const AGothicCharacterState CharacterState) const
    {
        return IsInManagedFight(TrainingGroups, CharacterState);
    }

    /** True if A and B are in the same training fight on OPPOSING teams. */
    bool IsInTrainingFightAgainst(const AGothicCharacterState CharacterStateA, const AGothicCharacterState CharacterStateB) const
    {
        return IsInManagedFightAgainst(TrainingGroups, CharacterStateA, CharacterStateB);
    }

    /** True if CharacterStateA and CharacterStateB are in the same training fight on the SAME team (allies). */
    bool IsInTrainingFightWith(const AGothicCharacterState CharacterStateA, const AGothicCharacterState CharacterStateB) const
    {
        return IsInManagedFightWith(TrainingGroups, CharacterStateA, CharacterStateB);
    }

    /** All current opponents of Character within their petty fight, if any. */
    void GetPettyOpponents(const AGothicCharacterState CharacterState, TArray<AGothicCharacterState>&out OutOpponents) const
    {
        GetManagedFightOpponents(PettyGroups, CharacterState, OutOpponents);
    }

    /** All current opponents of Character within their training fight, if any. */
    void GetTrainingOpponents(const AGothicCharacterState CharacterState, TArray<AGothicCharacterState>&out OutOpponents) const
    {
        GetManagedFightOpponents(TrainingGroups, CharacterState, OutOpponents);
    }

    private void LeaveManagedFight(TArray<FManagedFightGroup>& Groups, const AGothicCharacterState CharacterState)
    {
        int GroupIndex = FindGroupIndexOf(Groups, CharacterState);
        if (GroupIndex == -1)
            return;

        for (int MemberHandleIndex = Groups[GroupIndex].MemberHandles.Num() - 1; MemberHandleIndex >= 0; --MemberHandleIndex)
        {
            if (Groups[GroupIndex].MemberHandles[MemberHandleIndex].CharacterState == CharacterState)
            {
                Groups[GroupIndex].MemberHandles.RemoveAt(MemberHandleIndex);
                break;
            }
        }

        // Petty fight is still ongoing
        if (IsViableGroup(PettyGroups[GroupIndex]))
            return;
        
        PettyGroups.RemoveAt(GroupIndex);
    }

    
    private void EndManagedFightOf(TArray<FManagedFightGroup>& Groups, AGothicCharacterState CharacterState)
    {
        int GroupIndex = FindGroupIndexOf(Groups, CharacterState);

        // The character isn't actually in a fight of that group type
        if (GroupIndex == -1)
            return;

        Groups.RemoveAt(GroupIndex);
    }

    private bool IsInManagedFight(const TArray<FManagedFightGroup>& Groups, const AGothicCharacterState CharacterState) const
    {
        return FindGroupIndexOf(Groups, CharacterState) != -1;
    }

    private bool IsInManagedFightAgainst(const TArray<FManagedFightGroup>& Groups, const AGothicCharacterState CharacterStateA, const AGothicCharacterState CharacterStateB) const
    {
        int TeamA = 0;
        int TeamB = 0;
        int GroupA = FindGroupAndTeamOf(Groups, CharacterStateA, TeamA);

        if (GroupA == -1)
            return false;

        int GroupB = FindGroupAndTeamOf(Groups, CharacterStateB, TeamB);
        return GroupA == GroupB && TeamA != TeamB;
    }

    private bool IsInManagedFightWith(const TArray<FManagedFightGroup>& Groups, const AGothicCharacterState CharacterStateA, const AGothicCharacterState CharacterStateB) const
    {
        int TeamA = 0;
        int TeamB = 0;
        int GroupA = FindGroupAndTeamOf(Groups, CharacterStateA, TeamA);

        if (GroupA == -1)
            return false;
        
        int GroupB = FindGroupAndTeamOf(Groups, CharacterStateB, TeamB);
        return GroupA == GroupB && TeamA == TeamB && CharacterStateA != CharacterStateB;
    }

    private void GetManagedFightOpponents(const TArray<FManagedFightGroup>& Groups, const AGothicCharacterState CharacterState,
        TArray<AGothicCharacterState>&out OutOpponents) const
    {
        OutOpponents.Empty();

        int Team = 0;
        int GroupIndex = FindGroupAndTeamOf(Groups, CharacterState, Team);
        if (GroupIndex == -1)
            return;

        for (FManagedFightMemberHandle MemberHandle : Groups[GroupIndex].MemberHandles)
        {
            if (!IsValid(MemberHandle.CharacterState) || MemberHandle.TeamId == Team)
                continue;

            OutOpponents.Add(MemberHandle.CharacterState);
        }
    }

    /**
    * Starter begins a managed fight against Target. All effects are immediate.
    *
    * Without Ally (nullptr):
    *   - Neither in a fight        -> new group; Starter team 0, Target team 1.
    *   - Target already in a fight -> Starter joins Target's group on a NEW team.
    *   - Starter in a fight, Target free -> Target joins Starter's group on a new team.
    *   - Both in the SAME fight    -> no-op (returns whether they oppose).
    *   - Both in DIFFERENT fights  -> rejected; merge is not defined.
    *
    * With Ally:
    *   - Ally in a fight -> Starter joins Ally's TEAM in Ally's group. Target must be
    *     an opponent of Ally in that group, or free (then Target joins on a new team
    *     of their own). Starter must be free.
    *   - Ally NOT in a fight -> rejected (Variant A). See the commented Variant B
    *     block below for team-start semantics instead.
    *
    * Returns true if, when the call returns, Starter and Target are opponents in the
    * same managed fight.
    */
    private bool StartManagedFight(TArray<FManagedFightGroup>& Groups, AGothicCharacterState Starter, AGothicCharacterState Target, AGothicCharacterState Ally = nullptr)
    {
        if (!IsValid(Starter) || !IsValid(Target) || Starter == Target)
            return false;

        PruneInvalidMembers();

        int StarterGroup = FindGroupIndexOf(Groups, Starter);
        int TargetGroup = FindGroupIndexOf(Groups, Target);

        // If an Ally is passed, attempt to put Starter on Ally's team. Can only join Ally team if not in a training fight group already
        if (IsValid(Ally) && Ally != Starter && Ally != Target && StarterGroup == -1)
        {
            int AllyTeam = 0;
            int AllyGroup = FindGroupAndTeamOf(Groups, Ally, AllyTeam);

            // Can't proceed if target and ally are in different active training fights
            if (TargetGroup == -1 || TargetGroup == AllyGroup)
            {
                if (AllyGroup != -1)
                {
                    if (TargetGroup == AllyGroup)
                    {
                        int TargetTeam = 0;
                        FindGroupAndTeamOf(Groups, Target, TargetTeam);
                        // Something went wrong if Target and Ally are already in a training fight as allies
                        if (TargetTeam == AllyTeam)
                            return false;
                    }

                    AddMemberToGroup(Groups, AllyGroup, Starter, AllyTeam);

                    if (TargetGroup == -1)
                    {
                        AddMemberToGroup(Groups, AllyGroup, Target, GetNextFreeTeamId(Groups[AllyGroup]));
                    }

                    return true;
                }
            }

            // Ally is NOT in a fight or could not join Ally team
            // Simply start the fight as if there was no ally.
        }

        // NO ALLY

        // Starter and Target are free: create a fresh two-team group.
        if (StarterGroup == -1 && TargetGroup == -1)
        {
            FManagedFightGroup Group;
            Group.GroupId = NextGroupId;
            NextGroupId++;
            Groups.Add(Group);
            int NewIdx = Groups.Num() - 1;
            AddMemberToGroup(Groups, NewIdx, Starter, 0);
            AddMemberToGroup(Groups, NewIdx, Target, 1);
            return true;
        }

        // Same group already: nothing to change.
        if (StarterGroup == TargetGroup)
            return IsInTrainingFightAgainst(Starter, Target);

        // In different existing fights
        if (StarterGroup != -1 && TargetGroup != -1)
            return false;

        // Exactly one side is already fighting: the free character joins that group
        // on a new team of their own.
        int GroupIdx = (TargetGroup != -1) ? TargetGroup : StarterGroup;
        AGothicCharacterState Joiner = (TargetGroup != -1) ? Starter : Target;
        AddMemberToGroup(Groups, GroupIdx, Joiner, GetNextFreeTeamId(Groups[GroupIdx]));
        return true;
    }

    private bool JoinManagedFightOf(TArray<FManagedFightGroup>&inout Groups,
        AGothicCharacterState Joiner, AGothicCharacterState Member,
        bool bAsAlly)
    {
        if (!IsValid(Joiner) || !IsValid(Member) || Joiner == Member)
            return false;

        PruneInvalidMembers();

        // Cannot join if already in a fight
        if (FindGroupIndexOf(Groups, Joiner) != -1)
            return false;

        int MemberTeam = 0;
        int GroupIdx = FindGroupAndTeamOf(Groups, Member, MemberTeam);
        if (GroupIdx == -1)
        {
            // Trying to join a fight that has already ended
            return false;
        }

        AddMemberToGroup(Groups, GroupIdx, Joiner, bAsAlly ? MemberTeam : GetNextFreeTeamId(Groups[GroupIdx]));
        return true;
    }

    private bool IsInAnyManagedFight(const AGothicCharacterState Character) const
    {
        return FindGroupIndexOf(TrainingGroups, Character) != -1
            || FindGroupIndexOf(PettyGroups, Character) != -1;
    }

    // At the top of each public start, before the store-specific logic, every
    // involved character that the logic expects to be FREE must be free of BOTH
    // groups. The generic core then only ever sees its own store:
    private bool IsFreeOrNotInGroup(const TArray<FManagedFightGroup>&in Group,
        const AGothicCharacterState Character) const
    {
        return FindGroupIndexOf(Group, Character) == -1;
    }

    /**
     * A group remains a fight only if it has at least two members, at least two
     * teams, and at least one AI participant. The AI rule intentionally applies on
     * every mutation, not just LeaveTrainingFight: a fight consisting of the player
     * alone (e.g. after opponents were destroyed) is equally meaningless.
     */
    private bool IsViableGroup(const FManagedFightGroup&in Group) const
    {
        if (Group.MemberHandles.Num() < 2)
            return false;

        int FirstTeam = Group.MemberHandles[0].TeamId;
        bool bMultipleTeams = false;
        bool bHasAI = false;

        for (FManagedFightMemberHandle MemberHandle : Group.MemberHandles)
        {
            if (!IsValid(MemberHandle.CharacterState))
                continue;

            if (MemberHandle.TeamId != FirstTeam)
            {
                bMultipleTeams = true;
            }

            if (IsValid(MemberHandle.CharacterState.Character) && !MemberHandle.CharacterState.Character.IsPlayerCharacterOrPlayerControlled())
            {
                bHasAI = true;
            }
        }

        return bMultipleTeams && bHasAI;
    }

    /** Drops destroyed/streamed-out members and collapses groups that stop qualifying. */
    private void PruneInvalidMembers()
    {
        PruneInvalidMembersOfGroups(TrainingGroups);
        PruneInvalidMembersOfGroups(PettyGroups);
    }

    private void PruneInvalidMembersOfGroups(TArray<FManagedFightGroup>& Groups)
    {
        for (int GroupIndex = Groups.Num() - 1; GroupIndex >= 0; --GroupIndex)
        {
            for (int MemberHandleIndex = Groups[GroupIndex].MemberHandles.Num() - 1; MemberHandleIndex >= 0; --MemberHandleIndex)
            {
                auto CharacterState = Groups[GroupIndex].MemberHandles[MemberHandleIndex].CharacterState;
                if (!IsValid(CharacterState))
                {
                    Groups[GroupIndex].MemberHandles.RemoveAt(MemberHandleIndex);
                    continue;
                }

                UGameplayAbility_CharacterAI_Gothic GothicAI = Cast<UGameplayAbility_CharacterAI_Gothic>(CharacterState.AI);
                if (!IsValid(GothicAI))
                    continue;

                if (GothicAI.HasPendingScheduledState())
                    continue;

                if (!CharacterState.HasGameplayTag(GameplayTag::AIState_DailyRoutine))
                    continue;                
                
                Groups[GroupIndex].MemberHandles.RemoveAt(MemberHandleIndex);                
            }
            if (IsViableGroup(Groups[GroupIndex]))
                continue;

            Groups.RemoveAt(GroupIndex);
        }
    }

    private int FindGroupIndexOf(const TArray<FManagedFightGroup>&in Groups, const AGothicCharacterState Character) const
    {
        int Unused = 0;
        return FindGroupAndTeamOf(Groups, Character, Unused);
    }

    private int FindGroupAndTeamOf(const TArray<FManagedFightGroup>&in Groups, const AGothicCharacterState Character, int&out OutTeamId) const
    {
        OutTeamId = -1;
        if (!IsValid(Character))
            return -1;

        for (int GroupIndex = 0; GroupIndex < Groups.Num(); ++GroupIndex)
        {
            for (FManagedFightMemberHandle MemberHandle : Groups[GroupIndex].MemberHandles)
            {
                if (MemberHandle.CharacterState != Character)
                    continue;
                
                OutTeamId = MemberHandle.TeamId;
                return GroupIndex;
            }
        }
        return -1;
    }

    private int GetNextFreeTeamId(const FManagedFightGroup&in Group) const
    {
        int Max = -1;
        for (FManagedFightMemberHandle MemberHandle : Group.MemberHandles)
        {
            Max = Math::Max(Max, MemberHandle.TeamId);
        }

        return Max + 1;
    }

    private void AddMemberToGroup(TArray<FManagedFightGroup>& Groups, int GroupIndex, AGothicCharacterState CharacterState, int TeamId)
    {
        FManagedFightMemberHandle MemberHandle;
        MemberHandle.CharacterState = CharacterState;
        MemberHandle.TeamId = TeamId;
        Groups[GroupIndex].MemberHandles.Add(MemberHandle);
    }

    // =============================================================================
    // Debug — flat ImGui, Text/Separator only
    // =============================================================================

#if WITH_IMGUI
    void DrawImGuiDebug()
    {
        ImGui::Text(f"Training fights: {TrainingGroups.Num()}");
        for (FManagedFightGroup& Group : TrainingGroups)
        {
            ImGui::Separator();
            ImGui::Text(f"Group {Group.GroupId} ({Group.MemberHandles.Num()} members)");
            for (FManagedFightMemberHandle& MemberHandle : Group.MemberHandles)
            {
                if (IsValid(MemberHandle.CharacterState))
                {
                    ImGui::Text(f"    Team {MemberHandle.TeamId}: {MemberHandle.CharacterState.GetName()}");
                }
                else
                {
                    ImGui::Text("    <invalid member>");
                }
            }
        }

        ImGui::Text(f"Petty fights: {PettyGroups.Num()}");
        for (FManagedFightGroup& Group : PettyGroups)
        {
            ImGui::Separator();
            ImGui::Text(f"Group {Group.GroupId} ({Group.MemberHandles.Num()} members)");
            for (FManagedFightMemberHandle& MemberHandle : Group.MemberHandles)
            {
                if (IsValid(MemberHandle.CharacterState))
                {
                    ImGui::Text(f"    Team {MemberHandle.TeamId}: {MemberHandle.CharacterState.GetName()}");
                }
                else
                {
                    ImGui::Text("    <invalid member>");
                }
            }
        }
    }
#endif
}

/** True if the character is part of a training group within the ManagedFightSubsystem */
mixin bool IsInTrainingFight(const AGothicCharacterState CharacterState)
{
    auto ManagedFightSubsystem = UManagedFightSubsystem::Get();
    return ManagedFightSubsystem.IsInTrainingFight(CharacterState);
}

/** True if A and B are in the same training fight on OPPOSING teams. */
mixin bool IsInTrainingFightAgainst(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState)
{
    auto ManagedFightSubsystem = UManagedFightSubsystem::Get();
    return ManagedFightSubsystem.IsInTrainingFightAgainst(CharacterState, OtherCharacterState);
}

/** True if CharacterStateA and CharacterStateB are in the same training fight on the SAME team (allies). */
mixin bool IsInTrainingFightWith(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState)
{
    auto ManagedFightSubsystem = UManagedFightSubsystem::Get();
    return ManagedFightSubsystem.IsInTrainingFightWith(CharacterState, OtherCharacterState);
}

/** Character leaves its current training fight group if in any */
mixin void LeaveTrainingFight(const AGothicCharacterState CharacterState)
{
    auto ManagedFightSubsystem = UManagedFightSubsystem::Get();
    ManagedFightSubsystem.LeaveTrainingFight(CharacterState);
}

/** True if the character is part of a petty group within the ManagedFightSubsystem */
mixin bool IsInPettyFight(const AGothicCharacterState CharacterState)
{
    auto ManagedFightSubsystem = UManagedFightSubsystem::Get();
    return ManagedFightSubsystem.IsInPettyFight(CharacterState);
}

/** True if A and B are in the same petty fight on OPPOSING teams. */
mixin bool IsInPettyFightAgainst(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState)
{
    auto ManagedFightSubsystem = UManagedFightSubsystem::Get();
    return ManagedFightSubsystem.IsInPettyFightAgainst(CharacterState, OtherCharacterState);
}

/** True if CharacterStateA and CharacterStateB are in the same petty fight on the SAME team (allies). */
mixin bool IsInPettyFightWith(const AGothicCharacterState CharacterState, const AGothicCharacterState OtherCharacterState)
{
    auto ManagedFightSubsystem = UManagedFightSubsystem::Get();
    return ManagedFightSubsystem.IsInPettyFightWith(CharacterState, OtherCharacterState);
}

/** Character leaves its current petty fight group if in any */
mixin void LeavePettyFight(const AGothicCharacterState CharacterState)
{
    auto ManagedFightSubsystem = UManagedFightSubsystem::Get();
    ManagedFightSubsystem.LeavePettyFight(CharacterState);
}