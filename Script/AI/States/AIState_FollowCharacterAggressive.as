/**
 * Follows the given character but also reacts aggressively to nearby hostile CREATURES,
 * matching the behavior of NPC followers while guiding the player through dangerous areas.
 */
UCLASS()
class UAIState_FollowCharacterAggressive : UAIState_FollowCharacter
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Follow_Aggressive);
    
    default AssessmentModuleClass = UAIARM_FollowingCharacterAggressive;

    UAIState_FollowCharacterAggressive(AGothicCharacterState InCharacterToFollow, float InFollowDistance = 750.0f, float InSprintWhenFurtherAwayThan = -1.0f, float InThreatDetectionDistance = 1500.0f, float InMaxHeightDifference = 500.0f)
    {
        CharacterToFollow = InCharacterToFollow;
        FollowDistance = InFollowDistance;
        SprintWhenFurtherAwayThan = InSprintWhenFurtherAwayThan;
        ThreatDetectionDistance = InThreatDetectionDistance;
        MaxHeightDifference = InMaxHeightDifference;
    }

    UAIState_FollowCharacterAggressive(FName InCharacterToFollowUniqueName, float InFollowDistance = 750.0f, float InSprintWhenFurtherAwayThan = -1.0f, float InThreatDetectionDistance = 1500.0f, float InMaxHeightDifference = 500.0f)
    {
        FollowCharacterUniqueName = InCharacterToFollowUniqueName;
        FollowDistance = InFollowDistance;
        SprintWhenFurtherAwayThan = InSprintWhenFurtherAwayThan;
        ThreatDetectionDistance = InThreatDetectionDistance;
        MaxHeightDifference = InMaxHeightDifference;
    }

    /** Distance at which the follower will proactively engage hostile creatures. */
    UPROPERTY()
    float ThreatDetectionDistance = 1500.f;

    /**
     * Maximum absolute Z difference between the follower and a creature for it to be considered a threat.
     */
    UPROPERTY()
    float MaxHeightDifference = 500.f;

    /**
     * Returns true if either the follower or the followed character has an unobstructed
     * line of sight to the creature (no wall/geometry in between).
     */
    UFUNCTION()
    protected bool HasLineOfSightToCreature(AGothicCharacter Creature) const
    {
        ETraceTypeQuery TraceType = UCollisionProfile::ConvertToTraceType(ECollisionChannel::ECC_Visibility);
        FHitResult HitResult;

        TArray<AActor> ActorsIgnore;
        ActorsIgnore.Add(AI.Character);
        ActorsIgnore.Add(Creature);

        FVector CreatureEye = Creature.ActorLocation + FVector::UpVector * Creature.BaseEyeHeight;

        bool bFollowerCanSee = !System::LineTraceSingle(
            AI.Character.ActorLocation + FVector::UpVector * AI.Character.BaseEyeHeight,
            CreatureEye,
            TraceType, false, ActorsIgnore, EDrawDebugTrace::None, HitResult, true);

        if (bFollowerCanSee)
            return true;

        if (IsValid(CharacterToFollow) && IsValid(CharacterToFollow.Character))
        {
            ActorsIgnore.Add(CharacterToFollow.Character);
            bool bFollowedCanSee = !System::LineTraceSingle(
                CharacterToFollow.Character.ActorLocation + FVector::UpVector * CharacterToFollow.Character.BaseEyeHeight,
                CreatureEye,
                TraceType, false, ActorsIgnore, EDrawDebugTrace::None, HitResult, true);

            if (bFollowedCanSee)
                return true;
        }

        return false;
    }

    UFUNCTION(BlueprintOverride)
    void SetupPerceptions(UCharacterPerceptionComponent Perception)
    {
        // React when the followed character is being attacked
        Perception.JustSeenAttackHitOtherWithMeleeWeapon()
            .PerceptionGained.BindUFunction(this, n"HandleFollowedCharacterAttacked");
        Perception.JustSeenAttackHitOtherWithFists()
            .PerceptionGained.BindUFunction(this, n"HandleFollowedCharacterAttacked");
        Perception.JustSeenAttackHitOtherWithRangedWeapon()
            .PerceptionGained.BindUFunction(this, n"HandleFollowedCharacterAttacked");
    }

    /** Called when someone else is hit; checks if it is the followed character being attacked by a hostile/enemy CREATURE. */
    UFUNCTION()
    private void HandleFollowedCharacterAttacked(const FRememberedPerception&in Perception,
                                                  const FPerceptionShortTermMemory&in Memory)
    {
        if (!IsValid(AI) || !IsValid(CharacterToFollow))
            return;

        // Only act when the affected character is the one we are following
        if (!IsValid(Perception.Affected.CharacterState) ||
            Perception.Affected.CharacterState != CharacterToFollow)
            return;

        // Only defend against CREATURES; let normal faction rules handle humans/orcs
        if (!IsValid(Perception.Instigator.CharacterState))
            return;

        if (!Perception.Instigator.CharacterState.HasGameplayTag(GameplayTag::Species_Creature))
            return;

        // Only defend against ANGRY, HOSTILE or ENEMY creatures
        ERelationship Relationship = AI.CharacterState.Relationship.GetRelationshipTowards(Perception.Instigator.CharacterState);
        if (Relationship == ERelationship::Neutral || Relationship == ERelationship::Friend)
            return;

        // Force awareness so the attacker is reliably in the perception system even when behind us
        AI.Character.Perception.SetAwarenessToCharacter(Perception.Instigator.CharacterState.Character, EPerceptionSense::See, 100.0f);

        AI.AssessEvent(GameplayTag::AIEvent_Seen_AttackHit_OnOther, Perception);
    }

    UFUNCTION(BlueprintOverride, meta = (NoSuperCall))
    void DoTask()
    {
        if (CharacterToFollow == nullptr)
        {
            CharacterToFollow = AGothicCharacterState::FindByUniqueName(FollowCharacterUniqueName);
        }

        if (!IsValid(CharacterToFollow))
        {
            EndTaskAsFailure();
            return;
        }

        while (!bShouldExitState && ShouldKeepFollowing())
        {
            // Creatures already in a combat group targeting us or the followed character.
            if (CheckAndHandleTargetingCreatures())
                return;

            // Spatial radius scan for any hostile creature in range.
            if (CheckAndHandleNearbyThreats())
                return;
            
            AI.Follow(CharacterToFollow, FollowDistance, bCopyWalkSpeed, SprintWhenFurtherAwayThan, true).While(n"ShouldKeepFollowingNoThreats");

            WaitOneTick();
        }
    }

    UFUNCTION(BlueprintCallable)
    bool ShouldKeepFollowingNoThreats() const
    {
        if (!ShouldKeepFollowing())
            return false;

        if (IsCreatureTargetingUsInCombat())
            return false;

        return !HasNearbyHostileCreatures();
    }

    /**
     * Returns true if any hostile or enemy creature is within ThreatDetectionDistance.
     * Uses a spatial radius query so creatures behind the NPC or outside the vision cone are also detected. 
     */
    UFUNCTION()
    protected bool HasNearbyHostileCreatures() const
    {
        if (!IsValid(AI) || !IsValid(AI.Character))
            return false;

        TArray<AActor> NearbyActors = UNearbyActorsSubsystem::Get().FindActorsOfClassInRadius(
            AGothicCharacter::StaticClass(), AI.Character.NavAgentLocation, ThreatDetectionDistance);

        for (auto Actor : NearbyActors)
        {
            AGothicCharacter Creature = Cast<AGothicCharacter>(Actor);
            if (!IsValid(Creature) || !IsValid(Creature.CharacterState))
                continue;

            if (!Creature.CharacterState.HasGameplayTag(GameplayTag::Species_Creature))
                continue;

            if (Creature.CharacterState.HasGameplayTag(GameplayTag::State_Dead))
                continue;
            if (Creature.CharacterState.HasGameplayTag(GameplayTag::State_Defeated))
                continue;
            if (Creature.CharacterState.HasGameplayTag(GameplayTag::AIState_Conflict_Disengage))
                continue;
            if (Creature.CharacterState.HasGameplayTag(GameplayTag::AIState_Conflict_Flee))
                continue;
            if (Creature.CharacterState.HasGameplayTag(GameplayTag::Species_Creature_Scavenger_Adult_Rideable))
                continue;

            if (Math::Abs(Creature.ActorLocation.Z - AI.Character.ActorLocation.Z) > MaxHeightDifference)
                continue;

            ERelationship Relationship = AI.CharacterState.Relationship.GetRelationshipTowards(Creature.CharacterState);
            if (Relationship == ERelationship::Neutral || Relationship == ERelationship::Friend)
                continue;

            if (!HasLineOfSightToCreature(Creature))
                continue;

            return true;
        }

        return false;
    }

    /**
     * Returns true if any hostile/enemy creature is currently in combat and has the follower
     * or the followed character as its target, and is within ThreatDetectionDistance.
     */
    UFUNCTION(BlueprintCallable)
    protected bool IsCreatureTargetingUsInCombat() const
    {
        if (!IsValid(AI) || !IsValid(AI.Character))
            return false;

        if (IsValid(AI.Character))
        {
            auto Attackers = AI.Character.GetCharactersWithTagTargetingThisCharacterInCombat(GameplayTag::Species_Creature);
            for (auto Attacker : Attackers)
            {
                if (!IsValid(Attacker) || !IsValid(Attacker.CharacterState))
                    continue;
                if (Attacker.CharacterState.HasGameplayTag(GameplayTag::State_Dead))
                    continue;
                if (Attacker.CharacterState.HasGameplayTag(GameplayTag::State_Defeated))
                    continue;
                ERelationship Relationship = AI.CharacterState.Relationship.GetRelationshipTowards(Attacker.CharacterState);
                if (Relationship == ERelationship::Neutral || Relationship == ERelationship::Friend)
                    continue;
                if (Math::Abs(Attacker.ActorLocation.Z - AI.Character.ActorLocation.Z) > MaxHeightDifference)
                    continue;
                if (Attacker.GetDistanceTo(AI.Character) > ThreatDetectionDistance)
                    continue;
                if (!HasLineOfSightToCreature(Attacker))
                    continue;
                return true;
            }
        }

        if (IsValid(CharacterToFollow) && IsValid(CharacterToFollow.Character))
        {
            auto Attackers = CharacterToFollow.Character.GetCharactersWithTagTargetingThisCharacterInCombat(GameplayTag::Species_Creature);
            for (auto Attacker : Attackers)
            {
                if (!IsValid(Attacker) || !IsValid(Attacker.CharacterState))
                    continue;
                if (Attacker.CharacterState.HasGameplayTag(GameplayTag::State_Dead))
                    continue;
                if (Attacker.CharacterState.HasGameplayTag(GameplayTag::State_Defeated))
                    continue;
                ERelationship Relationship = AI.CharacterState.Relationship.GetRelationshipTowards(Attacker.CharacterState);
                if (Relationship == ERelationship::Neutral || Relationship == ERelationship::Friend)
                    continue;
                if (Math::Abs(Attacker.ActorLocation.Z - AI.Character.ActorLocation.Z) > MaxHeightDifference)
                    continue;
                if (Attacker.GetDistanceTo(AI.Character) > ThreatDetectionDistance)
                    continue;
                if (!HasLineOfSightToCreature(Attacker))
                    continue;
                return true;
            }
        }

        return false;
    }

    /**
     * Checks for hostile/enemy creatures currently in combat targeting the follower or the
     * followed character. Forces awareness on the first one found and fires the threat
     * assessment event.
     */
    UFUNCTION()
    protected bool CheckAndHandleTargetingCreatures()
    {
        if (!IsValid(AI) || !IsValid(AI.Character))
            return false;

        // Check creatures targeting the follower itself
        if (IsValid(AI.Character))
        {
            auto Attackers = AI.Character.GetCharactersWithTagTargetingThisCharacterInCombat(GameplayTag::Species_Creature);
            for (auto Attacker : Attackers)
            {
                if (!IsValid(Attacker) || !IsValid(Attacker.CharacterState))
                    continue;
                if (Attacker.CharacterState.HasGameplayTag(GameplayTag::State_Dead))
                    continue;
                if (Attacker.CharacterState.HasGameplayTag(GameplayTag::State_Defeated))
                    continue;
                if (Attacker.CharacterState.HasGameplayTag(GameplayTag::AIState_Conflict_Disengage))
                    continue;
                if (Attacker.CharacterState.HasGameplayTag(GameplayTag::AIState_Conflict_Flee))
                    continue;
                if (Attacker.CharacterState.HasGameplayTag(GameplayTag::Species_Creature_Scavenger_Adult_Rideable))
                    continue;

                ERelationship Relationship = AI.CharacterState.Relationship.GetRelationshipTowards(Attacker.CharacterState);
                if (Relationship == ERelationship::Neutral || Relationship == ERelationship::Friend)
                    continue;

                if (Attacker.GetDistanceTo(AI.Character) > ThreatDetectionDistance)
                    continue;

                if (Math::Abs(Attacker.ActorLocation.Z - AI.Character.ActorLocation.Z) > MaxHeightDifference)
                    continue;

                if (!HasLineOfSightToCreature(Attacker))
                    continue;

                AI.Character.Perception.SetAwarenessToCharacter(Attacker, EPerceptionSense::See, 100.0f);

                FRememberedPerception ThreatPerception;
                ThreatPerception.Origin.Character = Attacker;
                ThreatPerception.Origin.CharacterState = Attacker.CharacterState;
                ThreatPerception.Origin.Relationship = Relationship;
                ThreatPerception.Origin.Hostility = AI.CharacterState.Relationship.GetHostilityTowards(Attacker.CharacterState);

                AI.AssessEvent(GameplayTag::AIEvent_Seen_Hostile_Enter_WarningRange, ThreatPerception);
                return true;
            }
        }

        // Check creatures targeting the followed character
        if (IsValid(CharacterToFollow) && IsValid(CharacterToFollow.Character))
        {
            auto Attackers = CharacterToFollow.Character.GetCharactersWithTagTargetingThisCharacterInCombat(GameplayTag::Species_Creature);
            for (auto Attacker : Attackers)
            {
                if (!IsValid(Attacker) || !IsValid(Attacker.CharacterState))
                    continue;
                if (Attacker.CharacterState.HasGameplayTag(GameplayTag::State_Dead))
                    continue;
                if (Attacker.CharacterState.HasGameplayTag(GameplayTag::State_Defeated))
                    continue;
                if (Attacker.CharacterState.HasGameplayTag(GameplayTag::AIState_Conflict_Disengage))
                    continue;
                if (Attacker.CharacterState.HasGameplayTag(GameplayTag::AIState_Conflict_Flee))
                    continue;
                if (Attacker.CharacterState.HasGameplayTag(GameplayTag::Species_Creature_Scavenger_Adult_Rideable))
                    continue;

                ERelationship Relationship = AI.CharacterState.Relationship.GetRelationshipTowards(Attacker.CharacterState);
                if (Relationship == ERelationship::Neutral || Relationship == ERelationship::Friend)
                    continue;

                if (Attacker.GetDistanceTo(AI.Character) > ThreatDetectionDistance)
                    continue;

                if (Math::Abs(Attacker.ActorLocation.Z - AI.Character.ActorLocation.Z) > MaxHeightDifference)
                    continue;

                if (!HasLineOfSightToCreature(Attacker))
                    continue;

                AI.Character.Perception.SetAwarenessToCharacter(Attacker, EPerceptionSense::See, 100.0f);

                FRememberedPerception ThreatPerception;
                ThreatPerception.Origin.Character = Attacker;
                ThreatPerception.Origin.CharacterState = Attacker.CharacterState;
                ThreatPerception.Origin.Relationship = Relationship;
                ThreatPerception.Origin.Hostility = AI.CharacterState.Relationship.GetHostilityTowards(Attacker.CharacterState);

                AI.AssessEvent(GameplayTag::AIEvent_Seen_Hostile_Enter_WarningRange, ThreatPerception);
                return true;
            }
        }

        return false;
    }

    /**
     * Scans for nearby hostile/enemy creatures using a spatial radius query, forces the
     * NPC to be aware of the first one found, then fires the threat assessment event.
     */
    UFUNCTION()
    protected bool CheckAndHandleNearbyThreats()
    {
        if (!IsValid(AI) || !IsValid(AI.Character))
            return false;

        TArray<AActor> NearbyActors = UNearbyActorsSubsystem::Get().FindActorsOfClassInRadius(
            AGothicCharacter::StaticClass(), AI.Character.NavAgentLocation, ThreatDetectionDistance);

        for (auto Actor : NearbyActors)
        {
            AGothicCharacter Creature = Cast<AGothicCharacter>(Actor);
            if (!IsValid(Creature) || !IsValid(Creature.CharacterState))
                continue;

            if (!Creature.CharacterState.HasGameplayTag(GameplayTag::Species_Creature))
                continue;

            if (Creature.CharacterState.HasGameplayTag(GameplayTag::State_Dead))
                continue;
            if (Creature.CharacterState.HasGameplayTag(GameplayTag::State_Defeated))
                continue;
            if (Creature.CharacterState.HasGameplayTag(GameplayTag::AIState_Conflict_Disengage))
                continue;
            if (Creature.CharacterState.HasGameplayTag(GameplayTag::AIState_Conflict_Flee))
                continue;
            if (Creature.CharacterState.HasGameplayTag(GameplayTag::Species_Creature_Scavenger_Adult_Rideable))
                continue;

            if (Math::Abs(Creature.ActorLocation.Z - AI.Character.ActorLocation.Z) > MaxHeightDifference)
                continue;

            ERelationship Relationship = AI.CharacterState.Relationship.GetRelationshipTowards(Creature.CharacterState);
            if (Relationship == ERelationship::Neutral || Relationship == ERelationship::Friend)
                continue;

            if (!HasLineOfSightToCreature(Creature))
                continue;

            AI.Character.Perception.SetAwarenessToCharacter(Creature, EPerceptionSense::See, 100.0f);

            FRememberedPerception ThreatPerception;
            ThreatPerception.Origin.Character = Creature;
            ThreatPerception.Origin.CharacterState = Creature.CharacterState;
            ThreatPerception.Origin.Relationship = Relationship;
            ThreatPerception.Origin.Hostility = AI.CharacterState.Relationship.GetHostilityTowards(Creature.CharacterState);

            AI.AssessEvent(GameplayTag::AIEvent_Seen_Hostile_Enter_WarningRange, ThreatPerception);
            return true;
        }

        return false;
    }
}

UCLASS()
class UAIState_FollowHeroAggressive : UAIState_FollowCharacterAggressive
{
    default OwnedGameplayTags.AddTag(GameplayTag::State_NeverMumble);
    default OwnedGameplayTags.AddTag(GameplayTag::Smalltalk_Blocked);

    UAIState_FollowHeroAggressive(float InFollowDistance, bool bMatchWalkspeed = true, float InSprintWhenFurtherAwayThan = 1000, float InThreatDetectionDistance = 1500.0f, float InMaxHeightDifference = 500.0f)
    {
        FollowDistance = InFollowDistance;
        SprintWhenFurtherAwayThan = InSprintWhenFurtherAwayThan;
        bCopyWalkSpeed = bMatchWalkspeed;
        ThreatDetectionDistance = InThreatDetectionDistance;
        MaxHeightDifference = InMaxHeightDifference;
    }

    default FollowCharacterUniqueName = n"Hero";
}
