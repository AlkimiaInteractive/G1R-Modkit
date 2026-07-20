class UAIEventResponse_AssessConflict : UAIEventResponse_SingleTarget
{
    /** Returns the conflict group that contains FocusCharacterState. */
    UAIGroup_ConflictInstance FindConflictGroupOf(const AGothicCharacterState FocusCharacterState) const
    {
        if (!IsValid(FocusCharacterState) || !IsValid(FocusCharacterState.Character))
            return nullptr;
        
        // Tries the focus' own AI group first before falling back to iterating every active conflict group.
        auto FocusAI = Cast<UGameplayAbility_CharacterAI_Gothic>(FocusCharacterState.AI);
        if (IsValid(FocusAI))
        {
            auto OwnGroup = Cast<UAIGroup_ConflictInstance>(FocusAI.GetGroupOfClass(UAIGroup_ConflictInstance));
            if (IsValid(OwnGroup) && OwnGroup.IsCharacterInvolved(FocusCharacterState.Character))
                return OwnGroup;
        }

        auto Groups = UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_ConflictInstance);
        for (auto Group : Groups)
        {
            auto ConflictGroupToCheck = Cast<UAIGroup_ConflictInstance>(Group);
            if (!IsValid(ConflictGroupToCheck))
                continue;

            if (!ConflictGroupToCheck.IsCharacterInvolved(FocusCharacterState.Character))
                continue;

            return ConflictGroupToCheck;
        }

        return nullptr;
    }

    /** Fills the per-member buckets that can't be derived from team membership. */
    private void ClassifyInvolvedCharacter(
        const AGothicCharacterState InvolvedCharacterState,
        ERelationship RelationshipTowards,
        ERelationshipHostility HostilityTowards,
        TSet<AGothicCharacterState>&out EnemyAttackOnSightCharacters,
        TSet<AGothicCharacterState>&out PlayerCharacters,
        TSet<AGothicCharacterState>&out AngryOrWorseCreatures) const
    {
        bool bIsPlayer = InvolvedCharacterState.IsPlayerCharacter() || InvolvedCharacterState.IsPlayerControlled();
        if (bIsPlayer)
        {
            PlayerCharacters.Add(InvolvedCharacterState);
        }

        if (RelationshipTowards == ERelationship::Enemy && HostilityTowards == ERelationshipHostility::AttackOnSight)
        {
            EnemyAttackOnSightCharacters.Add(InvolvedCharacterState);
        }

        if (RelationshipTowards != ERelationship::Neutral &&
            RelationshipTowards != ERelationship::Friend &&
            InvolvedCharacterState.IsCreature())
        {
            AngryOrWorseCreatures.Add(InvolvedCharacterState);
        }
    }

    /** Returns true if the joiner considers Other an "ally" (friend, protector relation, or party). */
    private int HowAlliedIsJoinerWith(const AGothicCharacterState Other, ERelationship RelationshipTowards) const
    {
        if (Other == AI.CharacterState)
            return 5;

        if (RelationshipTowards == ERelationship::Friend && !Other.IsPlayerCharacter())
            return 4;

        if (!IsValid(AI) || !IsValid(AI.CharacterState))
            return 0;

        ERelationshipHostility HostilityTowardsOther = AI.CharacterState.Relationship.GetHostilityTowards(Other);
        if (HostilityTowardsOther == ERelationshipHostility::ProtectFromDifferentGuild_Premium)
            return 3;

        if (AI.CharacterState.IsProtecting(Other) || Other.IsProtecting(AI.CharacterState))
            return 2;

        if (AI.CharacterState.IsInPartyWith(Other))
            return 1;

        return 0;
    }

    bool AssessConflictGroupOf(AGothicCharacterState FocusCharacterState, 
        TSet<AGothicCharacterState>&out AlliedCharacters,
        TSet<AGothicCharacterState>&out OpposingCharacters,
        TSet<AGothicCharacterState>&out NeutralCharacters,
        TSet<AGothicCharacterState>&out EnemyAttackOnSightCharacters,
        TSet<AGothicCharacterState>&out PlayerCharacters,
        TSet<AGothicCharacterState>&out AngryOrWorseCreatures) const
    {
        if (!IsValid(AI))
            return false;

        auto ConflictGroup = FindConflictGroupOf(FocusCharacterState);
        if (!IsValid(ConflictGroup))
            return false;

        auto ConflictValueSet = AI.SpawnedStorage(UAIValueSet_ConflictAssessment);

        // Cache hit on group, stamp, focus unchanged. Cross-team check always runs for live updates.
        if (ConflictValueSet.bCacheValid &&
            ConflictValueSet.Group == ConflictGroup &&
            ConflictValueSet.GroupStamp == ConflictGroup.TeamStamp &&
            ConflictValueSet.Focus == FocusCharacterState)
        {
            AlliedCharacters.Empty();
            AlliedCharacters.Append(ConflictValueSet.Allied);
            OpposingCharacters.Empty();
            OpposingCharacters.Append(ConflictValueSet.Opposing);
            NeutralCharacters.Empty();
            NeutralCharacters.Append(ConflictValueSet.Neutral);
            EnemyAttackOnSightCharacters.Empty();
            EnemyAttackOnSightCharacters.Append(ConflictValueSet.EnemyAttackOnSight);
            PlayerCharacters.Empty();
            PlayerCharacters.Append(ConflictValueSet.Player);
            AngryOrWorseCreatures.Empty();
            AngryOrWorseCreatures.Append(ConflictValueSet.AngryOrWorseCreatures);

            ApplyCrossTeamOppositionPass(ConflictGroup, ConflictValueSet.AlliedTeamIdxs, ConflictValueSet.AlliedTeamScores, 
                AlliedCharacters, OpposingCharacters, NeutralCharacters);
                
            return true;
        }

        // Cache miss. Classify each team via its representative (O(T)), expand to members.
        auto Teams = ConflictGroup.Teams;

        // Joiner's direct personal Enemy/Hostile targets. Others inherit rep's relationship unless creature.
        TSet<AGothicCharacterState> JoinerIndividualizedTargets;
        for (auto Modifier : AI.CharacterState.Relationship.ActivePersonalModifiers)
        {
            auto Enemy = Cast<UActivePersonalRelationshipModifier_Enemy>(Modifier);
            if (IsValid(Enemy) && IsValid(Enemy.TargetCharacter))
            {
                JoinerIndividualizedTargets.Add(Enemy.TargetCharacter);
                continue;
            }
            auto Hostile = Cast<UActivePersonalRelationshipModifier_Hostile>(Modifier);
            if (IsValid(Hostile) && IsValid(Hostile.TargetCharacter))
            {
                JoinerIndividualizedTargets.Add(Hostile.TargetCharacter);
            }
        }

        TSet<int> AlliedTeamIdxs;
        TMap<int, int> AlliedTeamScores;

        for (int TeamIdx = 0; TeamIdx < Teams.Num(); TeamIdx++)
        {
            auto Team = Teams[TeamIdx];
            if (!IsValid(Team) || !IsValid(Team.Rep))
                continue;
            if (!IsValid(Team.Rep.CharacterState))
                continue;

            auto RepState = Team.Rep.CharacterState;
            auto RelToRep = RepState == AI.CharacterState ? ERelationship::Friend : AI.CharacterState.GetRelationshipTowards(RepState);
            auto HostToRep = (RelToRep == ERelationship::Enemy)
                ? AI.CharacterState.GetHostilityTowards(RepState)
                : ERelationshipHostility::None;
            int Alliedness = HowAlliedIsJoinerWith(RepState, RelToRep);
            bool bAlliedWithTeam = Alliedness > 0;

            if (bAlliedWithTeam)
            {
                AlliedTeamIdxs.Add(TeamIdx);
                AlliedTeamScores.Add(TeamIdx, Alliedness);
            }

            for (auto Member : Team.Members)
            {
                if (!IsValid(Member) || !IsValid(Member.CharacterState))
                    continue;

                auto MemberState = Member.CharacterState;
                bool bIsMemberPlayer = MemberState.IsPlayerCharacter() || MemberState.IsPlayerControlled();

                // Skip non-player bystanders sharing the group.
                if (!bIsMemberPlayer &&
                    !MemberState.Character.IsInConflictFightingState() &&
                    !MemberState.Character.IsInConflictWarningState())
                {
                    continue;
                }

                ERelationship RelToMember;
                ERelationshipHostility HostToMember;

                // Creatures get per-member RB; everyone else inherits the rep's relationship unless the joiner has an individualized modifier on them.
                bool bUseRepRel = (Member == Team.Rep)
                    || (!MemberState.IsCreature()
                        && !JoinerIndividualizedTargets.Contains(MemberState));

                if (bUseRepRel)
                {
                    RelToMember = RelToRep;
                    HostToMember = HostToRep;
                }
                else
                {
                    RelToMember = AI.CharacterState.GetRelationshipTowards(MemberState);
                    // AttackOnSight tier only relevant when relationship is Enemy.
                    HostToMember = (RelToMember == ERelationship::Enemy)
                        ? AI.CharacterState.GetHostilityTowards(MemberState)
                        : ERelationshipHostility::None;
                }

                ClassifyInvolvedCharacter(MemberState, RelToMember, HostToMember,
                    EnemyAttackOnSightCharacters, PlayerCharacters, AngryOrWorseCreatures);

                if (!bAlliedWithTeam)
                {
                    if (RelToRep == ERelationship::Enemy || RelToRep == ERelationship::Hostile)
                    {
                        OpposingCharacters.Add(MemberState);
                    }
                    else
                    {
                        NeutralCharacters.Add(MemberState);
                    }
                }
            }
        }

        // Store rep-only baseline; cross-team pass runs after and is re-applied live on hit.
        ConflictValueSet.Group = ConflictGroup;
        ConflictValueSet.GroupStamp = ConflictGroup.TeamStamp;
        ConflictValueSet.Focus = FocusCharacterState;

        ApplyCrossTeamOppositionPass(ConflictGroup, AlliedTeamIdxs, AlliedTeamScores,
            AlliedCharacters, OpposingCharacters, NeutralCharacters); 

        ConflictValueSet.Allied.Empty();
        ConflictValueSet.Allied.Append(AlliedCharacters);
        ConflictValueSet.Opposing.Empty();
        ConflictValueSet.Opposing.Append(OpposingCharacters);
        ConflictValueSet.Neutral.Empty();
        ConflictValueSet.Neutral.Append(NeutralCharacters);
        ConflictValueSet.EnemyAttackOnSight.Empty();
        ConflictValueSet.EnemyAttackOnSight.Append(EnemyAttackOnSightCharacters);
        ConflictValueSet.Player.Empty();
        ConflictValueSet.Player.Append(PlayerCharacters);
        ConflictValueSet.AngryOrWorseCreatures.Empty();
        ConflictValueSet.AngryOrWorseCreatures.Append(AngryOrWorseCreatures);
        ConflictValueSet.AlliedTeamIdxs.Empty();
        ConflictValueSet.AlliedTeamIdxs.Append(AlliedTeamIdxs);
        ConflictValueSet.AlliedTeamScores.Empty();
        ConflictValueSet.AlliedTeamScores = AlliedTeamScores;

        ConflictValueSet.bCacheValid = true;        

        return true;
    }

    /** Promotes Neutral members of teams that have a hostility edge with any allied team to Opposing. */
    private void ApplyCrossTeamOppositionPass(
        UAIGroup_ConflictInstance ConflictGroup,
        const TSet<int>&in AlliedTeamIdxs,
        const TMap<int, int>&in AlliedTeamScores,
        TSet<AGothicCharacterState>&out AlliedCharacters,
        TSet<AGothicCharacterState>&out OpposingCharacters,
        TSet<AGothicCharacterState>&out NeutralCharacters) const
    {
        if (AlliedTeamIdxs.IsEmpty())
            return;
        
        auto Teams = ConflictGroup.Teams;

        for (int Idx = 0; Idx < Teams.Num(); Idx++)
        {
            auto Team = Teams[Idx];
            if (!IsValid(Team) || !IsValid(Team.Rep) || !IsValid(Team.Rep.CharacterState))
                continue;

            bool bIsAlly = AlliedTeamIdxs.Contains(Idx);
            
            bool bOpposesAnAlly = false;
            int MaxAllyOpponentScore = 0;
            for (auto AllyIdx : AlliedTeamIdxs)
            {
                if (AllyIdx == Idx)
                    continue;

                if (ConflictGroup.DoTeamsOpposeEachOther(Idx, AllyIdx))
                {
                    bOpposesAnAlly = true;

                    if (!bIsAlly)
                        break;
                }

                int Score;
                if (!AlliedTeamScores.Find(AllyIdx, Score))
                    continue;

                if (Score < MaxAllyOpponentScore)
                    continue;

                MaxAllyOpponentScore = Score;
            }

            if (!bOpposesAnAlly && !bIsAlly)
                continue;

            // If allied team opposes another allied team, we have to choose one to be allied to
            int Score;
            if (bIsAlly)
            {
                if (!bOpposesAnAlly || (AlliedTeamScores.Find(Idx, Score) && MaxAllyOpponentScore < Score))
                {
                    for (auto Member : Team.Members)
                    {
                        if (!IsValid(Member) || !IsValid(Member.CharacterState))
                            continue;

                        AlliedCharacters.Add(Member.CharacterState);
                    }

                    continue;
                }
            }            

            for (auto Member : Team.Members)
            {
                if (!IsValid(Member) || !IsValid(Member.CharacterState))
                    continue;

                NeutralCharacters.Remove(Member.CharacterState);
                OpposingCharacters.Add(Member.CharacterState);
            }
        }
    }

    /** Called after the joiner adds an Enemy/Hostile modifier.
     * Different-team target inserts a hostility edge without bumping _TeamStamp.
     * Same-team falls back to dirty-mark and invalidates this AI's cache only.
     */
    void NotifyConflictGroupOfRelationshipChange(AGothicCharacterState TargetedCharacterState) const
    {
        if (!IsValid(AI) || !IsValid(AI.Character) || !IsValid(TargetedCharacterState) || !IsValid(TargetedCharacterState.Character))
            return;

        auto ConflictValueSet = AI.SpawnedStorage(UAIValueSet_ConflictAssessment);

        auto Group = ConflictValueSet.Group;
        if (!IsValid(Group) || !Group.IsCharacterInvolved(TargetedCharacterState.Character))
        {
            Group = Cast<UAIGroup_ConflictInstance>(AI.GetGroupOfClass(UAIGroup_ConflictInstance));
        }

        if (!IsValid(Group))
            return;

        if (!Group.IsCharacterInvolved(AI.Character) || !Group.IsCharacterInvolved(TargetedCharacterState.Character))
            return;

        bool bEdgeOnly = Group.TryRecordHostilityEdgeOrMarkDirty(AI.Character, TargetedCharacterState.Character);
        if (!bEdgeOnly)
        {
            // Partition may have changed; invalidate own cache (others pay the stamp-mismatch lazily).
            ConflictValueSet.bCacheValid = false;
        }
    }

    bool IsGroupCombatFavorableForAllies(const TSet<AGothicCharacterState> AlliedCharacters, const TSet<AGothicCharacterState> OpponentCharacters) const
    {
        if (!IsValid(AI) || !IsValid(AI.CharacterState) || !IsValid(AI.Character))
                return false;

            if (AI.ModeOfFleeOnUnfavorableCombat == EFleeOnUnfavorableCombatMode::Never)
                return true;

            if (AI.ModeOfFleeOnUnfavorableCombat == EFleeOnUnfavorableCombatMode::Always)
                return false;

            if (AI.CharacterState.ShouldActBrave())
                return true;

            if (AI.CharacterState.ShouldActCoward())
                return false;

            auto CharacterPerception = AI.Character.Perception;
            TArray<AGothicCharacter> Predators;
            if (AI.ModeOfFleeOnUnfavorableCombat == EFleeOnUnfavorableCombatMode::Always_PredatorOnly || AI.ModeOfFleeOnUnfavorableCombat == EFleeOnUnfavorableCombatMode::OnUnfavorable_PredatorOnly)
            {
                Predators = CharacterPerception.GetAllSensedCharactersMatchingPerceptionHandler(AI.PredatorFilterHandler_LivingOnly);

                if (AI.ModeOfFleeOnUnfavorableCombat == EFleeOnUnfavorableCombatMode::OnUnfavorable_PredatorOnly && Predators.IsEmpty())
                    return true;

                if (AI.ModeOfFleeOnUnfavorableCombat == EFleeOnUnfavorableCombatMode::Always_PredatorOnly && !Predators.IsEmpty())
                    return false;
            }

            int OpponentCount = 0;
            int AllyCount = 0;

            float OpponentsLevelTotal = 0.0f;
            float AlliesLevelTotal = 0.0f;

            if (IsValid(AI.CharacterState))
            {
                AllyCount += 1;
                AlliesLevelTotal += AI.CharacterState.GetLevelAttribute();
            }

            if (AI.ModeOfFleeOnUnfavorableCombat == EFleeOnUnfavorableCombatMode::OnUnfavorable_PredatorOnly)
            {
                for (auto Opponent : OpponentCharacters)
                {
                    if (AI.CharacterState.GetHostilityTowards(Opponent) != ERelationshipHostility::Prey)
                        continue;

                    OpponentsLevelTotal += Opponent.GetLevelAttribute();
                    OpponentCount++;
                }
            }
            else
            {
                for (auto Opponent : OpponentCharacters)
                {
                    OpponentsLevelTotal += Opponent.GetLevelAttribute();
                    OpponentCount++;
                }
            }

            for (auto Ally : AlliedCharacters)
            {
                AlliesLevelTotal += Ally.GetLevelAttribute();
                AllyCount++;
            }

            // Probabilistic flee curve
            float PlayerLvl = OpponentsLevelTotal / Math::Max(1, OpponentCount);
            float CreatureLvl = AI.CharacterState.GetLevelAttribute();
            int LivingAllyCount = AllyCount;

            float BaseThreshold = AI.FleeCurve_BaseThreshold;
            float ThresholdScale = AI.FleeCurve_ThresholdScale;
            float Steepness = AI.FleeCurve_Steepness;
            float LevelShield = AI.FleeCurve_LevelShield;
            float GroupConfidence = AI.FleeCurve_GroupConfidence;

            float EffectiveThreshold = BaseThreshold + CreatureLvl * ThresholdScale;
            float LevelDiff = PlayerLvl - CreatureLvl - EffectiveThreshold;
            float BaseFlee = Math::Clamp(LevelDiff * Steepness, 0.0f, 1.0f);
            float ShieldDenom = Math::Max(LevelShield - 1.0f, 0.001f);
            float LevelShieldMod = Math::Clamp((PlayerLvl - 1.0f) / ShieldDenom, 0.0f, 1.0f);
            float GroupMod = Math::Max(0.0f, 1.0f - float(LivingAllyCount - 1) * GroupConfidence);
            float FleeProbability = BaseFlee * LevelShieldMod * GroupMod;

            return Math::RandRange(0.0f, 1.0f) > FleeProbability;
    }
}

