/**
 * CreepingEvaluationContext
 */
class UAIValueSet_Creeping : UAIValueSet_Crime
{
    // --- Crime-agnostic cache key ---
    bool bIsPopulated = false;
    FName CachedCriminalGlobalID;
    int CachedCrimeID = -1;
    FGameplayTag CachedEventTag;
    FInGameTime CachedPopulationTime;

    // --- Inspector / future-use fields surfaced from the latest registered Creeping entry ---
    bool bHasCrimeEntry = false;
    FInGameTime LatestCrimeTimeCommitted;
    float LatestCrimeEvaluatedSeverity = 0.0f;
    ECrimeSeverityLevel LatestCrimeSeverityLevel = ECrimeSeverityLevel::None;

    // --- Re-creep grace ---
    /** Realtime stamp at which this witness last peacefully exited Observe/Warning Creeping vs this criminal. */
    FInGameTime LastResolvedAt;
    /** True when (now - LastResolvedAt) < tuning.ReCreepGraceSeconds; consumed by CreepingShouldJumpStraightToWarning. */
    bool bWithinReCreepGrace = false;

    // --- Counters surfaced for ImGui inspection ---
    int CreepingCountByCriminalAgainstWitness = 0;
}

namespace CreepingContext
{
    bool IsCreepingEventTag(FGameplayTag EventTag)
    {
        if (EventTag.MatchesTag(GameplayTag::Crime_Creeping))
            return true;

        if (EventTag.MatchesTag(GameplayTag::AIEvent_Crime_Creeping_EscalateToWarning))
            return true;

        if (EventTag.MatchesTag(GameplayTag::AIEvent_Crime_Creeping_WarningTimedOut))
            return true;

        if (EventTag.MatchesTag(GameplayTag::AIEvent_Seen_PastCrimeInstigator))
            return true;

        return false;
    }

    UAIValueSet_Creeping FetchContext(const UGameplayAbility_CharacterAI_Gothic AI, FRememberedPerception Perception)
    {
        if (!ensure(IsValid(AI)))
            return nullptr;
        if (!ensure(IsValid(AI.CrimeProcessingSubsystem)))
            return nullptr;

        return GetCurrent(AI, Perception);
    }

    UCrimeTuningConfig_Creeping GetTuning(const UGameplayAbility_CharacterAI_Gothic AI)
    {
        if (!IsValid(AI) || !IsValid(AI.CrimeProcessingSubsystem))
            return nullptr;

        return AI.CrimeProcessingSubsystem.CreepingTuning;
    }

    UAIValueSet_Creeping GetCurrent(const UGameplayAbility_CharacterAI_Gothic AI, FRememberedPerception Perception)
    {
        if (!IsValid(AI))
            return nullptr;

        UAIValueSet_Creeping Ctx = AI.SpawnedStorage(UAIValueSet_Creeping);
        if (!IsValid(Ctx))
            return nullptr;

        EnsurePreparedFor(Ctx, AI, Perception);
        return Ctx;
    }

