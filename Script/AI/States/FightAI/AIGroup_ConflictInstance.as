UCLASS()
class UConflictInstanceNode
{
    UConflictInstanceNode(AGothicCharacter InCharacter)
    {
        Character = InCharacter;
    }

    UPROPERTY()
    const AGothicCharacter Character;

    UPROPERTY()
    TSet<AGothicCharacter> Connections;

    UPROPERTY()
    private bool bIsFleeing = false;

    UFUNCTION()
    void InitializeConnections()
    {
        if (!IsValid(Character))
            return;

        auto CharacterAI = Cast<UGameplayAbility_CharacterAI_Gothic>(Character.CharacterState.GetAI());
        if (!IsValid(CharacterAI))
            return;
                
        for (auto HostileCharacter : CharacterAI.GetSensedLivingHostiles())
        {
            Connections.Add(HostileCharacter);
        }

        for (auto EnemyCharacter : CharacterAI.GetSensedLivingEnemies())
        {
            Connections.Add(EnemyCharacter);
        }
    }

    UFUNCTION()
    void SetFleeing()
    {
        bIsFleeing = true;
    }

    UFUNCTION()
    void SetFighting()
    {
        bIsFleeing = false;
    }

    UFUNCTION()
    bool IsFleeing()
    {
        return bIsFleeing;
    }
}

enum EConflictType
{
    None,
    TrainingFight,
    PettyFight,
    TrueFight,
    DeadlyFight
}

/** Friend-equivalence class within a conflict group. Rep stands in for the team during joiner classification. */
UCLASS()
class UConflictTeam
{
    UPROPERTY()
    AGothicCharacter Rep;

    UPROPERTY()
    TSet<AGothicCharacter> Members;

    #if TEST
    #if WITH_IMGUI
    void DisplayImGui()
    {
        
        FName RepDisplayName = IsValid(Rep) ? Rep.CharacterUniqueName : n"Nullptr Rep";
        if (!ImGui::CollapsingHeader(f"Team {RepDisplayName}", false))
            return;

        for (auto Member : Members)
        {
            if (!IsValid(Member))
                continue;

            ImGui::Indent(10.0f);
            ImGui::TextColored(Member == Rep ? FColor::Green : FColor::White, f"{Member.CharacterUniqueName}");
            ImGui::Indent(-10.0f);
        }
    }
    #endif
    #endif    
}

/** Wrapper for outgoing team-vs-team hostility edges. */
UCLASS()
class UTeamHostilityEdges
{
    UPROPERTY()
    TSet<int> Targets;
}

UCLASS()
class UAIGroup_ConflictInstance : UGothicAIGroup
{
    default OwnedTagsToAddToMembers.AddTag(GameplayTag::State_Group_Conflict);
    
    UPROPERTY()
    TMap<AGothicCharacter, UConflictInstanceNode> InvolvedCharacterNodes;

    UPROPERTY()
    TArray<FCombatTauntRequestTags> ExecutedTauntRequests;

    UPROPERTY()
    private EConflictType _ConflictType = EConflictType::None;

    /** Friend-equivalence partition. Rebuilt lazily from _DirtyMembers. */
    UPROPERTY()
    private TArray<UConflictTeam> _Teams;

    /** Character -> _Teams idx. */
    UPROPERTY()
    private TMap<AGothicCharacter, int> _CharacterToTeamIdx;

    /** Members pending re-partition. Drained by RebuildTeamsIfDirty. */
    UPROPERTY()
    private TSet<AGothicCharacter> _DirtyMembers;

    /** AssessConflictGroupOf cache key. Bumped on partition mutations only. */
    UPROPERTY()
    private int _TeamStamp = 0;

    /** Directed team-vs-team hostility edges at member level.
     * Tracks if any member of one team is hostile to any member of another.
     * Captures one-sided aggression missed by team rep checks.
     */
    UPROPERTY()
    private TMap<int, UTeamHostilityEdges> _TeamHostility;

    UFUNCTION()
    EConflictType GetConflictType() const property
    {
        return _ConflictType;
    }

