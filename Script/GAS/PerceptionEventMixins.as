class UPerceptionConditions : UWorldSubsystem
{
	UFUNCTION()
	bool ExampleShouldPassPerception(const AGothicCharacter Self, const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory) const
	{
		return false;
	}

    UFUNCTION()
	bool IsSensedCharacterLookingAtMe(const AGothicCharacter Self, const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory) const
	{
        return Perception.Origin.Character.IsLookingAtOtherCharacter(Self);
	}

    UFUNCTION()
	bool IsSensedCharacterLookingAtMeAndNotInTrainingFightWithOther(const AGothicCharacter Self, const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory) const
	{
        auto Hostility = Self.CharacterState.Relationship.GetHostilityTowards(Perception.Origin.CharacterState);
        if (Perception.Origin.Character.IsBeingTargetedInTrainingFight() &&
            Hostility != ERelationshipHostility::TrainingFight)
            return false;

        return Perception.Origin.Character.IsLookingAtOtherCharacter(Self);
	}

    UFUNCTION()
	bool IsSensedCharacterLookingAtFriendly(const AGothicCharacter Self, const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory) const
	{
        AGothicCharacter CharacterFaced = Perception.Origin.Character.GetCharacterThisCharacterIsLookingAt();

        if (CharacterFaced == nullptr)
            return false;

        if (!Self.IsFriendlyTowards(CharacterFaced))
            return false;

        return true;
	}

    UFUNCTION()
	bool IsSensedCharacterLookingAtFriendlyAndNotInTrainingFight(const AGothicCharacter Self, const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory) const
	{
        AGothicCharacter CharacterFaced = Perception.Origin.Character.GetCharacterThisCharacterIsLookingAt();

        if (CharacterFaced == nullptr)
            return false;

        if (!Self.IsFriendlyTowards(CharacterFaced))
            return false;

        auto Hostility = CharacterFaced.CharacterState.Relationship.GetHostilityTowards(Perception.Origin.CharacterState);
        if (Hostility == ERelationshipHostility::TrainingFight)
            return false;

        return true;
	}

    UFUNCTION()
	bool IsSensedCharacterAimingAtMe(const AGothicCharacter Self, const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory) const
	{
        return Perception.Origin.Character.IsLookingAtOtherCharacter(Self, 100.0f);
	}

    UFUNCTION()
	bool IsSensedCharacterAimingAtAlly(const AGothicCharacter Self, const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory) const
	{
        AGothicCharacter CharacterFaced = Perception.Origin.Character.GetCharacterThisCharacterIsDirectlyFacing();

        if (CharacterFaced == nullptr)
            return false;

        if (!Self.IsCurrentlyPerceiving(CharacterFaced))
            return false;

        if (!Self.IsFriendlyTowards(CharacterFaced))
            return false;

        return true;
	}

    UFUNCTION()
    bool IsSensedCharacterOfLowerRankAndBlockingMyPath(const AGothicCharacter Self, const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory) const
	{
        return Self.IsPathBlockedByGivenLowerRankCharacter(Perception.Origin.Character, true);
	}

    UFUNCTION()
    bool IsSensedCharacterBlockingMyPath(const AGothicCharacter Self, const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory) const
    {
        return Self.IsPathBlockedByGivenCharacter(Perception.Origin.Character, false);
    }

    UFUNCTION()
    bool IsSensedCharacterInFrontOfMe(const AGothicCharacter Self, const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory) const
    {
        // Use stored init direction if set; falls back to live ActorForwardVector.
        FVector CheckDirection = Self.ActorForwardVector;
        auto GothicAI = Cast<UGameplayAbility_CharacterAI_Gothic>(Self.CharacterState.AI);
        if (IsValid(GothicAI))
        {
            FVector StoredDir = GothicAI.SpawnedStorage(UAIValueSet_BlockingPath).StationaryForwardDirection;
            if (!StoredDir.IsNearlyZero())
                CheckDirection = StoredDir;
        }
        return Self.IsCharacterDirectionFacingOtherCharacter(Perception.Origin.Character, CheckDirection, -0.866f);
    }

    UFUNCTION()
    bool IsSensedCharacterAimingMagicProjectileSpellAtMe(const AGothicCharacter Self, const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory) const
    {
        if (!Perception.Origin.Character.HasDrawnMagicSpellWithSpec(GameplayTag::AISpellKeywords_ProjectileSpeed))
            return false;

        if (!IsSensedCharacterAimingAtMe(Self, Perception, Memory))
            return false;

        return true;
    }

    UFUNCTION()
    bool IsSensedCharacterConsideredHostile(const AGothicCharacter Self, const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory) const
    {
        if (!Self.IsHostileTowards(Perception.Origin.Character))
            return false;

        return true;
    }

    UFUNCTION()
    bool IsSensedCharacterConsideredEnemy(const AGothicCharacter Self, const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory) const
    {
        if (!Self.IsEnemyTowards(Perception.Origin.Character))
            return false;

        return true;
    }

    UFUNCTION()
    bool IsSensedCharacterConsideredFriendly(const AGothicCharacter Self, const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory) const
    {
        if (!Self.IsFriendlyTowards(Perception.Origin.Character))
            return false;

        return true;
    }

    UFUNCTION()
    bool IsSensedCharacterConsideredNeutral(const AGothicCharacter Self, const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory) const
    {
        if (!Self.IsNeutralTowards(Perception.Origin.Character))
            return false;

        return true;
    }

    UFUNCTION()
    bool IsSensedCharacterConsideredAngering(const AGothicCharacter Self, const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory) const
    {
        if (!Self.IsAngryTowards(Perception.Origin.Character))
            return false;

        return true;
    }

    UFUNCTION()
    bool AffectedIsTarget(const AGothicCharacter Self, const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory) const
    {
        if (Perception.Affected.CharacterState != Perception.Target.CharacterState)
            return false;

        return true;
    }

    UFUNCTION()
    bool IsSensedItemOwnedByMe(const AGothicCharacter Self, const FRememberedPerception&in Perception, const FPerceptionShortTermMemory&in Memory) const
    {
        const AActor OriginActor = Perception.Origin.Actor;
        if (OriginActor != nullptr)
        {
            AActor Owner = OriginActor.GetOwner();
            if (Owner == Self)
            {
                return true;
            }
        }
        return false;
    }
}

// Property so the global condition object can be accessed like so: Delegate.BindUFunction(PerceptionConditions, n"SomeFunction")
UPerceptionConditions GetPerceptionConditions() property { return UPerceptionConditions::Get(); }

mixin FPerceptionHandler& UpdateOnCombatRelevantAction(FPerceptionHandler& Handler)
{
    return Handler.UpdateOnChangeSensingTags(GameplayTag::AIState_AssessGoToDailyRoutine)
                  .UpdateOnChangeSensingTags(GameplayTag::AIState_Conflict_Search)
                  .UpdateOnChangeSensingTags(GameplayTag::AIState_Conflict_ChaseAndLookForHidingCharacter)
                  .UpdateOnChangeSensingTags(GameplayTag::AIState_Conflict_InvestigateCombatSound)
                  .UpdateOnChangeSensingTags(GameplayTag::AIState_Conflict_InvestigateIdentifiedSound)
                  .UpdateOnChangeSensingTags(GameplayTag::AIState_Conflict_InvestigatePickpocket)
                  .UpdateOnChangeSensingTags(GameplayTag::AIState_Conflict_InvestigatePouch)
                  .UpdateOnChangeSensingTags(GameplayTag::AIState_Conflict_InvestigateSuspiciousSound);
}

mixin FPerceptionHandler& NotOnSensingCharactersInvolvedInFight(FPerceptionHandler& Handler)
{
    return Handler
        .NotOnSensingCharactersWith(GameplayTag::AIState_Conflict_Combat)
        .NotOnSensingCharactersWith(GameplayTag::AIState_Conflict_WatchFight)
        .NotOnSensingCharactersWith(GameplayTag::AIState_Conflict_WatchHostile)
        .NotOnSensingCharactersWith(GameplayTag::AIState_Conflict_Disengage)
        .NotOnSensingCharactersWith(GameplayTag::AIState_Conflict_Flee)
        .NotOnSensingCharactersWith(GameplayTag::AIState_Conflict_TurnToAttacker);
}

mixin FPerceptionHandler& OnSensedOther(UCharacterPerceptionComponent Perception)
{
	return Perception.AddPerceptionHandler()
                     .WithAwareness(100.0f)
					 .ExcludeOriginActor(Perception.OwnerCharacter);
}

mixin FPerceptionHandler& OnHeardInstantSoundEvent(UCharacterPerceptionComponent Perception, FGameplayTag SoundTag)
{
    return Perception.AddPerceptionHandler()
                     .AddEvent(GameplayTag::Event_Perception_Gained_Hear)
                     .OnCharactersWith(SoundTag)
                     .ViaSense(EPerceptionSense::Hear)
                     .RequireSensingSource(false);
}

mixin FPerceptionHandler& OnHeardInstantSoundEventWithSource(UCharacterPerceptionComponent Perception, FGameplayTag SoundTag)
{
    return Perception.AddPerceptionHandler()
                     .AddEvent(GameplayTag::Event_Perception_Gained_Hear)
                     .OnCharactersWith(SoundTag)
                     .ViaSense(EPerceptionSense::Hear)
                     .RequireSensingSource(true);
}

mixin FPerceptionHandler& OnSensedSelf(UCharacterPerceptionComponent Perception)
{
	return Perception.AddPerceptionHandler()
					 .HandleOriginActor(Perception.OwnerCharacter);
}

mixin FPerceptionHandler& OnSensedEventOnSelf(UCharacterPerceptionComponent Perception, FGameplayTag EventTag)
{
	return Perception.OnSensedSelf()
	                 .AddEvent(EventTag);
}

mixin FPerceptionHandler& OnSensedEventOnOthers(UCharacterPerceptionComponent Perception, FGameplayTag EventTag)
{
	return Perception.OnSensedOther()
	                 .AddEvent(EventTag);
}

mixin FPerceptionHandler& OnSensedOtherWithTag(UCharacterPerceptionComponent Perception, FGameplayTag Tag)
{
	return Perception.OnSensedOther()
	                 .OnCharactersWith(Tag);
}

mixin FPerceptionHandler& OnSensedSelfWithTag(UCharacterPerceptionComponent Perception, FGameplayTag Tag)
{
	return Perception.OnSensedSelf()
	                 .OnCharactersWith(Tag);
}

mixin FPerceptionHandler& OnSensedTagIsAddedOnOther(UCharacterPerceptionComponent Perception, FGameplayTag Tag)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Character_Changed_Tags)
	                 .WhenTagIsAdded(Tag);
}

mixin FPerceptionHandler& OnSensedTagIsRemovedOnOther(UCharacterPerceptionComponent Perception, FGameplayTag Tag)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Character_Changed_Tags)
	                 .WhenTagIsRemoved(Tag);
}

mixin FPerceptionHandler& OnSensedTagIsRemovedOnSelf(UCharacterPerceptionComponent Perception, FGameplayTag Tag)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Character_Changed_Tags)
	                 .WhenTagIsRemoved(Tag);
}

mixin FPerceptionHandler& JustSensedOtherStartCastingSpell_LowThreat(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedTagIsAddedOnOther(GameplayTag::State_Casting)
        .OnCharactersWith(GameplayTag::Item_Property_LowThreat)
        .OnlyHandleWithAllSenseAwareness(EPerceptionSense::See, 90.0f);
}

mixin FPerceptionHandler& JustSensedOtherStartCastingSpell_HighThreat(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedTagIsAddedOnOther(GameplayTag::State_Casting)
        .NotOnSensingCharactersInvolvedInFight()
        .OnCharactersWith(GameplayTag::Character_Player)
        .NotOnCharactersWith(GameplayTag::Item_Property_NoThreat)
        .NotOnCharactersWith(GameplayTag::Item_Property_LowThreat)
        .WithRelationship(ERelationship::Hostile)
        .OnlyHandleWithAllSenseAwareness(EPerceptionSense::See, 90.0f);
}

/** Triggers whenever a hostile character enters perception */
mixin FPerceptionHandler& JustSeenHostileCharacter(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .WithRelationship(ERelationship::Hostile);
}

/** Triggers whenever a visible character with a drawn weapon enters perception */
mixin FPerceptionHandler& JustSeenCharacterWithWeaponDrawn(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .OnCharactersWith(GameplayTag::State_Combat);
}

/** Triggers whenever a visible friendly character with a drawn weapon enters perception */
mixin FPerceptionHandler& JustSeenFriendlyCharacterWithWeaponDrawn(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .OnCharactersWith(GameplayTag::State_Combat)
        .WithRelationship(ERelationship::Friend);
}

