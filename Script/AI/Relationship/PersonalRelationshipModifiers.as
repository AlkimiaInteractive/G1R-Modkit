UCLASS(Abstract)
class URelationshipModifier_DebugUniversalRelationship : UPersonalRelationshipModifier
{
    default Weight = MAX_flt;
}

class URelationshipModifier_DebugUniversalRelationship_Enemy : URelationshipModifier_DebugUniversalRelationship
{
    default RelationshipTowardsOther = ERelationship::Enemy;
    default HostilityTowardsOther = ERelationshipHostility::AttackOnSight;
    default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::AIDebug_Relationship_Universal_Enemy);
}

class URelationshipModifier_DebugUniversalRelationship_Friend : URelationshipModifier_DebugUniversalRelationship
{
    default RelationshipTowardsOther = ERelationship::Friend;
    default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::AIDebug_Relationship_Universal_Friend);
}

class URelationshipModifier_Fear : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Debuff_Fear);
    default bApplicableWhenOtherIsPlayer = true;
    default bApplicableWhenOtherIsNPC = false;

    default Weight = 15000.0f;

    default RelationshipTowardsOther = ERelationship::Enemy;
    default HostilityTowardsOther = ERelationshipHostility::MagicFear;
}

class URelationshipModifier_Charm : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Debuff_Charm);
    default bApplicableWhenOtherIsPlayer = true;
    default bApplicableWhenOtherIsNPC = false;

    default Weight = 15000.0f;

    default RelationshipTowardsOther = ERelationship::Friend;
    default HostilityTowardsOther = ERelationshipHostility::Help;
}

//// STORY MODIFIER
class UActivePersonalRelationshipModifier_Story : UActivePersonalRelationshipModifier_SingleCharacter
{
    UActivePersonalRelationshipModifier_Story(AGothicCharacterState Other, ERelationship RelationshipTowardsOther)
    {
        TargetCharacter = Other;
        Relationship = RelationshipTowardsOther;
    }

    default Weight = 1000.0f;

    UPROPERTY(SaveGame)
    ERelationship Relationship;

    UFUNCTION(BlueprintOverride)
    ERelationship UpdateRelationship()
    {
        return Relationship;
    }

    UFUNCTION(BlueprintOverride)
    ERelationshipHostility UpdateHostility()
    {
        if (Relationship == ERelationship::Enemy)
            return ERelationshipHostility::AttackOnSight;

        return ERelationshipHostility::Unknown;
    }
}

class UActivePersonalRelationshipModifier_Story_UntilDefeated : UActivePersonalRelationshipModifier_SingleCharacter
{
   UActivePersonalRelationshipModifier_Story_UntilDefeated(AGothicCharacterState Other, ERelationship RelationshipTowardsOther)
    {
        TargetCharacter = Other;
        Relationship = RelationshipTowardsOther;
    }

    default Weight = 2000.0f;

    UPROPERTY(SaveGame)
    ERelationship Relationship;

    UFUNCTION(BlueprintOverride)
    ERelationship UpdateRelationship()
    {
        if (TargetCharacter.HasDefeated(Owner, ActivatedAtTime) || TargetCharacter.WasDefeatedBy(Owner, ActivatedAtTime))
        {
            Discard();
            return ERelationship::Unknown;
        }

        return Relationship;
    }

    UFUNCTION(BlueprintOverride)
    ERelationshipHostility UpdateHostility()
    {
        if (Relationship == ERelationship::Enemy)
            return ERelationshipHostility::AttackOnSight;
        
        return ERelationshipHostility::Unknown;
    }
}


class UActivePersonalRelationshipModifier_Story_Permanent : UActivePersonalRelationshipModifier_SingleCharacter
{
   UActivePersonalRelationshipModifier_Story_Permanent(AGothicCharacterState Other, ERelationship RelationshipTowardsOther)
    {
        TargetCharacter = Other;
        Relationship = RelationshipTowardsOther;
    }

    default Weight = 1000.0f;

    UPROPERTY(SaveGame)
    ERelationship Relationship;

    UFUNCTION(BlueprintOverride)
    ERelationship UpdateRelationship()
    {
        return Relationship;
    }

    UFUNCTION(BlueprintOverride)
    ERelationshipHostility UpdateHostility()
    {
        if (Relationship == ERelationship::Enemy)
            return ERelationshipHostility::AttackOnSight;

        return ERelationshipHostility::Unknown;
    }
}

//// TRANSFORMATION MODIFIER
class URelationshipModifier_TransformedCharacter : UPersonalRelationshipModifier
{
    default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::State_Transformed);
    default Weight = 6.0f;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!IsValid(Other.Character) || !IsValid(Me.Character))
            return false;

        if (!IsValid(Other.Character.GetActorInstigator()))
            return false;

        if (Other.Character == Other.Character.GetActorInstigator())
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    ERelationship HowMuchDoILike(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        auto InstigatorCharacter = Cast<AGothicCharacter>(Other.Character.GetActorInstigator());
        if (!IsValid(InstigatorCharacter))
            return ERelationship::Neutral;
        return Me.GetRelationshipTowards(InstigatorCharacter.CharacterState);
    }

    UFUNCTION(BlueprintOverride)
    ERelationshipHostility HowHostileAmIAgainst(const AGothicCharacterState Me,
                                                const AGothicCharacterState Other) const
    {
        auto InstigatorCharacter = Cast<AGothicCharacter>(Other.Character.GetActorInstigator());
        if (!IsValid(InstigatorCharacter))
            return ERelationshipHostility::None;
        return Me.Relationship.GetHostilityTowards(InstigatorCharacter.CharacterState);
    }
}