class UAIEventResponse_AssessJoinConflict : UAIEventResponse_AssessConflict
{
    UAIEventResponse_AssessJoinConflict(EPerceptionCharacterType PerceptionCharacterType)
    {
        FocusCharacterType = PerceptionCharacterType;
    }

    UPROPERTY()
    EPerceptionCharacterType FocusCharacterType;

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        auto FocusCharacterState = TargetCharacterState(FocusCharacterType, Perception);

        // If perception character state could not be found or the character is not spawned, no conflict can be joined
        if (!IsValid(FocusCharacterState) || !IsValid(FocusCharacterState.Character))
            return;

        // auto FocusConflict = FindConflictGroupOf(FocusCharacterState);
        // if (IsValid(FocusConflict) && IsValid(AI) && IsValid(AI.Character)
        //     && FocusConflict.IsCharacterInvolved(AI.Character))
        // {
        //     return;
        // }

        TSet<AGothicCharacterState> AlliedCharacters;
        TSet<AGothicCharacterState> OpposingCharacters;
        TSet<AGothicCharacterState> NeutralCharacters;
        TSet<AGothicCharacterState> EnemyAttackOnSightCharacters;
        TSet<AGothicCharacterState> PlayerCharacters;
        TSet<AGothicCharacterState> AngryOrWorseCreatures;