/** Triggers whenever a visible neutral character with a drawn weapon enters perception */
mixin FPerceptionHandler& JustSeenNeutralCharacterWithWeaponDrawn(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .OnCharactersWith(GameplayTag::State_Combat)
        .WithRelationship(ERelationship::Neutral);
}

/** Triggers whenever a visible angering character with a drawn weapon enters perception */
mixin FPerceptionHandler& JustSeenAngeringCharacterWithWeaponDrawn(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .OnCharactersWith(GameplayTag::State_Combat)
        .WithRelationship(ERelationship::Angry);
}

/** Triggers whenever a visible defeated character enters vision perception */
mixin FPerceptionHandler& SeenDefeatedCharacter(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        // .TickRate(0.3f)
        .OnCharactersWith(GameplayTag::State_Defeated);
}

mixin FPerceptionHandler& HearEnemyInRangeWhileGuiding(UCharacterPerceptionComponent Perception, float MaxDistance)
{
    return Perception
        .AddPerceptionHandler()
        .WithAwareness(1.0f)
        .ViaSense(EPerceptionSense::Hear)
        .WithinRange(MaxDistance)
        .UpdateOnChangeSensingTags(GameplayTag::AIState_Guide)
        .OnSensingCharactersWith(GameplayTag::AIState_Guide)
        .WithRelationship(ERelationship::Enemy)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated);
}

mixin FPerceptionHandler& HearEnemyInRangeWhileAggressiveFollowing(UCharacterPerceptionComponent Perception, float MaxDistance)
{
    return Perception
        .AddPerceptionHandler()
        .WithAwareness(1.0f)
        .ViaSense(EPerceptionSense::Hear)
        .WithinRange(MaxDistance)
        .UpdateOnChangeSensingTags(GameplayTag::AIState_Follow_Aggressive)
        .OnSensingCharactersWith(GameplayTag::AIState_Follow_Aggressive)
        .WithRelationship(ERelationship::Enemy)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated);
}

mixin FPerceptionHandler& SeenHostileCharacterEnterWarningRange(UCharacterPerceptionComponent Perception, float MaxDistance)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .WithinRange(MaxDistance)
        .NotOnSensingCharactersWith(GameplayTag::State_Ambush)
        .UpdateOnCombatRelevantAction()
        //.UpdateOnChangeSensingTags(GameplayTag::State_Defeated)
        .OnSensingCharactersWith(GameplayTag::Species_Creature)
        .WithRelationship(ERelationship::Hostile)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated);
}

/** Triggers whenever a visible living character not considered enemy enters vision perception */
mixin FPerceptionHandler& SeenLivingNonEnemyCharacter(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .UpdateOnCombatRelevantAction()
        //.UpdateOnChangeSensingTags(GameplayTag::State_Defeated)
        .IgnoreRelationship(ERelationship::Enemy)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated);
}

/** Triggers whenever a visible living character considered hostile enters vision perception */
mixin FPerceptionHandler& SeenLivingHostileCharacter(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .UpdateOnCombatRelevantAction()
        //.UpdateOnChangeSensingTags(GameplayTag::State_Defeated)
        .WithRelationship(ERelationship::Hostile)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated);
}

/** Triggers whenever a visible living character considered hostile enters vision perception */
mixin FPerceptionHandler& SeenLivingHostileCharacterTicking(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        //.UpdateOnChangeSensingTags(GameplayTag::State_Defeated)
        .WithRelationship(ERelationship::Hostile)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .TickRate(0.2f);
}

mixin FPerceptionHandler& SeenLivingHostileCharacterWithinRange(UCharacterPerceptionComponent Perception, float Distance)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .WithinRange(Distance)
        .UpdateOnChangeSensingTags(GameplayTag::AIState_Conflict_Warning)
        .WithRelationship(ERelationship::Hostile)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated);
}

/** Triggers whenever a visible defeated character considered hostile enters vision perception */
mixin FPerceptionHandler& SeenDefeatedHostileCharacter(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        // .TickRate(0.3f)
        .WithRelationship(ERelationship::Hostile)
        .OnCharactersWith(GameplayTag::State_Defeated);
}

/** Triggers whenever a visible character considered hostile is perceived through hearing */
mixin FPerceptionHandler& HeardHostileCharacter(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::Hear)
        .IgnoreWithSenseAwareness(EPerceptionSense::See, 80.0f)
        .TickRate(0.3f)
        .WithRelationship(ERelationship::Hostile)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated);
}

/** Triggers whenever a visible character exits sight perception */
mixin FPerceptionHandler& LostSightOfCharacter(UCharacterPerceptionComponent Perception)
{
    return Perception
        .AddPerceptionHandler()
        .ViaSense(EPerceptionSense::See)
        .WithAwareness(80.0f)
        .ExcludeOriginActor(Perception.OwnerCharacter)
        .RequireOriginCharacter(true)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated);
}

/** Triggers whenever a smelled character exits sight perception */
mixin FPerceptionHandler& LostSmellOfCharacter(UCharacterPerceptionComponent Perception)
{
    return Perception
        .AddPerceptionHandler()
        .ViaSense(EPerceptionSense::Smell)
        .WithAwareness(80.0f)
        .ExcludeOriginActor(Perception.OwnerCharacter)
        .RequireOriginCharacter(true)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated);
}

/** Triggers whenever a visible character considered enemy enters vision perception */
mixin FPerceptionHandler& SeenLivingEnemyCharacter(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .UpdateOnCombatRelevantAction()
        //.UpdateOnChangeSensingTags(GameplayTag::State_Defeated)
        .WithRelationship(ERelationship::Enemy)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated);
}

/** Triggers whenever a visible character considered enemy enters vision perception */
mixin FPerceptionHandler& SeenLivingEnemyCharacterWithAttackOnSight(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .UpdateOnCombatRelevantAction()
        //.UpdateOnChangeSensingTags(GameplayTag::State_Defeated)
        .WithRelationship(ERelationship::Enemy)
        .WithHostility(ERelationshipHostility::AttackOnSight)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated);
}

/** Triggers whenever a visible character considered enemy enters vision perception */
mixin FPerceptionHandler& SeenLivingEnemyCharacterTooClose(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .UpdateOnCombatRelevantAction()
        //.UpdateOnChangeSensingTags(GameplayTag::State_Defeated)
        .WithRelationship(ERelationship::Enemy)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .WithinRange(300.0f);
}

/** Triggers whenever a visible character considered enemy enters vision perception */
mixin FPerceptionHandler& SeenDefeatedEnemyCharacter(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        // .TickRate(0.3f)
        .WithRelationship(ERelationship::Enemy)
        .OnCharactersWith(GameplayTag::State_Defeated);
}

/** Triggers whenever a visible character considered enemy enters vision perception */
mixin FPerceptionHandler& SeenDeadEnemyCharacter(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        // .TickRate(0.3f)
        .WithRelationship(ERelationship::Enemy)
        .OnCharactersWith(GameplayTag::State_Dead);
}

/** Triggers whenever a visible carcass considered prey enters vision perception */
mixin FPerceptionHandler& SeenPreyCarcass(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        // .TickRate(0.3f)
        .WithHostility(ERelationshipHostility::Predator)
        .OnCharactersWith(GameplayTag::State_Dead);
}

/** Triggers whenever a visible carcass enters vision perception */
mixin FPerceptionHandler& SeenCarcass(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        // .TickRate(0.3f)
        .OnCharactersWith(GameplayTag::State_Dead)
        .OnCharactersWith(GameplayTag::Species_Creature);
}

/** Triggers whenever a hostile or enemy character is sensed within ambush range and the sensing character has the Ambush state */
mixin FPerceptionHandler& SensedHostileOrEnemyWithinAmbushRange(UCharacterPerceptionComponent Perception, float Range)
{
    return Perception
        .OnSensedOther()
        .WithAwareness(90.0f)
        .WithinRange(Range)
        .OnSensingCharactersWith(GameplayTag::State_Ambush)
        .IgnoreRelationship(ERelationship::Neutral)
        .IgnoreRelationship(ERelationship::Friend)
        .IgnoreRelationship(ERelationship::Angry);
}

mixin FPerceptionHandler& SensedAmbushStart(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnOthers(GameplayTag::AreaEvent_AmbushStarted)
        .WithAwareness(90.0f)
        .OnSensingCharactersWith(GameplayTag::State_Ambush);
}

/** Triggers whenever a visible character considered enemy is perceived through hearing */
mixin FPerceptionHandler& HeardEnemyCharacter(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::Hear)
        .IgnoreWithSenseAwareness(EPerceptionSense::See, 80.0f)
        .TickRate(0.3f)
        .WithRelationship(ERelationship::Enemy)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated);
}

/** Triggers whenever a visible character considered enemy is perceived through hearing */
mixin FPerceptionHandler& HeardEnemyCharacterWithAttackOnSight(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::Hear)
        .IgnoreWithSenseAwareness(EPerceptionSense::See, 80.0f)
        .TickRate(0.3f)
        .WithRelationship(ERelationship::Enemy)
        .WithHostility(ERelationshipHostility::AttackOnSight)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated);
}

/** Triggers whenever a player character enters hearing perception within pickpocketing range, the player cannot be seen (comes from behind) and we have a pouch. */
mixin FPerceptionHandler& HeardPlayerMightBeTryingToPickpocketSelf(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOtherWithTag(GameplayTag::Character_Player) // Even player-controlled NPCs cannot ever pickpocket other NPCs. Confirmed by Javi on Sep 26, 2024
        .ViaSense(EPerceptionSense::Hear)
        .WithinRange(100.0f) // Should be smaller than UGA_Human_Pickpocket.m_DetectionRadius
        .IgnoreWithSenseAwareness(EPerceptionSense::See, 80.0f)
        .TickRate(1.0f) // #jfm: double-check with Henrik: does this handler really need to tick? It should not in theory. 
        .OnSensingCharactersWith(GameplayTag::State_HasPouch)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated);
}

/** Triggers when the perceiving character hears the sound of a pouch falling on the ground. */
mixin FPerceptionHandler& HeardPouchHittingGround(UCharacterPerceptionComponent Perception)
{
    FPerceptionHandler& PerceptionHandler =  Perception
        .OnHeardInstantSoundEvent(GameplayTag::FX_Collision_Pouch_HitGround)
        .OnSensingCharactersWith(GameplayTag::State_HasPouch)
        .HandleSensorOwnership(EOwnershipRelationFlags::PersonalSpecific);

    return PerceptionHandler;
}

/** Triggers when the perceiving character senses a failed pickpocketing attempt on itself. */
mixin FPerceptionHandler& SensedPickpocketingFailedOnSelf(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnSelf(GameplayTag::Perception_Pickpocketing_Failed);
        // .TickRate(1.0f);
}

/** Triggers when the perceiving character senses a failed pickpocketing attempt on itself. */
mixin FPerceptionHandler& SensedPickpocketingSuccessOnSelf(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnSelf(GameplayTag::Perception_Pickpocketing_Succeeded);
        // .TickRate(1.0f);
}

/** Triggers when the perceiving character senses a failed pickpocketing attempt on itself. */
mixin FPerceptionHandler& SensedPickpocketingTelekinesisOnSelf(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnSelf(GameplayTag::Perception_Pickpocketing_Telekinesis);
        // .TickRate(1.0f);
}

/** Triggers when the perceiving character sees a failed or succeeded pickpocketing attempt by the player on someone else. */
mixin FPerceptionHandler& SeenPlayerTryingToPickpocketOther(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnOthers(GameplayTag::Perception_Pickpocketing) // matches either Perception_Pickpocketing_Failed or Perception_Pickpocketing_Succeeced; sensed on the pickpocket/player
        // .TickRate(1.0f)
        .ViaSense(EPerceptionSense::See);
}

/** Triggers when the perceiving character sees a failed pickpocketing attempt by the player on someone else. */
mixin FPerceptionHandler& SeenSomeoneFailPickpocketOther(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnOthers(GameplayTag::Perception_Pickpocketing_Failed)
        // .TickRate(1.0f)
        .ViaSense(EPerceptionSense::See);
}

/** Triggers when the perceiving character sees a succeeded pickpocketing attempt by the player on someone else. */
mixin FPerceptionHandler& SeenSomeoneSucceedPickpocketOther(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnOthers(GameplayTag::Perception_Pickpocketing_Succeeded)
        // .TickRate(1.0f)
        .ViaSense(EPerceptionSense::See);
}

/** Triggers when the perceiving character sees a succeeded pickpocketing attempt by the player on someone else. */
mixin FPerceptionHandler& SeenPouchLiftedByTelekinesis(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnOthers(GameplayTag::Perception_Pickpocketing_Telekinesis)
        // .TickRate(1.0f)
        .ViaSense(EPerceptionSense::See);
}