class URelationshipModifier_TransformationOverride : UPersonalRelationshipModifier
{
    default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::State_Transformed);
    default Weight = 6.5f;

    /** Witnessed-transformation memory is only considered valid for this many real-time seconds; also cleared when the NPC sees the character return to human. */
    const float WitnessedTransformationMemoryMaxAgeSeconds = 600.0f;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!IsValid(Other.Character) || !IsValid(Me.Character))
            return false;

        if (!IsValid(Other.Character.GetActorInstigator()))
            return false;

        if (Other.Character == Other.Character.GetActorInstigator())
            return false;

        auto InstigatorCharacter = Cast<AGothicCharacter>(Other.Character.GetActorInstigator());
        if (!IsValid(InstigatorCharacter))
            return false;

        AGothicCharacterState InstigatorState = InstigatorCharacter.CharacterState;

        if (Me.IsInPartyWith(InstigatorState))
            return false;

        // Check if we are in active (non-training) conflict with the transformed character or instigator.
        bool bInConflictWithTransformed = false;
        auto Groups = UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_ConflictInstance);
        for (auto Group : Groups)
        {
            auto ConflictGroup = Cast<UAIGroup_ConflictInstance>(Group);
            if (!IsValid(ConflictGroup))
                continue;
            if (ConflictGroup.ConflictType == EConflictType::TrainingFight)
                continue;
            if (!ConflictGroup.IsCharacterInvolved(Me.Character))
                continue;
            if (ConflictGroup.IsCharacterInvolved(Other.Character) || ConflictGroup.IsCharacterInvolved(InstigatorCharacter))
            {
                bInConflictWithTransformed = true;
                break;
            }
        }

        // Not applicable if friendly with the instigator, unless we're already in conflict with them.
        // Only skip override if we witnessed the instigator transform recently (e.g. saw them as wolf)
        if (Me.GetRelationshipTowards(InstigatorState) == ERelationship::Friend && !bInConflictWithTransformed)
        {
            bool bWitnessedTransform = Me.LongTermMemory.FilterEventsAffectingMe(GameplayTag::Memory_WitnessedTransformation)
                .CausedBy(InstigatorState.CharacterGlobalId)
                .AfterTime(FInGameTime::XRealtimeSecondsAgo(WitnessedTransformationMemoryMaxAgeSeconds))
                .Count >= 1;
            if (bWitnessedTransform)
                return false;
        }

        // Not applicable if we are in a training fight with the transformed character or instigator.
        for (auto Group : Groups)
        {
            auto ConflictGroup = Cast<UAIGroup_ConflictInstance>(Group);
            if (!IsValid(ConflictGroup))
                continue;
            if (ConflictGroup.ConflictType != EConflictType::TrainingFight)
                continue;
            if (!ConflictGroup.IsCharacterInvolved(Me.Character))
                continue;
            if (ConflictGroup.IsCharacterInvolved(Other.Character))
                return false;
            if (ConflictGroup.IsCharacterInvolved(InstigatorCharacter))
                return false;
        }

        // Apply species-based relationship so NPCs treat player-as-creature as hostile (attack on sight).
        return true;
    }

    /** Resolve the species to use for static relationship lookup: prefer transformed species from owned tags, else CharacterState.Species. */
    private FGameplayTag GetOtherSpeciesForStaticLookup(const AGothicCharacterState Other) const
    {
        FGameplayTagContainer SpeciesTagFilter;
        SpeciesTagFilter.AddTag(GameplayTag::Species);

        FGameplayTagContainer OtherTags;
        Other.Character.GetGothicAbilitySystemComponent().GetOwnedGameplayTags(OtherTags);
        OtherTags = OtherTags.Filter(SpeciesTagFilter);
        OtherTags.RemoveTag(Other.Species);

        for (FGameplayTag Tag : OtherTags.GameplayTags)
            return Tag;

        return Other.Species;
    }

    UFUNCTION(BlueprintOverride)
    ERelationship HowMuchDoILike(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        FGameplayTag OtherSpecies = GetOtherSpeciesForStaticLookup(Other);
        auto StaticValues = URelationshipSystem::Get().StaticRelationshipBetween(Me.Species, OtherSpecies, Me.Guild, GameplayTag::Guild_None);

        if (StaticValues.Relationship == ERelationship::Friend)
            return ERelationship::Neutral;

        // Elevate Angry/Hostile to Enemy so perception fires SeenLivingEnemyCharacter (not just Seen_Hostile).
        // Attack-on-sight and flee rules only respond to AIEvent_Seen_Enemy, which requires relationship Enemy.
        if (StaticValues.Relationship == ERelationship::Angry || StaticValues.Relationship == ERelationship::Hostile)
            return ERelationship::Enemy;

        return StaticValues.Relationship;
    }

    UFUNCTION(BlueprintOverride)
    ERelationshipHostility HowHostileAmIAgainst(const AGothicCharacterState Me,
                                                const AGothicCharacterState Other) const
    {
        FGameplayTag OtherSpecies = GetOtherSpeciesForStaticLookup(Other);
        auto StaticValues = URelationshipSystem::Get().StaticRelationshipBetween(Me.Species, OtherSpecies, Me.Guild, GameplayTag::Guild_None);

        if (StaticValues.Hostility != ERelationshipHostility::None)
            return StaticValues.Hostility;

        // When static relationship is Angry/Enemy but no explicit hostility, use AttackOnSight so NPCs attack transformed beasts immediately.
        if (StaticValues.Relationship == ERelationship::Angry || StaticValues.Relationship == ERelationship::Enemy)
            return ERelationshipHostility::AttackOnSight;

        return StaticValues.Hostility;
    }
}

/// Leader relative rank
#ifdef WITH_STORY_G1R
class URelationshipModifier_GuildToLeader : UPersonalRelationshipModifier
{
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::CampRole_GuildLeader);
    default Weight = 500.0f;

    default RelativeRankTowardsOther = ERelationshipRelativeRank::HigherThanMe;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!Me.GetGuildLevelTag().MatchesTagExact(Other.GetGuildLevelTag()))
            return false;

        return true;
    }
}
#endif

#ifdef WITH_STORY_G1R
class URelationshipModifier_LeaderToGuild : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::CampRole_GuildLeader);
    default Weight = 500.0f;

    default RelativeRankTowardsOther = ERelationshipRelativeRank::LowerThanMe;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!Me.GetGuildLevelTag().MatchesTagExact(Other.GetGuildLevelTag()))
            return false;

        return true;
    }
}
#endif

/// Leader relative rank
#ifdef WITH_STORY_G1R
class URelationshipModifier_CampToBoss : UPersonalRelationshipModifier
{
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::CampRole_Boss);
    default Weight = 550.0f;

    default RelativeRankTowardsOther = ERelationshipRelativeRank::Boss;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!Me.GetGuildLevelTag().MatchesTagExact(Other.GetGuildLevelTag()))
            return false;

        return true;
    }
}
#endif

#ifdef WITH_STORY_G1R
class URelationshipModifier_BossToCamp : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::CampRole_Boss);
    default Weight = 550.0f;

    default RelativeRankTowardsOther = ERelationshipRelativeRank::LowerThanMe;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!Me.GetGuildLevelTag().MatchesTagExact(Other.GetGuildLevelTag()))
            return false;

        return true;
    }
}
#endif

// class URelationshipModifier_StayNeutralTo_NonEnemyAIControlledCreatures : UPersonalRelationshipModifier
// {
//     default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Creature);
//     default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Human);
//     default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Orc);

//     default Weight = 10.0f;

//     default ApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Angry);

//     default RelationshipTowardsOther = ERelationship::Neutral;

//     UFUNCTION(BlueprintOverride)
//     bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
//     {
//         if (!IsValid(Other.Character))
//             return false;

//         if (Other.Character.IsPlayerControlled())
//             return false;

//         if (Other.Character.HasGameplayTag(GameplayTag::AIState_Conflict_Search))
//             return true;

//         if (Other.Character.HasDrawnWeapon())
//             return false;

//         auto AI = Other.Character.GetGothicAI();
//         if (!IsValid(AI))
//             return true;
        
//         UGothicCharacterAIState ScheduledAIState = Cast<UGothicCharacterAIState>(AI.ScheduledDailyRoutineAIStateTemplate);

//         if (!IsValid(ScheduledAIState) || !ScheduledAIState.IsA(UAIState_GuideCharacter))
//             return true;

//         return true;
//     }
// }

// class URelationshipModifier_BecomeEnemyTowards_NonEnemyAIControlledCreaturesInCombat : UPersonalRelationshipModifier
// {
//     default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Creature);
//     default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Human);
//     default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Orc);
//     default Weight = 15.0f;