    UFUNCTION(BlueprintOverride)
    TArray<AActor> GetGroupTargets() const
    {
        TArray<AActor> Targets;
        for (auto Node : InvolvedCharacterNodes)
        {
            if (IsValid(Node.Value))
            {
                for (auto Connection : Node.Value.Connections)
                {
                    Targets.Add(Connection);
                }
            }
        }

        return Targets;
    }

    UFUNCTION()
    void EscalateConflictTo(EConflictType NewConflictType)
    {
        if (_ConflictType >= NewConflictType)
            return;

        _ConflictType = NewConflictType;
    }

    UFUNCTION(BlueprintOverride)
    void HandleMemberJoined(AGothicCharacter Character)
    {
        if (!IsValid(Character))
            return;

        CreateNewNodeForCharacter(Character);
    }    

    UFUNCTION(BlueprintOverride)
    void HandleMemberLeft(AGothicCharacter Character)
    {
        if (!IsValid(Character))
            return;

        UConflictInstanceNode Node;
        
        if (!InvolvedCharacterNodes.Find(Character, Node) || !IsValid(Node))
            return;

        Node.Connections.Reset();

        NodeCleanup();

        if (!InvolvedCharacterNodes.Contains(Character))
        {
            RemoveCharacterFromTeams(Character);
        }
        else
        {
            MarkMemberDirty(Character);
        }
    }

    UFUNCTION(BlueprintCallable)
    void RequestAddInvolvedCharacter(AGothicCharacter CharacterMakingRequest, AGothicCharacter CharacterToAdd)
    {
        UConflictInstanceNode RequesterNode;
        if (!InvolvedCharacterNodes.Find(CharacterMakingRequest, RequesterNode))
        {
            RequesterNode = CreateNewNodeForCharacter(CharacterMakingRequest);
        }

        if (!RequesterNode.Connections.Contains(CharacterToAdd))
        {
            RequesterNode.Connections.Add(CharacterToAdd);
        } 
        
        if (!InvolvedCharacterNodes.Contains(CharacterToAdd))
        {
            CreateNewNodeForCharacter(CharacterToAdd);
        }
    }

    UFUNCTION(BlueprintCallable)
    void RequestRemoveInvolvedCharacter(AGothicCharacter CharacterMakingRequest, AGothicCharacter CharacterToRemove)
    {
        UConflictInstanceNode Node;
        if (!InvolvedCharacterNodes.Find(CharacterMakingRequest, Node))
            return;

        Node.Connections.Remove(CharacterToRemove);

        NodeCleanup();

        if (!InvolvedCharacterNodes.Contains(CharacterToRemove))
        {
            RemoveCharacterFromTeams(CharacterToRemove);
        }
    }

    UFUNCTION()
    void ReportFleeingCharacter(const AGothicCharacter Character)
    {
        UConflictInstanceNode CharacterConflictNode;
        if (!InvolvedCharacterNodes.Find(Character, CharacterConflictNode))
            return;

        CharacterConflictNode.SetFleeing();
    }

    UFUNCTION()
    void ReportCharacterReturningToFight(const AGothicCharacter Character)
    {
        UConflictInstanceNode CharacterConflictNode;
        if (!InvolvedCharacterNodes.Find(Character, CharacterConflictNode))
            return;

        CharacterConflictNode.SetFighting();
    }

    UFUNCTION()
    void ReportTauntRequest(FCombatTauntRequestTags TauntRequestTags)
    {
        ExecutedTauntRequests.Add(TauntRequestTags);
    }

    ////////////////////////////////////////////////////////////////////////

    UFUNCTION()
    bool IsCharacterInvolved(const AGothicCharacter Character) const
    {
        return InvolvedCharacterNodes.Contains(Character);
    }

    UFUNCTION()
    bool IsCharacterFleeing(const AGothicCharacter Character) const
    {
        UConflictInstanceNode CharacterConflictNode;
        if (!InvolvedCharacterNodes.Find(Character, CharacterConflictNode))
            return false;

        return CharacterConflictNode.IsFleeing();
    }