        // 1. Identify the friendlies / protected characters in the conflict group and who their enemies are        
        if (!AssessConflictGroupOf(FocusCharacterState, AlliedCharacters, OpposingCharacters, NeutralCharacters, EnemyAttackOnSightCharacters, PlayerCharacters, AngryOrWorseCreatures))
            return;

        // 2. Determine if there's combat or only warning
        bool bIsFightingConflict = false;
        bool bFriendlyNPCOpponent = false;
        TSet<AGothicCharacterState> AllInvolvedCharacters;
        AllInvolvedCharacters.Append(AlliedCharacters);
        AllInvolvedCharacters.Append(OpposingCharacters);
        AllInvolvedCharacters.Append(NeutralCharacters);

        for (auto InvolvedCharacterState : AllInvolvedCharacters)
        {
            if (InvolvedCharacterState.Character.IsInConflictFightingState())
            {
                bIsFightingConflict = true;
                break;
            }
        }

        bool bInPartyWithPlayerAlly = false;
        bool bAlliedEnforcerPresent = false;
        bool bPremiumProtectedAlly = false;
        bool bPersonallyPremiumProtectedAlly = false;
        bool bProtectedAlly = false;
        bool bFriendlyAllies = false;
        for (auto AlliedCharacter : AlliedCharacters)
        {
            if (!bFriendlyAllies && AI.CharacterState.IsFriendlyTowards(AlliedCharacter))
            {
                bFriendlyAllies = true;
            }

            if (!bAlliedEnforcerPresent && AlliedCharacter.IsEnforcerOrLeaderRole())
            {
                bAlliedEnforcerPresent = true;
            }
            
            if (!bPremiumProtectedAlly && AI.CharacterState.Guild.MatchesTag(GameplayTag::Guild_Human_OldCamp) && AlliedCharacter.HasAnyPremiumProtection())
            {
                bPremiumProtectedAlly = true;
            }

            if (!bProtectedAlly && AI.CharacterState.IsProtecting(AlliedCharacter))
            {
                bProtectedAlly = true;
            }            
            
            if (!bPersonallyPremiumProtectedAlly)
            {
                ERelationshipHostility HostilityTowardsOther = AI.CharacterState.Relationship.GetHostilityTowards(AlliedCharacter);
                if (HostilityTowardsOther == ERelationshipHostility::ProtectFromDifferentGuild_Premium)
                {
                    bPersonallyPremiumProtectedAlly = true;
                }
            }

            if (!AlliedCharacter.IsPlayerCharacter() && !AlliedCharacter.IsPlayerControlled())
                continue;

            if (!bInPartyWithPlayerAlly && AI.CharacterState.IsInPartyWith(AlliedCharacter)) 
            {
                bInPartyWithPlayerAlly = true;
            }
        }