//     default NotApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::AIState_Conflict_Search);

//     default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Friend);
//     default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Neutral);

//     default RelationshipTowardsOther = ERelationship::Enemy;
//     default HostilityTowardsOther = ERelationshipHostility::AttackOnSight;

//     UFUNCTION(BlueprintOverride)
//     bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
//     {
//         // #ifdef G1R_DEMO
//         //     return false;
//         // #endif

//         if (!IsValid(Me.Character))
//             return false;

//         if (!IsValid(Other.Character))
//             return false;

//         if (Me.GetRelationshipTowards(Other) == ERelationship::Friend)
//             return false;

//         if (Other.Character.IsPlayerControlled())
//             return false;

//         if (!Other.Character.IsInConflictFightingState())
//             return false;

//         return true;
//     }
// }

class URelationshipModifier_EscalateHostilesToEnemy_PlayerControlledCreatures : UPersonalRelationshipModifier
{
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Creature);
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Orc);
    default Weight = 10.0f;

    default ApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Hostile);
    default ApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Enemy);

    default RelationshipTowardsOther = ERelationship::Enemy;
    default HostilityTowardsOther = ERelationshipHostility::AttackOnSight;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        // #ifdef G1R_DEMO
        //     return false;
        // #endif
        // if (!IsValid(Other.Character))
        //     return false;

        if (IsValid(Other.Character) && !Other.Character.IsPlayerControlled())
            return false;
        
        return true;
    }
}

class URelationshipModifier_AngryCreatures_EscalateToEnemyWhenInPlayerParty : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Creature);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Orc);
    default Weight = 10.0f;

    default ApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Angry);

    default RelationshipTowardsOther = ERelationship::Enemy;
    default HostilityTowardsOther = ERelationshipHostility::AttackOnSight;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!IsValid(Me.Character))
            return false;

        if (!IsValid(Other.Character))
            return false;

        if (Other.Character.IsPlayerControlled() || Other.Character.IsPlayerCharacter())
            return false;

        auto PlayerCharacter = Cast<AGothicCharacter>(Gameplay::GetPlayerCharacter(0));
        if (!IsValid(PlayerCharacter))
            return false;

        if (!Other.IsInPartyWith(PlayerCharacter.CharacterState))
            return false;

        return true;
    }
}

class URelationshipModifier_GuidingCharacter_TowardsCreatures : UPersonalRelationshipModifier
{
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Creature);
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Orc);
    default Weight = 15.0f;

    default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Friend);
    default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Neutral);

    default RelationshipTowardsOther = ERelationship::Enemy;
    default HostilityTowardsOther = ERelationshipHostility::AttackOnSight;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        // #ifdef G1R_DEMO
        //     return false;
        // #endif
        if (!IsValid(Other.Character))
            return false;

        if (Me.GetRelationshipTowards(Other) == ERelationship::Friend)
            return false;

        if (Other.Character.IsPlayerControlled() || Other.Character.IsPlayerCharacter())
            return false;

        auto AI = Me.Character.GetGothicAI();
        if (!IsValid(AI))
            return false;
        
        UGothicCharacterAIState ScheduledAIState = Cast<UGothicCharacterAIState>(AI.ScheduledDailyRoutineAIStateTemplate);

        if (!IsValid(ScheduledAIState) || !ScheduledAIState.IsA(UAIState_GuideCharacter))
            return false;

        return true;
    }
}

class URelationshipModifier_Creatures_TowardsGuidingCharacters : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Creature);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Orc);
    default Weight = 10.0f;

    default ApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Angry);
    default ApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Hostile);

    default RelationshipTowardsOther = ERelationship::Enemy;
    default HostilityTowardsOther = ERelationshipHostility::AttackOnSight;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!IsValid(Me.Character))
            return false;

        if (!IsValid(Other.Character))
            return false;
        
        auto AI = Other.Character.GetGothicAI();
        if (!IsValid(AI))
            return false;
        
        UGothicCharacterAIState ScheduledAIState = Cast<UGothicCharacterAIState>(AI.ScheduledDailyRoutineAIStateTemplate);

        if (!IsValid(ScheduledAIState) || !ScheduledAIState.IsA(UAIState_GuideCharacter))
            return false;
        
        return true;
    }
}

// class URelationshipModifier_HostileCreatures_NeutralOrEnemyToNonCreatures : UPersonalRelationshipModifier
// {
//     default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Creature);
//     // default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Human);
//     // default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Orc);
//     default Weight = 2.0f;

//     default ApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Hostile);
//     default ApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Neutral);

//     UFUNCTION(BlueprintOverride)
//     bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
//     {
//         if (!IsValid(Me.Character))
//             return false;

//         if (!IsValid(Other.Character))
//             return false;

//         if (Other.Character.IsPlayerControlled() || Other.Character.IsPlayerCharacter())
//             return false;

//         return true;
//     }

//     UFUNCTION(BlueprintOverride)
//     ERelationship HowMuchDoILike(const AGothicCharacterState Me, const AGothicCharacterState Other) const
//     {
//         if (Other.GetRelationshipWith(Me) == ERelationship::Enemy)
//             return ERelationship::Enemy;

//         return ERelationship::Neutral;
//     }
// }

class URelationshipModifier_SummonsFriendlyToSummoner : UPersonalRelationshipModifier
{
    default Weight = 15000.0f;
    default RelationshipTowardsOther = ERelationship::Friend;
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::State_Summoned);
    default NotApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::State_Transformed);
    default NotApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::State_Controlled);

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        
        if (!IsValid(Me.Character))
            return false;

        if (!IsValid(Other.Character))
            return false;

        auto npcState = Cast<AGothicNPCState>(Me);
        if(npcState == nullptr)
            return false;
        
        auto summonedBy = npcState.GetSummonedBy();
        if(summonedBy == nullptr)
            return false;

        if (!IsValid(summonedBy.Character))
            return false;
        
        if (summonedBy != Other && !Other.IsInPartyWith(summonedBy))
            return false;

        return true;
    }
}

class URelationshipModifier_SummonerFriendlyToSummons : UPersonalRelationshipModifier
{
    default Weight = 15000.0f;
    default RelationshipTowardsOther = ERelationship::Friend;
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::State_Summoned);
    default NotApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::State_Transformed);
    default NotApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::State_Controlled);

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        
        if (!IsValid(Me.Character))
            return false;

        if (!IsValid(Other.Character))
            return false;

        auto npcState = Cast<AGothicNPCState>(Other);
        if(npcState == nullptr)
            return false;
        
        auto summonedBy = npcState.GetSummonedBy();
        if(summonedBy == nullptr)
            return false;

        if (!IsValid(summonedBy.Character))
            return false;
        
        if (summonedBy != Me && !Me.IsInPartyWith(summonedBy))
            return false;

        return true;
    }
}