/** Triggers when the perceiving character hears an alert about a pickpocket */
mixin FPerceptionHandler& HeardAlertPickpocket(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnOthers(GameplayTag::Perception_Alert_Pickpocket)
        .ViaSense(EPerceptionSense::Hear);
}

/** Triggers when seeing a character with Follow relationship*/
mixin FPerceptionHandler& SeenCharacterThatShouldBeFollowed(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .NotOnSensingCharactersWith(GameplayTag::AIState_Conversation)
        .UpdateOnChangeSensingTags(GameplayTag::AIState_AssessGoToDailyRoutine)
        .UpdateOnChangeSensingTags(GameplayTag::AIState_DailyRoutine)
        //.UpdateOnChangeSensingTags(GameplayTag::State_Defeated)
        .UpdateOnChangeSensingTags(GameplayTag::AIState_Conversation)
        .UpdateOnChangeSensingTags(GameplayTag::AIState_Follow)
        .WithHostility(ERelationshipHostility::FollowOnSight)
        .IgnoreRelationship(ERelationship::Enemy)
        .IgnoreRelationship(ERelationship::Hostile)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .OutsideRange(1500.0f)
        .SetCooldownOnPerceptionGained(30.0f);
}

mixin FPerceptionHandler& SeenPlayerCharacterUndrawWeapon(UCharacterPerceptionComponent Perception)
{
    FPerceptionHandler& PerceptionHandler = Perception
        .AddPerceptionHandler()
        .WhenTagIsRemoved(GameplayTag::State_Combat)
        .OnCharactersWith(GameplayTag::Character_Player)
        .IgnoreHostility(ERelationshipHostility::TrainingFight);

    PerceptionHandler.bRequiresSensing = false;

    return PerceptionHandler;
}

/** Triggers whenever a visible human character with a drawn weapon enters perception looking at self or a friendly character*/
mixin FPerceptionHandler& SeenHumanCharacterWithRangedWeaponDrawnFaceMeOrAllys(UCharacterPerceptionComponent Perception)
{
         return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .NotOnSensingCharactersInvolvedInFight()
        .UpdateOnEventTag(GameplayTag::Event_Perception_Crime)
        .UpdateOnCombatRelevantAction()
        //.UpdateOnChangeSensingTags(GameplayTag::State_Defeated)
        .OnCharactersWith(GameplayTag::Species_Human)
        .OnCharactersWith(GameplayTag::State_Combat_Archery)
        .OnCharactersWith(GameplayTag::State_ItemDraw)
        .OnCharactersWith(GameplayTag::State_ItemInHand)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .TickRate(8.0f)
        .IgnoreHostility(ERelationshipHostility::TrainingFight)
        .HandleOriginLookingAtSensorOrAllys(true);
}

/** Triggers whenever a visible human character with a drawn weapon enters perception looking at self or a friendly character*/
mixin FPerceptionHandler& SeenHumanCharacterWithMeleeWeaponDrawnFaceMeOrAllys(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .NotOnSensingCharactersInvolvedInFight()
        .UpdateOnEventTag(GameplayTag::Event_Perception_Crime)
        .UpdateOnCombatRelevantAction()
        //.UpdateOnChangeSensingTags(GameplayTag::State_Defeated)
        .OnCharactersWith(GameplayTag::Species_Human)
        .OnCharactersWith(GameplayTag::State_Combat_Melee)
        .OnCharactersWith(GameplayTag::State_ItemDraw)
        .OnCharactersWith(GameplayTag::State_ItemInHand)
        .NotOnCharactersWith(GameplayTag::State_Combat_Melee_Fist)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .TickRate(8.0f)
        .IgnoreHostility(ERelationshipHostility::TrainingFight)
        .HandleOriginLookingAtSensorOrAllys(true);
}

/** Triggers whenever a visible human character with a drawn weapon enters perception looking at self or a friendly character*/
mixin FPerceptionHandler& SeenHumanCharacterWithFistsDrawnFaceMeOrAllys(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .NotOnSensingCharactersInvolvedInFight()
        .UpdateOnEventTag(GameplayTag::Event_Perception_Crime)
        .UpdateOnCombatRelevantAction()
        //.UpdateOnChangeSensingTags(GameplayTag::State_Defeated)
        .OnCharactersWith(GameplayTag::Species_Human)
        .OnCharactersWith(GameplayTag::State_Combat_Melee_Fist)
        .OnCharactersWith(GameplayTag::State_ItemDraw)
        .OnCharactersWith(GameplayTag::State_ItemInHand)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .TickRate(8.0f)
        .IgnoreHostility(ERelationshipHostility::TrainingFight)
        .HandleOriginLookingAtSensorOrAllys(true);
}

/** Triggers whenever a visible human character with a drawn weapon enters perception looking at self or a friendly character*/
mixin FPerceptionHandler& SeenHumanCharacterWithMagicHighThreatWeaponDrawnFaceMeOrAllys(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .NotOnSensingCharactersInvolvedInFight()
        .UpdateOnEventTag(GameplayTag::Event_Perception_Crime)
        .UpdateOnCombatRelevantAction()
        //.UpdateOnChangeSensingTags(GameplayTag::State_Defeated)
        .OnCharactersWith(GameplayTag::Species_Human)
        .OnCharactersWith(GameplayTag::State_Combat_Magic)
        .OnCharactersWith(GameplayTag::State_ItemDraw)
        .OnCharactersWith(GameplayTag::State_ItemInHand)
        .NotOnCharactersWith(GameplayTag::Item_Property_NoThreat)
        .NotOnCharactersWith(GameplayTag::Item_Property_LowThreat)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .TickRate(8.0f)
        .IgnoreHostility(ERelationshipHostility::TrainingFight)
        .HandleOriginLookingAtSensorOrAllys(true);
}

/** Triggers whenever a visible human character with a drawn weapon enters perception looking at self or a friendly character*/
mixin FPerceptionHandler& SeenHumanCharacterWithMagicLowThreatWeaponDrawnFaceMeOrAllys(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .NotOnSensingCharactersInvolvedInFight()
        .UpdateOnCombatRelevantAction()
        //.UpdateOnChangeSensingTags(GameplayTag::State_Defeated)
        .OnCharactersWith(GameplayTag::Species_Human)
        .OnCharactersWith(GameplayTag::State_Combat_Magic)
        .OnCharactersWith(GameplayTag::State_ItemDraw)
        .OnCharactersWith(GameplayTag::State_ItemInHand)
        .OnCharactersWith(GameplayTag::Item_Property_LowThreat)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .TickRate(8.0f)
        .IgnoreHostility(ERelationshipHostility::TrainingFight)
        .HandleOriginLookingAtSensorOrAllys(true);
}

/** Triggers whenever a visible human character with a drawn melee weapon enters perception*/
mixin FPerceptionHandler& SeenHumanCharacterWithMeleeWeaponDrawn(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .NotOnSensingCharactersInvolvedInFight()
        .UpdateOnCombatRelevantAction()
        //.UpdateOnChangeSensingTags(GameplayTag::State_Defeated)
        .OnCharactersWith(GameplayTag::Species_Human)
        .OnCharactersWith(GameplayTag::State_Combat_Melee)
        .OnCharactersWith(GameplayTag::State_ItemDraw)
        .OnCharactersWith(GameplayTag::State_ItemInHand)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .TickRate(8.0f)
        .IgnoreHostility(ERelationshipHostility::TrainingFight);
}

/** Triggers whenever a visible human character with a drawn ranged weapon enters perception*/
mixin FPerceptionHandler& SeenHumanCharacterWithRangedWeaponDrawn(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .NotOnSensingCharactersInvolvedInFight()
        .UpdateOnCombatRelevantAction()
        //.UpdateOnChangeSensingTags(GameplayTag::State_Defeated)
        .OnCharactersWith(GameplayTag::Species_Human)
        .OnCharactersWith(GameplayTag::State_Combat_Archery)
        .OnCharactersWith(GameplayTag::State_ItemDraw)
        .OnCharactersWith(GameplayTag::State_ItemInHand)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .TickRate(8.0f)
        .IgnoreHostility(ERelationshipHostility::TrainingFight);
}

/** Triggers whenever a visible human character with a drawn magic weapon enters perception*/
mixin FPerceptionHandler& SeenHumanCharacterWithMagicWeaponDrawn(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .NotOnSensingCharactersInvolvedInFight()
        .UpdateOnCombatRelevantAction()
        //.UpdateOnChangeSensingTags(GameplayTag::State_Defeated)
        .OnCharactersWith(GameplayTag::Species_Human)
        .OnCharactersWith(GameplayTag::State_Combat_Magic)
        .OnCharactersWith(GameplayTag::State_ItemDraw)
        .OnCharactersWith(GameplayTag::State_ItemInHand)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .TickRate(8.0f)
        .IgnoreHostility(ERelationshipHostility::TrainingFight);
}

/** Triggers whenever a visible creature character with a drawn weapon enters perception*/
mixin FPerceptionHandler& SeenCreatureCharacterWithWeaponDrawn(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .NotOnSensingCharactersInvolvedInFight()
        .UpdateOnCombatRelevantAction()
        //.UpdateOnChangeSensingTags(GameplayTag::State_Defeated)
        .OnCharactersWith(GameplayTag::Species_Creature)
        .OnCharactersWith(GameplayTag::State_Combat)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        // .TickRate(0.3f)
        .IgnoreHostility(ERelationshipHostility::TrainingFight);
}

/** Triggers whenever a visible orc character with a drawn weapon enters perception*/
mixin FPerceptionHandler& SeenOrcCharacterWithWeaponDrawn(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .NotOnSensingCharactersInvolvedInFight()
        .UpdateOnCombatRelevantAction()
        //.UpdateOnChangeSensingTags(GameplayTag::State_Defeated)
        .OnCharactersWith(GameplayTag::Species_Orc)
        .OnCharactersWith(GameplayTag::State_Combat)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        // .TickRate(0.3f)
        .IgnoreHostility(ERelationshipHostility::TrainingFight);
}

/** Triggers whenever a visible character draws an weapon */
mixin FPerceptionHandler& SeeCharacterDrawWeapon(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedTagIsAddedOnOther(GameplayTag::State_Combat)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .ViaSense(EPerceptionSense::See);
}

/** Triggers whenever a visible friendly character draws an weapon */
mixin FPerceptionHandler& SeeFriendlyCharacterDrawWeapon(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedTagIsAddedOnOther(GameplayTag::State_Combat)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .ViaSense(EPerceptionSense::See)
        .WithRelationship(ERelationship::Friend);
}

/** Triggers whenever a visible neutral character draws an weapon */
mixin FPerceptionHandler& SeeNeutralCharacterDrawWeapon(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedTagIsAddedOnOther(GameplayTag::State_Combat)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .ViaSense(EPerceptionSense::See)
        .WithRelationship(ERelationship::Neutral);
}

/** Triggers whenever a visible angering character draws an weapon */
mixin FPerceptionHandler& SeeAngeringCharacterDrawWeapon(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedTagIsAddedOnOther(GameplayTag::State_Combat)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .ViaSense(EPerceptionSense::See)
        .WithRelationship(ERelationship::Angry);
}

/** Triggers whenever a visible character draws an weapon */
mixin FPerceptionHandler& SeeCharacterToggleWeaponDrawn(UCharacterPerceptionComponent Perception)
{
    FPerceptionHandler& PerceptionHandler = Perception
        .OnSensedTagIsAddedOnOther(GameplayTag::State_Combat)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .ViaSense(EPerceptionSense::See);

    PerceptionHandler.DelaySeconds = 0.6f;
    
    return PerceptionHandler;
}

/** Triggers whenever the player enters sight perception */
mixin FPerceptionHandler& SeePlayer(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOtherWithTag(GameplayTag::Character_Player)
        .UpdateOnCombatRelevantAction()
        //.UpdateOnChangeSensingTags(GameplayTag::State_Defeated)
        .ViaSense(EPerceptionSense::See);
}

/** Triggers whenever the player enters sight perception */
mixin FPerceptionHandler& PreSensedPlayer(UCharacterPerceptionComponent Perception)
{
    return Perception
        .AddPerceptionHandler()
        .WithAwareness(1.0f)
        .ExcludeOriginActor(Perception.OwnerCharacter)
        .OnCharactersWith(GameplayTag::Character_Player)
        .ViaSense(EPerceptionSense::See);
}

/** Sensed Player any awareness */
mixin FPerceptionHandler& SensedPlayerAnyAwareness(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOtherWithTag(GameplayTag::Character_Player)
        .WithAwareness(1.0f);
}