    UFUNCTION()
    bool IsAnyInvolvedCharacterEnforcerOrLeaderRole() const
    {
        TSet<AGothicCharacter> CheckedCharacters;
        for (auto NodeKeyValuePair : InvolvedCharacterNodes)
        {
            auto Node = NodeKeyValuePair.Value;
            for (auto OtherCharacter : Node.Connections)
            {
                if (CheckedCharacters.Contains(OtherCharacter))
                    continue;
                
                CheckedCharacters.Add(OtherCharacter);
                if (OtherCharacter.CharacterState.IsEnforcerOrLeaderRole())
                    return true;
            }

            if (CheckedCharacters.Contains(Node.Character))
                continue;
            
            CheckedCharacters.Add(Node.Character);
            if (Node.Character.CharacterState.IsEnforcerOrLeaderRole())
                return true;
        }

        return false;
    }

    UFUNCTION()
    bool IsCharacterBeingWarnedByAnyone(const AGothicCharacter Character) const
    {
        if (!IsCharacterInvolved(Character))
            return false;

        TSet<AGothicCharacter> CheckedCharacters;
        for (auto NodeKeyValuePair : InvolvedCharacterNodes)
        {
            auto Node = NodeKeyValuePair.Value;
            for (auto OtherCharacter : Node.Connections)
            {
                if (CheckedCharacters.Contains(OtherCharacter))
                    continue;

                if (!IsValid(OtherCharacter))
                    continue;
                
                CheckedCharacters.Add(OtherCharacter);
                if (!OtherCharacter.HasGameplayTag(GameplayTag::AIState_Conflict_Warning))
                    continue;
                
                if (OtherCharacter.IsHostileTowards(Character))
                    return true;
            }

            if (!IsValid(Node.Character))
                continue;

            if (CheckedCharacters.Contains(Node.Character))
                continue;
            
            CheckedCharacters.Add(Node.Character);
            if (!Node.Character.HasGameplayTag(GameplayTag::AIState_Conflict_Warning))
                continue;
                
            if (Node.Character.IsHostileTowards(Character))
                return true;
        }

        return false;
    }

    UFUNCTION()
    bool IsAnyInvolvedCharacterEnforcerOrLeaderRoleAndFriendlyOf(const AGothicCharacter Character) const
    {
        TSet<AGothicCharacter> CheckedCharacters;
        for (auto NodeKeyValuePair : InvolvedCharacterNodes)
        {
            auto Node = NodeKeyValuePair.Value;
            for (auto OtherCharacter : Node.Connections)
            {
                if (CheckedCharacters.Contains(OtherCharacter))
                    continue;

                if (!IsValid(OtherCharacter))
                    continue;
                
                CheckedCharacters.Add(OtherCharacter);
                if (OtherCharacter.CharacterState.IsEnforcerOrLeaderRole() && Character.CharacterState.IsFriendlyTowards(OtherCharacter.CharacterState))
                    return true;
            }

            if (CheckedCharacters.Contains(Node.Character))
                continue;
            
            CheckedCharacters.Add(Node.Character);
            if (IsValid(Node.Character) && Node.Character.CharacterState.IsEnforcerOrLeaderRole() && Character.CharacterState.IsFriendlyTowards(Node.Character.CharacterState))
                return true;
        }

        return false;
    }

    UFUNCTION()
    bool IsAnyInvolvedCharacterFriendlyOrEnemyOf(const AGothicCharacter Character) const
    {
        TArray<ERelationship> Relationships;
        Relationships.Add(ERelationship::Friend);
        Relationships.Add(ERelationship::Enemy);
        return DoesCharacaterHaveAnyRelationshipTowardsAnyInvolvedCharacter(Character, Relationships);
    }

    UFUNCTION()
    bool DoesCharacaterHaveRelationshipTowardsAnyInvolvedCharacter(const AGothicCharacter Character, ERelationship Relationship) const
    {
        TArray<ERelationship> Relationships;
        Relationships.Add(Relationship);
        return DoesCharacaterHaveAnyRelationshipTowardsAnyInvolvedCharacter(Character, Relationships);
    }