class URelationshipModifier_RelationshipsFromSummoned : UPersonalRelationshipModifier
{
    default Weight = 9000.0f;
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::State_Summoned);

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        auto npcState = Cast<AGothicNPCState>(Me);
        if(npcState == nullptr)
            return false;
        
        auto summonedBy = npcState.GetSummonedBy();
        if(summonedBy == nullptr)
            return false;

        if (!IsValid(summonedBy.Character))
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    ERelationship HowMuchDoILike(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        auto npcState = Cast<AGothicNPCState>(Me);
        if(npcState == nullptr)
            return ERelationship::Unknown;
        
        auto summonedBy = npcState.GetSummonedBy();
        if(summonedBy == nullptr)
            return ERelationship::Unknown;

        if (summonedBy.IsPlayerCharacter())
            return Other.Relationship.GetRelationshipTowards(summonedBy);

        return summonedBy.Relationship.GetRelationshipTowards(Other);
    }
}

class URelationshipModifier_RelationshipsTowardsSummoned : UPersonalRelationshipModifier
{
    default Weight = 9000.0f;
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::State_Summoned);

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        auto npcState = Cast<AGothicNPCState>(Other);
        if(npcState == nullptr)
            return false;
        
        auto summonedBy = npcState.GetSummonedBy();
        if(summonedBy == nullptr)
            return false;

        if (!IsValid(summonedBy.Character))
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    ERelationship HowMuchDoILike(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        auto npcState = Cast<AGothicNPCState>(Other);
        if(npcState == nullptr)
            return ERelationship::Unknown;
        
        auto summonedBy = npcState.GetSummonedBy();
        if(summonedBy == nullptr)
            return ERelationship::Unknown;
        return Me.Relationship.GetRelationshipTowards(summonedBy);
    }
}

class URelationshipModifier_RideableScavengerTowardsHumans : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Creature_Scavenger_Adult_Rideable);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Human);

    default Weight = 9000.0f;

    default RelationshipTowardsOther = ERelationship::Neutral;
}

class URelationshipModifier_RideableScavengerTowardsPlayer : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Creature_Scavenger_Adult_Rideable);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Human);

    default bApplicableWhenOtherIsNPC = false;
    default bApplicableWhenOtherIsPlayer = true;

    default Weight = 9000.0f;

    default RelationshipTowardsOther = ERelationship::Friend;
}

class URelationshipModifier_HumansTowardsRideableScavenger : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Species_Creature_Scavenger_Adult_Rideable);

    default Weight = 9000.0f;

    default RelationshipTowardsOther = ERelationship::Neutral;
}

class URelationshipModifier_OwnedRideableScavengerTowardsOthers : UPersonalRelationshipModifier
{
    default Weight = 9000.0f;
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Species_Creature_Scavenger_Adult_Rideable);
    default bApplicableWhenOtherIsNPC = true;
    default bApplicableWhenOtherIsPlayer = false;

    UFUNCTION(BlueprintOverride)
    ERelationship HowMuchDoILike(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {        
        auto Player = Cast<AGothicCharacterState>(Gameplay::GetPlayerState(0));
        if(!IsValid(Player))
            return ERelationship::Unknown;

        return Other.Relationship.GetRelationshipTowards(Player);
    }
}

class URelationshipModifier_FriendlyToPartyMember : UPersonalRelationshipModifier
{
    default Weight = 10000.0f;

    default RelationshipTowardsOther = ERelationship::Friend;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!IsValid(Me.Character))
            return false;

        if (!IsValid(Other.Character))
            return false;
        
        if (!Me.IsInPartyWith(Other))
            return false;

        return true;
    }
}

class UActivePersonalRelationshipModifier_StartHunt : UActivePersonalRelationshipModifier
{
    UActivePersonalRelationshipModifier_StartHunt(FGameplayTag InTargetCharacterSpecies, float DurationInGameHours = 5.0f)
    {
        ValidForIngameHours = DurationInGameHours;
        TargetCharacterSpecies = InTargetCharacterSpecies;
    }

    UPROPERTY()
    FGameplayTag TargetCharacterSpecies;
    default Weight = 10000.0f;

    default RelationshipTowardsOther = ERelationship::Enemy;
    default HostilityTowardsOther = ERelationshipHostility::Loot;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!TargetCharacterSpecies.IsValid())
            return false;

        if (!Other.Species.MatchesTag(TargetCharacterSpecies))
            return false;

        return true;
    }
}

UCLASS(Abstract)
class UActivePersonalRelationshipModifier_RelationshipToGuild : UActivePersonalRelationshipModifier
{
    UPROPERTY(SaveGame)
    FGameplayTag TargetGuild;

    default Weight = 10000.0f;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!TargetGuild.IsValid())
            return false;

        if (!Other.IsTrulyPartOfGuild(TargetGuild))
            return false;

        return true;
    }
}

UCLASS(Abstract)
class UActivePersonalRelationshipModifier_RelationshipToCharacterByUniqueName : UActivePersonalRelationshipModifier
{
    UPROPERTY(SaveGame)
    FName CharacterUniqueName;

    default Weight = 10000.0f;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (Other.CharacterUniqueName != CharacterUniqueName)
            return false;

        return true;
    }
}

class UActivePersonalRelationshipModifier_Enemy : UActivePersonalRelationshipModifier_SingleCharacter
{
    UActivePersonalRelationshipModifier_Enemy(AGothicCharacterState Other)
    {
        TargetCharacter = Other;
    }

    default Weight = 12000.0f;

    default RelationshipTowardsOther = ERelationship::Enemy;
    default HostilityTowardsOther = ERelationshipHostility::AttackWithinReason;

    default bCanTick = true;
    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaTime)
    {
        if (!IsValid(TargetCharacter))
            return;
        
        auto AI = Owner.CharacterAI;
        if (!IsValid(AI))
        {
            Discard();
            return;
        }
        
        if (TargetCharacter.IsDefeated() || TargetCharacter.IsDead())
        {
            Discard();
            return;
        }

        if (AI.HasPendingScheduledState())
            return;

        if (Owner.HasGameplayTag(GameplayTag::AIState_DailyRoutine))
        {
            Discard();
            return;
        }
    }

    UFUNCTION(BlueprintOverride)
    void HandleModifierRemoved()
    {
        auto AI = IsValid(Owner) ? Owner.CharacterAI : nullptr;
        FString Msg = f"[ActiveRelationshipDbg] RelationshipModifier_Enemy removed. Owner={Owner} Target={TargetCharacter}"
            + f" Class={Class.Name}"
            + f" InTraining={IsValid(Owner) && Owner.IsInTrainingFight()}"
            + f" Pending={IsValid(AI) && AI.HasPendingScheduledState()}"
            + f" DR={IsValid(Owner) && Owner.HasGameplayTag(GameplayTag::AIState_DailyRoutine)}"
            + f" GoToDR={IsValid(Owner) && Owner.HasGameplayTag(GameplayTag::AIState_AssessGoToDailyRoutine)}"
            + f" Combat={IsValid(Owner) && Owner.HasGameplayTag(GameplayTag::AIState_Conflict_Combat)}"
            + "\n" + FormatAngelscriptCallstack();
        Log(Msg);          // or whatever logging helper you use; Print() too so testers see it
    }
}