/** Triggers whenever the specified character enters sight perception */
mixin FPerceptionHandler& SeeSpecificCharacter(UCharacterPerceptionComponent Perception, AGothicCharacterState CharacterState)
{
    return Perception
        .OnSensedOther()
        .HandleOriginActor(CharacterState.Character)
        .ViaSense(EPerceptionSense::See);
}

/** Triggers whenever the perceiving character gets hit.*/
mixin FPerceptionHandler& HitOnSelf(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Incoming_Attack_Hit).TickRate(0.1f);
}

mixin FPerceptionHandler& HitOnSelfWithFists(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnSelf(GameplayTag::Perception_Incoming_Attack_Hit)
        .HandleEffectCauserTag(GameplayTag::Item_Weapon_Fist);
        // .TickRate(0.1f);
}

mixin FPerceptionHandler& HitOnSelfWithHighThreatRune(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnSelf(GameplayTag::Perception_Incoming_Attack_Hit)
        .HandleEffectCauserTag(GameplayTag::Item_Weapon_Rune)
        .IgnoreEffectCauserTag(GameplayTag::Item_Property_NoThreat)
        .IgnoreEffectCauserTag(GameplayTag::Item_Property_LowThreat);
        // .TickRate(0.1f);
}

mixin FPerceptionHandler& HitOnSelfWithLowThreatRune(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnSelf(GameplayTag::Perception_Incoming_Attack_Hit)
        .HandleEffectCauserTag(GameplayTag::Item_Weapon_Rune)
        .HandleEffectCauserTag(GameplayTag::Item_Property_LowThreat);
        // .TickRate(0.1f);
}

mixin FPerceptionHandler& HitOnSelfWithHighThreatScroll(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnSelf(GameplayTag::Perception_Incoming_Attack_Hit)
        .HandleEffectCauserTag(GameplayTag::Item_Weapon_Scroll)
        .IgnoreEffectCauserTag(GameplayTag::Item_Property_NoThreat)
        .IgnoreEffectCauserTag(GameplayTag::Item_Property_LowThreat);
        // .TickRate(0.1f);
}

mixin FPerceptionHandler& HitOnSelfWithLowThreatScroll(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnSelf(GameplayTag::Perception_Incoming_Attack_Hit)
        .HandleEffectCauserTag(GameplayTag::Item_Weapon_Scroll)
        .HandleEffectCauserTag(GameplayTag::Item_Property_LowThreat);
        // .TickRate(0.1f);
}

mixin FPerceptionHandler& HitOnSelfWithWeaponMelee(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnSelf(GameplayTag::Perception_Incoming_Attack_Hit)
        .IgnoreEffectCauserTag(GameplayTag::Item_Weapon_Fist)
        .IgnoreEffectCauserTag(GameplayTag::Item_Weapon_Rune)
        .IgnoreEffectCauserTag(GameplayTag::Item_Weapon_Scroll)
        .HandleEffectCauserTag(GameplayTag::Item_Range_Melee);
        // .TickRate(0.1f);
}

mixin FPerceptionHandler& HitOnSelfWithWeaponRanged(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnSelf(GameplayTag::Perception_Incoming_Attack_Hit)
        .IgnoreEffectCauserTag(GameplayTag::Item_Weapon_Fist)
        .IgnoreEffectCauserTag(GameplayTag::Item_Weapon_Rune)
        .IgnoreEffectCauserTag(GameplayTag::Item_Weapon_Scroll)
        .HandleEffectCauserTag(GameplayTag::Item_Range_Long);
        // .TickRate(0.1f);
}

mixin FPerceptionHandler& HitOnSelfWithThrowable(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnSelf(GameplayTag::Perception_Incoming_Attack_Hit)
        .HandleEffectCauserTag(GameplayTag::Item_Property_Throwable);
}

mixin FPerceptionHandler& HitOnOtherWithFists(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnOthers(GameplayTag::Perception_Incoming_Attack_Hit)
        .HandleEffectCauserTag(GameplayTag::Item_Weapon_Fist)
        .Delay(0.2f);
        // .TickRate(0.1f);
}

mixin FPerceptionHandler& HitOnOtherWithHighThreatRune(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnOthers(GameplayTag::Perception_Incoming_Attack_Hit)
        .HandleEffectCauserTag(GameplayTag::Item_Weapon_Rune)
        .IgnoreEffectCauserTag(GameplayTag::Item_Property_NoThreat)
        .IgnoreEffectCauserTag(GameplayTag::Item_Property_LowThreat)
        .Delay(0.2f);
        // .TickRate(0.1f);
}

mixin FPerceptionHandler& HitOnOtherWithLowThreatRune(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnOthers(GameplayTag::Perception_Incoming_Attack_Hit)
        .HandleEffectCauserTag(GameplayTag::Item_Weapon_Rune)
        .HandleEffectCauserTag(GameplayTag::Item_Property_LowThreat)
        .Delay(0.2f);
        // .TickRate(0.1f);
}

mixin FPerceptionHandler& HitOnOtherWithHighThreatScroll(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnOthers(GameplayTag::Perception_Incoming_Attack_Hit)
        .HandleEffectCauserTag(GameplayTag::Item_Weapon_Scroll)
        .IgnoreEffectCauserTag(GameplayTag::Item_Property_NoThreat)
        .IgnoreEffectCauserTag(GameplayTag::Item_Property_LowThreat)
        .Delay(0.2f);
        // .TickRate(0.1f);
}

mixin FPerceptionHandler& HitOnOtherWithLowThreatScroll(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnOthers(GameplayTag::Perception_Incoming_Attack_Hit)
        .HandleEffectCauserTag(GameplayTag::Item_Weapon_Scroll)
        .HandleEffectCauserTag(GameplayTag::Item_Property_LowThreat)
        .Delay(0.2f);
        // .TickRate(0.1f);
}

mixin FPerceptionHandler& HitOnOtherWithWeaponMelee(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnOthers(GameplayTag::Perception_Incoming_Attack_Hit)
        .IgnoreEffectCauserTag(GameplayTag::Item_Weapon_Fist)
        .IgnoreEffectCauserTag(GameplayTag::Item_Weapon_Rune)
        .IgnoreEffectCauserTag(GameplayTag::Item_Weapon_Scroll)
        .HandleEffectCauserTag(GameplayTag::Item_Range_Melee)
        .Delay(0.2f);
        // .TickRate(0.1f);
}

mixin FPerceptionHandler& HitOnOtherWithWeaponRanged(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnOthers(GameplayTag::Perception_Incoming_Attack_Hit)
        .IgnoreEffectCauserTag(GameplayTag::Item_Weapon_Fist)
        .IgnoreEffectCauserTag(GameplayTag::Item_Weapon_Rune)
        .IgnoreEffectCauserTag(GameplayTag::Item_Weapon_Scroll)
        .HandleEffectCauserTag(GameplayTag::Item_Range_Long)
        .Delay(0.2f);
        // .TickRate(0.1f);
}

mixin FPerceptionHandler& HitOnOtherWithThrowable(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnOthers(GameplayTag::Perception_Incoming_Attack_Hit)
        .HandleEffectCauserTag(GameplayTag::Item_Property_Throwable)
        .Delay(0.2f);
        // .TickRate(0.1f);
}

/** Triggers whenever the perceiving character sees another get hit by a melee attack with a weapon.*/
mixin FPerceptionHandler& JustSeenAttackHitOtherWithMeleeWeapon(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Incoming_Attack_Hit)
        .ViaSense(EPerceptionSense::See)
        .IgnoreEffectCauserTag(GameplayTag::Item_Weapon_Fist)
        .HandleEffectCauserTag(GameplayTag::Item_Range_Melee)
        .ExcludeInstigatorActor(Perception.OwnerCharacter)
        .Delay(0.2f);
        // .TickRate(0.1f);
}

/** Triggers whenever the perceiving character sees another get hit by a melee attack with fists.*/
mixin FPerceptionHandler& JustSeenAttackHitOtherWithFists(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Incoming_Attack_Hit)
        .ViaSense(EPerceptionSense::See)
        .HandleEffectCauserTag(GameplayTag::Item_Weapon_Fist)
        .HandleEffectCauserTag(GameplayTag::Item_Range_Melee)
        .ExcludeInstigatorActor(Perception.OwnerCharacter)
        .Delay(0.2f);
        // .TickRate(0.1f);
}

/** Triggers whenever the perceiving character sees another get hit by a ranged attack with weapon.*/
mixin FPerceptionHandler& JustSeenAttackHitOtherWithRangedWeapon(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Incoming_Attack_Hit)
        .ViaSense(EPerceptionSense::See)
        .IgnoreEffectCauserTag(GameplayTag::Item_Weapon_Fist)
        .IgnoreEffectCauserTag(GameplayTag::Item_Weapon_Rune)
        .IgnoreEffectCauserTag(GameplayTag::Item_Weapon_Scroll)
        .HandleEffectCauserTag(GameplayTag::Item_Range_Long)
        .ExcludeInstigatorActor(Perception.OwnerCharacter)
        .Delay(0.2f);
        // .TickRate(0.1f);
}

/** Triggers whenever the perceiving character sees another get hit by a ranged attack with weapon.*/
mixin FPerceptionHandler& JustSeenAttackHitOtherWithRune_HighThreat(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Incoming_Attack_Hit)
        .ViaSense(EPerceptionSense::See)
        .HandleEffectCauserTag(GameplayTag::Item_Weapon_Rune)
        .IgnoreEffectCauserTag(GameplayTag::Item_Property_NoThreat)
        .IgnoreEffectCauserTag(GameplayTag::Item_Property_LowThreat)
        .ExcludeInstigatorActor(Perception.OwnerCharacter)
        .Delay(0.2f);
        // .TickRate(0.1f);
}

/** Triggers whenever the perceiving character sees another get hit by a ranged attack with weapon.*/
mixin FPerceptionHandler& JustSeenAttackHitOtherWithScroll_HighThreat(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Incoming_Attack_Hit)
        .ViaSense(EPerceptionSense::See)
        .HandleEffectCauserTag(GameplayTag::Item_Weapon_Scroll)
        .IgnoreEffectCauserTag(GameplayTag::Item_Property_NoThreat)
        .IgnoreEffectCauserTag(GameplayTag::Item_Property_LowThreat)
        .ExcludeInstigatorActor(Perception.OwnerCharacter)
        .Delay(0.2f);
        // .TickRate(0.1f);
}

/** Triggers whenever the perceiving character sees another get hit by a ranged attack with weapon.*/
mixin FPerceptionHandler& JustSeenAttackHitOtherWithRune_LowThreat(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Incoming_Attack_Hit)
        .ViaSense(EPerceptionSense::See)
        .HandleEffectCauserTag(GameplayTag::Item_Weapon_Rune)
        .HandleEffectCauserTag(GameplayTag::Item_Property_LowThreat)
        .ExcludeInstigatorActor(Perception.OwnerCharacter)
        .Delay(0.2f);
        // .TickRate(0.1f);
}

/** Triggers whenever the perceiving character sees another get hit by a ranged attack with weapon.*/
mixin FPerceptionHandler& JustSeenAttackHitOtherWithScroll_LowThreat(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Incoming_Attack_Hit)
        .ViaSense(EPerceptionSense::See)
        .HandleEffectCauserTag(GameplayTag::Item_Weapon_Scroll)
        .HandleEffectCauserTag(GameplayTag::Item_Property_LowThreat)
        .ExcludeInstigatorActor(Perception.OwnerCharacter)
        .Delay(0.2f);
        // .TickRate(0.1f);
}

/** Triggers whenever the perceiving character hears another get hit by a melee attack with a weapon.*/
mixin FPerceptionHandler& JustHeardAttackHitOtherWithMeleeWeapon(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Incoming_Attack_Hit)
        .ViaSense(EPerceptionSense::Hear)
        .IgnoreEffectCauserTag(GameplayTag::Item_Weapon_Fist)
        .HandleEffectCauserTag(GameplayTag::Item_Range_Melee)
        .ExcludeInstigatorActor(Perception.OwnerCharacter)
        .Delay(0.2f);
        // .TickRate(0.1f);
}

/** Triggers whenever the perceiving character hears another get hit by a melee attack with fists.*/
mixin FPerceptionHandler& JustHeardAttackHitOtherWithFists(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Incoming_Attack_Hit)
        .ViaSense(EPerceptionSense::Hear)
        .HandleEffectCauserTag(GameplayTag::Item_Weapon_Fist)
        .HandleEffectCauserTag(GameplayTag::Item_Range_Melee)
        .ExcludeInstigatorActor(Perception.OwnerCharacter)
        .Delay(0.2f);
        // .TickRate(0.1f);
}