    UFUNCTION()
    bool DoesCharacaterHaveAnyRelationshipTowardsAnyInvolvedCharacter(const AGothicCharacter Character, TArray<ERelationship> Relationships) const
    {
        TSet<AGothicCharacter> CheckedCharacters;
        for (auto NodeKeyValuePair : InvolvedCharacterNodes)
        {
            auto Node = NodeKeyValuePair.Value;

            for (auto OtherCharacter : Node.Connections)
            {
                if (OtherCharacter == Character)
                    continue;

                if (CheckedCharacters.Contains(OtherCharacter))
                    continue;
                
                CheckedCharacters.Add(OtherCharacter);
                if (Character.IsFriendlyTowards(OtherCharacter) || Character.IsEnemyTowards(OtherCharacter))
                    return true;
            }
            
            if (Node.Character == Character)
                    continue;

            if (CheckedCharacters.Contains(Node.Character))
                continue;
            
            CheckedCharacters.Add(Node.Character);
            for (auto Relationship : Relationships)
            {
                if (Character.GetRelationshipTowards(Node.Character) == Relationship)
                    return true;
            }
        }

        return false;
    }

    UFUNCTION()
    bool IsAnyInvolvedCharacterEnemyAndStrongerThan(const AGothicCharacter Character) const
    {
        TSet<AGothicCharacter> CheckedCharacters;
        for (auto NodeKeyValuePair : InvolvedCharacterNodes)
        {
            auto Node = NodeKeyValuePair.Value;
            for (auto OtherCharacter : Node.Connections)
            {
                if (OtherCharacter == Character)
                    continue;

                if (CheckedCharacters.Contains(OtherCharacter))
                    continue;
                
                CheckedCharacters.Add(OtherCharacter);
                if (Character.IsEnemyTowards(OtherCharacter) && OtherCharacter.IsStrongerThan(Character))
                    return true;
            }

            if (Node.Character == Character)
                    continue;

            if (CheckedCharacters.Contains(Node.Character))
                continue;
            
            CheckedCharacters.Add(Node.Character);
            if (Character.IsEnemyTowards(Node.Character) && Node.Character.IsStrongerThan(Character))
                return true;
        }

        return false;
    }

    UFUNCTION()
    bool IsAnyInvolvedCreatureAngryOrWorse(const AGothicCharacterState CharacterState)
    {
        TSet<AGothicCharacter> CheckedCharacters;
        for (auto NodeKeyValuePair : InvolvedCharacterNodes)
        {
            auto Node = NodeKeyValuePair.Value;
            for (auto OtherCharacter : Node.Connections)
            {
                if (!IsValid(OtherCharacter))
                    continue;

                if (OtherCharacter.CharacterState == CharacterState)
                    continue;

                if (CheckedCharacters.Contains(OtherCharacter))
                    continue;

                if (!OtherCharacter.IsCreature())
                    continue;
                
                CheckedCharacters.Add(OtherCharacter);
                if (CharacterState.IsNeutralTowards(OtherCharacter.CharacterState) || CharacterState.IsFriendlyTowards(OtherCharacter.CharacterState))
                    continue;

                return true;
            }

            if (Node.Character.CharacterState == CharacterState)
                    continue;

            if (CheckedCharacters.Contains(Node.Character))
                continue;
            
            if (!Node.Character.IsCreature())
                    continue;
            
            CheckedCharacters.Add(Node.Character);
            if (CharacterState.IsNeutralTowards(Node.Character.CharacterState) || CharacterState.IsFriendlyTowards(Node.Character.CharacterState))
                continue;

            return true;
        }

        return false;
    }

    ////////////////////////////////////////////////////////////////////////

    UFUNCTION()
    private bool IsCharacterConnectedToAnyNode(const AGothicCharacter Character) const
    {
        for (auto NodeKeyValuePair : InvolvedCharacterNodes)
        {
            auto Node = NodeKeyValuePair.Value;
            if (Node.Connections.Contains(Character))
                return true;
        }

        return false;
    }