class UActivePersonalRelationshipModifier_Hostile : UActivePersonalRelationshipModifier_SingleCharacter
{
    UActivePersonalRelationshipModifier_Hostile(AGothicCharacterState Other)
    {
        TargetCharacter = Other;
    }

    default Weight = 11000.0f;

    default RelationshipTowardsOther = ERelationship::Hostile;
    default HostilityTowardsOther = ERelationshipHostility::AttackWithinReason;

    default bCanTick = true;
    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaTime)
    {
        auto AI = Owner.CharacterAI;
        if (!IsValid(AI))
        {
            Discard();
            return;
        }
        
        if (AI.HasPendingScheduledState())
            return;

        if (Owner.HasGameplayTag(GameplayTag::AIState_DailyRoutine))
        {
            Discard();
            return;
        }
    }
}

// class UActivePersonalRelationshipModifier_Hostile_Trespassing : UActivePersonalRelationshipModifier_SingleCharacter
// {
//     UActivePersonalRelationshipModifier_Hostile_Trespassing(AGothicCharacterState Other)
//     {
//         TargetCharacter = Other;
//     }

//     default bCanTick = true;
//     default Weight = 5000.0f;

//     default RelationshipTowardsOther = ERelationship::Hostile;
//     default HostilityTowardsOther = ERelationshipHostility::AttackWithinReason;

//     UFUNCTION(BlueprintOverride)
//     void Tick(float DeltaTime)
//     {
//         if (!IsValid(Owner) || !IsValid(TargetCharacter) || !IsValid(Owner.Character) || !IsValid(TargetCharacter.Character))
//             return;

//         if (Owner.IsDead() || Owner.IsDefeated())
//         {
//             Discard();
//             return;
//         }

//         if (!IsValid(Owner.Character))
//         {
//             Discard();
//             return;
//         }

//         if (!IsValid(TargetCharacter.Character))
//         {
//             Discard();
//             return;
//         }

//         FGameplayTag AreaTag = TargetCharacter.AreaTagOfLocation;

//         if (!TargetCharacter.IsCharacterTrespassingAccordingToWitness(AI.CharacterState))
//         {
//             Discard();
//             return;
//         }
//     }
// }

// class UActivePersonalRelationshipModifier_Hostile_OwnedInteractableUse : UActivePersonalRelationshipModifier_SingleCharacter
// {
//     UActivePersonalRelationshipModifier_Hostile_OwnedInteractableUse(AGothicCharacterState Other)
//     {
//         TargetCharacter = Other;
//     }

//     default bCanTick = true;
//     default Weight = 5000.0f;

//     default RelationshipTowardsOther = ERelationship::Hostile;
//     default HostilityTowardsOther = ERelationshipHostility::AttackWithinReason;

//     UFUNCTION(BlueprintOverride)
//     void Tick(float DeltaTime)
//     {
//         if (!IsValid(Owner) || !IsValid(TargetCharacter))
//             return;

//         if (Owner.IsDead() || Owner.IsDefeated())
//         {
//             Discard();
//             return;
//         }

//         if (!IsValid(Owner.Character))
//         {
//             Discard();
//             return;
//         }

//         if (!IsValid(TargetCharacter.Character))
//         {
//             Discard();
//             return;
//         }

//         if (!TargetCharacter.HasGameplayTag(GameplayTag::State_PickLock))
//         {
//             Discard();
//             return;
//         }
//     }
// }

// class UActivePersonalRelationshipModifier_HostileIfBeingThreatened_HumanOrc : UActivePersonalRelationshipModifier_SingleCharacter
// {
//     UActivePersonalRelationshipModifier_HostileIfBeingThreatened_HumanOrc(AGothicCharacterState Other)
//     {
//         TargetCharacter = Other;
//     }

//     default bCanTick = true;
//     default Weight = 6000.0f;

//     default RelationshipTowardsOther = ERelationship::Hostile;
//     default HostilityTowardsOther = ERelationshipHostility::AttackWithinReason;

//     UFUNCTION(BlueprintOverride)
//     void Tick(float DeltaTime)
//     {
//         if (!IsValid(Owner) || !IsValid(TargetCharacter) || !IsValid(Owner.Character) || !IsValid(TargetCharacter.Character))
//             return;

//         if (Owner.IsDead() || Owner.IsDefeated())
//         {
//             Discard();
//             return;
//         }

//         if (!IsValid(Owner.Character))
//         {
//             Discard();
//             return;
//         }

//         if (!IsValid(TargetCharacter.Character))
//         {
//             Discard();
//             return;
//         }

//         if (!TargetCharacter.Character.HasDrawnWeapon() && !TargetCharacter.Character.IsDrawingOrUndrawingWeapon())
//         {
//             Discard();
//             return;
//         }

//         if (TargetCharacter.Character.IsBeingTargetedInTrainingFight())
//         {
//             Discard();
//             return;
//         }

//         if (TargetCharacter.Character.IsBeingTargetedByCreatureInCombat())
//         {
//             Discard();
//             return;
//         }

//         if (!Owner.IsHostileTowards(TargetCharacter) && !Owner.IsAngryTowards(TargetCharacter) && !Owner.IsEnemyTowards(TargetCharacter))
//         {
//             for (auto Character : TargetCharacter.Character.GetCharactersWithTagTargetingThisCharacterInCombat())
//             {
//                 if (Owner.IsAngryTowards(Character.CharacterState) || Owner.IsHostileTowards(Character.CharacterState))
//                 {
//                     Discard();
//                     return;
//                 }
//             }
//         }

//         auto SelfAI = Owner.Character.GetGothicAI();
//         if (!IsValid(SelfAI))
//         {
//             Discard();
//             return;
//         }

//         if (!SelfAI.IsCharacterConsideredAThreat(TargetCharacter.Character))
//         {
//             Discard();
//             return;
//         }

//         FGameplayTagContainer DefeatMemoryTags;
//         DefeatMemoryTags.AddTag(GameplayTag::Memory_Combat_WasDefeated);
//         auto AggressorDefeatMemories = Owner.LongTermMemory.Filter().HavingAnyMatchingTag(DefeatMemoryTags).Affecting(TargetCharacter.CharacterGlobalId).AfterTime(ActivatedAtTime).GetArray();
//         if (AggressorDefeatMemories.Num() > 0)
//         {
//             Discard();
//             return;
//         }
//     }
// }

class URelationshipModifier_DegradeOutcastToNeutral_All : UPersonalRelationshipModifier
{
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Character_Personality_Outcast_All);

    default Weight = 10.0f;
    default RelationshipTowardsOther = ERelationship::Neutral;
    default HostilityTowardsOther = ERelationshipHostility::None;
    default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Enemy);
    default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Angry);
    default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Hostile);
}

class URelationshipModifier_DegradeOutcastToNeutral_OldCamp : UPersonalRelationshipModifier
{
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Character_Personality_Outcast_OldCamp);
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp);

    default Weight = 10.0f;
    default RelationshipTowardsOther = ERelationship::Neutral;
    default HostilityTowardsOther = ERelationshipHostility::None;
    default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Enemy);
    default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Angry);
    default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Hostile);
}