/** Triggers whenever the perceiving character hears another get hit by a ranged attack with weapon.*/
mixin FPerceptionHandler& JustHeardAttackHitOtherWithRangedWeapon(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Incoming_Attack_Hit)
        .ViaSense(EPerceptionSense::Hear)
        .HandleEffectCauserTag(GameplayTag::Item_Range_Long)
        .ExcludeInstigatorActor(Perception.OwnerCharacter)
        .Delay(0.2f);
        // .TickRate(0.1f);
}

// /** Triggers whenever the perceiving character gets hit.*/
// mixin FPerceptionHandler& JustSeenAttackHitOther(UCharacterPerceptionComponent Perception)
// {
//     return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Incoming_Attack_Hit)
//         .ViaSense(EPerceptionSense::See)
//         .TickRate(0.1f);
// }

mixin FPerceptionHandler& JustSmelledHostileCharacter(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedOther()
        .ViaSense(EPerceptionSense::Smell)
        .UpdateOnChangeSensingTags(GameplayTag::AIState_AssessGoToDailyRoutine)
        .IgnoreWithSenseAwareness(EPerceptionSense::See, 80.0f)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .WithRelationship(ERelationship::Hostile);
}

mixin FPerceptionHandler& JustSmelledEnemyCharacter(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedOther()
        .ViaSense(EPerceptionSense::Smell)
        .UpdateOnChangeSensingTags(GameplayTag::AIState_AssessGoToDailyRoutine)
        .IgnoreWithSenseAwareness(EPerceptionSense::See, 80.0f)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .WithRelationship(ERelationship::Enemy);
}

mixin FPerceptionHandler& JustSmelledPredator(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedOther()
        .ViaSense(EPerceptionSense::Smell)
        .UpdateOnChangeSensingTags(GameplayTag::AIState_AssessGoToDailyRoutine)
        .IgnoreWithSenseAwareness(EPerceptionSense::See, 80.0f)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .WithHostility(ERelationshipHostility::Prey);
}

mixin FPerceptionHandler& JustSmelledPrey(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedOther()
        .ViaSense(EPerceptionSense::Smell)
        .UpdateOnChangeSensingTags(GameplayTag::AIState_AssessGoToDailyRoutine)
        .IgnoreWithSenseAwareness(EPerceptionSense::See, 80.0f)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .WithHostility(ERelationshipHostility::Predator);
}

// /** Triggers whenever the perceiving character gets hit.*/
// mixin FPerceptionHandler& Hit_Old(UCharacterPerceptionComponent Perception)
// {
//     return Perception.OnSensedEvent(GameplayTag::Event_Damaged_Me_After);
// }

/// Spell effect on self
mixin FPerceptionHandler& SpellEffectStartedOnSelf_Charm(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Spell_Debuff_Charm_Start);
}

mixin FPerceptionHandler& SpellEffectLoadedOnSelfBeforeSetup_Charm(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Character_Setup)
        .OnCharactersWith(GameplayTag::Debuff_Charm);
}

mixin FPerceptionHandler& SpellEffectLoadedOnSelfAfterSetup_Charm(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Spell_Debuff_Charm_Load);
}

mixin FPerceptionHandler& SpellEffectEndedOnSelf_Charm(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Spell_Debuff_Charm_End);
}

mixin FPerceptionHandler& SpellEffectStartedOnSelf_Fear(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Spell_Debuff_Fear_Start);
}

mixin FPerceptionHandler& SpellEffectLoadedOnSelfBeforeSetup_Fear(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Character_Setup)
        .OnCharactersWith(GameplayTag::Debuff_Fear);
}

mixin FPerceptionHandler& SpellEffectLoadedOnSelfAfterSetup_Fear(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Spell_Debuff_Fear_Load);
}

mixin FPerceptionHandler& SpellEffectEndedOnSelf_Fear(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Spell_Debuff_Fear_End);
}

mixin FPerceptionHandler& SpellEffectStartedOnSelf_Sleep(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Spell_Debuff_Sleep_Start);
}

mixin FPerceptionHandler& SpellEffectEndedOnSelf_Sleep(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Spell_Debuff_Sleep_End);
}

mixin FPerceptionHandler& SpellEffectStartedOnSelf_Control(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Spell_Control_Start);
}

mixin FPerceptionHandler& SpellEffectEndedOnSelf_Control(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Spell_Control_End);
}

mixin FPerceptionHandler& SpellEffectStartedOnSelf_Paralyzed(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Spell_Debuff_Paralyzed_Start);
}

mixin FPerceptionHandler& SpellEffectStartedOnSelf_Pyrokinesis(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Spell_Debuff_Pyrokinesis_Start);
}

mixin FPerceptionHandler& SpellEffectStartedOnSelf_UrizielWaveOfDeath(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Spell_Debuff_UrizielWaveOfDeath_Start);
}

mixin FPerceptionHandler& SpellEffectStartedOnSelf_FireRain(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Spell_Debuff_FireRain_Start);
}

mixin FPerceptionHandler& SpellEffectEndedOnSelf_Paralyzed(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Spell_Debuff_Paralyzed_End);
}

/// Spell effect on other
mixin FPerceptionHandler& SpellEffectStartedOnOther_Charm(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Spell_Debuff_Charm_Start);
}

mixin FPerceptionHandler& SpellEffectEndedOnOther_Charm(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Spell_Debuff_Charm_End);
}

mixin FPerceptionHandler& SpellEffectStartedOnOther_Fear(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Spell_Debuff_Fear_Start);
}

mixin FPerceptionHandler& SpellEffectEndedOnOther_Fear(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Spell_Debuff_Fear_End);
}

mixin FPerceptionHandler& SpellEffectStartedOnOther_Sleep(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Spell_Debuff_Sleep_Start);
}

mixin FPerceptionHandler& SpellEffectEndedOnOther_Sleep(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Spell_Debuff_Sleep_End);
}

mixin FPerceptionHandler& SpellEffectStartedOnOther_Control(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Spell_Control_Start);
}

mixin FPerceptionHandler& SpellEffectEndedOnOther_Control(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Spell_Control_End);
}

mixin FPerceptionHandler& SpellEffectStartedOnOther_Paralyzed(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Spell_Debuff_Paralyzed_Start);
}

mixin FPerceptionHandler& SpellEffectStartedOnOther_Pyrokinesis(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Spell_Debuff_Pyrokinesis_Start);
}

mixin FPerceptionHandler& SpellEffectStartedOnOther_UrizielWaveOfDeath(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Spell_Debuff_UrizielWaveOfDeath_Start);
}

mixin FPerceptionHandler& SpellEffectStartedOnOther_FireRain(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Spell_Debuff_FireRain_Start);
}

mixin FPerceptionHandler& SpellEffectEndedOnOther_Paralyzed(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Spell_Debuff_Paralyzed_End);
}

mixin FPerceptionHandler& SpellEffectStartedOnOther_Transform(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Spell_Transform_Start);
}

mixin FPerceptionHandler& SpellEffectEndedOnOther_Transform(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Spell_Transform_End);
}

/** Triggers whenever a character that isn't the perceiver is sensed getting hit.*/
mixin FPerceptionHandler& SeeHitOnOtherCharacter(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnOthers(GameplayTag::Perception_Incoming_Attack_Hit)
        .ViaSense(EPerceptionSense::See)
        .TickRate(0.1f);
}

/** Triggers whenever the perceiver's target is sensed getting hit.*/
mixin FPerceptionHandler& HitOnTarget(UCharacterPerceptionComponent Perception)
{
    FPerceptionHandler& PerceptionHandler =  Perception
        .OnSensedEventOnSelf(GameplayTag::Perception_Attack_Hit)
        .FilterFunction(FPerceptionConditionDelegate(PerceptionConditions, n"AffectedIsTarget"));

    return PerceptionHandler;
}

/** Triggers whenever an incoming attack enters the reaction animnotify */
mixin FPerceptionHandler& IncomingAttackAtSelfReactionNotifyEntered(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnOthers(GameplayTag::Perception_Attack_Reactable)
        .TickRate(0.1f)
        .HandleAffectedActor(Perception.OwnerCharacter);
}

/** Triggers whenever the perceiving character is about to get hit.*/
mixin FPerceptionHandler& IncomingAttackAtSelf(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnSelf(GameplayTag::Perception_Incoming_Attack_AboutToHit)
        .TickRate(0.1f);
}

/** Triggers whenever the perceiving character is about to get hit.*/
mixin FPerceptionHandler& JustSeenIncomingAttackAtSelf(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnSelf(GameplayTag::Perception_Incoming_Attack_AboutToHit)
        .ViaSense(EPerceptionSense::See)
        .TickRate(0.1f);
}

/** Triggers whenever a character that isn't the perceiver is sensed about to get hit.*/
mixin FPerceptionHandler& JustSeenIncomingAttackAtOther(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnOthers(GameplayTag::Perception_Incoming_Attack_AboutToHit)
        .ViaSense(EPerceptionSense::See)
        .TickRate(0.1f);
}

/** Triggers whenever a character that is aiming an archery weapon enters visibility perception */
mixin FPerceptionHandler& JustSeenCharacterAimingArcheryWeapon(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .OnCharactersWith(GameplayTag::State_Combat_Archery)
        .OnCharactersWith(GameplayTag::State_Aiming_Normal);
}

/** Triggers when a character in visibility perception of the perceiver starts or stops aiming an archery weapon */
mixin FPerceptionHandler& SeenCharacterToggleAimingArcheryWeapon(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedTagIsAddedOnOther(GameplayTag::State_Aiming_Normal)
        .ViaSense(EPerceptionSense::See)
        .OnCharactersWith(GameplayTag::State_Combat_Archery)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated);
}

/** Triggers whenever a guard enters the character's visibility perception */
mixin FPerceptionHandler& JustSeenGuard(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .OnCharactersWith(GameplayTag::Action_Ambient_GuardPassage)
        .OnCharactersWith(GameplayTag::Action_Ambient_GuardWatch)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated);
}

/** Triggers when gaining sight perception of a character casting magic */
mixin FPerceptionHandler& JustSeenCharacterCastingMagic_HighThreat(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .OnCharactersWith(GameplayTag::State_Casting)
        .NotOnCharactersWith(GameplayTag::Item_Property_NoThreat)
        .NotOnCharactersWith(GameplayTag::Item_Property_LowThreat);
}

/** Triggers when sensed character starts or stops casting magic */
mixin FPerceptionHandler& SeenCharacterToggleCastingMagic_HighThreat(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedTagIsAddedOnOther(GameplayTag::State_Casting)
        .NotOnCharactersWith(GameplayTag::Item_Property_NoThreat)
        .NotOnCharactersWith(GameplayTag::Item_Property_LowThreat)
        .ViaSense(EPerceptionSense::See);
}

/** Triggers when gaining sight perception of a character casting magic */
mixin FPerceptionHandler& JustSeenCharacterCastingMagic_LowThreat(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .OnCharactersWith(GameplayTag::State_Casting)
        .OnCharactersWith(GameplayTag::Item_Property_LowThreat);
}

/** Triggers when sensed character starts or stops casting magic */
mixin FPerceptionHandler& SeenCharacterToggleCastingMagic_LowThreat(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedTagIsAddedOnOther(GameplayTag::State_Casting)
        .OnCharactersWith(GameplayTag::Item_Property_LowThreat)
        .ViaSense(EPerceptionSense::See);
}

/** Triggers when gaining sight perception of a character launching a spell */
mixin FPerceptionHandler& JustSeenCharacterLaunchingSpell(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .OnCharactersWith(GameplayTag::State_LaunchingSpell);
}

/** Triggers when sensed character launches a spell */
mixin FPerceptionHandler& SeenCharacterLaunchSpell(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedTagIsAddedOnOther(GameplayTag::State_LaunchingSpell)
        .ViaSense(EPerceptionSense::See);
}

/** Triggers when gaining sight perception of a frozen character */
mixin FPerceptionHandler& JustSeenCharacterFrozen(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .OnCharactersWith(GameplayTag::Debuff_Freeze)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated);
}

/** Triggers when sensed character gets frozen */
mixin FPerceptionHandler& SeenCharacterGetFrozen(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedTagIsAddedOnOther(GameplayTag::Debuff_Freeze)
        .ViaSense(EPerceptionSense::See)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated);
}

/** Triggers when gaining sight perception of a burning character */
mixin FPerceptionHandler& JustSeenCharacterBurn(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .OnCharactersWith(GameplayTag::Debuff_Burn)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated);
}

/** Triggers when sensed character starts burning */
mixin FPerceptionHandler& SeenCharacterGetBurn(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedTagIsAddedOnOther(GameplayTag::Debuff_Burn)
        .ViaSense(EPerceptionSense::See)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated);
}