    /** Cache-keyed populator. Calls CrimeContext::EnsurePreparedFor_Common first. */
    void EnsurePreparedFor(UAIValueSet_Creeping Ctx, const UGameplayAbility_CharacterAI_Gothic AI, FRememberedPerception Perception)
    {
        if (!IsValid(Ctx) || !IsValid(AI))
            return;

        if (!IsValid(AI.CharacterState) || !IsValid(AI.CrimeProcessingSubsystem))
        {
            ResetContext(Ctx);
            return;
        }

        AGothicCharacterState Criminal = Perception.Instigator.CharacterState;

        FName CriminalID = IsValid(Criminal) ? Criminal.CharacterGlobalId : FName();
        FGameplayTag EventTag = Perception.EventTag;

        FCrimeEntry LatestCreeping;
        bool bFound = FindLatestCreepingEntry(AI, Criminal, LatestCreeping);

        int LatestCrimeID = bFound ? LatestCreeping.ID : -1;

        if (Ctx.bIsPopulated &&
            Ctx.CachedEventTag == EventTag &&
            Ctx.CachedCriminalGlobalID == CriminalID &&
            Ctx.CachedCrimeID == LatestCrimeID)
        {
            // Re-evaluate the time-sensitive grace flag every read.
            UpdateReCreepGrace(Ctx, AI);
            return;
        }

        ResetContext(Ctx);

        Ctx.CachedEventTag = EventTag;
        Ctx.CachedCriminalGlobalID = CriminalID;
        Ctx.CachedCrimeID = LatestCrimeID;
        Ctx.CachedPopulationTime = FInGameTime::Now();

        if (!bFound)
        {
            UpdateReCreepGrace(Ctx, AI);
            Ctx.bIsPopulated = true;
            return;
        }

        Ctx.bHasCrimeEntry = true;
        Ctx.LatestCrimeTimeCommitted = LatestCreeping.TimeCommitted;
        Ctx.LatestCrimeEvaluatedSeverity = AI.CrimeProcessingSubsystem.EvaluateCrimeEntry(AI.CharacterState, LatestCreeping);
        Ctx.LatestCrimeSeverityLevel = AI.CrimeProcessingSubsystem.GetCrimeSeverityLevelFromValue(Ctx.LatestCrimeEvaluatedSeverity);

        CrimeContext::EnsurePreparedFor_Common(Ctx, AI, LatestCreeping, GetTuning(AI));

        if (!Ctx.bWitnessIsAreaEnforcer && CrimeContext::WitnessHasEnforcerRole(AI.CharacterState))
        {
            AGothicCharacterState CriminalState = AGothicCharacterState::FindByGlobalId(LatestCreeping.CriminalGlobalID);
            if (IsValid(CriminalState) && IsValid(CriminalState.Character) && IsValid(AI.Character) &&
                AI.IsInSameTerritoryOrCombatRadiusAsOtherCharacter(CriminalState.Character))
            {
                Ctx.bWitnessIsAreaEnforcer = true;
            }
        }

        PopulateCreepingMemoryStats(Ctx, AI, LatestCreeping);

        // Count-based override, per-creeping severity is too low for band thresholds; counts give a clean curve.
        UCrimeTuningConfig_Creeping CountTuning = GetTuning(AI);
        int Count = Ctx.CreepingCountByCriminalAgainstWitness;
        int EscalateAt = IsValid(CountTuning) ? CountTuning.CountForReputationEscalation : 2;
        int ExecuteAt = IsValid(CountTuning) ? CountTuning.CountForExecuteOnDefeat : 3;
        Ctx.bIsReputationEscalated = Count >= EscalateAt;
        Ctx.bIsReputationAtExecuteLevel = Count >= ExecuteAt;
        UpdateReCreepGrace(Ctx, AI);

        Ctx.bIsPopulated = true;
    }

    void ResetContext(UAIValueSet_Creeping Ctx)
    {
        Ctx.bIsPopulated = false;
        Ctx.bHasCrimeEntry = false;
        Ctx.CachedCriminalGlobalID = FName();
        Ctx.CachedCrimeID = -1;
        Ctx.CachedEventTag = FGameplayTag::Empty;

        Ctx.LatestCrimeTimeCommitted = FInGameTime();
        Ctx.LatestCrimeEvaluatedSeverity = 0.0f;
        Ctx.LatestCrimeSeverityLevel = ECrimeSeverityLevel::None;

        Ctx.bCriminalIsPartyMember = false;
        Ctx.bCriminalOutranksWitness = false;
        Ctx.bWitnessIsPersonalVictim = false;
        Ctx.bWitnessIsAreaEnforcer = false;
        Ctx.bVictimIsOutgroup = false;
        Ctx.bVictimOutranksWitness = false;
        Ctx.bWitnessIsCriminal = false;
        Ctx.bLatestCrimeForgiven = false;
        Ctx.bLatestCrimeSuppressed = false;
        Ctx.AccumulatedCrimeSeverityLevel = ECrimeSeverityLevel::None;
        Ctx.bIsReputationEscalated = false;
        Ctx.bIsReputationAtExecuteLevel = false;

        Ctx.bWithinReCreepGrace = false;
        Ctx.CreepingCountByCriminalAgainstWitness = 0;
        // LastResolvedAt is *not* cleared here on purpose: the grace clock is the
        // witness's memory of the previous resolution and survives cache misses.
    }