class URelationshipModifier_DegradeOutcastToNeutral_NewCamp : UPersonalRelationshipModifier
{
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Character_Personality_Outcast_NewCamp);
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Guild_Human_NewCamp);
    
    default Weight = 10.0f;
    default RelationshipTowardsOther = ERelationship::Neutral;
    default HostilityTowardsOther = ERelationshipHostility::None;
    default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Enemy);
    default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Angry);
    default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Hostile);
}

class URelationshipModifier_DegradeAllToNeutral_Outcast : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Character_Personality_Outcast_All);

    default Weight = 10.0f;
    default RelationshipTowardsOther = ERelationship::Neutral;
    default HostilityTowardsOther = ERelationshipHostility::None;
    default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Enemy);
    default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Angry);
    default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Hostile);
}

class URelationshipModifier_DegradeOldCampToNeutral_Outcast : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Character_Personality_Outcast_OldCamp);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp);

    default Weight = 10.0f;
    default RelationshipTowardsOther = ERelationship::Neutral;
    default HostilityTowardsOther = ERelationshipHostility::None;
    default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Enemy);
    default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Angry);
    default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Hostile);
}

class URelationshipModifier_DegradeNewCampToNeutral_Outcast : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Character_Personality_Outcast_NewCamp);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Guild_Human_NewCamp);
    
    default Weight = 10.0f;
    default RelationshipTowardsOther = ERelationship::Neutral;
    default HostilityTowardsOther = ERelationshipHostility::None;
    default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Enemy);
    default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Angry);
    default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Hostile);
}

class UActivePersonalRelationshipModifier_FriendlyToCharacter : UActivePersonalRelationshipModifier_SingleCharacter
{
    UActivePersonalRelationshipModifier_FriendlyToCharacter(AGothicCharacterState Other)
    {
        TargetCharacter = Other;
    }

    default Weight = 10000.0f;

    default RelationshipTowardsOther = ERelationship::Friend;
    default HostilityTowardsOther = ERelationshipHostility::Help;
}

class UActivePersonalRelationshipModifier_AngryToCharacter : UActivePersonalRelationshipModifier_SingleCharacter
{
    UActivePersonalRelationshipModifier_AngryToCharacter(AGothicCharacterState Other)
    {
        TargetCharacter = Other;
    }

    default Weight = 9900.0f; // 9900
    default RelationshipTowardsOther = ERelationship::Angry;

    default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Enemy);
}

class UActivePersonalRelationshipModifier_FriendlyToPlayer : UActivePersonalRelationshipModifier
{
    default Weight = 10000.0f;
    default RelationshipTowardsOther = ERelationship::Friend;

    default bApplicableWhenOtherIsPlayer = true;
    default bApplicableWhenOtherIsNPC = false;
}

class UActivePersonalRelationshipModifier_ExecuteCharacter : UActivePersonalRelationshipModifier_SingleCharacter
{
    UActivePersonalRelationshipModifier_ExecuteCharacter(AGothicCharacterState Other)
    {
        TargetCharacter = Other;
    }

    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::State_Defeated);
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::AIState_Conflict_CombatEndActions);

    default Weight = 12010.0f;
    default bCanTick = true;

    default RelationshipTowardsOther = ERelationship::Enemy;
    default HostilityTowardsOther = ERelationshipHostility::Execute;

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaTime)
    {        
        if (!IsValid(Owner) || !IsValid(Owner.CharacterAI))
            return;

        // End if the Agent ever goes back to routine states
        if (!IsValid(Owner.CharacterAI.ScheduledNextState) && !Owner.HasGameplayTag(GameplayTag::AIState_Conflict))
        {
            Discard();
        }
    }
}

class UActivePersonalRelationshipModifier_LootCharacter : UActivePersonalRelationshipModifier_SingleCharacter
{
    UActivePersonalRelationshipModifier_LootCharacter(AGothicCharacterState Other)
    {
        TargetCharacter = Other;
    }

    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::State_Defeated);
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::AIState_Conflict_CombatEndActions);
    
    default Weight = 11050.0f;
    default bCanTick = true;

    default RelationshipTowardsOther = ERelationship::Hostile;
    default HostilityTowardsOther = ERelationshipHostility::Loot;

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaTime)
    {        
        if (!IsValid(Owner) || !IsValid(Owner.CharacterAI))
            return;

        // End if the Agent ever goes back to routine states
        if (!IsValid(Owner.CharacterAI.ScheduledNextState) && !Owner.HasGameplayTag(GameplayTag::AIState_Conflict))
        {
            Discard();
        }
    }
}

/// SPECIAL MODIFIERS FOR TESTS ///

class URelationshipModifier_RebelDigger : UPersonalRelationshipModifier
{
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp_Guard);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp_Shadow);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp_OreBaron);
    default Weight = 5000.0f;

    default RelationshipTowardsOther = ERelationship::Enemy;
    default HostilityTowardsOther = ERelationshipHostility::AttackOnSight;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!IsValid(Me.Character))
            return false;

        if (!IsValid(Other.Character))
            return false;
        
        if (Me.CharacterUniqueName != n"RebelDigger")
            return false;

        return true;
    }
}

// class URelationshipModifier_Test_NeutralCreatureOverride : UPersonalRelationshipModifier
// {
//     default Weight = 10000.0f;

//     UFUNCTION(BlueprintOverride)
//     bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
//     {
//         if (!Other.Species.MatchesTag(GameplayTag::Species_Creature))
//             return false;

//         return true;
//     }

//     UFUNCTION(BlueprintOverride)
//     ERelationship HowMuchDoILike(const AGothicCharacterState Me, const AGothicCharacterState Other) const
//     {
//         return ERelationship::Neutral;
//     }
// }


// class URelationshipModifier_DoNotPursueIntrusionForOwners : UPersonalRelationshipModifier
// {
//     UFUNCTION(BlueprintOverride)
//     FPursuedCrimeSet WhatCrimesDoIPursueOtherFor(const AGothicCharacterState Me,
//                                                  const AGothicCharacterState Other) const
//     {
//         Me.Relationship.GetCrime
//     }
// }

#ifdef WITH_STORY_G1R
class URelationshipModifier_SwampCampNovices_LowThreatMagicTarget : UPersonalRelationshipModifier
{
    default Weight = 20.0f;
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Guild_Human_SwampCamp_Novice);
    default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::Species_Human);

    default HostilityTowardsOther = ERelationshipHostility::LowThreatMagicTarget;

    default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Enemy);
    default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Hostile);

    default bApplicableWhenOtherIsPlayer = true;
    default bApplicableWhenOtherIsNPC = false;

    // default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Area tags);
}
#endif

// #ifdef WITH_STORY_G1R
// class URelationshipModifier_Mud_FollowHero : UPersonalRelationshipModifier
// {
//     default Weight = 20.0f;
//     default HostilityTowardsOther = ERelationshipHostility::FollowOnSight;
//     default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Enemy);
//     default NotApplicableWhenStaticRelationshipToOtherIs.Add(ERelationship::Hostile);

//     default bApplicableWhenOtherIsPlayer = true;