        bool bGroupFavorableForAllies = IsGroupCombatFavorableForAllies(AlliedCharacters, OpposingCharacters);

        bool bInPartyWithPlayerOpponent = false;
        bool bPremiumProtectedOpponent = false;
        bool bPersonallyPremiumProtectedOpponent = false;
        bool bProtectedOpponent = false;
        for (auto OpposingCharacter : OpposingCharacters)
        {
            if (!bPremiumProtectedOpponent && AI.CharacterState.Guild.MatchesTag(GameplayTag::Guild_Human_OldCamp) && OpposingCharacter.HasAnyPremiumProtection())
            {
                bPremiumProtectedOpponent = true;
            }

            if (!bProtectedOpponent && AI.CharacterState.IsProtecting(OpposingCharacter))
            {
                bProtectedOpponent = true;
            }            
            
            if (!bPersonallyPremiumProtectedOpponent)
            {
                ERelationshipHostility HostilityTowardsOther = AI.CharacterState.Relationship.GetHostilityTowards(OpposingCharacter);
                if (HostilityTowardsOther == ERelationshipHostility::ProtectFromDifferentGuild_Premium)
                {
                    bPersonallyPremiumProtectedOpponent = true;
                }
            }

            if (!OpposingCharacter.IsPlayerCharacter() && !OpposingCharacter.IsPlayerControlled())
            {
                if (AI.CharacterState.IsFriendlyTowards(OpposingCharacter))
                {
                    bFriendlyNPCOpponent = true;
                }                
                
                continue;
            }

            if (!bInPartyWithPlayerOpponent && AI.CharacterState.IsInPartyWith(OpposingCharacter)) 
            {
                bInPartyWithPlayerOpponent = true;
            }
        }