/** Triggers when the sensed character has launched a projectile spell towards the perceiving character */
mixin FPerceptionHandler& SeenCharacterLaunchMagicProjectileAtMe(UCharacterPerceptionComponent Perception)
{
    FPerceptionHandler& PerceptionHandler = Perception
        .OnSensedTagIsAddedOnOther(GameplayTag::State_LaunchingSpell)
        .ViaSense(EPerceptionSense::See)
        .FilterFunction(FPerceptionConditionDelegate(PerceptionConditions, n"IsSensedCharacterAimingMagicProjectileSpellAtMe"));

    return PerceptionHandler;
}

mixin FPerceptionHandler& TrainingFightWithFistsStarted(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::AIEvent_StartTrainingFight_Fists);
}

mixin FPerceptionHandler& TrainingFightWithWeaponStarted(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::AIEvent_StartTrainingFight_Weapon);
}

/** Triggers when the perceiving character hears the sound of a character being hit */
mixin FPerceptionHandler& HeardHit(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedEventOnOthers(GameplayTag::Perception_Attack_Hit)
        .TickRate(0.1f)
        .ViaSense(EPerceptionSense::Hear);
}

/** Triggers when the perceiving character hears the sound of a warning */
mixin FPerceptionHandler& HeardWarning(UCharacterPerceptionComponent Perception)
{
    FPerceptionHandler& PerceptionHandler = Perception
        .OnSensedEventOnOthers(GameplayTag::Sound_Bark_Warn);

    PerceptionHandler.bRequiresSensing = false;

    return PerceptionHandler;
}

/** Triggers when the perceiving character hears the sound of a warning */
mixin FPerceptionHandler& HeardWarningByFriendly(UCharacterPerceptionComponent Perception)
{
    FPerceptionHandler& PerceptionHandler = Perception
        .OnSensedEventOnOthers(GameplayTag::Sound_Bark_Warn)
        .WithRelationship(ERelationship::Friend);

    PerceptionHandler.bRequiresSensing = false;

    return PerceptionHandler;
}

/** Triggers when the perceiving character hears the sound of a warning */
mixin FPerceptionHandler& HeardTaunt(UCharacterPerceptionComponent Perception)
{
    FPerceptionHandler& PerceptionHandler = Perception
        .OnSensedEventOnOthers(GameplayTag::Sound_Bark_Warn);

    PerceptionHandler.bRequiresSensing = false;

    return PerceptionHandler;
}

/** Triggers when the perceiving character hears another character */
mixin FPerceptionHandler& HeardCharacter(UCharacterPerceptionComponent Perception)
{
    FPerceptionHandler& PerceptionHandler = Perception
        .AddPerceptionHandler().WithAwareness(80.0f)
        .ViaSense(EPerceptionSense::Hear)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .TickRate(5.0f);

    return PerceptionHandler;
}

mixin FPerceptionHandler& HeardCharacterTrespassingInArea(UCharacterPerceptionComponent Perception)
{
    FPerceptionHandler& PerceptionHandler = Perception.HeardCharacter()
            .WhenWouldPursueCrime(GameplayTag::Crime_Trespassing_OnGuild)
            .WhenWouldPursueCrime(GameplayTag::Crime_Trespassing_OnPerson);

    return PerceptionHandler;
}

/** Triggers when the perceiving character hears the sound of a warning */
mixin FPerceptionHandler& HeardTauntByFriendly(UCharacterPerceptionComponent Perception)
{
    FPerceptionHandler& PerceptionHandler = Perception
        .OnSensedEventOnOthers(GameplayTag::Perception_Sound_Taunt)
        .WithRelationship(ERelationship::Friend);

    PerceptionHandler.bRequiresSensing = false;

    return PerceptionHandler;
}

/** Triggers when the perceiving character hears the sound of a warning */
mixin FPerceptionHandler& HeardTauntByEnemy(UCharacterPerceptionComponent Perception)
{
    FPerceptionHandler& PerceptionHandler = Perception
        .OnSensedEventOnOthers(GameplayTag::Perception_Sound_Taunt)
        .WithRelationship(ERelationship::Enemy);

    PerceptionHandler.bRequiresSensing = false;

    return PerceptionHandler;
}

/** Triggers when the perceiving character hears the sound of a warning */
mixin FPerceptionHandler& HeardTauntByHostile(UCharacterPerceptionComponent Perception)
{
    FPerceptionHandler& PerceptionHandler = Perception
        .OnSensedEventOnOthers(GameplayTag::Perception_Sound_Taunt)
        .WithRelationship(ERelationship::Enemy);

    PerceptionHandler.bRequiresSensing = false;

    return PerceptionHandler;
}

/** Triggers when a lower-class character stands in our path */
mixin FPerceptionHandler& OnSomeoneLowerClassBlockingMyPath(UCharacterPerceptionComponent Perception, float MaxDistance)
{
    FPerceptionHandler& PerceptionHandler = Perception
		.OnSensedOther()
        .WithinRange(MaxDistance)
        .WithRelativeRank(ERelationshipRelativeRank::Scum)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .FilterFunction(FPerceptionConditionDelegate(PerceptionConditions, n"IsSensedCharacterOfLowerRankAndBlockingMyPath"));

    return PerceptionHandler;
}

/** Triggers when a lower-class character stands in our path */
mixin FPerceptionHandler& OnPlayerLowerClassBlockingMyPath(UCharacterPerceptionComponent Perception, float MaxDistance)
{
    FPerceptionHandler& PerceptionHandler = Perception
		.OnSensedOther()
        .WithinRange(MaxDistance)
        .WithRelativeRank(ERelationshipRelativeRank::Scum)
        .OnCharactersWith(GameplayTag::Character_Player)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .FilterFunction(FPerceptionConditionDelegate(PerceptionConditions, n"IsSensedCharacterOfLowerRankAndBlockingMyPath"));

    return PerceptionHandler;
}

/** Triggers when the player stands in our path (rank-agnostic; reaction differentiated in ARM). */
mixin FPerceptionHandler& OnPlayerBlockingMyPath(UCharacterPerceptionComponent Perception, float MaxDistance)
{
    FPerceptionHandler& PerceptionHandler = Perception
        .OnSensedOther()
        .WithinRange(MaxDistance)
        .OnCharactersWith(GameplayTag::Character_Player)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .FilterFunction(FPerceptionConditionDelegate(PerceptionConditions, n"IsSensedCharacterBlockingMyPath"));

    return PerceptionHandler;
}

/** Triggers when the player is sensed within range AND Self is currently facing them (stationary NPCs). */
mixin FPerceptionHandler& OnPlayerInFrontOfMe(UCharacterPerceptionComponent Perception, float MaxDistance)
{
    FPerceptionHandler& PerceptionHandler = Perception
        .OnSensedOther()
        .WithinRange(MaxDistance)
        .OnCharactersWith(GameplayTag::Character_Player)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        // Suppress during conversation to avoid false positives after dialogue.
        .NotOnSensingCharactersWith(GameplayTag::AIState_Conversation)
        .FilterFunction(FPerceptionConditionDelegate(PerceptionConditions, n"IsSensedCharacterInFrontOfMe"));

    return PerceptionHandler;
}

/** Triggers when Self got knocked out by someone. */
mixin FPerceptionHandler& OnMyselfGotKnockedOut(UCharacterPerceptionComponent Perception)
{
    FPerceptionHandler& PerceptionHandler = Perception
		.OnSensedEventOnSelf(GameplayTag::Perception_Incoming_Attack_Hit_Damaged_Defeated);
    
    PerceptionHandler.bRequiresSensing = false;
	
	return PerceptionHandler;
}

/** Triggers when Self got killed by someone. */
mixin FPerceptionHandler& OnMyselfGotKilled(UCharacterPerceptionComponent Perception)
{
    FPerceptionHandler& PerceptionHandler = Perception
		.OnSensedEventOnSelf(GameplayTag::Event_Die_Me_Before);
    
    PerceptionHandler.bRequiresSensing = false;
	
	return PerceptionHandler;
}

/** Triggers when Self got knocked out by someone. */
mixin FPerceptionHandler& OnSomeoneElseGotKnockedOut(UCharacterPerceptionComponent Perception)
{
    FPerceptionHandler& PerceptionHandler = Perception
		.OnSensedEventOnOthers(GameplayTag::Perception_Incoming_Attack_Hit_Damaged_Defeated);

    PerceptionHandler.bRequiresSensing = false;
	
	return PerceptionHandler;
}

/** Triggers when Self got killed by someone. */
mixin FPerceptionHandler& OnSomeoneElseGotKilled(UCharacterPerceptionComponent Perception)
{
    FPerceptionHandler& PerceptionHandler = Perception
		.OnSensedEventOnOthers(GameplayTag::Perception_Incoming_Attack_Hit_Damaged_Killed);

    // PerceptionHandler.bRequiresSensing = false;
	
	return PerceptionHandler;
}

/** Triggers when someone dies by execution. */
mixin FPerceptionHandler& OnSomeoneIsExecuting(UCharacterPerceptionComponent Perception)
{
    FPerceptionHandler& PerceptionHandler = Perception
		.OnSensedOtherWithTag(GameplayTag::State_Interact_Body_Execute);

    // PerceptionHandler.bRequiresSensing = false;
	
	return PerceptionHandler;
}

/** Triggers when someone dies by execution. */
mixin FPerceptionHandler& OnSelfIsExecuting(UCharacterPerceptionComponent Perception)
{
    FPerceptionHandler& PerceptionHandler = Perception
		.OnSensedSelfWithTag(GameplayTag::State_Interact_Body_Execute);

    // PerceptionHandler.bRequiresSensing = false;
	
	return PerceptionHandler;
}

/** Triggers when Someone ignored warnings from Self */
mixin FPerceptionHandler& OnSomeoneIgnoredMyWarnings(UCharacterPerceptionComponent Perception)
{
    FPerceptionHandler& PerceptionHandler = Perception
        .OnSensedEventOnSelf(GameplayTag::AreaEvent_IgnoredWarning).TickRate(0.1f);

    PerceptionHandler.bRequiresSensing = false;

    return PerceptionHandler;
}

/** Triggers when Someone ignored warnings from Other */
mixin FPerceptionHandler& OnSomeoneIgnoredOtherWarnings(UCharacterPerceptionComponent Perception)
{
    FPerceptionHandler& PerceptionHandler = Perception
        .OnSensedEventOnOthers(GameplayTag::AreaEvent_IgnoredWarning).TickRate(0.1f);

    PerceptionHandler.bRequiresSensing = false;

    return PerceptionHandler;
}

/** Returns true, if we can sense any character with the given tag. */
mixin bool CanSenseCharacterWithTag(const UCharacterPerceptionComponent Perception, FGameplayTag Tag)
{
    return Perception.GetAnySensedCharacterWithTag(Tag) != nullptr;
}

/** Returns a character that we can sense and has the given tag. */
mixin AGothicCharacter GetAnySensedCharacterWithTag(const UCharacterPerceptionComponent Perception, FGameplayTag Tag)
{
    FGameplayTagContainer Tags;
    
    Tags.AddTag(Tag);

    return Perception.GetAnySensedCharacterWithAnyOf(Tags);
}

/** Returns true, if we can sense any character that has any of the the given tags. */
mixin bool CanSenseCharacterWithAnyOf(const UCharacterPerceptionComponent Perception, FGameplayTagContainer Tags)
{
    return Perception.GetAnySensedCharacterWithAnyOf(Tags) != nullptr;
}

/** Returns a character that we can sense and has any of the given tags. */
mixin AGothicCharacter GetAnySensedCharacterWithAnyOf(const UCharacterPerceptionComponent Perception, FGameplayTagContainer Tags)
{
    auto Sensed = Perception.GetAllSensedCharacters(Tags, FGameplayTagContainer());

    return Sensed.Num() > 0 ? Sensed[0] : nullptr;
}

/** Triggers when a perceived hostile character changes relationships with the sensing character */
mixin FPerceptionHandler& OnHostileChangedRelationship(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Character_Changed_Relationship)
            .WithRelationship(ERelationship::Hostile);
}

/** Triggers when a perceived enemy character changes relationships with the sensing character */
mixin FPerceptionHandler& OnEnemyChangedRelationship(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Character_Changed_Relationship)
            .WithRelationship(ERelationship::Enemy);
}

/** Triggers when a perceived character changes relationships with the sensing character */
mixin FPerceptionHandler& OnChangedRelationship(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Character_Changed_Relationship);
}

mixin FPerceptionHandler& OnSomeonePickedUpOwnedItem(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Character_PickUpItem)
        .ViaSense(EPerceptionSense::See)
        .HandleOriginOwnership(EOwnershipRelationFlags::Other);
}