    UFUNCTION()
    private void NodeCleanup()
    {
        TSet<AGothicCharacter> ToRemove;
        for (auto NodeKeyValuePair : InvolvedCharacterNodes)
        {
            auto Node = NodeKeyValuePair.Value;
            if (!Node.Connections.IsEmpty())
                continue;

            if (IsCharacterConnectedToAnyNode(Node.Character))
                continue;

            if (JoinedCharacters.Contains(Node.Character))
                continue;

            ToRemove.Add(Node.Character);
        }

        for (auto Character : ToRemove)
        {
            InvolvedCharacterNodes.Remove(Character);
        }
    }

    UFUNCTION()
    private UConflictInstanceNode CreateNewNodeForCharacter(AGothicCharacter Character)
    {
        auto NewNode = UConflictInstanceNode(Character);
        NewNode.InitializeConnections();
        InvolvedCharacterNodes.Add(Character, NewNode);

        MarkMemberDirty(Character);

        for (auto ConnectedCharacter : NewNode.Connections)
        {
            UConflictInstanceNode OtherNode;
            if (InvolvedCharacterNodes.Find(ConnectedCharacter, OtherNode))
                continue;

            CreateNewNodeForCharacter(ConnectedCharacter);
        }

        return NewNode;
    }

    ////////////////////////////////////////////////////////////////////////
    // Team partitioning.

    UFUNCTION()
    int GetTeamStamp() const property
    {
        return _TeamStamp;
    }

    UFUNCTION()
    void MarkMemberDirty(AGothicCharacter Character)
    {
        if (!IsValid(Character))
            return;

        _DirtyMembers.Add(Character);
        _TeamStamp++;
    }

    /** Dirty-marks both ends of an Active modifier add/remove between two involved members. */
    UFUNCTION()
    void OnMemberRelationshipChanged(AGothicCharacter A, AGothicCharacter B)
    {
        if (IsValid(A) && InvolvedCharacterNodes.Contains(A))
            MarkMemberDirty(A);
        if (IsValid(B) && InvolvedCharacterNodes.Contains(B))
            MarkMemberDirty(B);
    }

    UFUNCTION()
    TArray<UConflictTeam> GetTeams() property
    {
        RebuildTeamsIfDirty();
        return _Teams;
    }

    UFUNCTION()
    private void RebuildTeamsIfDirty()
    {
        if (_DirtyMembers.IsEmpty())
            return;

        // Copy and clear _DirtyMembers to avoid mutation during iteration.
        TArray<AGothicCharacter> ToReassign;
        for (auto Character : _DirtyMembers)
        {
            ToReassign.Add(Character);
        }
        _DirtyMembers.Reset();

        for (auto Character : ToReassign)
        {
            if (!IsValid(Character))
                continue;

            RemoveCharacterFromTeams_NoBump(Character);

            if (!InvolvedCharacterNodes.Contains(Character))
                continue;

            AssignCharacterToTeam(Character);
        }

        DropEmptyTeams();

        // Rebuild hostility edges from scratch. Dirty members may have moved teams.
        _TeamHostility.Empty();
        for (auto Team : _Teams)
        {
            if (!IsValid(Team))
                continue;
            for (auto Member : Team.Members)
            {
                RecordTeamHostilityFor(Member);
            }
        }
    }

    UFUNCTION()
    private void AssignCharacterToTeam(AGothicCharacter Character)
    {
        // Attach to existing team via symmetric friendship with its rep, else create a new team.
        for (int Idx = 0; Idx < _Teams.Num(); Idx++)
        {
            auto Team = _Teams[Idx];
            if (!IsValid(Team) || !IsValid(Team.Rep))
                continue;

            if (!IsTeammatePair(Character, Team.Rep))
                continue;

            Team.Members.Add(Character);
            _CharacterToTeamIdx.Add(Character, Idx);
            return;
        }

        auto NewTeam = UConflictTeam();
        NewTeam.Rep = Character;
        NewTeam.Members.Add(Character);
        _Teams.Add(NewTeam);
        _CharacterToTeamIdx.Add(Character, _Teams.Num() - 1);
    }