        bool bInPartyWithPlayerNeutral = false;
        for (auto NeutralCharacter : NeutralCharacters)
        {
            if (!NeutralCharacter.IsPlayerCharacter() && !NeutralCharacter.IsPlayerControlled())
                continue;

            if (!AI.CharacterState.IsInPartyWith(NeutralCharacter))
                continue;

            bInPartyWithPlayerNeutral = true;
        }

        // 3.   - If Combat
        //          Determine if character should go to WatchFight, Combat or Flee
        //          WatchFight if
        //              - AT LEAST 1 TRUE
        //                  * No allies or no opponents
        //                  * Friendly non player opponents
        //                  * Opponent player in party
        //              - NO ENEMY WITH ATTACKONSIGHT

        FGameplayTagContainer Tags;
        if (bIsFightingConflict) Tags.AddTag(GameplayTag::AIConflictAssessment_FightingConflict);
        if (!EnemyAttackOnSightCharacters.IsEmpty()) Tags.AddTag(GameplayTag::AIConflictAssessment_AttackOnSightEnemiesInvolved);
        if (!AngryOrWorseCreatures.IsEmpty()) Tags.AddTag(GameplayTag::AIConflictAssessment_AngryOrWorseCreatures);
        if (AlliedCharacters.IsEmpty()) Tags.AddTag(GameplayTag::AIConflictAssessment_NoAlliedCharacters);
        if (OpposingCharacters.IsEmpty()) Tags.AddTag(GameplayTag::AIConflictAssessment_NoOpposingCharacters);
        if (bFriendlyNPCOpponent) Tags.AddTag(GameplayTag::AIConflictAssessment_FriendlyNPCOpponent);
        if (bFriendlyAllies) Tags.AddTag(GameplayTag::AIConflictAssessment_FriendlyAllies);
        if (bInPartyWithPlayerOpponent) Tags.AddTag(GameplayTag::AIConflictAssessment_InPartyWithPlayerOpponent);
        if (bInPartyWithPlayerNeutral) Tags.AddTag(GameplayTag::AIConflictAssessment_InPartyWithPlayerNeutral);
        if (bInPartyWithPlayerAlly) Tags.AddTag(GameplayTag::AIConflictAssessment_InPartyWithPlayerAlly);
        if (bAlliedEnforcerPresent) Tags.AddTag(GameplayTag::AIConflictAssessment_AlliedEnforcerPresent);
        if (bGroupFavorableForAllies) Tags.AddTag(GameplayTag::AIConflictAssessment_CombatFavorableForAllies);
        if (bPersonallyPremiumProtectedAlly) Tags.AddTag(GameplayTag::AIConflictAssessment_PersonallyPremiumProtectedAllies);
        if (bPersonallyPremiumProtectedOpponent) Tags.AddTag(GameplayTag::AIConflictAssessment_PersonallyPremiumProtectedOpponents);
        if (bPremiumProtectedAlly) Tags.AddTag(GameplayTag::AIConflictAssessment_PremiumProtectedAllies);
        if (bPremiumProtectedOpponent) Tags.AddTag(GameplayTag::AIConflictAssessment_PremiumProtectedOpponents);
        if (bProtectedAlly) Tags.AddTag(GameplayTag::AIConflictAssessment_ProtectedAllies);
        if (bProtectedOpponent) Tags.AddTag(GameplayTag::AIConflictAssessment_ProtectedOpponents);