//     // default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Area tags);
//     UFUNCTION(BlueprintOverride)
//     bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
//     {
//         if (Me.CharacterUniqueName != n"OC_VLK_Mud_574")
//             return false;

//         if (G1R::UStoryG1R::Get().Mud_Follow == 0)
//             return false;

//         return true;
//     }
// }
// #endif

UCLASS(Abstract)
class UPersonalRelationshipModifier_AreaRequirement : UPersonalRelationshipModifier
{
    FGameplayTagContainer ApplicableWhenSelfOrOtherAreaIsAnyOf;
    FGameplayTagContainer ApplicableWhenSelfAreaIsAnyOf;
    FGameplayTagContainer ApplicableWhenOtherAreaIsAnyOf;

    FGameplayTagContainer NotApplicableWhenSelfOrOtherAreaIsAnyOf;
    FGameplayTagContainer NotApplicableWhenSelfAreaIsAnyOf;
    FGameplayTagContainer NotApplicableWhenOtherAreaIsAnyOf;

    FGameplayTagContainer ApplicableWhenSelfAndOtherAreaIsAnyOf;
    FGameplayTagContainer NotApplicableWhenSelfAndOtherAreaIsAnyOf;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!ApplicableWhenSelfAndOtherAreaIsAnyOf.IsEmpty() && 
            !(Me.AreaTagOfLocation.MatchesAny(ApplicableWhenSelfAndOtherAreaIsAnyOf) &&
            Other.AreaTagOfLocation.MatchesAny(ApplicableWhenSelfAndOtherAreaIsAnyOf)))
            return false;
        
        if (!NotApplicableWhenSelfAndOtherAreaIsAnyOf.IsEmpty() && 
            (Me.AreaTagOfLocation.MatchesAny(NotApplicableWhenSelfAndOtherAreaIsAnyOf) &&
            Other.AreaTagOfLocation.MatchesAny(NotApplicableWhenSelfAndOtherAreaIsAnyOf)))
            return false;

        if (!ApplicableWhenSelfOrOtherAreaIsAnyOf.IsEmpty() && 
            !Me.AreaTagOfLocation.MatchesAny(ApplicableWhenSelfOrOtherAreaIsAnyOf) &&
            !Other.AreaTagOfLocation.MatchesAny(ApplicableWhenSelfOrOtherAreaIsAnyOf))
            return false;

        if (!ApplicableWhenSelfAreaIsAnyOf.IsEmpty() && !Me.AreaTagOfLocation.MatchesAny(ApplicableWhenSelfAreaIsAnyOf))
            return false;

        if (!ApplicableWhenOtherAreaIsAnyOf.IsEmpty() && !Other.AreaTagOfLocation.MatchesAny(ApplicableWhenOtherAreaIsAnyOf))
            return false;

        if (!NotApplicableWhenSelfOrOtherAreaIsAnyOf.IsEmpty() && 
            (Me.AreaTagOfLocation.MatchesAny(NotApplicableWhenSelfOrOtherAreaIsAnyOf) ||
            Other.AreaTagOfLocation.MatchesAny(NotApplicableWhenSelfOrOtherAreaIsAnyOf)))
            return false;

        if (!NotApplicableWhenSelfAreaIsAnyOf.IsEmpty() && Me.AreaTagOfLocation.MatchesAny(NotApplicableWhenSelfAreaIsAnyOf))
            return false;

        if (!NotApplicableWhenOtherAreaIsAnyOf.IsEmpty() && Other.AreaTagOfLocation.MatchesAny(NotApplicableWhenOtherAreaIsAnyOf))
            return false;

        return true;
    }
}

#ifdef WITH_STORY_G1R
class URelationshipModifier_AfterFireMagesDeath_OldCamp_AngryToPlayer : UPersonalRelationshipModifier_AreaRequirement
{
    default Weight = 6.0f;
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Species_Human);

    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp);
    default NotApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp_FireMage);
    default RelationshipTowardsOther = ERelationship::Angry;

    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::CrimeLocation_OldCamp);
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::CrimeLocation_OldMine);

    default bApplicableWhenOtherIsPlayer = true;
    default bApplicableWhenOtherIsNPC = false;

    default NotApplicableWhenSelfOrOtherAreaIsAnyOf.AddTag(GameplayTag::Area_FreeMine);

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (G1R::UStoryG1R::Get().FireMagesDead == 0)
            return false;
        
        if (!Super::IsApplicableFor(Me, Other))
            return false;

        return true;
    }
}
#endif

#ifdef WITH_STORY_G1R
class URelationshipModifier_AfterFireMagesDeath_FreeMine_EnemiesToPlayer : UPersonalRelationshipModifier_AreaRequirement
{
    default Weight = 6.0f;
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Species_Human);

    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp);
    default NotApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp_FireMage);
    default RelationshipTowardsOther = ERelationship::Enemy;
    default HostilityTowardsOther = ERelationshipHostility::AttackOnSight;

    default bApplicableWhenOtherIsPlayer = true;
    default bApplicableWhenOtherIsNPC = false;

    default ApplicableWhenSelfOrOtherAreaIsAnyOf.AddTag(GameplayTag::Area_FreeMine);

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (G1R::UStoryG1R::Get().FireMagesDead == 0)
            return false;

        auto Jackal = AGothicCharacterState::FindByUniqueName(n"OC_GRD_Jackal_201");
        if (G1R::UStoryG1R::Get().FMHostile == 0 && IsValid(Jackal) && !Jackal.IsDead())
            return false;

        if (Me.CharacterUniqueName == n"OC_STT_Diego")
            return false;
        
        if (!Super::IsApplicableFor(Me, Other))
            return false;

        return true;
    }
}
#endif

#ifdef WITH_STORY_G1R
class URelationshipModifier_AfterFireMagesDeath_FreeMine_Enemies_OC : UPersonalRelationshipModifier_AreaRequirement
{
    default Weight = 1500000.0f;
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::Species_Human);

    default NotApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp);
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp);

    default NotApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Character_Personality_Outcast);
    default NotApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp_WomanSlave);
    default NotApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp_FireMage);

    default RelationshipTowardsOther = ERelationship::Enemy;
    default HostilityTowardsOther = ERelationshipHostility::AttackOnSight;

    default bApplicableWhenOtherIsPlayer = false;

    default ApplicableWhenSelfOrOtherAreaIsAnyOf.AddTag(GameplayTag::Area_FreeMine);

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (G1R::UStoryG1R::Get().FireMagesDead == 0)
            return false;
        
        auto Jackal = AGothicCharacterState::FindByUniqueName(n"OC_GRD_Jackal_201");
        if (G1R::UStoryG1R::Get().FMHostile == 0 && IsValid(Jackal) && !Jackal.IsDead())
            return false;
        
        if (!Super::IsApplicableFor(Me, Other))
            return false;

        return true;
    }
}
#endif