mixin FPerceptionHandler& OnSelfPickedUpOwnedItem(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Character_PickUpItem)
        .HandleOriginOwnership(EOwnershipRelationFlags::Other);
}

mixin FPerceptionHandler& OnSomeoneTookItemFromOwnedContainer(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnOthers(GameplayTag::Perception_Character_Looted_Container)
        .ViaSense(EPerceptionSense::See)
        .HandleOriginOwnership(EOwnershipRelationFlags::Other);
}

mixin FPerceptionHandler& OnSelfTookItemFromOwnedContainer(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Character_Looted_Container)
        .HandleOriginOwnership(EOwnershipRelationFlags::Other);
}

mixin FPerceptionHandler& OnStartedPickingOwnedLock(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedSelfWithTag(GameplayTag::State_PickLock)
        .HandleOriginOwnership(EOwnershipRelationFlags::Other)
        .RequireInteractiveObject(true);
}

mixin FPerceptionHandler& OnSomeoneSeenLockpickingOwnedInteractable(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedOtherWithTag(GameplayTag::State_PickLock)
        .ViaSense(EPerceptionSense::See)
        .HandleOriginOwnership(EOwnershipRelationFlags::Other)
        .TickRate(5.0f);
}

mixin FPerceptionHandler& OnSomeoneHeardLockpickingOwnedInteractable(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedOtherWithTag(GameplayTag::State_PickLock)
        .ViaSense(EPerceptionSense::Hear)
        .HandleOriginOwnership(EOwnershipRelationFlags::Other);
}

mixin FPerceptionHandler& OnStartedUsingOwnedInteractable(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedSelfWithTag(GameplayTag::State_Interact)
        .HandleOriginOwnership(EOwnershipRelationFlags::Other)
        .RequireInteractiveObject(true);
}

mixin FPerceptionHandler& OnSomeoneSeenUsingOwnedInteractable(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedOtherWithTag(GameplayTag::State_Interact_Ongoing)
        .ViaSense(EPerceptionSense::See)
        .HandleOriginOwnership(EOwnershipRelationFlags::Other)
        .RequireInteractiveObject(true);
}


mixin FPerceptionHandler& OnSomeoneHeardUsingOwnedInteractable(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedOtherWithTag(GameplayTag::State_Interact_Ongoing)
        .ViaSense(EPerceptionSense::Hear)
        .RequireInteractiveObject(true)
        .HandleOriginOwnership(EOwnershipRelationFlags::Other);
}

/** Triggers when a character is first seen, is seen changing areas or remains within an area and perceived for the tick duration */
mixin FPerceptionHandler& OnCharacterSeenInArea(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .TickRate(8.0f)
        .ShouldUpdateOnChangeOriginTags(GameplayTag::Character_Area_Changed)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .UpdateOnChangeSensingTags(GameplayTag::AIState_Conflict_InvestigateSuspiciousSound)
        .UpdateOnChangeSensingTags(GameplayTag::AIState_Wait_DefeatedIntruder);
}

mixin FPerceptionHandler& AwarenessOfLivingPredator(UCharacterPerceptionComponent Perception)
{
    return Perception
        .AddPerceptionHandler()
		.ExcludeOriginActor(Perception.OwnerCharacter)
        .WithHostility(ERelationshipHostility::Prey)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .NotOnCharactersWith(GameplayTag::State_Perceptions_GetIgnored)
        .WithAwareness(100.0f)
        .ExitWithAwareness(20.0f)
        .AddDebugInfo("AwarenessOfLivingPredator");
}

mixin FPerceptionHandler& AwarenessOfLivingHostileCharacter(UCharacterPerceptionComponent Perception)
{
    return Perception
        .AddPerceptionHandler()
		.ExcludeOriginActor(Perception.OwnerCharacter)
        .WithRelationship(ERelationship::Hostile)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .NotOnCharactersWith(GameplayTag::State_Perceptions_GetIgnored)
        .WithAwareness(100.0f)
        .ExitWithAwareness(20.0f)
        .AddDebugInfo("AwarenessOfLivingHostileCharacter");
}

mixin FPerceptionHandler& AwarenessOfLivingEnemyCharacter(UCharacterPerceptionComponent Perception)
{
    return Perception
        .AddPerceptionHandler()
		.ExcludeOriginActor(Perception.OwnerCharacter)
        .WithRelationship(ERelationship::Enemy)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .NotOnCharactersWith(GameplayTag::State_Perceptions_GetIgnored)
        .WithAwareness(100.0f)
        .ExitWithAwareness(20.0f)
        .AddDebugInfo("AwarenessOfLivingEnemyCharacter");
}

mixin FPerceptionHandler& AwarenessOfLivingFriendlyCharacter(UCharacterPerceptionComponent Perception)
{
    return Perception
        .AddPerceptionHandler()
		.ExcludeOriginActor(Perception.OwnerCharacter)
        .WithRelationship(ERelationship::Friend)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .WithAwareness(100.0f)
        .ExitWithAwareness(20.0f)
        .AddDebugInfo("AwarenessOfLivingFriendlyCharacter");
}

mixin FPerceptionHandler& AwarenessOfLivingOrDefeatedPredator(UCharacterPerceptionComponent Perception)
{
    return Perception
        .AddPerceptionHandler()
		.ExcludeOriginActor(Perception.OwnerCharacter)
        .WithHostility(ERelationshipHostility::Prey)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Perceptions_GetIgnored)
        .WithAwareness(100.0f)
        .ExitWithAwareness(1.0f)
		.AddDebugInfo("AwarenessOfLivingOrDefeatedPredator");
}

mixin FPerceptionHandler& AwarenessOfLivingOrDefeatedHostileCharacter(UCharacterPerceptionComponent Perception)
{
    return Perception
        .AddPerceptionHandler()
		.ExcludeOriginActor(Perception.OwnerCharacter)
        .WithRelationship(ERelationship::Hostile)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Perceptions_GetIgnored)
        .WithAwareness(100.0f)
        .ExitWithAwareness(20.0f)
		.AddDebugInfo("AwarenessOfLivingOrDefeatedHostileCharacter");
}

mixin FPerceptionHandler& AwarenessOfLivingOrDefeatedEnemyCharacter(UCharacterPerceptionComponent Perception)
{
    return Perception
        .AddPerceptionHandler()
		.ExcludeOriginActor(Perception.OwnerCharacter)
        .WithRelationship(ERelationship::Enemy)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Perceptions_GetIgnored)
        .WithAwareness(100.0f)
        .ExitWithAwareness(20.0f)
		.AddDebugInfo("AwarenessOfLivingOrDefeatedEnemyCharacter");
}

mixin FPerceptionHandler& AwarenessOfLivingOrDefeatedFriendlyCharacter(UCharacterPerceptionComponent Perception)
{
    return Perception
        .AddPerceptionHandler()
		.ExcludeOriginActor(Perception.OwnerCharacter)
        .WithRelationship(ERelationship::Friend)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .WithAwareness(100.0f)
        .ExitWithAwareness(20.0f)
		.AddDebugInfo("AwarenessOfLivingOrDefeatedFriendlyCharacter");
}

mixin FPerceptionHandler& JustHeardCharacterInFightingState(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedOtherWithTag(GameplayTag::State_Group_Conflict)
        .NotOnSensingCharactersInvolvedInFight()
        .OnCharactersWith(GameplayTag::AIState_Conflict)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_Warning)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_WatchFight)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_WatchHostile)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_InvestigateCombatSound)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_InvestigateAlarm)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_InvestigateIdentifiedSound)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_InvestigatePickpocket)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_InvestigatePouch)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_InvestigateSuspiciousSound)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_Defeated)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_CombatEndActions)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_ChaseAndLookForHidingCharacter)
        .NotOnCharactersWith(GameplayTag::AIState_AssessGoToDailyRoutine)
        .ViaSense(EPerceptionSense::Hear)
        .WithAwareness(0.1f)
        .IgnoreWithSenseAwareness(EPerceptionSense::See, 90.0f)
        .Delay(0.1f);
}

mixin FPerceptionHandler& JustHeardCharacterInWarningState(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedOtherWithTag(GameplayTag::State_Group_Conflict)
        .NotOnSensingCharactersInvolvedInFight()
        .OnCharactersWith(GameplayTag::AIState_Conflict_Warning)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_Warning_BlockedPath)
        .ViaSense(EPerceptionSense::Hear)
        .WithAwareness(0.1f)
        .IgnoreWithSenseAwareness(EPerceptionSense::See, 90.0f)
        .Delay(0.1f);
}

mixin FPerceptionHandler& JustHeardCharacterInWatchFightState(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedOtherWithTag(GameplayTag::State_Group_Conflict)
        .NotOnSensingCharactersInvolvedInFight()
        .OnCharactersWith(GameplayTag::AIState_Conflict_WatchFight)
        .ViaSense(EPerceptionSense::Hear)
        .WithAwareness(0.1f)
        .IgnoreWithSenseAwareness(EPerceptionSense::See, 90.0f)
        .Delay(0.1f);
}

mixin FPerceptionHandler& JustHeardCharacterInWatchHostileState(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedOtherWithTag(GameplayTag::State_Group_Conflict)
        .NotOnSensingCharactersInvolvedInFight()
        .OnCharactersWith(GameplayTag::AIState_Conflict_WatchHostile)
        .ViaSense(EPerceptionSense::Hear)
        .WithAwareness(0.1f)
        .IgnoreWithSenseAwareness(EPerceptionSense::See, 90.0f)
        .Delay(0.1f);
}

mixin FPerceptionHandler& JustSeenCharacterInFightingState_NonCreature(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedOtherWithTag(GameplayTag::State_Group_Conflict)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_Warning)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_WatchFight)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_WatchHostile)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_InvestigateCombatSound)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_InvestigateAlarm)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_InvestigateIdentifiedSound)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_InvestigatePickpocket)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_InvestigatePouch)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_InvestigateSuspiciousSound)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_ChaseAndLookForHidingCharacter)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_GoGetGuard)
        .OnCharactersWith(GameplayTag::AIState_Conflict_Combat)
        .NotOnCharactersWith(GameplayTag::Species_Creature)
        .ViaSense(EPerceptionSense::See)
        .WithAwareness(99.0f)
        .Delay(0.1f);
}

mixin FPerceptionHandler& JustSeenCharacterInFightingState_Creature(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedOtherWithTag(GameplayTag::State_Group_Conflict)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_Warning)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_WatchFight)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_WatchHostile)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_InvestigateCombatSound)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_InvestigateAlarm)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_InvestigateIdentifiedSound)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_InvestigatePickpocket)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_InvestigatePouch)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_InvestigateSuspiciousSound)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_ChaseAndLookForHidingCharacter)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_GoGetGuard)
        .OnCharactersWith(GameplayTag::State_Combat)
        .OnCharactersWith(GameplayTag::Species_Creature)
        .ViaSense(EPerceptionSense::See)
        .WithAwareness(99.0f)
        .Delay(0.1f);
}

mixin FPerceptionHandler& JustSeenCharacterInWarningState_NonCreature(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedOtherWithTag(GameplayTag::State_Group_Conflict)
        .OnCharactersWith(GameplayTag::AIState_Conflict_Warning)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_Warning_BlockedPath)
        .NotOnCharactersWith(GameplayTag::Species_Creature)
        .ViaSense(EPerceptionSense::See)
        .WithAwareness(99.0f)
        .Delay(0.1f);
}

mixin FPerceptionHandler& JustSeenCharacterInWarningState_Creature(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedOtherWithTag(GameplayTag::State_Group_Conflict)
        .OnCharactersWith(GameplayTag::AIState_Conflict_Warning)
        .NotOnCharactersWith(GameplayTag::AIState_Conflict_Warning_BlockedPath)
        .OnCharactersWith(GameplayTag::State_Combat)
        .OnCharactersWith(GameplayTag::Species_Creature)
        .ViaSense(EPerceptionSense::See)
        .WithAwareness(99.0f)
        .Delay(0.1f);
}

mixin FPerceptionHandler& JustSeenCharacterInWatchFightState(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedOtherWithTag(GameplayTag::State_Group_Conflict)
        .OnCharactersWith(GameplayTag::AIState_Conflict_WatchFight)
        .ViaSense(EPerceptionSense::See)
        .WithAwareness(99.0f)
        .Delay(0.1f);
}

mixin FPerceptionHandler& JustSeenCharacterInWatchHostileState(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedOtherWithTag(GameplayTag::State_Group_Conflict)
        .OnCharactersWith(GameplayTag::AIState_Conflict_WatchHostile)
        .ViaSense(EPerceptionSense::See)
        .WithAwareness(99.0f)
        .Delay(0.1f);
}