        // if (EnemyAttackOnSightCharacters.IsEmpty() && 
        //     (AlliedCharacters.IsEmpty() || OpposingCharacters.IsEmpty() ||
        //     bFriendlyNPCOpponent || 
        //     bInPartyWithPlayerOpponent))
        // {
        //     Outcome = EJoinConflictOutcome::WatchFight;
        // } 
        // //          Combat if
        // //              - ALL TRUE
        // //                  * No friendly non player opponents
        // //                  * No opponent players in party
        // //                  * No neutral player in party
        // else if (!bFriendlyNPCOpponent && !bInPartyWithPlayerOpponent && !bInPartyWithPlayerNeutral)
        // {
        //     Outcome = EJoinConflictOutcome::Combat;
        // }

        if (!bIsFightingConflict)
        {
            //      - If Warning
            //          Determine if character should go to WatchHostile or Warning (Crime specific)
            //      Warning if 
            //          - less than 3 npcs in warning

            FGameplayTag Leader;
            TMap<FGameplayTag, int> TagCount;
            int TotalWarningCharacters = 0;
            for (auto AlliedCharacter : AlliedCharacters)
            {
                FGameplayTagContainer AlliedCharacterTags;
                AlliedCharacter.AbilitySystemComponent.GetOwnedGameplayTags(AlliedCharacterTags);

                auto WarnedCharacterSubsystem = UWarnedCharacterSubsystem::Get();
                if (!WarnedCharacterSubsystem.IsCharacterWarning(AlliedCharacter))
                    continue;

                for (auto Tag : AlliedCharacterTags.GameplayTags)
                {
                    if (!Tag.MatchesTag(GameplayTag::AIState_Conflict_Warning))
                        continue;

                    TotalWarningCharacters++;

                    int& CurrentTagCount = TagCount.FindOrAdd(Tag, 0);
                    CurrentTagCount++;

                    int LeaderTagCount;
                    if (!Leader.IsValid() || Tag.MatchesTag(Leader) || !TagCount.Find(Leader, LeaderTagCount))
                    {
                        Leader = Tag;
                        continue;
                    }

                    if (LeaderTagCount >= CurrentTagCount)
                        continue;

                    Leader = Tag;
                }
            }

            if (TotalWarningCharacters > 0) Tags.AddTag(Leader);
        }

        // 4. AssessEvent
        //      - WatchFight - AIEvent_JoinConflict_WatchFight [Event assessment should sync enemy modifiers]
        //      - Combat - AIEvent_JoinConflict_Combat [Event assessment should sync enemy modifiers]
        //      - Flee - AIEvent_JoinConflict_Flee [Event assessment should sync enemy modifiers]
        //      - WatchHostile - AIEvent_JoinConflict_WatchHostile [Event assessment should sync hostile modifiers]
        //      - Warning - AIEvent_JoinConflict_Warning + EventTag(WarningAIStateTagOfOther?) [Event assessment should sync enemy modifiers]