#ifdef WITH_STORY_G1R
class URelationshipModifier_AfterFireMagesDeath_FreeMine_Enemies_NC : UPersonalRelationshipModifier_AreaRequirement
{
    default Weight = 1500000.0f;
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::Species_Human);

    default NotApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Guild_Human_NewCamp);
    default ApplicableWhenSelfHasAnyOf.AddTag(GameplayTag::Guild_Human_NewCamp);

    default RelationshipTowardsOther = ERelationship::Enemy;
    default HostilityTowardsOther = ERelationshipHostility::AttackOnSight;

    default bApplicableWhenOtherIsPlayer = false;

    default ApplicableWhenSelfOrOtherAreaIsAnyOf.AddTag(GameplayTag::Area_FreeMine);

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (G1R::UStoryG1R::Get().FireMagesDead == 0)
            return false;
        
        auto Jackal = AGothicCharacterState::FindByUniqueName(n"OC_GRD_Jackal_201");
        if (G1R::UStoryG1R::Get().FMHostile == 0 && IsValid(Jackal) && !Jackal.IsDead())
            return false;
        
        if (!Super::IsApplicableFor(Me, Other))
            return false;

        return true;
    }
}
#endif

#ifdef WITH_STORY_G1R
class URelationshipModifier_AfterFireMagesDeath_FreeMine_Neutrality : UPersonalRelationshipModifier_AreaRequirement
{
    default Weight = 6.0f;

    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp);

    default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::Guild_Human_OldCamp);
    default NotApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Guild_Human_OldCamp_FireMage);

    default ApplicableWhenSelfOrOtherAreaIsAnyOf.AddTag(GameplayTag::Area_FreeMine);

    default NotApplicableWhenSelfAndOtherAreaIsAnyOf.AddTag(GameplayTag::Area_FreeMine);

    default RelationshipTowardsOther = ERelationship::Neutral;

    default bApplicableWhenOtherIsPlayer = false;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (G1R::UStoryG1R::Get().FireMagesDead == 0 || G1R::UStoryG1R::Get().FMHostile == 0)
            return false;

        if (!Super::IsApplicableFor(Me, Other))
            return false;

        return true;
    }
}
#endif

#ifdef WITH_STORY_G1R
UCLASS(Abstract)
class URelationshipModifier_TheFriends : UPersonalRelationshipModifier
{
    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::Species_Human);

    TArray<FName> FriendUniqueNames;
    default FriendUniqueNames.Add(n"OC_STT_Diego");
    default FriendUniqueNames.Add(n"SC_NOV_Lester");
    default FriendUniqueNames.Add(n"NC_SLD_Gorn_699");
    default FriendUniqueNames.Add(n"OC_KDF_Milten");

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!FriendUniqueNames.Contains(Me.CharacterUniqueName))
            return false;

        return true;
    }
}
#endif

#ifdef WITH_STORY_G1R
class URelationshipModifier_TheFriends_TowardsEachOther : URelationshipModifier_TheFriends
{
    default Weight = 10.5f;
    default RelationshipTowardsOther = ERelationship::Friend;
    default HostilityTowardsOther = ERelationshipHostility::Help;
    default RelativeRankTowardsOther = ERelationshipRelativeRank::Same;

    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::Species_Human);

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!Super::IsApplicableFor(Me, Other))        
            return false;

        if (!FriendUniqueNames.Contains(Other.CharacterUniqueName))
            return false;

        return true;
    }
}
#endif

#ifdef WITH_STORY_G1R
class URelationshipModifier_TheFriends_NeutralTowardsConvoy : URelationshipModifier_TheFriends
{
    default Weight = 10.0f;
    default RelationshipTowardsOther = ERelationship::Neutral;
    default HostilityTowardsOther = ERelationshipHostility::None;

    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::Species_Human);

    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Guild_Human_Convoy_OldCamp);
    default ApplicableWhenOtherHasAnyOf.AddTag(GameplayTag::Guild_Human_Convoy_NewCamp);

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!Super::IsApplicableFor(Me, Other))        
            return false;

        return true;
    }
}
#endif

#ifdef WITH_STORY_G1R
class URelationshipModifier_TheFriends_NeutralTowardsFightNPCs_Failsafe : URelationshipModifier_TheFriends
{
    default Weight = 10.0f;
    default RelationshipTowardsOther = ERelationship::Neutral;
    default HostilityTowardsOther = ERelationshipHostility::None;

    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::Species_Human);

    TArray<FName> FightNPCsUniqueNames;
    default FightNPCsUniqueNames.Add(n"SC_NOV_Nyras_1303");
    default FightNPCsUniqueNames.Add(n"NC_ORG_Lefty_844");

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (!Super::IsApplicableFor(Me, Other))        
            return false;

        if (!FightNPCsUniqueNames.Contains(Other.CharacterUniqueName))
            return false;

        return true;
    }
}
#endif

#ifdef WITH_STORY_G1R
class URelationshipModifier_AfterFireMagesDeath_TheFriends_NeutralToPlayer : URelationshipModifier_TheFriends
{
    default Weight = 10.0f;
    default RelationshipTowardsOther = ERelationship::Neutral;
    default HostilityTowardsOther = ERelationshipHostility::None;
    default RelativeRankTowardsOther = ERelationshipRelativeRank::Same;

    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::Species_Human);

    default bApplicableWhenOtherIsPlayer = true;
    default bApplicableWhenOtherIsNPC = false;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (G1R::UStoryG1R::Get().FireMagesDead == 0)
            return false;

        if (!Super::IsApplicableFor(Me, Other))        
            return false;

        return true;
    }
}
#endif

#ifdef WITH_STORY_G1R
class URelationshipModifier_TheFriends_FriendlyToPlayer : URelationshipModifier_TheFriends
{
    default Weight = 1950.0f;
    default RelationshipTowardsOther = ERelationship::Friend;
    default HostilityTowardsOther = ERelationshipHostility::Help;
    default RelativeRankTowardsOther = ERelationshipRelativeRank::Same;

    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::Species_Human);

    default bApplicableWhenOtherIsPlayer = true;
    default bApplicableWhenOtherIsNPC = false;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (G1R::UStoryG1R::Get().HappyFriends == 0 && !G1R::Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasBeenStarted())
            return false;

        if (!Super::IsApplicableFor(Me, Other))        
            return false;

        return true;
    }
}
#endif

#ifdef WITH_STORY_G1R
class URelationshipModifier_TheFriends_NeutralTowardsCamps : URelationshipModifier_TheFriends
{
    default Weight = 10.0f;
    default RelationshipTowardsOther = ERelationship::Neutral;
    default HostilityTowardsOther = ERelationshipHostility::None;

    default ApplicableWhenSelfHasAllOf.AddTag(GameplayTag::Species_Human);
    default ApplicableWhenOtherHasAllOf.AddTag(GameplayTag::Species_Human);

    default bApplicableWhenOtherIsPlayer = false;
    default bApplicableWhenOtherIsNPC = true;

    UFUNCTION(BlueprintOverride)
    bool IsApplicableFor(const AGothicCharacterState Me, const AGothicCharacterState Other) const
    {
        if (G1R::UStoryG1R::Get().HappyFriends == 0 && !G1R::Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.HasBeenStarted())
            return false;

        if (!Super::IsApplicableFor(Me, Other))        
            return false;

        if (FriendUniqueNames.Contains(Other.CharacterUniqueName))
            return false;

        return true;
    }
}
#endif