namespace Assessed
{
    const FAssessmentBits IsTheft_ShouwldGiveAShit = IsCrimeSeverityLow | IsCrimeSeverityMedium | IsCrimeSeverityHigh | IsCrimeSeverityCritical;

    namespace Evaluate
    {
        /// CRIME SEVERITY
        UFUNCTION(meta=(AssessmentCondition))
        bool IsCrimeSeverityNone(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!EventTag.MatchesTag(GameplayTag::Crime) && !EventTag.MatchesTag(GameplayTag::AIEvent_Seen_PastCrimeInstigator))
                return false;
            if (!ensure(IsValid(AI)))
                return false;
            return Perception.Magnitude <= 0.0f;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool IsCrimeSeverityMinimal(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!EventTag.MatchesTag(GameplayTag::Crime) && !EventTag.MatchesTag(GameplayTag::AIEvent_Seen_PastCrimeInstigator))
                return false;

            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::IsCrimeSeverityMinimal ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(AI.CrimeProcessingSubsystemClass) && IsValid(AI.CrimeProcessingSubsystem)))
            {
                PrintError(f"{EventTag}::IsCrimeSeverityMinimal ran with nullptr CrimeProcessingModule");
                return false;
            }

            return AI.CrimeProcessingSubsystem.IsCrimeSeverityWithinThreshold(Perception.Magnitude, ECrimeSeverityLevel::Minimal);
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool IsCrimeSeverityLow(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!EventTag.MatchesTag(GameplayTag::Crime) && !EventTag.MatchesTag(GameplayTag::AIEvent_Seen_PastCrimeInstigator))
                return false;

            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::IsCrimeSeverityLow ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(AI.CrimeProcessingSubsystemClass) && IsValid(AI.CrimeProcessingSubsystem)))
            {
                PrintError(f"{EventTag}::IsCrimeSeverityLow ran with nullptr CrimeProcessingModule");
                return false;
            }

            return AI.CrimeProcessingSubsystem.IsCrimeSeverityWithinThreshold(Perception.Magnitude, ECrimeSeverityLevel::Low);
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool IsCrimeSeverityMedium(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!EventTag.MatchesTag(GameplayTag::Crime) && !EventTag.MatchesTag(GameplayTag::AIEvent_Seen_PastCrimeInstigator))
                return false;
            
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::IsCrimeSeverityMedium ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(AI.CrimeProcessingSubsystemClass) && IsValid(AI.CrimeProcessingSubsystem)))
            {
                PrintError(f"{EventTag}::IsCrimeSeverityMedium ran with nullptr CrimeProcessingModule");
                return false;
            }

            return AI.CrimeProcessingSubsystem.IsCrimeSeverityWithinThreshold(Perception.Magnitude, ECrimeSeverityLevel::Medium);
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool IsCrimeSeverityHigh(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!EventTag.MatchesTag(GameplayTag::Crime) && !EventTag.MatchesTag(GameplayTag::AIEvent_Seen_PastCrimeInstigator))
                return false;
            
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::IsCrimeSeverityHigh ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(AI.CrimeProcessingSubsystemClass) && IsValid(AI.CrimeProcessingSubsystem)))
            {
                PrintError(f"{EventTag}::IsCrimeSeverityHigh ran with nullptr CrimeProcessingModule");
                return false;
            }

            return AI.CrimeProcessingSubsystem.IsCrimeSeverityWithinThreshold(Perception.Magnitude, ECrimeSeverityLevel::High);
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool IsCrimeSeverityCritical(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!EventTag.MatchesTag(GameplayTag::Crime) && !EventTag.MatchesTag(GameplayTag::AIEvent_Seen_PastCrimeInstigator))
                return false;
            
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::IsCrimeSeverityCritical ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(AI.CrimeProcessingSubsystemClass) && IsValid(AI.CrimeProcessingSubsystem)))
            {
                PrintError(f"{EventTag}::IsCrimeSeverityCritical ran with nullptr CrimeProcessingModule");
                return false;
            }

            return AI.CrimeProcessingSubsystem.IsCrimeSeverityWithinThreshold(Perception.Magnitude, ECrimeSeverityLevel::Critical);
        }

        /// MEMORY
        UFUNCTION(meta=(AssessmentCondition))
        bool AffectedWasCombatForgivenBefore(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::AffectedWasCombatForgivenBefore ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(AI.CharacterState)))
            {
                PrintError(f"{EventTag}::AffectedWasCombatForgivenBefore ran with nullptr AI.CharacterState");
                return false;
            }

            if (!ensure(IsValid(AI.CharacterState.LongTermMemory)))
            {
                PrintError(f"{EventTag}::AffectedWasCombatForgivenBefore ran with nullptr LongTermMemory");
                return false;
            }

            if (!ensure(IsValid(Perception.Affected.CharacterState)))
            {
                PrintError(f"{EventTag}::AffectedWasCombatForgivenBefore ran with nullptr Affected.CharacterState");
                return false;
            }

            if (AI.CharacterState.LongTermMemory
                    .FilterEventsAffecting(Perception.Affected.CharacterState.CharacterGlobalId, GameplayTag::Memory_Combat_Forgive)
                    .CausedBy(AI.CharacterState.CharacterGlobalId)
                    .Count > 0)
                return true;

            return false;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool SensedWasCombatForgivenBefore(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::SensedWasCombatForgivenBefore ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(AI.CharacterState)))
            {
                PrintError(f"{EventTag}::SensedWasCombatForgivenBefore ran with nullptr AI.CharacterState");
                return false;
            }

            if (!ensure(IsValid(Perception.Origin.CharacterState)))
            {
                PrintError(f"{EventTag}::SensedWasCombatForgivenBefore ran with nullptr Origin.CharacterState");
                return false;
            }

            if (AI.CharacterState.LongTermMemory
                    .FilterEventsAffecting(Perception.Origin.CharacterState.CharacterGlobalId, GameplayTag::Memory_Combat_Forgive)
                    .CausedBy(AI.CharacterState.CharacterGlobalId)
                    .Count > 0)
                return true;

            return false;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool InstigatorWasCombatForgivenBefore(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::InstigatorWasCombatForgivenBefore ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(AI.CharacterState)))
            {
                PrintError(f"{EventTag}::InstigatorWasCombatForgivenBefore ran with nullptr AI.CharacterState");
                return false;
            }

            if (!ensure(IsValid(Perception.Instigator.CharacterState)))
            {
                PrintError(f"{EventTag}::InstigatorWasCombatForgivenBefore ran with nullptr Instigator.CharacterState");
                return false;
            }

            if (AI.CharacterState.LongTermMemory
                    .FilterEventsAffecting(Perception.Instigator.CharacterState.CharacterGlobalId, GameplayTag::Memory_Combat_Forgive)
                    .CausedBy(AI.CharacterState.CharacterGlobalId)
                    .Count > 0)
                return true;

            return false;
        }
        ///////////

        /// PLAYER
        UFUNCTION(meta=(AssessmentCondition))
        bool SensedIsPlayer(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(Perception.Origin.CharacterState)))
            {
                PrintError(f"{EventTag}::SensedIsPlayer ran with nullptr Origin.CharacterState");
                return false;
            }

            if (!Perception.Origin.CharacterState.IsPlayerControlled() && !Perception.Origin.CharacterState.IsPlayerCharacter())
                return false;

            return true;
        }

        /// WEAPON
        UFUNCTION(meta=(AssessmentCondition))
        bool HasSensedDrawnThreateningWeapon(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(Perception.Origin.Character)))
            {
                PrintError(f"{EventTag}::HasSensedDrawnThreateningWeapon ran with nullptr Origin.Character");
                return false;
            }

            if (!Perception.Origin.Character.CarryComponent.IsEquippedWeaponAThreat())
                return false;

            return true;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool IsSensedDrawingOrUndrawingWeapon(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(Perception.Origin.Character)))
            {
                PrintError(f"{EventTag}::IsSensedDrawingOrUndrawingWeapon ran with nullptr Origin.Character");
                return false;
            }

            if (!Perception.Origin.Character.IsDrawingOrUndrawingWeapon())
                return false;

            return true;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool SensedIsWithWeapon(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(Perception.Origin.Character)))
            {
                PrintError(f"{EventTag}::SensedIsWithWeapon ran with nullptr Origin.Character");
                return false;
            }

            if (!Perception.Origin.Character.HasDrawnWeapon())
                return false;

            if (!Perception.Origin.Character.IsInCombat())
                return false;

            if (Perception.Origin.Character.IsInCombatWithFists())
                return false;

            return true;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool AllHostileWeaponsAreFists(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::AllHostileWeaponsAreFists ran with nullptr AI");
                return false;
            }

            bool bAnyInCombat = false;
            for (auto Character : AI.GetSensedLivingHostiles())
            {
                if (!IsValid(Character))
                    continue;

                if (!Character.IsInCombat())
                    continue;

                bAnyInCombat = true;

                if (!Character.IsInCombatWithFists())
                    return false;
            }

            return bAnyInCombat;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool AtLeastOneHostileHasDrawnNonFistWeapon(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::AtLeastOneHostileHasDrawnNonFistWeapon ran with nullptr AI");
                return false;
            }

            for (auto Character : AI.GetSensedLivingHostiles())
            {
                if (!IsValid(Character))
                    continue;

                if (!Character.IsInCombat())
                    continue;

                if (!Character.IsInCombatWithFists())
                    return true;
            }

            return false;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool SensedIsWithFists(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(Perception.Origin.Character)))
            {
                PrintError(f"{EventTag}::SensedIsWithFists ran with nullptr Origin.Character");
                return false;
            }

            if (!Perception.Origin.Character.IsInCombatWithFists())
                return false;

            return true;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool InstigatorIsWithWeapon(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(Perception.Instigator.Character)))
            {
                PrintError(f"{EventTag}::InstigatorIsWithWeapon ran with nullptr Instigator.Character");
                return false;
            }

            if (!Perception.Instigator.Character.HasDrawnWeapon())
                return false;

            if (!Perception.Instigator.Character.IsInCombat())
                return false;

            if (Perception.Instigator.Character.IsInCombatWithFists())
                return false;

            return true;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool InstigatorIsWithFists(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(Perception.Instigator.Character)))
            {
                PrintError(f"{EventTag}::InstigatorIsWithFists ran with nullptr Instigator.Character");
                return false;
            }

            if (!Perception.Instigator.Character.IsInCombatWithFists())
                return false;

            return true;
        }
        /////////

        /// EVENT CHARACTER RELATIONSHIP
        UFUNCTION(meta=(AssessmentCondition))
        bool SensedIsFriendly(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(Perception.Origin.CharacterState)))
            {
                PrintError(f"{EventTag}::SensedIsFriendly ran with nullptr Origin.CharacterState");
                return false;
            }

            return Perception.Origin.Relationship == ERelationship::Friend || Perception.Origin.Hostility == ERelationshipHostility::Help;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool SensedWasEnemy(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(Perception.Origin.CharacterState)))
            {
                PrintError(f"{EventTag}::SensedWasEnemy ran with nullptr Origin.CharacterState");
                return false;
            }

            return AI.CharacterState.IsEnemyTowards(Perception.Origin.CharacterState);
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool SensedWasHostile(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(Perception.Origin.CharacterState)))
            {
                PrintError(f"{EventTag}::SensedWasHostile ran with nullptr Origin.CharacterState");
                return false;
            }

            return Perception.Origin.Relationship == ERelationship::Hostile;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool InstigatorWasEnemy(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(Perception.Instigator.CharacterState)))
            {
                PrintError(f"{EventTag}::InstigatorWasEnemy ran with nullptr Instigator.CharacterState");
                return false;
            }

            return Perception.Instigator.Relationship == ERelationship::Enemy;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool InstigatorWasHostile(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(Perception.Instigator.CharacterState)))
            {
                PrintError(f"{EventTag}::InstigatorWasHostile ran with nullptr Instigator.CharacterState");
                return false;
            }

            if (Perception.Instigator.Character == nullptr)
                return false;

            return Perception.Instigator.Relationship == ERelationship::Hostile;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool InstigatorWasFriendly(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(Perception.Instigator.CharacterState)))
            {
                PrintError(f"{EventTag}::InstigatorWasFriendly ran with nullptr Instigator.CharacterState");
                return false;
            }

            if (IsValid(AI) && IsValid(Perception.Affected.CharacterState) && AI.CharacterState == Perception.Affected.CharacterState)
                return false;

            return Perception.Instigator.Relationship == ERelationship::Friend || Perception.Instigator.Hostility == ERelationshipHostility::Help;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool AffectedWasEnemy(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(Perception.Affected.CharacterState)))
            {
                PrintError(f"{EventTag}::AffectedWasEnemy ran with nullptr Affected.CharacterState");
                return false;
            }

            return Perception.Affected.Relationship == ERelationship::Enemy;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool AffectedWasFriendly(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(Perception.Affected.CharacterState)))
            {
                PrintError(f"{EventTag}::AffectedWasFriendly ran with nullptr Affected.CharacterState");
                return false;
            }

            return Perception.Affected.Relationship == ERelationship::Friend || Perception.Affected.Hostility == ERelationshipHostility::Help;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool AffectedIsProtected(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(Perception.Affected.CharacterState)))
            {
                PrintError(f"{EventTag}::AffectedIsProtected ran with nullptr Affected.CharacterState");
                return false;
            }

            if (Perception.Affected.Hostility == ERelationshipHostility::ProtectFromDifferentGuild_Premium)
                return true;

            if (Perception.Instigator.Hostility == ERelationshipHostility::ProtectFromDifferentGuild_Premium ||
                Perception.Instigator.CharacterState.HasAnyPremiumProtection())
                return false;

            if (Perception.Instigator.Relationship != ERelationship::Friend && 
                Perception.Affected.Hostility == ERelationshipHostility::ProtectFromNonFriendly)
                return true;
            
            if (Perception.Instigator.CharacterState.Character.IsCreature() && 
                Perception.Affected.Hostility == ERelationshipHostility::ProtectFromCreature)
                return true;
            
            if (Perception.Affected.Hostility == ERelationshipHostility::ProtectFromDifferentGuild_Jurisdiction)
                return true;

            if (Perception.Instigator.Hostility == ERelationshipHostility::ProtectFromDifferentGuild_Jurisdiction)
                return false;

            if (!Perception.Affected.CharacterState.Guild.MatchesTag(Perception.Instigator.CharacterState.Guild) &&
                Perception.Affected.Hostility == ERelationshipHostility::ProtectFromDifferentGuild)
                return true;            

            return false;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool SelfIsProtectedBySensed(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(Perception.Origin.CharacterState)))
            {
                PrintError(f"{EventTag}::SelfIsProtectedBySensed ran with nullptr Origin.CharacterState");
                return false;
            }

            return Perception.Origin.CharacterState.IsProtecting(AI.CharacterState);
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool SensedIsSelfSummoner(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(Perception.Origin.Character)))
            {
                PrintError(f"{EventTag}::SensedIsSelfSummoner ran with nullptr Origin.Character");
                return false;
            }

            return Perception.Origin.Character == AI.Self.Owner;
        }
        /////////

        /// EVENT CHARACTER HOSTILITY
        UFUNCTION(meta=(AssessmentCondition))
        bool SelfIsTrainingWithSensed(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(Perception.Origin.CharacterState)))
            {
                PrintError(f"{EventTag}::SelfIsTrainingWithSensed ran with nullptr Origin.CharacterState");
                return false;
            }

            return AI.CharacterState.IsInTrainingFightAgainst(Perception.Origin.CharacterState);
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool SelfIsTrainingWithAffected(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(Perception.Affected.CharacterState)))
            {
                PrintError(f"{EventTag}::SelfIsTrainingWithAffected ran with nullptr Affected.CharacterState");
                return false;
            }

            return AI.CharacterState.IsInTrainingFightAgainst(Perception.Affected.CharacterState);
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool SelfIsTrainingWithInstigator(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(Perception.Instigator.CharacterState)))
            {
                PrintError(f"{EventTag}::SelfIsTrainingWithInstigator ran with nullptr Instigator.CharacterState");
                return false;
            }

            return AI.CharacterState.IsInTrainingFightAgainst(Perception.Instigator.CharacterState);
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool AffectedIsTrainingWithInstigator(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(Perception.Affected.CharacterState)))
            {
                PrintError(f"{EventTag}::AffectedIsTrainingWithInstigator ran with nullptr Affected.CharacterState");
                return false;
            }

            if (!ensure(IsValid(Perception.Instigator.CharacterState)))
            {
                PrintError(f"{EventTag}::AffectedIsTrainingWithInstigator ran with nullptr Instigator.CharacterState");
                return false;
            }

            return Perception.Affected.CharacterState.IsInTrainingFightAgainst(Perception.Instigator.CharacterState) ||
                Perception.Instigator.CharacterState.IsInTrainingFightAgainst(Perception.Affected.CharacterState);
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool IsTrainingFight(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            TSet<AGothicCharacterState> EventCharacterStates;
            if (IsValid(Perception.Origin.CharacterState))
            {
                EventCharacterStates.Add(Perception.Origin.CharacterState);
            }

            if (IsValid(Perception.Affected.CharacterState))
            {
                if (Perception.Affected.CharacterState.IsDefeated())
                {
                    auto DefeatedMemories = Perception.Affected.CharacterState.LongTermMemory.Filter().WithTag(GameplayTag::Memory_Conflict_Defeated).ArrayOldestToNewest;

                    if (!DefeatedMemories.IsEmpty())
                    {
                        auto LastDefeatedMemory = DefeatedMemories.Last();
                        if (LastDefeatedMemory.EventTags.HasTag(GameplayTag::Memory_Conflict_Defeated_TrainingFight))
                            return true;
                    }
                }
                else if (Perception.Affected.CharacterState.IsDead())
                {
                    auto DefeatedMemories = Perception.Affected.CharacterState.LongTermMemory.Filter().WithTag(GameplayTag::Memory_Conflict_Defeated).ArrayOldestToNewest;

                    if (!DefeatedMemories.IsEmpty())
                    {
                        auto LastKilledMemory = DefeatedMemories.Last();
                        if (LastKilledMemory.EventTags.HasTag(GameplayTag::Memory_Conflict_Killed_TrainingFight))
                            return true;
                    }
                }
                EventCharacterStates.Add(Perception.Affected.CharacterState);
            }

            if (IsValid(Perception.Instigator.CharacterState))
            {
                EventCharacterStates.Add(Perception.Instigator.CharacterState);
            }

            if (IsValid(Perception.Target.CharacterState))
            {
                EventCharacterStates.Add(Perception.Target.CharacterState);
            }

            bool bAnyTraining = false;
            for (auto EventCharacterState : EventCharacterStates)
            {
                if (!EventCharacterState.IsInTrainingFight())
                    continue;

                bAnyTraining = true;
            }

            return bAnyTraining;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool IsPettyFight(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            TSet<AGothicCharacterState> EventCharacterStates;
            if (IsValid(Perception.Origin.CharacterState))
            {
                EventCharacterStates.Add(Perception.Origin.CharacterState);
            }

            if (IsValid(Perception.Affected.CharacterState))
            {
                if (Perception.Affected.CharacterState.IsDefeated())
                {
                    auto DefeatedMemories = Perception.Affected.CharacterState.LongTermMemory.Filter().WithTag(GameplayTag::Memory_Conflict_Defeated).ArrayOldestToNewest;

                    if (!DefeatedMemories.IsEmpty())
                    {
                        auto LastDefeatedMemory = DefeatedMemories.Last();
                        if (LastDefeatedMemory.EventTags.HasTag(GameplayTag::Memory_Conflict_Defeated_PettyFight))
                            return true;
                    }
                }
                else if (Perception.Affected.CharacterState.IsDead())
                {
                    auto DefeatedMemories = Perception.Affected.CharacterState.LongTermMemory.Filter().WithTag(GameplayTag::Memory_Conflict_Defeated).ArrayOldestToNewest;

                    if (!DefeatedMemories.IsEmpty())
                    {
                        auto LastKilledMemory = DefeatedMemories.Last();
                        if (LastKilledMemory.EventTags.HasTag(GameplayTag::Memory_Conflict_Killed_PettyFight))
                            return true;
                    }
                }
                EventCharacterStates.Add(Perception.Affected.CharacterState);
            }

            if (IsValid(Perception.Instigator.CharacterState))
            {
                EventCharacterStates.Add(Perception.Instigator.CharacterState);
            }

            if (IsValid(Perception.Target.CharacterState))
            {
                EventCharacterStates.Add(Perception.Target.CharacterState);
            }

            bool bAnyInPettyFight = false;
            for (auto EventCharacterState : EventCharacterStates)
            {
                if (EventCharacterState.IsPlayerControlled() || EventCharacterState.IsPlayerCharacter())
                    continue;

                if (!IsValid(EventCharacterState.Character))
                    continue;

                auto GothicAI = EventCharacterState.Character.GetGothicAI();
                if (!IsValid(GothicAI))
                    continue;

                auto State = Cast<UAIState_Conflict>(GothicAI.CurrentState);
                if (!IsValid(State))
                    continue;
                
                if (!IsValid(State.ConflictInstanceGroup))
                    return false;

                if (IsValid(State.ConflictInstanceGroup) && State.ConflictInstanceGroup.ConflictType != EConflictType::PettyFight)
                    return false;

                bAnyInPettyFight = true;
            }

            return bAnyInPettyFight;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool AwareOfInstigator(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::AwareOfInstigator ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(Perception.Instigator.Character)))
            {
                PrintError(f"{EventTag}::AwareOfInstigator ran with nullptr Instigator.Character");
                return false;
            }

            if (AI.Self.Perception.CanSee(Perception.Instigator.Character))
                return true;

            if (AI.Self.Perception.CanSmell(Perception.Instigator.Character))
                return true;

            return false;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool AwareOfTarget(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::AwareOfTarget ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(Perception.Target.Character)))
            {
                PrintError(f"{EventTag}::AwareOfTarget ran with nullptr Target.Character");
                return false;
            }

            if (AI.Self.Perception.CanSee(Perception.Target.Character))
                return true;

            if (AI.Self.Perception.CanSmell(Perception.Target.Character))
                return true;

            //if (AI.Self.Perception.Memory.Filter().FilterInstigatorCharacterIs(Perception.Target.Character).FilterViaSense(EPerceptionSense::See).)

            return false;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool AwareOfAffected(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::AwareOfAffected ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(Perception.Affected.Character)))
            {
                PrintError(f"{EventTag}::AwareOfAffected ran with nullptr Affected.Character");
                return false;
            }

            if (AI.Self.Perception.CanSee(Perception.Affected.Character))
                return true;

            if (AI.Self.Perception.CanSmell(Perception.Affected.Character))
                return true;

            return false;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool AwareOfSensed(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::AwareOfSensed ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(Perception.Origin.Character)))
            {
                PrintError(f"{EventTag}::AwareOfSensed ran with nullptr Origin.Character");
                return false;
            }

            if (AI.Self.Perception.CanSee(Perception.Origin.Character))
                return true;

            if (AI.Self.Perception.CanSmell(Perception.Origin.Character))
                return true;

            return false;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool SensedIsTrainingWithTheirTarget(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            // NAME DEPRECATED - USE AFFECTED INSTEAD OF SENSED'S TARGET
            if (!ensure(IsValid(Perception.Origin.CharacterState)))
            {
                PrintError(f"{EventTag}::SensedIsTrainingWithTheirTarget ran with nullptr Origin.Character");
                return false;
            }

            if (!ensure(IsValid(Perception.Affected.CharacterState)))
            {
                PrintError(f"{EventTag}::SensedIsTrainingWithTheirTarget ran with nullptr Affected.Character");
                return false;
            }

            return Perception.Origin.CharacterState.IsInTrainingFightAgainst(Perception.Affected.CharacterState) ||
                Perception.Affected.CharacterState.IsInTrainingFightAgainst(Perception.Origin.CharacterState);
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool SelfIsTrainingWithSensedsTarget(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            // NAME DEPRECATED - USE AFFECTED INSTEAD OF SENSED'S TARGET
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::SelfIsTrainingWithSensedsTarget ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(Perception.Origin.Character)))
            {
                PrintError(f"{EventTag}::SelfIsTrainingWithSensedsTarget ran with nullptr Origin.Character");
                return false;
            }

            if (!ensure(IsValid(Perception.Affected.CharacterState)))
            {
                PrintError(f"{EventTag}::SelfIsTrainingWithSensedsTarget ran with nullptr Affected.Character");
                return false;
            }

            return AI.CharacterState.IsInTrainingFightAgainst(Perception.Affected.CharacterState) ||
                Perception.Affected.CharacterState.IsInTrainingFightAgainst(AI.CharacterState);
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool SelfIsTrainingWithAllHostiles(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::SelfIsTrainingWithAllHostiles ran with nullptr AI");
                return false;
            }

            bool bAnyHostilesFound = false;
            for (auto Character : AI.GetSensedLivingHostiles())
            {
                if (!IsValid(Character))
                    continue;
                
                bAnyHostilesFound = true;
                if (!AI.CharacterState.IsInTrainingFightAgainst(Character.CharacterState) && !Character.CharacterState.IsInTrainingFightAgainst(AI.CharacterState))
                    return false;
            }

            return bAnyHostilesFound;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool SensedIsPredator(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::SensedIsPredator ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(Perception.Origin.CharacterState)))
            {
                PrintError(f"{EventTag}::SensedIsPredator ran with nullptr Origin.CharacterState");
                return false;
            }

            return AI.Self.CharacterState.Relationship.GetHostilityTowards(Perception.Origin.CharacterState) == ERelationshipHostility::Prey;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool SensedIsPrey(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::SensedIsPrey ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(Perception.Origin.CharacterState)))
            {
                PrintError(f"{EventTag}::SensedIsPrey ran with nullptr Origin.CharacterState");
                return false;
            }

            return AI.Self.CharacterState.Relationship.GetHostilityTowards(Perception.Origin.CharacterState) == ERelationshipHostility::Predator;
        }
        /////////

        /// NAVIGATION
        UFUNCTION(meta=(AssessmentCondition))
        bool SensedIsReachable(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::SensedIsReachable ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(Perception.Origin.Character)))
            {
                PrintError(f"{EventTag}::SensedIsReachable ran with nullptr Origin.Character");
                return false;
            }
            
            float ReachRangeZ = AI.Character.SimpleCollisionHalfHeight * 2 + Perception.Origin.Character.SimpleCollisionHalfHeight; 

            FVector Location;
            if (!UNavigationSystemV1::CanTargetBeReached3D(
                    AI.Character, 
                    Perception.Origin.Character, 
                    100.0f, 
                    ReachRangeZ, 
                    false, Location))
            {
                return false;
            }

            return true;
        }
        /////////

        /// EVENT CHARACTERS COMPARISON
        UFUNCTION(meta=(AssessmentCondition))
        bool AffectedIsSelf(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::AffectedIsSelf ran with nullptr AI");
                return false;
            }

            if (IsValid(Perception.Affected.CharacterState) && Perception.Affected.CharacterState == AI.CharacterState)
                return true;

            if (!EventTag.MatchesTag(GameplayTag::Crime) && !EventTag.MatchesTag(GameplayTag::AIEvent_Seen_PastCrimeInstigator) && !ensure(IsValid(Perception.Affected.CharacterState)))
            {
                PrintError(f"{EventTag}::AffectedIsSelf ran with nullptr Affected.CharacterState");
                return false;
            }

            if (!EventTag.MatchesTag(GameplayTag::Crime) && !EventTag.MatchesTag(GameplayTag::AIEvent_Seen_PastCrimeInstigator))
                return Perception.Affected.CharacterState == AI.CharacterState;

            
            if (Perception.AffectedCharacterUniqueNames.Contains(AI.CharacterState.CharacterGlobalId))
                return true;

            if (AI.CharacterState.Guild.MatchesAny(Perception.Affected.Tags))
                return true;
            
            FGameplayTagContainer AreaTagFilter;
            AreaTagFilter.AddTag(GameplayTag::Area);
            
            FGameplayTagContainer AreaTags = Perception.Instigator.Tags.Filter(AreaTagFilter);
            FGameplayTag AreaTag = FGameplayTag::Empty;
            if (!AreaTags.IsEmpty())
            {
                AreaTag = AreaTags.Last();
            }

            if (AreaTag.IsValid())
            {
                TSet<AGothicCharacterState> AffectedCharacters = AI.CrimeProcessingSubsystem.GetEventAreaOwningCharacterStates(AreaTag);
                FGameplayTagContainer AffectedGuilds = AI.CrimeProcessingSubsystem.GetEventAreaOwningGuilds(AreaTag);

                if (AffectedCharacters.Contains(AI.CharacterState))
                    return true;

                if (AI.CharacterState.Guild.MatchesAny(AffectedGuilds))
                    return true;
            }

            return false;
        }
        /////////

        /// EVENT CHARACTERS STATE
        UFUNCTION(meta=(AssessmentCondition))
        bool AffectedIsDefeated(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::AffectedIsDefeated ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(Perception.Affected.CharacterState)))
            {
                PrintError(f"{EventTag}::AffectedIsDefeated ran with nullptr Affected.CharacterState");
                return false;
            }

            return Perception.Affected.CharacterState.IsDefeated();
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool AffectedIsDead(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::AffectedIsDead ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(Perception.Affected.CharacterState)))
            {
                PrintError(f"{EventTag}::AffectedIsDead ran with nullptr Affected.CharacterState");
                return false;
            }

            return Perception.Affected.CharacterState.IsDead();
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool SensedIsTrespassing(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(Perception.Origin.CharacterState)))
            {
                PrintError(f"{EventTag}::SensedIsTrespassing ran with nullptr Origin.CharacterState");
                return false;
            }

            return Perception.Origin.CharacterState.IsCharacterTrespassingAccordingToWitness(AI.CharacterState);
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool InstigatorIsTrespassing(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(Perception.Instigator.CharacterState)))
            {
                PrintError(f"{EventTag}::InstigatorIsTrespassing ran with nullptr Instigator.CharacterState");
                return false;
            }

            return Perception.Instigator.CharacterState.IsCharacterTrespassingAccordingToWitness(AI.CharacterState);
        }
        /////////

        /// EVENT CHARACTERS POWER COMPARISON
        UFUNCTION(meta=(AssessmentCondition))
        bool AffectedIsStrongerThanSelf(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::AffectedIsStrongerThanSelf ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(Perception.Affected.Character)))
            {
                PrintError(f"{EventTag}::AffectedIsStrongerThanSelf ran with nullptr Affected.Character");
                return false;
            }

            if (AI.CharacterState.ShouldActCoward())
                return true;

            if (AI.CharacterState.ShouldActBrave())
                return false;

            return Perception.Affected.Character.IsStrongerThan(AI.Self);
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool InstigatorIsStrongerThanSelf(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::InstigatorIsStrongerThanSelf ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(Perception.Instigator.Character)))
            {
                PrintError(f"{EventTag}::InstigatorIsStrongerThanSelf ran with nullptr Instigator.Character");
                return false;
            }

            if (AI.CharacterState.ShouldActCoward())
                return true;

            if (AI.CharacterState.ShouldActBrave())
                return false;

            return Perception.Instigator.Character.IsStrongerThan(AI.Self);
        }

        /// Same as InstigatorIsStrongerThanSelf but ignores Coward/Brave personality. Use for witness "watch vs help" so actual strength decides.
        UFUNCTION(meta=(AssessmentCondition))
        bool InstigatorIsStrongerThanSelfActual(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::InstigatorIsStrongerThanSelfActual ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(Perception.Instigator.Character)))
            {
                PrintError(f"{EventTag}::InstigatorIsStrongerThanSelfActual ran with nullptr Instigator.Character");
                return false;
            }

            return Perception.Instigator.Character.IsStrongerThan(AI.Self);
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool SensedIsStrongerThanSelf(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::SensedIsStrongerThanSelf ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(Perception.Origin.Character)))
            {
                PrintError(f"{EventTag}::SensedIsStrongerThanSelf ran with nullptr Origin.Character");
                return false;
            }

            if (AI.CharacterState.ShouldActCoward())
                return true;

            if (AI.CharacterState.ShouldActBrave())
                return false;

            return Perception.Origin.Character.IsStrongerThan(AI.Self);
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool SelfIsHostileOrAngryTowardSensed(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)) || !ensure(IsValid(AI.CharacterState)))
                return false;
            if (!IsValid(Perception.Origin.CharacterState))
                return false;
            return AI.CharacterState.IsHostileTowards(Perception.Origin.CharacterState) || AI.CharacterState.IsAngryTowards(Perception.Origin.CharacterState);
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool SelfIsHuman(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)) || !ensure(IsValid(AI.CharacterState)))
                return false;
            return AI.CharacterState.Species.MatchesTag(GameplayTag::Species_Human);
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool SelfIsOrc(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)) || !ensure(IsValid(AI.CharacterState)))
                return false;
            return AI.CharacterState.Species.MatchesTag(GameplayTag::Species_Orc);
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool SensedOutranksOrEnforcesSelf(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)) || !ensure(IsValid(AI.CharacterState)))
                return false;
            return Perception.Origin.RelativeRank == ERelationshipRelativeRank::HigherThanMe ||
                   Perception.Origin.RelativeRank == ERelationshipRelativeRank::Boss;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool WasBlockingPathSensedCharacterDefeatedBySelf(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!IsValid(AI) || !IsValid(AI.CharacterState) || !IsValid(Perception.Origin.CharacterState))
                return false;

            float DefeatImmunityDuration = AI.SpawnedStorage(UAIValueSet_BlockingPath).BlockingPathDefeatImmunityDurationSeconds;
            bool bDefeatedBySensed = false;
            if (DefeatImmunityDuration > 0.0f)
            {
                bDefeatedBySensed = AI.CharacterState.WasDefeatedBy(
                    Perception.Origin.CharacterState,
                    FInGameTime::XRealtimeSecondsAgo(DefeatImmunityDuration));
            }
            else
            {
                bDefeatedBySensed = AI.CharacterState.WasDefeatedBy(Perception.Origin.CharacterState);
            }

            if (bDefeatedBySensed)
            {
                Log(f"[BlockPath][DIST] DefeatImmunityActive=true (Event={EventTag} Blocker={Perception.Origin.Character} Duration={DefeatImmunityDuration}s)");
            }
            return bDefeatedBySensed;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool IsBlockingPathEscalationGuardRestricted(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!IsValid(AI.CharacterState))
                return false;

            bool bParty = IsInPartyWithSensedCharacter(AI, EventTag, Perception);
            bool bOutrank = SensedOutranksOrEnforcesSelf(AI, EventTag, Perception);
            bool bFriendly = IsValid(Perception.Origin.CharacterState) && AI.CharacterState.IsFriendlyTowards(Perception.Origin.CharacterState);
            bool bBrave = AI.CharacterState.ShouldActBrave();
            bool bCoward = AI.CharacterState.ShouldActCoward();
            bool bEffectiveCoward = bCoward && !bBrave;
            bool bSensedStronger = IsValid(AI.Self) && IsValid(Perception.Origin.Character) && Perception.Origin.Character.IsStrongerThan(AI.Self);
            bool bPatient = AI.CharacterState.IsPatientPersonality();
            bool bDefeatedBySensed = WasBlockingPathSensedCharacterDefeatedBySelf(AI, EventTag, Perception);
            bool bRestricted = bParty || bOutrank || bFriendly || bEffectiveCoward || bSensedStronger || bPatient || bDefeatedBySensed;
            Log(f"[BlockPath][DIST] WaitOnlyCap={bRestricted} (Event={EventTag} Blocker={Perception.Origin.Character} Party={bParty} Outrank={bOutrank} Friendly={bFriendly} Coward={bCoward} Brave={bBrave} EffectiveCoward={bEffectiveCoward} SensedStronger={bSensedStronger} Patient={bPatient} Defeated={bDefeatedBySensed})");
            if (bRestricted && EventTag.MatchesTag(GameplayTag::AIEvent_BlockingPath_EscalateToWarning))
                Log(f"[BlockPath][DIST] GuardRestrictedRoute=StayInWait+InterjectionAngry (Blocker={Perception.Origin.Character})");
            return bRestricted;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool IsBlockingPathEscalationGuardRestricted_Orc(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!IsValid(AI.CharacterState))
                return false;

            bool bParty = IsInPartyWithSensedCharacter(AI, EventTag, Perception);
            bool bOutrank = SensedOutranksOrEnforcesSelf(AI, EventTag, Perception);
            bool bFriendly = IsValid(Perception.Origin.CharacterState) && AI.CharacterState.IsFriendlyTowards(Perception.Origin.CharacterState);
            bool bPatient = AI.CharacterState.IsPatientPersonality();
            bool bDefeatedBySensed = WasBlockingPathSensedCharacterDefeatedBySelf(AI, EventTag, Perception);
            bool bRestricted = bParty || bOutrank || bFriendly || bPatient || bDefeatedBySensed;
            Log(f"[BlockPath][DIST][Orc] WaitOnlyCap={bRestricted} (Event={EventTag} Blocker={Perception.Origin.Character} Party={bParty} Outrank={bOutrank} Friendly={bFriendly} Patient={bPatient} Defeated={bDefeatedBySensed})");
            if (bRestricted && EventTag.MatchesTag(GameplayTag::AIEvent_BlockingPath_EscalateToWarning))
                Log(f"[BlockPath][DIST][Orc] GuardRestrictedRoute=StayInWait+InterjectionAngry (Blocker={Perception.Origin.Character})");
            return bRestricted;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool IsBlockingPathEscalationMissingTarget(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            bool bMissingTarget = !IsValid(Perception.Origin.CharacterState);
            if (bMissingTarget)
                Log(f"[BlockPath][DIST] MissingTarget=true (Event={EventTag} BlockerState={Perception.Origin.CharacterState} Blocker={Perception.Origin.Character})");
            return bMissingTarget;
        }

        int ComputeBlockingPathEffectiveThreshold(const UGameplayAbility_CharacterAI_Gothic AI, FRememberedPerception Perception)
        {
            if (!IsValid(AI.CharacterState) || !IsValid(AI.Self))
                return 999;

            auto BlockingPathStorage = AI.SpawnedStorage(UAIValueSet_BlockingPath);
            int Effective = BlockingPathStorage.BlockingPathFrustrationThreshold;
            auto BlockerState = Perception.Origin.CharacterState;
            auto Blocker = Perception.Origin.Character;

            bool bParty    = IsValid(BlockerState) && AI.CharacterState.IsInPartyWith(BlockerState);
            bool bFriendly = IsValid(BlockerState) && AI.CharacterState.IsFriendlyTowards(BlockerState);
            bool bSensedStronger = IsValid(Blocker) && Blocker.IsStrongerThan(AI.Self);
            bool bBrave    = AI.CharacterState.ShouldActBrave();
            bool bCoward   = AI.CharacterState.ShouldActCoward();
            bool bEffectiveCoward = bCoward && !bBrave;
            bool bPatient  = AI.CharacterState.IsPatientPersonality();
            bool bDefeatedBySensed = WasBlockingPathSensedCharacterDefeatedBySelf(AI, GameplayTag::Crime_BlockingPath, Perception);
            bool bGuard    = AI.CharacterState.HasGameplayTag(GameplayTag::CampRole_Guard);
            bool bSelfStronger = IsValid(Blocker) && AI.Self.IsStrongerThan(Blocker);

            if (bParty || bFriendly || bSensedStronger || bEffectiveCoward || bPatient || bDefeatedBySensed)
            {
                Log(f"[BlockPath][DIST] EffectiveThreshold=999 (Blocker={Perception.Origin.Character} Base={Effective} Party={bParty} Friendly={bFriendly} SensedStronger={bSensedStronger} Coward={bCoward} Brave={bBrave} EffectiveCoward={bEffectiveCoward} Patient={bPatient} Defeated={bDefeatedBySensed})");
                return 999;
            }

            if (bBrave)
                Effective = Math::Max(1, Effective - 1);
            if (bGuard)
                Effective = Math::Max(1, Effective - 1);
            if (bSelfStronger)
                Effective = Math::Max(1, Effective - 1);

            Log(f"[BlockPath][DIST] EffectiveThreshold={Effective} (Blocker={Perception.Origin.Character} Base={BlockingPathStorage.BlockingPathFrustrationThreshold} Brave={bBrave} Guard={bGuard} SelfStronger={bSelfStronger})");
            return Effective;
        }

        int ComputeBlockingPathEffectiveThreshold_Orc(const UGameplayAbility_CharacterAI_Gothic AI, FRememberedPerception Perception)
        {
            if (!IsValid(AI.CharacterState))
                return 999;

            auto BlockingPathStorage = AI.SpawnedStorage(UAIValueSet_BlockingPath);
            int Effective = BlockingPathStorage.BlockingPathFrustrationThreshold;
            auto BlockerState = Perception.Origin.CharacterState;

            bool bParty = IsValid(BlockerState) && AI.CharacterState.IsInPartyWith(BlockerState);
            bool bFriendly = IsValid(BlockerState) && AI.CharacterState.IsFriendlyTowards(BlockerState);
            bool bOutrank = Perception.Origin.RelativeRank == ERelationshipRelativeRank::HigherThanMe ||
                            Perception.Origin.RelativeRank == ERelationshipRelativeRank::Boss;
            bool bPatient = AI.CharacterState.IsPatientPersonality();
            bool bDefeatedBySensed = WasBlockingPathSensedCharacterDefeatedBySelf(AI, GameplayTag::Crime_BlockingPath, Perception);

            if (bParty || bFriendly || bOutrank || bPatient || bDefeatedBySensed)
            {
                Log(f"[BlockPath][DIST][Orc] EffectiveThreshold=999 (Blocker={Perception.Origin.Character} Base={Effective} Party={bParty} Friendly={bFriendly} Outrank={bOutrank} Patient={bPatient} Defeated={bDefeatedBySensed})");
                return 999;
            }

            Log(f"[BlockPath][DIST][Orc] EffectiveThreshold={Effective} (Blocker={Perception.Origin.Character} Base={BlockingPathStorage.BlockingPathFrustrationThreshold})");
            return Effective;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool ShouldBlockingPathSkipWaitToWarning(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            int EffectiveThreshold = ComputeBlockingPathEffectiveThreshold(AI, Perception);
            int PersistentFrustration = AI.SpawnedStorage(UAIValueSet_BlockingPath).BlockingPathFrustrationCount;
            bool bSkipWaitToWarning = PersistentFrustration >= EffectiveThreshold && PersistentFrustration < EffectiveThreshold + 1;
            Log(f"[BlockPath][DIST] SkipWaitToWarning={bSkipWaitToWarning} (Event={EventTag} Blocker={Perception.Origin.Character} Frustration={PersistentFrustration} Threshold={EffectiveThreshold})");
            return bSkipWaitToWarning;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool ShouldBlockingPathEscalationGoToCombat(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            int EffectiveThreshold = ComputeBlockingPathEffectiveThreshold(AI, Perception);
            int PersistentFrustration = AI.SpawnedStorage(UAIValueSet_BlockingPath).BlockingPathFrustrationCount;
            bool bShouldCombat = PersistentFrustration >= EffectiveThreshold + 1;
            Log(f"[BlockPath][DIST] ShouldCombat={bShouldCombat} (Event={EventTag} Blocker={Perception.Origin.Character} Frustration={PersistentFrustration} Threshold={EffectiveThreshold})");
            return bShouldCombat;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool ShouldBlockingPathSkipWaitToWarning_Orc(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            int EffectiveThreshold = ComputeBlockingPathEffectiveThreshold_Orc(AI, Perception);
            int PersistentFrustration = AI.SpawnedStorage(UAIValueSet_BlockingPath).BlockingPathFrustrationCount;
            bool bSkipWaitToWarning = PersistentFrustration >= EffectiveThreshold && PersistentFrustration < EffectiveThreshold + 1;
            Log(f"[BlockPath][DIST][Orc] SkipWaitToWarning={bSkipWaitToWarning} (Event={EventTag} Blocker={Perception.Origin.Character} Frustration={PersistentFrustration} Threshold={EffectiveThreshold})");
            return bSkipWaitToWarning;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool ShouldBlockingPathEscalationGoToCombat_Orc(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            int EffectiveThreshold = ComputeBlockingPathEffectiveThreshold_Orc(AI, Perception);
            int PersistentFrustration = AI.SpawnedStorage(UAIValueSet_BlockingPath).BlockingPathFrustrationCount;
            bool bShouldCombat = PersistentFrustration >= EffectiveThreshold + 1;
            Log(f"[BlockPath][DIST][Orc] ShouldCombat={bShouldCombat} (Event={EventTag} Blocker={Perception.Origin.Character} Frustration={PersistentFrustration} Threshold={EffectiveThreshold})");
            return bShouldCombat;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool SensedCharacterOfInterestIsStrongerThanSelf(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::SensedCharacterOfInterestIsStrongerThanSelf ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(Perception.Origin.Character)))
            {
                PrintError(f"{EventTag}::SensedCharacterOfInterestIsStrongerThanSelf ran with nullptr Origin.Character");
                return false;
            }

            auto SensedAI = Perception.Origin.Character.GetGothicAI();
            if (SensedAI != nullptr && SensedAI.CharacterOfInterest != nullptr)
            {
                if (AI.CharacterState.ShouldActCoward())
                return true;

                if (AI.CharacterState.ShouldActBrave())
                    return false;

                return SensedAI.CharacterOfInterest.IsStrongerThan(AI.Self);
            }

            if (SensedAI != nullptr)
                return false;

            auto TargetedActor = Perception.Origin.Character.TargetedActor;
            auto TargetedCharacter = Cast<AGothicCharacter>(TargetedActor);

            if (TargetedCharacter == nullptr)
                return false;

            if (AI.CharacterState.ShouldActCoward())
                return true;

            if (AI.CharacterState.ShouldActBrave())
                return false;

            return TargetedCharacter.IsStrongerThan(AI.Self);
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool GroupCombatIsFavorableForAllies(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!IsValid(AI) || !IsValid(AI.CharacterState) || !IsValid(AI.Character))
                return false;

            if (AI.ModeOfFleeOnUnfavorableCombat == EFleeOnUnfavorableCombatMode::Never)
                return true;

            if (AI.ModeOfFleeOnUnfavorableCombat == EFleeOnUnfavorableCombatMode::Always)
                return false;

            if (AI.CharacterState.ShouldActBrave())
                return true;

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

            TArray<AGothicCharacter> EventCharacters;
            // TSet<AGothicCharacterState> Opponents;
            // TSet<AGothicCharacterState> Allies;

            int OpponentCount = 0;
            int AllyCount = 0;

            float OpponentsLevelTotal = 0.0f;
            float AlliesLevelTotal = 0.0f;

            if (IsValid(AI.CharacterState))
            {
                AllyCount += 1;
                AlliesLevelTotal += AI.CharacterState.GetLevelAttribute();
            }

            if (IsValid(Perception.Origin.CharacterState) && !Perception.Origin.CharacterState.IsDead() && !Perception.Origin.CharacterState.IsDefeated())
            {
                EventCharacters.AddUnique(Perception.Origin.Character);

                if (Perception.Origin.Relationship == ERelationship::Enemy || Perception.Origin.Relationship == ERelationship::Hostile)
                {
                    if (AI.ModeOfFleeOnUnfavorableCombat != EFleeOnUnfavorableCombatMode::OnUnfavorable_PredatorOnly || Perception.Origin.Hostility == ERelationshipHostility::Predator)
                    {
                        OpponentsLevelTotal += Perception.Origin.CharacterState.GetLevelAttribute();
                        OpponentCount += 1;
                    }
                }
                else if (Perception.Origin.Relationship == ERelationship::Friend)
                {
                    AlliesLevelTotal += Perception.Origin.CharacterState.GetLevelAttribute();
                    AllyCount += 1;
                }
            }

            if (IsValid(Perception.Affected.CharacterState) && !Perception.Affected.CharacterState.IsDead() && !Perception.Affected.CharacterState.IsDefeated())
            {
                EventCharacters.AddUnique(Perception.Affected.Character);

                if (Perception.Affected.Relationship == ERelationship::Enemy || Perception.Affected.Relationship == ERelationship::Hostile)
                {
                    if (AI.ModeOfFleeOnUnfavorableCombat != EFleeOnUnfavorableCombatMode::OnUnfavorable_PredatorOnly || Perception.Affected.Hostility == ERelationshipHostility::Predator)
                    {
                        OpponentsLevelTotal += Perception.Affected.CharacterState.GetLevelAttribute();
                        OpponentCount += 1;
                    }
                }
                else if (Perception.Affected.Relationship == ERelationship::Friend)
                {
                    AlliesLevelTotal += Perception.Affected.CharacterState.GetLevelAttribute();
                    AllyCount += 1;
                }
            }

            if (IsValid(Perception.Instigator.CharacterState) && !Perception.Instigator.CharacterState.IsDead() && !Perception.Instigator.CharacterState.IsDefeated())
            {
                EventCharacters.AddUnique(Perception.Instigator.Character);

                if (Perception.Instigator.Relationship == ERelationship::Enemy || Perception.Instigator.Relationship == ERelationship::Hostile)
                {
                    if (AI.ModeOfFleeOnUnfavorableCombat != EFleeOnUnfavorableCombatMode::OnUnfavorable_PredatorOnly || Perception.Instigator.Hostility == ERelationshipHostility::Predator)
                    {
                        OpponentsLevelTotal += Perception.Instigator.CharacterState.GetLevelAttribute();
                        OpponentCount += 1;
                    }
                }
                else if (Perception.Instigator.Relationship == ERelationship::Friend)
                {
                    AlliesLevelTotal += Perception.Instigator.CharacterState.GetLevelAttribute();
                    AllyCount += 1;
                }
            }

            if (AI.ModeOfFleeOnUnfavorableCombat == EFleeOnUnfavorableCombatMode::OnUnfavorable_PredatorOnly)
            {                
                OpponentsLevelTotal += CharacterPerception.GetSumLevelOfSensedCharactersMatchingPerceptionHandler(AI.PredatorFilterHandler_LivingOnly);
                OpponentCount += CharacterPerception.GetAllSensedCharactersMatchingPerceptionHandler(AI.PredatorFilterHandler_LivingOnly).Num();
            }
            else
            {
                OpponentsLevelTotal += CharacterPerception.GetSumLevelOfSensedCharactersMatchingPerceptionHandler(AI.HostileCharacterFilterHandler_LivingOnly);
            	OpponentCount +=CharacterPerception.GetAllSensedCharactersMatchingPerceptionHandler(AI.HostileCharacterFilterHandler_LivingOnly).Num();
            
            	OpponentsLevelTotal += CharacterPerception.GetSumLevelOfSensedCharactersMatchingPerceptionHandler(AI.EnemyCharacterFilterHandler_LivingOnly);
            	OpponentCount += CharacterPerception.GetAllSensedCharactersMatchingPerceptionHandler(AI.EnemyCharacterFilterHandler_LivingOnly).Num();
            }

            AlliesLevelTotal += CharacterPerception.GetSumLevelOfSensedCharactersMatchingPerceptionHandler(AI.FriendlyCharacterFilterHandler_LivingOnly);
            AllyCount += CharacterPerception.GetAllSensedCharactersMatchingPerceptionHandler(AI.FriendlyCharacterFilterHandler_LivingOnly).Num();

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
        /////////

        /// ATTACK INTENTIONALITY
        UFUNCTION(meta=(AssessmentCondition))
        bool IsIntentionalAttack(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(Perception.Instigator.Character)))
            {
                PrintError(f"{EventTag}::IsIntentionalAttack ran with nullptr Instigator.Character");
                return false;
            }

            if (!ensure(IsValid(Perception.Affected.Character)))
            {
                PrintError(f"{EventTag}::IsIntentionalAttack ran with nullptr Affected.Character");
                return false;
            }

            bool bPartyOrTransformedParty = false;
            if (IsValid(Perception.Instigator.CharacterState) && IsValid(Perception.Affected.CharacterState))
            {
                if (Perception.Instigator.CharacterState.IsInPartyWith(Perception.Affected.CharacterState))
                    bPartyOrTransformedParty = true;
                // Victim in party with instigator's caster (e.g. wolf hit party member)
                else if (IsValid(AI) && AI.CharacterState == Perception.Affected.CharacterState &&
                    Perception.Instigator.CharacterState.HasGameplayTag(GameplayTag::State_Transformed) &&
                    IsValid(Perception.Instigator.Character))
                {
                    AGothicCharacter CasterCharacter = Cast<AGothicCharacter>(Perception.Instigator.Character.GetActorInstigator());
                    if (IsValid(CasterCharacter) && IsValid(CasterCharacter.CharacterState) && AI.CharacterState.IsInPartyWith(CasterCharacter.CharacterState))
                        bPartyOrTransformedParty = true;
                }
            }
            if (bPartyOrTransformedParty)
            {
                if (IsValid(AI) && IsValid(AI.CharacterState))
                {
                    // Check for any previous damage events (intentional or unintentional) in the last 30s
                    int RecentDamageEvents = AI.CharacterState.LongTermMemory
                        .FilterEventsCausedBy(Perception.Instigator.CharacterState.CharacterGlobalId, GameplayTag::Memory_Combat_WasDamaged)
                        .AfterTime(FInGameTime::XRealtimeSecondsAgo(30.0f))
                        .Affecting(Perception.Affected.CharacterState.CharacterGlobalId)
                        .Count;
        
                    // If this is the first hit, consider it unintentional
                    if (RecentDamageEvents == 0)
                        return false;
                }
            }

            bool bInstigatorIsPlayer = Perception.Instigator.CharacterState.IsPlayerControlled();

            if (Perception.Affected.CharacterState == Perception.Target.CharacterState)
                return true;

            if (AI.CharacterState.Species.MatchesTag(GameplayTag::Species_Creature))
                return true;

            // if (bInstigatorIsPlayer && !Perception.Instigator.CharacterState.IsInConflict() && !Perception.Affected.CharacterState.IsImmortal())
            //     return true;

            // When the assessor is the victim, allow intentional so they can register assault and retaliate.
            if (bInstigatorIsPlayer && Perception.Affected.CharacterState.Relationship.IsFriendlyTowards(Perception.Instigator.CharacterState) &&
                (!IsValid(AI) || AI.CharacterState != Perception.Affected.CharacterState))
                return false;

            if (bInstigatorIsPlayer)
                return true;
            
            return false;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool IsTooManyUnintentionalHits(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::IsTooManyUnintentionalHits ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(Perception.Instigator.Character)))
            {
                PrintError(f"{EventTag}::IsTooManyUnintentionalHits ran with nullptr Instigator.Character");
                return false;
            }

            if (!ensure(IsValid(Perception.Affected.Character)))
            {
                PrintError(f"{EventTag}::IsTooManyUnintentionalHits ran with nullptr Affected.Character");
                return false;
            }

            if (Perception.Affected.CharacterState == nullptr)
                return false;

            FInGameTime SearchWindowStartTime = FInGameTime::XRealtimeSecondsAgo(60.0f);

            auto EndConflictEvents = AI.CharacterState.LongTermMemory.Filter().WithTag(GameplayTag::Memory_Conflict_End).ArrayNewestToOldest;
            if (!EndConflictEvents.IsEmpty())
            {
                SearchWindowStartTime = EndConflictEvents[0].Time;
            }

            int TimesHitUnintentionallyByInstigator = AI.CharacterState.LongTermMemory
            .FilterEventsCausedBy(Perception.Instigator.CharacterState.CharacterGlobalId, GameplayTag::Memory_Combat_WasDamaged_Unintentionally)
            .AfterTime(SearchWindowStartTime)
            .BeforeTime(FInGameTime::XRealtimeSecondsAgo(Perception.AgeSeconds + 0.1f))
            .Affecting(Perception.Affected.CharacterState.CharacterGlobalId)
            .Count;

            if ((AI.GetSensedLivingEnemies().Num() > 0 || AI.GetSensedLivingHostiles().Num() > 0) && TimesHitUnintentionallyByInstigator < 3)
                return false;

            if (TimesHitUnintentionallyByInstigator < 1)
                return false;

            return true;
        }

        /// SPECIAL CHECKS
        UFUNCTION(meta=(AssessmentCondition))
        bool IsThreatening(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::IsThreatening ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(Perception.Origin.Character)))
            {
                PrintError(f"{EventTag}::IsThreatening ran with nullptr Origin.Character");
                return false;
            }

            if (!ensure(IsValid(Perception.Origin.CharacterState)))
            {
                PrintError(f"{EventTag}::IsThreatening ran with nullptr Origin.CharacterState");
                return false;
            }

            if (!AI.IsCharacterConsideredAThreat(Perception.Origin.Character))
                return false;

            if (!AI.CharacterState.IsEnemyTowards(Perception.Origin.CharacterState) && Perception.Origin.Character.IsBeingTargetedInCombat())
                return false;
            
            // Just defeated other
            auto LongTermMemory = AI.CharacterState.LongTermMemory
            .FilterEventsCausedBy(Perception.Origin.Character.CharacterGlobalId, GameplayTag::Memory_Combat_WasDefeated)
            .AfterTime(FInGameTime::XRealtimeSecondsAgo(15.0f))
            .GetArray();

            for (auto MemoryEvent : LongTermMemory)
            {
                auto AffectedCharacter = MemoryEvent.GetAffectedCharacter();

                if (AffectedCharacter == nullptr)
                    continue;

                if (AI.Self.IsFriendlyTowards(AffectedCharacter))
                    continue;

                return false;
            }

            // TODO: Just got up from defeated

            return true;
        }

        // Returns true if Character is in any Area
        UFUNCTION(meta=(AssessmentCondition))
        bool IsCharacterInAnyTerritory(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            auto CharacterTerritory = AI.GetCurrentTerritory();

            return IsValid(CharacterTerritory);
        }

        // Returns true if Character and instigator share any Territory tag or is withing Combat Radius without a territory
        UFUNCTION(meta=(AssessmentCondition))
        bool IsInstigatorInSameTerritoryAsCharacter(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {               
            if (!IsValid(Perception.Instigator.Character))
            {
                PrintError(f"{EventTag}::IsInstigatorInSameTerritoryAsCharacter ran with nullptr Instigator.Character");
                return false;
            }

            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::IsInstigatorInSameTerritoryAsCharacter ran with nullptr AI");
                return false;
            }

            if (!IsValid(AI.Character))
                return false;

            return AI.IsInSameTerritoryOrCombatRadiusAsOtherCharacter(Perception.Instigator.Character);      
        }
 
        // Returns true if Character and origin share any Territory tag or is withing Combat Radius without a territory
        UFUNCTION(meta=(AssessmentCondition))
        bool IsSensedInSameTerritoryAsCharacter(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {            
            if (!IsValid(Perception.Origin.CharacterState))
            {
                PrintError(f"{EventTag}::IsSensedInSameTerritoryAsCharacter ran with nullptr Origin.CharacterState");
                return false;
            }

            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::IsSensedInSameTerritoryAsCharacter ran with nullptr AI");
                return false;
            }

            if (!IsValid(AI.Character))
                return false;

            if (!IsValid(Perception.Origin.CharacterState.Character))
                return false;
                
            return AI.IsInSameTerritoryOrCombatRadiusAsOtherCharacter(Perception.Origin.CharacterState.Character);
        }

        /// PARTY CHECKS
        UFUNCTION(meta=(AssessmentCondition))
        bool IsInPartyWithAffected(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::IsInPartyWithAffected ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(Perception.Affected.CharacterState)))
            {
                PrintError(f"{EventTag}::IsInPartyWithAffected ran with nullptr Origin.CharacterState");
                return false;
            }
            
            return AI.CharacterState.IsInPartyWith(Perception.Affected.CharacterState);
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool IsInPartyWithInstigator(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::IsInPartyWithInstigator ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(Perception.Instigator.CharacterState)))
            {
                PrintError(f"{EventTag}::IsInPartyWithInstigator ran with nullptr Instigator.CharacterState");
                return false;
            }

            if (Perception.Instigator.Character == nullptr)
                return false;

            return AI.CharacterState.IsInPartyWith(Perception.Instigator.CharacterState);
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool IsInPartyWithSensedCharacter(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::IsInPartyWithSensedCharacter ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(Perception.Origin.CharacterState)))
            {
                PrintError(f"{EventTag}::IsInPartyWithSensedCharacter ran with nullptr Origin.CharacterState");
                return false;
            }
            
            return AI.CharacterState.IsInPartyWith(Perception.Origin.CharacterState);
        }

        /// Instigator is transformed (e.g. wolf) and self is in party with the transformation caster (e.g. Hero).
        UFUNCTION(meta=(AssessmentCondition))
        bool InstigatorIsTransformedAndSelfInPartyWithCaster(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!IsValid(AI) || !IsValid(AI.CharacterState))
                return false;
            if (!IsValid(Perception.Instigator.CharacterState) || !IsValid(Perception.Instigator.Character))
                return false;
            if (!Perception.Instigator.CharacterState.HasGameplayTag(GameplayTag::State_Transformed))
                return false;
            auto CasterCharacter = Cast<AGothicCharacter>(Perception.Instigator.Character.GetActorInstigator());
            if (!IsValid(CasterCharacter) || !IsValid(CasterCharacter.CharacterState))
                return false;
            return AI.CharacterState.IsInPartyWith(CasterCharacter.CharacterState);
        }

        /// True when the instigator has damaged self before this event (30s), to forgive the first hit if transformed-party-member.
        UFUNCTION(meta=(AssessmentCondition))
        bool InstigatorHasDamagedSelfBefore(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!IsValid(AI) || !IsValid(AI.CharacterState))
                return false;
            if (!IsValid(Perception.Instigator.CharacterState) || !IsValid(Perception.Affected.CharacterState))
                return false;
            int PreviousDamageEvents = AI.CharacterState.LongTermMemory
                .FilterEventsCausedBy(Perception.Instigator.CharacterState.CharacterGlobalId, GameplayTag::Memory_Combat_WasDamaged)
                .AfterTime(FInGameTime::XRealtimeSecondsAgo(30.0f))
                .BeforeTime(FInGameTime::XRealtimeSecondsAgo(Perception.AgeSeconds + 0.1f))
                .Affecting(Perception.Affected.CharacterState.CharacterGlobalId)
                .Count;
            return PreviousDamageEvents >= 1;
        }

        /// PERCEIVED CHARACTERS
        UFUNCTION(meta=(AssessmentCondition))
        bool LivingStandingEnemiesPerceived(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::LivingStandingEnemiesPerceived ran with nullptr AI");
                return false;
            }

            return !AI.GetSensedLivingEnemies().IsEmpty();
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool LivingStandingHostilesPerceived(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::LivingStandingHostilesPerceived ran with nullptr AI");
                return false;
            }

            return !AI.GetSensedLivingHostiles().IsEmpty();
        }

        /// STATE GROUP
        UFUNCTION(meta=(AssessmentCondition))
        bool IsSelfStateGroupLeader(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::IsSelfStateGroupLeader ran with nullptr AI");
                return false;
            }

            auto GothicAIState = Cast<UGothicCharacterAIState>(AI.CurrentState);

            if (!IsValid(GothicAIState))
                return false;

            if (!IsValid(GothicAIState.StateGroup))
                return false;

            if (!IsValid(AI.CharacterState) || !IsValid(GothicAIState.StateGroup.Leader))
                return false;

            if (GothicAIState.StateGroup.Leader != AI.CharacterState)
                return false;

            return true;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool GuardsNearby(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!ensure(IsValid(AI)))
            {
                PrintError(f"{EventTag}::GuardsNearby ran with nullptr AI");
                return false;
            }

            if (!ensure(IsValid(AI.Character)))
            {
                PrintError(f"{EventTag}::GuardsNearby ran with nullptr Self");
                return false;
            }

            for (auto OtherActor : UNearbyActorsSubsystem::Get().FindActorsOfClassInRadius(AGothicCharacter, AI.Character.NavAgentLocation, 10000.0f))
            {
                auto OtherCharacter = Cast<AGothicCharacter>(OtherActor);
                if (!IsValid(OtherCharacter) || !OtherCharacter.HasGameplayTag(GameplayTag::CampRole_Guard))
                    continue;

                if (OtherCharacter.IsDefeated() || OtherCharacter.IsDead())
                    continue;

                if (OtherCharacter.IsPlayerCharacterOrPlayerControlled())
                    continue;

                float ReachRangeZ = AI.Character.SimpleCollisionHalfHeight * 2 + Perception.Origin.Character.SimpleCollisionHalfHeight; 

                FVector Location;
                if (!UNavigationSystemV1::CanTargetBeReached3D(
                        AI.Character, 
                        OtherCharacter, 
                        100.0f, 
                        ReachRangeZ, 
                        false, Location))
                {
                    continue;
                }

                return true;
            }

            return false;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool IsEnemyStrongerCharacterInvolved(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!IsValid(AI) || !IsValid(AI.CharacterState) || !IsValid(AI.Character))
                return false;

            auto Origin = Perception.Origin.CharacterState;
            if (IsValid(Origin) && IsValid(Origin.Character) && 
                AI.CharacterState.IsEnemyTowards(Origin) && Origin.Character.IsStrongerThan(AI.Character))
                return true;
            
            auto Affected = Perception.Affected.CharacterState;
            if (IsValid(Affected) && IsValid(Affected.Character) && 
                AI.CharacterState.IsEnemyTowards(Affected) && Affected.Character.IsStrongerThan(AI.Character))
                return true;
            
            auto Instigator = Perception.Instigator.CharacterState;
            if (IsValid(Instigator) && IsValid(Instigator.Character) && 
                AI.CharacterState.IsEnemyTowards(Instigator) && Instigator.Character.IsStrongerThan(AI.Character))
                return true;

            auto Groups = UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_ConflictInstance);
            for (auto Group : Groups)
            {
                auto ConflictGroup = Cast<UAIGroup_ConflictInstance>(Group);
                if (!IsValid(ConflictGroup))
                    continue;

                if ((ConflictGroup.IsCharacterInvolved(AI.Character)) ||
                    (IsValid(Origin) && IsValid(Origin.Character) && ConflictGroup.IsCharacterInvolved(Origin.Character)) ||
                    (IsValid(Affected) && IsValid(Affected.Character) && ConflictGroup.IsCharacterInvolved(Affected.Character)) ||
                    (IsValid(Instigator) && IsValid(Instigator.Character) && ConflictGroup.IsCharacterInvolved(Instigator.Character)))
                {
                    if (ConflictGroup.IsAnyInvolvedCharacterEnemyAndStrongerThan(AI.Character))
                        return true;
                }
            }

            return false;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool IsAnyFriendlyEnforcerOrLeaderInvolved(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!IsValid(AI) || !IsValid(AI.CharacterState) || !IsValid(AI.Character))
                return false;

            auto Origin = Perception.Origin.CharacterState;
            auto Affected = Perception.Affected.CharacterState;
            auto Instigator = Perception.Instigator.CharacterState;

            auto Groups = UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_ConflictInstance);
            for (auto Group : Groups)
            {
                auto ConflictGroup = Cast<UAIGroup_ConflictInstance>(Group);
                if (!IsValid(ConflictGroup))
                    continue;

                if ((ConflictGroup.IsCharacterInvolved(AI.Character)) ||
                    (IsValid(Origin) && IsValid(Origin.Character) && ConflictGroup.IsCharacterInvolved(Origin.Character)) ||
                    (IsValid(Affected) && IsValid(Affected.Character) && ConflictGroup.IsCharacterInvolved(Affected.Character)) ||
                    (IsValid(Instigator) && IsValid(Instigator.Character) && ConflictGroup.IsCharacterInvolved(Instigator.Character)))
                {
                    if (ConflictGroup.IsAnyInvolvedCharacterEnforcerOrLeaderRoleAndFriendlyOf(AI.Character))
                        return true;
                }
            }

            return false;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool SelfIsParticipantOfPerceivedConflict(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!IsValid(AI) || !IsValid(AI.Character))
                return false;

            auto Origin = Perception.Origin.CharacterState;
            auto Affected = Perception.Affected.CharacterState;
            auto Instigator = Perception.Instigator.CharacterState;
            auto Target = Perception.Target.CharacterState;

            auto Groups = UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_ConflictInstance);
            for (auto Group : Groups)
            {
                auto ConflictGroup = Cast<UAIGroup_ConflictInstance>(Group);
                if (!IsValid(ConflictGroup))
                    continue;

                if (!ConflictGroup.IsCharacterInvolved(AI.Character))
                    continue;

                if ((IsValid(Origin) && IsValid(Origin.Character) && ConflictGroup.IsCharacterInvolved(Origin.Character)) ||
                    (IsValid(Affected) && IsValid(Affected.Character) && ConflictGroup.IsCharacterInvolved(Affected.Character)) ||
                    (IsValid(Instigator) && IsValid(Instigator.Character) && ConflictGroup.IsCharacterInvolved(Instigator.Character)) ||
                    (IsValid(Target) && IsValid(Target.Character) && ConflictGroup.IsCharacterInvolved(Target.Character)))
                {
                    return true;
                }
            }

            return false;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool SensedOrInstigatorIsBeingWarned(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!IsValid(AI) || !IsValid(AI.CharacterState) || !IsValid(AI.Character))
                return false;

            if ((!IsValid(Perception.Origin.CharacterState) || !IsValid(Perception.Origin.Character)) &&
                (!IsValid(Perception.Instigator.CharacterState) || !IsValid(Perception.Instigator.Character)))
                return false;

            AGothicCharacter OriginCharacter = nullptr;
            AGothicCharacter InstigatorCharacter = nullptr;
            if (IsValid(Perception.Origin.CharacterState) && IsValid(Perception.Origin.Character))
            {
                OriginCharacter = Perception.Origin.Character;
            }

            if (IsValid(Perception.Instigator.CharacterState) && IsValid(Perception.Instigator.Character))
            {
                InstigatorCharacter = Perception.Instigator.Character;
            }

            auto Groups = UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_ConflictInstance);
            for (auto Group : Groups)
            {
                auto ConflictGroup = Cast<UAIGroup_ConflictInstance>(Group);
                if (!IsValid(ConflictGroup))
                    continue;

                if (IsValid(OriginCharacter) && ConflictGroup.IsCharacterBeingWarnedByAnyone(OriginCharacter))
                    return true;
                
                if (IsValid(InstigatorCharacter) && ConflictGroup.IsCharacterBeingWarnedByAnyone(InstigatorCharacter))
                    return true;
            }

            return false;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool IsAnyFriendlyInvolved(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!IsValid(AI) || !IsValid(AI.CharacterState) || !IsValid(AI.Character))
                return false;

            auto Origin = Perception.Origin.CharacterState;
            if (IsValid(Origin) && IsValid(Origin.Character) && 
                AI.CharacterState.IsFriendlyTowards(Origin))
                return true;
            
            auto Affected = Perception.Affected.CharacterState;
            if (IsValid(Affected) && IsValid(Affected.Character) && 
                AI.CharacterState.IsFriendlyTowards(Affected))
                return true;
            
            auto Instigator = Perception.Instigator.CharacterState;
            if (IsValid(Instigator) && IsValid(Instigator.Character) && 
                AI.CharacterState.IsFriendlyTowards(Instigator))
                return true;

            auto Groups = UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_ConflictInstance);
            for (auto Group : Groups)
            {
                auto ConflictGroup = Cast<UAIGroup_ConflictInstance>(Group);
                if (!IsValid(ConflictGroup))
                    continue;

                if ((ConflictGroup.IsCharacterInvolved(AI.Character)) ||
                    (IsValid(Origin) && IsValid(Origin.Character) && ConflictGroup.IsCharacterInvolved(Origin.Character)) ||
                    (IsValid(Affected) && IsValid(Affected.Character) && ConflictGroup.IsCharacterInvolved(Affected.Character)) ||
                    (IsValid(Instigator) && IsValid(Instigator.Character) && ConflictGroup.IsCharacterInvolved(Instigator.Character)))
                {
                    if (ConflictGroup.DoesCharacaterHaveRelationshipTowardsAnyInvolvedCharacter(AI.Character, ERelationship::Friend))
                        return true;
                }
            }

            return false;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool IsAnyEnemyInvolved(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!IsValid(AI) || !IsValid(AI.CharacterState) || !IsValid(AI.Character))
                return false;

            auto Origin = Perception.Origin.CharacterState;
            if (IsValid(Origin) && IsValid(Origin.Character) && 
                AI.CharacterState.IsEnemyTowards(Origin))
                return true;
            
            auto Affected = Perception.Affected.CharacterState;
            if (IsValid(Affected) && IsValid(Affected.Character) && 
                AI.CharacterState.IsEnemyTowards(Affected))
                return true;
            
            auto Instigator = Perception.Instigator.CharacterState;
            if (IsValid(Instigator) && IsValid(Instigator.Character) && 
                AI.CharacterState.IsEnemyTowards(Instigator))
                return true;

            auto Groups = UGothicAIGroup::GetAllActiveGroupsOfClass(UAIGroup_ConflictInstance);
            for (auto Group : Groups)
            {
                auto ConflictGroup = Cast<UAIGroup_ConflictInstance>(Group);
                if (!IsValid(ConflictGroup))
                    continue;

                if ((ConflictGroup.IsCharacterInvolved(AI.Character)) ||
                    (IsValid(Origin) && IsValid(Origin.Character) && ConflictGroup.IsCharacterInvolved(Origin.Character)) ||
                    (IsValid(Affected) && IsValid(Affected.Character) && ConflictGroup.IsCharacterInvolved(Affected.Character)) ||
                    (IsValid(Instigator) && IsValid(Instigator.Character) && ConflictGroup.IsCharacterInvolved(Instigator.Character)))
                {
                    if (ConflictGroup.DoesCharacaterHaveRelationshipTowardsAnyInvolvedCharacter(AI.Character, ERelationship::Enemy))
                        return true;
                }
            }

            return false;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool ShouldIgnoreCrime(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            UAIValueSet_Crime Ctx = CrimeContext::FetchCrimeContext(AI, EventTag, Perception);
            if (!IsValid(Ctx))
                return true;

            if (Ctx.bCriminalIsPartyMember && Ctx.bVictimIsOutgroup && !Ctx.bWitnessIsAreaEnforcer)
                return true;
            if (Ctx.bCriminalOutranksWitness && !Ctx.bWitnessIsPersonalVictim)
                return true;
            if (Ctx.bVictimIsOutgroup && !Ctx.bWitnessIsAreaEnforcer && !Ctx.bVictimOutranksWitness)
                return true;
            if (Ctx.bWitnessIsCriminal)
                return true;
            if (Ctx.bLatestCrimeForgiven)
                return true;
            if (Ctx.bLatestCrimeSuppressed)
                return true;

            return false;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool WitnessIsPersonalVictimOfCrime(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            UAIValueSet_Crime Ctx = CrimeContext::FetchCrimeContext(AI, EventTag, Perception);
            return IsValid(Ctx) && Ctx.bWitnessIsPersonalVictim;
        }

        /** True only when the witness holds an enforcer role (Guard / Leader / BodyGuard / Boss) */
        UFUNCTION(meta=(AssessmentCondition))
        bool WitnessIsEnforcerOfCrimeArea(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            UAIValueSet_Crime Ctx = CrimeContext::FetchCrimeContext(AI, EventTag, Perception);
            return IsValid(Ctx) && Ctx.bWitnessIsAreaEnforcer;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool CrimeVictimIsOutgroupToWitness(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            UAIValueSet_Crime Ctx = CrimeContext::FetchCrimeContext(AI, EventTag, Perception);
            return IsValid(Ctx) && Ctx.bVictimIsOutgroup;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool CrimeReputationHasEscalated(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            UAIValueSet_Crime Ctx = CrimeContext::FetchCrimeContext(AI, EventTag, Perception);
            return IsValid(Ctx) && Ctx.bIsReputationEscalated;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool CrimeReputationAtExecuteLevel(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            UAIValueSet_Crime Ctx = CrimeContext::FetchCrimeContext(AI, EventTag, Perception);
            return IsValid(Ctx) && Ctx.bIsReputationAtExecuteLevel;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool EventIsForCrimeTheft(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            return Perception.ContextTags.HasTag(GameplayTag::Crime_Theft);
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool TheftStakesAreHigh(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!TheftContext::IsTheftEventTag(EventTag))
                return false;

            UAIValueSet_Theft Ctx = TheftContext::FetchContext(AI, Perception);
            if (!IsValid(Ctx))
                return false;

            return Ctx.ItemStakes == ETheftStakes::HighStakes
                || Ctx.CircumstanceStakes == ETheftStakes::HighStakes;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool PickpocketFailCountReachedCombatThreshold(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!PickpocketContext::IsPickpocketEventTag(EventTag))
                return false;

            UAIValueSet_Pickpocket Ctx = PickpocketContext::FetchContext(AI, Perception);
            if (!IsValid(Ctx))
                return false;

            UCrimeTuningConfig_Pickpocket Tuning = PickpocketContext::GetTuning(AI);
            int Threshold = IsValid(Tuning) ? Tuning.MaxFailedAttemptsBeforeCombat : 3;
            if (Threshold <= 0)
                return false;

            return Ctx.PickpocketFailCountByCriminalAgainstWitness >= Threshold;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool EventIsForCrimeCreeping(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            return Perception.ContextTags.HasTag(GameplayTag::Crime_Creeping);
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool CreepingShouldJumpStraightToWarning(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            if (!CreepingContext::IsCreepingEventTag(EventTag))
                return false;

            UAIValueSet_Creeping Ctx = CreepingContext::FetchContext(AI, Perception);
            if (!IsValid(Ctx))
                return false;

            return Ctx.bWithinReCreepGrace;
        }

        UFUNCTION(meta=(AssessmentCondition))
        bool PerceptionContextHasCreepingBarkRelayTag(const UGameplayAbility_CharacterAI_Gothic AI, FGameplayTag EventTag, FRememberedPerception Perception)
        {
            return Perception.ContextTags.HasTag(GameplayTag::Perception_Context_FromCreepingBark);
        }
    }
}