        AGothicCharacterState ResolvedCriminalState = ResolveCriminalFromFocus(FocusCharacterState);
        bool bHasResolvedCriminal = IsValid(ResolvedCriminalState) && IsValid(ResolvedCriminalState.Character);

        FRememberedPerception FakePerception;
        FakePerception.Origin.CharacterState = FocusCharacterState;
        if (bHasResolvedCriminal)
        {
            FakePerception.Instigator.CharacterState = ResolvedCriminalState;
            FakePerception.Instigator.Character = ResolvedCriminalState.Character;
        }
        else
        {
            FakePerception.Instigator.CharacterState = FocusCharacterState;
        }
        FakePerception.Affected.CharacterState = FocusCharacterState;

        FakePerception.EventTag = GameplayTag::AIEvent_ConflictAssessment;
        AI.AssessEventWithExtraTags(GameplayTag::AIEvent_ConflictAssessment, FakePerception, Tags);
    }

    /**
     * Resolve the real criminal/offender by walking from the focus character (the warner we are joining)
     * to their current AI state and reading the Instigator of that state's RememberedPerception.
     * Returns nullptr on any failure (e.g. focus invalid, AI invalid, current state not a UAIState_PerceptionResponse).
     */
    AGothicCharacterState ResolveCriminalFromFocus(AGothicCharacterState FocusCharacterState) const
    {
        if (!IsValid(FocusCharacterState))
            return nullptr;

        auto FocusAI = Cast<UGameplayAbility_CharacterAI_Gothic>(FocusCharacterState.AI);
        if (!IsValid(FocusAI))
            return nullptr;

        auto FocusState = Cast<UAIState_PerceptionResponse>(FocusAI.CurrentState);
        if (!IsValid(FocusState))
            return nullptr;

        return FocusState.RememberedPerception.Instigator.CharacterState;
    }
}

class UAIEventResponse_SynchEnemiesWithConflictGroupOfCharacter : UAIEventResponse_AssessConflict
{
    UAIEventResponse_SynchEnemiesWithConflictGroupOfCharacter(EPerceptionCharacterType _TargetType)
    {
        TargetType = _TargetType;
    }

    UPROPERTY()
    EPerceptionCharacterType TargetType = EPerceptionCharacterType::None;

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        if (TargetType == EPerceptionCharacterType::None)
            return;

        AGothicCharacterState FocusCharacterState = TargetCharacterState(TargetType, Perception);

        if (!IsValid(FocusCharacterState) || !IsValid(FocusCharacterState.Character))
            return;

        TSet<AGothicCharacterState> AlliedCharacters;
        TSet<AGothicCharacterState> OpposingCharacters;
        TSet<AGothicCharacterState> NeutralCharacters;
        TSet<AGothicCharacterState> EnemyAttackOnSightCharacters;
        TSet<AGothicCharacterState> PlayerCharacters;
        TSet<AGothicCharacterState> AngryOrWorseCreatures;

        if (!AssessConflictGroupOf(FocusCharacterState, AlliedCharacters, OpposingCharacters, NeutralCharacters, EnemyAttackOnSightCharacters, PlayerCharacters, AngryOrWorseCreatures))
            return;

        for (auto AlliedCharacter : AlliedCharacters)
        {
            AI.Character.Perception.SetAwarenessToCharacter(AlliedCharacter.Character, EPerceptionSense::See, 100.0f);
            AI.CrimeProcessingSubsystem.SynchronizeRelativeCrimesFromSource(AI.CharacterState, AlliedCharacter);
        }
        
        for (auto OpposingCharacterState : OpposingCharacters)
        {
            // AI.CharacterState.LongTermMemory.MemorizeActionAgainstCharacter(GameplayTag::Memory_Conflict_JoinedFight, OpposingCharacterState, AI.CharacterState);
            AI.Character.Perception.SetAwarenessToCharacter(OpposingCharacterState.Character, EPerceptionSense::See, 100.0f);
            AddEnemyModifierTargetingCharacter(OpposingCharacterState);

            // Mirror Execute intent from any ally already wanting execution
            if (AnyAlliedHasExecuteModifierTargeting(OpposingCharacterState, AlliedCharacters))
            {
                AddExecuteModifierTargetingCharacter(OpposingCharacterState);
            }
        }