mixin FPerceptionHandler& OnHeardItem(UCharacterPerceptionComponent Perception)
{
    return Perception.AddPerceptionHandler()
        .ViaSense(EPerceptionSense::Hear)
        .WithAwareness(99.0f)
        .RequiredItemType(GameplayTag::Item)
        .IgnoreItemsOfType(GameplayTag::Item_Ambient);
}

mixin FPerceptionHandler& OnHeardShinyItem(UCharacterPerceptionComponent Perception)
{
    return Perception.OnHeardItem()
        .HandleItemsWithSpec(GameplayTag::Item_Property_Shiny);
}

mixin FPerceptionHandler& OnHeardBoozeItem(UCharacterPerceptionComponent Perception)
{
    return Perception.OnHeardItem()
        .RequiredItemType(GameplayTag::Item_Potion)
        .HandleItemsWithEffect(GameplayTag::GE_Param_Alcohol, 0.0f);
}

mixin FPerceptionHandler& OnHeardDrugItem(UCharacterPerceptionComponent Perception)
{
    return Perception.OnHeardItem()
        .RequiredItemType(GameplayTag::Item_Drug);
}

mixin FPerceptionHandler& OnHeardFoodItem(UCharacterPerceptionComponent Perception)
{
    return Perception.OnHeardItem()
        .RequiredItemType(GameplayTag::Item_Food);
}

mixin FPerceptionHandler& OnHeardItemInGuildOwnedArea(UCharacterPerceptionComponent Perception)
{
    return Perception.OnHeardItem()
        .HandlePerceptionInSensorGuildArea(true)
        .AddDebugInfo("HeardItemInGuildArea");
}

mixin FPerceptionHandler& OnHeardItemInPersonallyOwnedArea(UCharacterPerceptionComponent Perception)
{
    return Perception.OnHeardItem()
        .HandlePerceptionInSensorPersonalArea(true)
        .AddDebugInfo("HeardItemInPersonalArea");
}

// Smelled item
mixin FPerceptionHandler& OnSmelledFoodItem(UCharacterPerceptionComponent Perception)
{
    return Perception.AddPerceptionHandler()
        .ViaSense(EPerceptionSense::Smell)
        .WithAwareness(99.0f)
        .RequiredItemType(GameplayTag::Item_Food);
}

mixin FPerceptionHandler& OnSeenItem(UCharacterPerceptionComponent Perception)
{
    return Perception.AddPerceptionHandler()
        .ViaSense(EPerceptionSense::See)
        .WithAwareness(99.0f)
        .RequiredItemType(GameplayTag::Item)
        // .WithinRange(200.0f)
        .ExcludeOriginActor(Perception.OwnerCharacter);
}

mixin FPerceptionHandler& OnSeenFoodItem(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSeenItem()
        .RequiredItemType(GameplayTag::Item_Food);
}

mixin FPerceptionHandler& OnSeenValuableItem(UCharacterPerceptionComponent Perception, float ValueThreshhold)
{
    return Perception.OnSeenItem()
        .IgnoreItemsOfType(GameplayTag::Item_Ore)
        .IgnoreItemsOfType(GameplayTag::Item_Drug)
        .IgnoreItemsOfType(GameplayTag::Item_Potion)
        .HandleItemsWithValue(ValueThreshhold);
}

mixin FPerceptionHandler& OnSeenOreItem(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSeenItem()
        .RequiredItemType(GameplayTag::Item_Ore);
}

mixin FPerceptionHandler& OnSeenShinyItem(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSeenItem()
        .HandleItemsWithSpec(GameplayTag::Item_Property_Shiny);
}

mixin FPerceptionHandler& OnSeenHealingPotionItem(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSeenItem()
        .RequiredItemType(GameplayTag::Item_Potion)
        .HandleItemsWithEffect(GameplayTag::GE_Param_Heal, 4.0f);
}

mixin FPerceptionHandler& OnSeenManaPotionItem(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSeenItem()
        .RequiredItemType(GameplayTag::Item_Potion)
        .HandleItemsWithEffect(GameplayTag::GE_Param_Mana, 4.0f);
}

mixin FPerceptionHandler& OnSeenBoozeItem(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSeenItem()
        .RequiredItemType(GameplayTag::Item_Potion)
        .HandleItemsWithEffect(GameplayTag::GE_Param_Alcohol, 1.0f);
}

mixin FPerceptionHandler& OnSeenDrugItem(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSeenItem()
        .RequiredItemType(GameplayTag::Item_Drug);
}

mixin FPerceptionHandler& HeardPreachingCharacter(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::Hear)
        .IgnoreRelationship(ERelationship::Enemy)
        .OnCharactersWith(GameplayTag::Action_Ambient_Preach)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .Delay(2.0f);
}

mixin FPerceptionHandler& SeenPreachingCharacter(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .TickRate(5.0f)
        .IgnoreRelationship(ERelationship::Enemy)
        .OnCharactersWith(GameplayTag::Action_Ambient_Preach)        
        .OnCharactersWith(GameplayTag::Sound_Voice_Conversation_DailyRoutine_SwampPropaganda)
        .NotOnCharactersWith(GameplayTag::State_Dead)
        .NotOnCharactersWith(GameplayTag::State_Defeated)
        .WithinRange(300.0f)
        .SetCooldownOnPerceptionGained(300.0f)
        .Delay(3.0f);
}

mixin FPerceptionHandler& SeenPotentiallyCreepingCharacter(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .ViaSense(EPerceptionSense::See)
        .IgnoreRelationship(ERelationship::Enemy)
        .IgnoreRelationship(ERelationship::Hostile)
        .OnCharactersWith(GameplayTag::State_Movement_Crouching)
        .HandlePerceptionInSensorArea(false)
        .WithinRange(750.0f)
        .SetCooldownOnPerceptionGained(1.0f);
}

mixin FPerceptionHandler& SeenNPCWithinCheeringDistance(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .WithinRange(300.0f)
        .SetCooldownOnPerceptionGained(5.0f)
        .ViaSense(EPerceptionSense::See)
        .NotOnCharactersWith(GameplayTag::Character_Player);
}

mixin FPerceptionHandler& SeenNeutralPlayerWithinCheeringDistance(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .WithinRange(250.0f)
        .SetCooldownOnPerceptionGained(300.0f)
        .ViaSense(EPerceptionSense::See)
        .OnCharactersWith(GameplayTag::Character_Player)
        .NotOnCharactersWith(GameplayTag::Species_Creature)
        .WithRelationship(ERelationship::Neutral);
}

mixin FPerceptionHandler& SeenFriendlyPlayerWithinCheeringDistance(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .WithinRange(250.0f)
        .SetCooldownOnPerceptionGained(300.0f)
        .ViaSense(EPerceptionSense::See)
        .OnCharactersWith(GameplayTag::Character_Player)
        .NotOnCharactersWith(GameplayTag::Species_Creature)
        .WithRelationship(ERelationship::Friend);
}

mixin FPerceptionHandler& SeenProtectingPlayerWithinCheeringDistance(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .WithinRange(250.0f)
        .SetCooldownOnPerceptionGained(300.0f)
        .ViaSense(EPerceptionSense::See)
        .OnCharactersWith(GameplayTag::Character_Player)
        .NotOnCharactersWith(GameplayTag::Species_Creature)
        .WithHostilityFromOrigin(ERelationshipHostility::ProtectFromDifferentGuild);
}

mixin FPerceptionHandler& SeenProtectedPlayerWithinCheeringDistance_Basic(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .WithinRange(250.0f)
        .SetCooldownOnPerceptionGained(300.0f)
        .ViaSense(EPerceptionSense::See)
        .OnCharactersWith(GameplayTag::Character_Player)
        .NotOnCharactersWith(GameplayTag::Species_Creature)
        .WithHostility(ERelationshipHostility::ProtectFromDifferentGuild);
}

mixin FPerceptionHandler& SeenProtectedPlayerWithinCheeringDistance_FromNonFriendly(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .WithinRange(250.0f)
        .SetCooldownOnPerceptionGained(300.0f)
        .ViaSense(EPerceptionSense::See)
        .OnCharactersWith(GameplayTag::Character_Player)
        .NotOnCharactersWith(GameplayTag::Species_Creature)
        .WithHostility(ERelationshipHostility::ProtectFromNonFriendly);
}

mixin FPerceptionHandler& SeenProtectedPlayerWithinCheeringDistance_Premium(UCharacterPerceptionComponent Perception)
{
    return Perception
        .OnSensedOther()
        .WithinRange(250.0f)
        .SetCooldownOnPerceptionGained(300.0f)
        .ViaSense(EPerceptionSense::See)
        .OnCharactersWith(GameplayTag::Character_Player)
        .NotOnCharactersWith(GameplayTag::Species_Creature)
        .WithHostility(ERelationshipHostility::ProtectFromDifferentGuild_Premium);
}

mixin FPerceptionHandler& SeenMeatbugWithinRange(UCharacterPerceptionComponent Perception, float Range)
{
    return Perception
        .OnSensedOther()
        .OnCharactersWith(GameplayTag::Species_Creature_Meatbug)
        .ViaSense(EPerceptionSense::See)
        .WithinRange(Range);
}

mixin FPerceptionHandler& SensedWeaponLootedBySelf(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Character_Looted_Body_Weapon);
}

mixin FPerceptionHandler& SensedOreLootedBySelf(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Character_Looted_Body_Ore);
}

mixin FPerceptionHandler& SelfChangedArea(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Character_Area_Leave);
}

mixin FPerceptionHandler& SelfChangedAreaWithWeaponInHand(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Character_Area_Enter)
        .OnCharactersWith(GameplayTag::State_ItemInHand);
}

mixin FPerceptionHandler& SelfDrawnWeapon(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedEventOnSelf(GameplayTag::Perception_Character_Weapon_Drawn);
}

mixin FPerceptionHandler& SelfMakingDirectThreatAtOther(UCharacterPerceptionComponent Perception)
{
    return Perception.OnSensedOther().HandleSensorLookingAtSomeOne(true)
        .ViaSense(EPerceptionSense::See)
        .OnSensingCharactersWith(GameplayTag::State_Combat)
        .NotOnSensingCharactersWith(GameplayTag::State_Dead)
        .NotOnSensingCharactersWith(GameplayTag::State_Defeated);
}

mixin FPerceptionHandler& SelfMakingDirectThreatAtOther_MeleeWeapon(UCharacterPerceptionComponent Perception)
{
    return Perception.SelfMakingDirectThreatAtOther()
        .OnSensingCharactersWith(GameplayTag::State_Combat_Melee)
        .OnSensingCharactersWith(GameplayTag::State_ItemDraw)
        .OnSensingCharactersWith(GameplayTag::State_ItemInHand)
        .NotOnSensingCharactersWith(GameplayTag::State_Combat_Melee_Fist);
}

mixin FPerceptionHandler& SelfMakingDirectThreatAtOther_Fists(UCharacterPerceptionComponent Perception)
{
    return Perception.SelfMakingDirectThreatAtOther()
        .OnSensingCharactersWith(GameplayTag::State_Combat_Melee_Fist)
        .OnSensingCharactersWith(GameplayTag::State_ItemDraw)
        .OnSensingCharactersWith(GameplayTag::State_ItemInHand);
}

mixin FPerceptionHandler& SelfMakingDirectThreatAtOther_RangedWeapon(UCharacterPerceptionComponent Perception)
{
    return Perception.SelfMakingDirectThreatAtOther()
        .OnSensingCharactersWith(GameplayTag::State_Combat_Archery)
        .OnSensingCharactersWith(GameplayTag::State_ItemDraw)
        .OnSensingCharactersWith(GameplayTag::State_ItemInHand);
}

mixin FPerceptionHandler& SelfMakingDirectThreatAtOther_HighThreatMagic(UCharacterPerceptionComponent Perception)
{
    return Perception.SelfMakingDirectThreatAtOther()
        .OnSensingCharactersWith(GameplayTag::State_Combat_Magic)
        .OnSensingCharactersWith(GameplayTag::State_ItemDraw)
        .OnSensingCharactersWith(GameplayTag::State_ItemInHand)
        .NotOnSensingCharactersWith(GameplayTag::Item_Property_NoThreat)
        .NotOnSensingCharactersWith(GameplayTag::Item_Property_LowThreat);
}

mixin FPerceptionHandler& SelfMakingDirectThreatAtOther_LowThreatMagic(UCharacterPerceptionComponent Perception)
{
    return Perception.SelfMakingDirectThreatAtOther()
        .OnSensingCharactersWith(GameplayTag::State_Combat_Magic)
        .OnSensingCharactersWith(GameplayTag::State_ItemDraw)
        .OnSensingCharactersWith(GameplayTag::State_ItemInHand)
        .OnSensingCharactersWith(GameplayTag::Item_Property_LowThreat);
}