    bool FindLatestCreepingEntry(const UGameplayAbility_CharacterAI_Gothic AI, AGothicCharacterState Criminal, FCrimeEntry&out OutEntry)
    {
        if (!IsValid(AI) || !IsValid(AI.CharacterState) || !IsValid(AI.CrimeProcessingSubsystem) || !IsValid(Criminal))
            return false;

        TArray<FCrimeEntry> Candidates = AI.CrimeProcessingSubsystem
            .FilterRelativeCrimesOfWitness(AI.CharacterState)
            .ByCriminal(Criminal)
            .OfCrimeType(GameplayTag::Crime_Creeping)
            .GetFullCrimeDataArray();

        int BestIdx = -1;
        for (int i = 0; i < Candidates.Num(); ++i)
        {
            if (Candidates[i].bIsForgiven || Candidates[i].bIsSuppressed)
                continue;

            if (BestIdx < 0 ||
                Candidates[i].TimeCommitted.TotalSeconds > Candidates[BestIdx].TimeCommitted.TotalSeconds)
            {
                BestIdx = i;
            }
        }

        if (BestIdx < 0)
            return false;

        OutEntry = Candidates[BestIdx];
        return OutEntry.bIsValid;
    }

    void PopulateCreepingMemoryStats(UAIValueSet_Creeping Ctx, const UGameplayAbility_CharacterAI_Gothic AI, const FCrimeEntry&in Latest)
    {
        AGothicCharacterState Witness = AI.CharacterState;
        AGothicCharacterState Criminal = AGothicCharacterState::FindByGlobalId(Latest.CriminalGlobalID);
        if (!IsValid(Criminal))
            return;

        TArray<FCrimeEntry> ActiveEntries = AI.CrimeProcessingSubsystem
            .FilterRelativeCrimesOfWitness(Witness)
            .ByCriminal(Criminal)
            .OfCrimeType(GameplayTag::Crime_Creeping)
            .WithForgivenessValue(false)
            .GetFullCrimeDataArray();

        int Count = 0;
        for (auto Entry : ActiveEntries)
        {
            if (Entry.bIsSuppressed)
                continue;
            Count++;
        }
        Ctx.CreepingCountByCriminalAgainstWitness = Count;
    }

    void UpdateReCreepGrace(UAIValueSet_Creeping Ctx, const UGameplayAbility_CharacterAI_Gothic AI)
    {
        UCrimeTuningConfig_Creeping Tuning = GetTuning(AI);
        if (!IsValid(Tuning) || Tuning.ReCreepGraceSeconds <= 0.0f)
        {
            Ctx.bWithinReCreepGrace = false;
            return;
        }

        if (Ctx.LastResolvedAt.TotalSeconds <= 0.0f)
        {
            Ctx.bWithinReCreepGrace = false;
            return;
        }

        Ctx.bWithinReCreepGrace = Ctx.LastResolvedAt.AgeInRealtimeSeconds < Tuning.ReCreepGraceSeconds;
    }

    void StampPeacefulResolution(const UGameplayAbility_CharacterAI_Gothic AI)
    {
        if (!IsValid(AI))
            return;
        UAIValueSet_Creeping Ctx = AI.SpawnedStorage(UAIValueSet_Creeping);
        if (!IsValid(Ctx))
            return;
        Ctx.LastResolvedAt = FInGameTime::Now();
        UpdateReCreepGrace(Ctx, AI);
    }
}