    /** Symmetric friendship test (requires both directions). */
    UFUNCTION()
    private bool IsTeammatePair(AGothicCharacter A, AGothicCharacter B) const
    {
        if (!IsValid(A) || !IsValid(B))
            return false;
        if (A == B)
            return true;

        if (!IsValid(A.CharacterState) || !IsValid(B.CharacterState))
            return false;

        if (A.CharacterState.IsInPartyWith(B.CharacterState))
            return true;

        if (A.CharacterState.IsProtecting(B.CharacterState) || B.CharacterState.IsProtecting(A.CharacterState))
            return true;

        return A.CharacterState.IsFriendlyTowards(B.CharacterState) &&
               B.CharacterState.IsFriendlyTowards(A.CharacterState);
    }

    UFUNCTION()
    private void RemoveCharacterFromTeams(AGothicCharacter Character)
    {
        RemoveCharacterFromTeams_NoBump(Character);
        _TeamStamp++;
    }

    UFUNCTION()
    private void RemoveCharacterFromTeams_NoBump(AGothicCharacter Character)
    {
        int Idx;
        if (!_CharacterToTeamIdx.Find(Character, Idx))
            return;

        _CharacterToTeamIdx.Remove(Character);

        if (Idx < 0 || Idx >= _Teams.Num())
            return;

        auto Team = _Teams[Idx];
        if (!IsValid(Team))
            return;

        Team.Members.Remove(Character);

        if (Team.Rep == Character)
        {
            // Promote any remaining member to rep.
            Team.Rep = nullptr;
            for (auto Remaining : Team.Members)
            {
                if (IsValid(Remaining))
                {
                    Team.Rep = Remaining;
                    break;
                }
            }
        }
    }

    UFUNCTION()
    private void DropEmptyTeams()
    {
        // Build old-to-new idx mapping while filtering survivors (single pass).
        TArray<int> OldToNew;
        OldToNew.SetNum(_Teams.Num());

        TArray<UConflictTeam> Survivors;
        for (int OldIdx = 0; OldIdx < _Teams.Num(); OldIdx++)
        {
            auto Team = _Teams[OldIdx];
            if (!IsValid(Team) || Team.Members.IsEmpty() || !IsValid(Team.Rep))
            {
                OldToNew[OldIdx] = -1;
                continue;
            }
            OldToNew[OldIdx] = Survivors.Num();
            Survivors.Add(Team);
        }

        _Teams = Survivors;

        // Idxs shifted; rebuild lookup map.
        _CharacterToTeamIdx.Empty();
        for (int Idx = 0; Idx < _Teams.Num(); Idx++)
        {
            auto Team = _Teams[Idx];
            if (!IsValid(Team))
                continue;

            for (auto Member : Team.Members)
            {
                _CharacterToTeamIdx.Add(Member, Idx);
            }
        }

        RemapTeamHostilityIndices(OldToNew);
    }

    ////////////////////////////////////////////////////////////////////////
    // Team-vs-team hostility edges.

    /** Try to insert directed hostility edge Source->Target if both in different known teams.
     * Avoids full team rebuild (keeps _TeamStamp, preserves caches).
     * Returns true if inserted, false if teams unknown or same (fallback to full dirty path).
     */
    UFUNCTION()
    bool TryRecordHostilityEdgeOrMarkDirty(AGothicCharacter Source, AGothicCharacter Target)
    {
        if (!IsValid(Source) || !IsValid(Target))
            return false;

        int SrcIdx;
        bool bSrcKnown = _CharacterToTeamIdx.Find(Source, SrcIdx);

        int TgtIdx;
        bool bTgtKnown = _CharacterToTeamIdx.Find(Target, TgtIdx);

        if (!bSrcKnown || !bTgtKnown || SrcIdx == TgtIdx)
        {
            // Partition could change; fall through to full dirty path.
            OnMemberRelationshipChanged(Source, Target);
            return false;
        }

        UTeamHostilityEdges Edges;
        if (!_TeamHostility.Find(SrcIdx, Edges) || !IsValid(Edges))
        {
            Edges = UTeamHostilityEdges();
            _TeamHostility.Add(SrcIdx, Edges);
        }
        Edges.Targets.Add(TgtIdx);
        return true;
    }