        for (auto AngryOrWorseCreatureState : AngryOrWorseCreatures)
        {
            AI.Character.Perception.SetAwarenessToCharacter(AngryOrWorseCreatureState.Character, EPerceptionSense::See, 100.0f);
            AddEnemyModifierTargetingCharacter(AngryOrWorseCreatureState);
        }
    }

    bool AddEnemyModifierTargetingCharacter(AGothicCharacterState TargetedCharacterState) const
    {
        for (auto Modifier : AI.Self.Relationship.ActivePersonalModifiers)
        {
            if (!Modifier.IsA(UActivePersonalRelationshipModifier_Enemy))
                continue;

            if (Cast<UActivePersonalRelationshipModifier_Enemy>(Modifier).TargetCharacter != TargetedCharacterState)
                continue;

            return false;
        }

        AI.CharacterState.Relationship.AddActiveModifier(UActivePersonalRelationshipModifier_Enemy(TargetedCharacterState));
        NotifyConflictGroupOfRelationshipChange(TargetedCharacterState);
        return true;
    }

    bool AnyAlliedHasExecuteModifierTargeting(const AGothicCharacterState Target, const TSet<AGothicCharacterState>&in Allies) const
    {
        if (!IsValid(Target))
            return false;

        for (auto Ally : Allies)
        {
            if (Ally == AI.CharacterState)
                continue;

            for (auto Modifier : Ally.Relationship.ActivePersonalModifiers)
            {
                if (!Modifier.IsA(UActivePersonalRelationshipModifier_ExecuteCharacter))
                    continue;

                if (Cast<UActivePersonalRelationshipModifier_ExecuteCharacter>(Modifier).TargetCharacter == Target)
                    return true;
            }
        }

        return false;
    }

    bool AddExecuteModifierTargetingCharacter(AGothicCharacterState TargetedCharacterState) const
    {
        for (auto Modifier : AI.Self.Relationship.ActivePersonalModifiers)
        {
            if (!Modifier.IsA(UActivePersonalRelationshipModifier_ExecuteCharacter))
                continue;

            if (Cast<UActivePersonalRelationshipModifier_ExecuteCharacter>(Modifier).TargetCharacter != TargetedCharacterState)
                continue;

            return false;
        }

        AI.CharacterState.Relationship.AddActiveModifier(UActivePersonalRelationshipModifier_ExecuteCharacter(TargetedCharacterState));
        return true;
    }
}

class UAIEventResponse_SynchHostilesWithConflictGroupOfCharacter : UAIEventResponse_AssessConflict
{
    UAIEventResponse_SynchHostilesWithConflictGroupOfCharacter(EPerceptionCharacterType _TargetType)
    {
        TargetType = _TargetType;
    }

    UPROPERTY()
    EPerceptionCharacterType TargetType = EPerceptionCharacterType::None;

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        if (TargetType == EPerceptionCharacterType::None)
            return;

        AGothicCharacterState FocusCharacterState = TargetCharacterState(TargetType, Perception);

        if (!IsValid(FocusCharacterState) || !IsValid(FocusCharacterState.Character))
            return;

        TSet<AGothicCharacterState> AlliedCharacters;
        TSet<AGothicCharacterState> OpposingCharacters;
        TSet<AGothicCharacterState> NeutralCharacters;
        TSet<AGothicCharacterState> EnemyAttackOnSightCharacters;
        TSet<AGothicCharacterState> PlayerCharacters;
        TSet<AGothicCharacterState> AngryOrWorseCreatures;

        if (!AssessConflictGroupOf(FocusCharacterState, AlliedCharacters, OpposingCharacters, NeutralCharacters, EnemyAttackOnSightCharacters, PlayerCharacters, AngryOrWorseCreatures))
            return;

        for (auto AlliedCharacter : AlliedCharacters)
        {
            AI.Character.Perception.SetAwarenessToCharacter(AlliedCharacter.Character, EPerceptionSense::See, 100.0f);
            AI.CrimeProcessingSubsystem.SynchronizeRelativeCrimesFromSource(AI.CharacterState, AlliedCharacter);
        }
        
        for (auto OpposingCharacterState : OpposingCharacters)
        {
            AI.Character.Perception.SetAwarenessToCharacter(OpposingCharacterState.Character, EPerceptionSense::See, 100.0f);
            AddHostileModifierTargetingCharacter(OpposingCharacterState);
        }
    }

    bool AddHostileModifierTargetingCharacter(AGothicCharacterState TargetedCharacterState) const
    {
        for (auto Modifier : AI.Self.Relationship.ActivePersonalModifiers)
        {
            if (!Modifier.IsA(UActivePersonalRelationshipModifier_Hostile))
                continue;

            if (Cast<UActivePersonalRelationshipModifier_Hostile>(Modifier).TargetCharacter != TargetedCharacterState)
                continue;

            return false;
        }

        AI.CharacterState.Relationship.AddActiveModifier(UActivePersonalRelationshipModifier_Hostile(TargetedCharacterState));
        NotifyConflictGroupOfRelationshipChange(TargetedCharacterState);
        return true;
    }
}

UCLASS()
class UAIValueSet_ConflictAssessment : UAIValueSet
{
    /** Transient cache of AssessConflictGroupOf result. */
    UPROPERTY()
    bool bCacheValid = false;

    UPROPERTY()
    UAIGroup_ConflictInstance Group;

    UPROPERTY()
    int GroupStamp = -1;

    UPROPERTY()
    AGothicCharacterState Focus;

    UPROPERTY()
    TSet<AGothicCharacterState> Allied;

    UPROPERTY()
    TSet<AGothicCharacterState> Opposing;

    UPROPERTY()
    TSet<AGothicCharacterState> Neutral;

    UPROPERTY()
    TSet<AGothicCharacterState> EnemyAttackOnSight;

    UPROPERTY()
    TSet<AGothicCharacterState> Player;

    UPROPERTY()
    TSet<AGothicCharacterState> AngryOrWorseCreatures;

    /** Joiner's Allied team idxs. Used for fast lookups. */
    UPROPERTY()
    TSet<int> AlliedTeamIdxs;

    UPROPERTY()
    TMap<int, int> AlliedTeamScores;
}