    /** Scans Source's ActivePersonalModifiers, inserts edges Source.team -> target.team for every
     * in-group Enemy/Hostile target in a different team. No-op if Source isn't partitioned. */
    UFUNCTION()
    private void RecordTeamHostilityFor(AGothicCharacter Source)
    {
        if (!IsValid(Source) || !IsValid(Source.CharacterState))
            return;

        int SrcIdx;
        if (!_CharacterToTeamIdx.Find(Source, SrcIdx))
            return;

        for (auto Modifier : Source.CharacterState.Relationship.ActivePersonalModifiers)
        {
            AGothicCharacterState TargetState = nullptr;

            auto Enemy = Cast<UActivePersonalRelationshipModifier_Enemy>(Modifier);
            if (IsValid(Enemy))
            {
                TargetState = Enemy.TargetCharacter;
            }
            else
            {
                auto Hostile = Cast<UActivePersonalRelationshipModifier_Hostile>(Modifier);
                if (IsValid(Hostile))
                    TargetState = Hostile.TargetCharacter;
            }

            if (!IsValid(TargetState) || !IsValid(TargetState.Character))
                continue;

            int TgtIdx;
            if (!_CharacterToTeamIdx.Find(TargetState.Character, TgtIdx))
                continue;
            if (TgtIdx == SrcIdx)
                continue;

            UTeamHostilityEdges Edges;
            if (!_TeamHostility.Find(SrcIdx, Edges) || !IsValid(Edges))
            {
                Edges = UTeamHostilityEdges();
                _TeamHostility.Add(SrcIdx, Edges);
            }
            Edges.Targets.Add(TgtIdx);
        }
    }

    /** Remaps edges via old->new idx mapping (-1 = drop). */
    UFUNCTION()
    private void RemapTeamHostilityIndices(const TArray<int>&in OldToNew)
    {
        TMap<int, UTeamHostilityEdges> Remapped;

        for (auto Pair : _TeamHostility)
        {
            int OldSrc = Pair.Key;
            if (OldSrc < 0 || OldSrc >= OldToNew.Num())
                continue;
            int NewSrc = OldToNew[OldSrc];
            if (NewSrc < 0)
                continue;
            if (!IsValid(Pair.Value))
                continue;

            UTeamHostilityEdges NewEdges = UTeamHostilityEdges();
            for (auto OldTgt : Pair.Value.Targets)
            {
                if (OldTgt < 0 || OldTgt >= OldToNew.Num())
                    continue;
                int NewTgt = OldToNew[OldTgt];
                if (NewTgt < 0)
                    continue;
                if (NewTgt == NewSrc)
                    continue;
                NewEdges.Targets.Add(NewTgt);
            }

            if (!NewEdges.Targets.IsEmpty())
                Remapped.Add(NewSrc, NewEdges);
        }

        _TeamHostility = Remapped;
    }

    /** True if either team has a hostility edge toward the other. */
    UFUNCTION()
    bool DoTeamsOpposeEachOther(int IdxA, int IdxB) const
    {
        if (IdxA == IdxB)
            return false;

        UTeamHostilityEdges EdgesA;
        if (_TeamHostility.Find(IdxA, EdgesA) && IsValid(EdgesA) && EdgesA.Targets.Contains(IdxB))
            return true;

        UTeamHostilityEdges EdgesB;
        if (_TeamHostility.Find(IdxB, EdgesB) && IsValid(EdgesB) && EdgesB.Targets.Contains(IdxA))
            return true;

        return false;
    }

}
