/**
 * PickpocketEvaluationContext
 */
class UAIValueSet_Pickpocket : UAIValueSet_Crime
{
    // --- Crime-agnostic cached facts ---
    bool bIsPopulated = false;
    FName CachedCriminalGlobalID;
    int CachedCrimeID = -1;
    FGameplayTag CachedEventTag;
    FInGameTime CachedPopulationTime;

    // --- Core perception info ---
    bool bHasCrimeEntry = false;
    FGameplayTag CrimeType;
    float PerceivedCumulativeSeverity = 0.0f;
    float LatestCrimeEvaluatedSeverity = 0.0f;
    ECrimeSeverityLevel PerceivedSeverityLevel = ECrimeSeverityLevel::None;
    ECrimeSeverityLevel LatestCrimeSeverityLevel = ECrimeSeverityLevel::None;
    FInGameTime LatestCrimeTimeCommitted;

    // --- Pickpocket-specific fields ---
    bool bAttemptSucceeded = false;
    bool bAttemptFailed = false;
    float ItemValue = 0.0f;
    TSubclassOf<UItemDefinition> ItemDefinitionClass;
    int PickpocketCountByCriminalAgainstWitness = 0;
    int PickpocketFailCountByCriminalAgainstWitness = 0;
}

namespace PickpocketContext
{
    bool IsPickpocketEventTag(FGameplayTag EventTag)
    {
        if (EventTag.MatchesTag(GameplayTag::Crime_Pickpocket))
            return true;

        if (EventTag.MatchesTag(GameplayTag::AIEvent_Seen_PastCrimeInstigator))
            return true;

        return false;
    }

    UAIValueSet_Pickpocket FetchContext(const UGameplayAbility_CharacterAI_Gothic AI, FRememberedPerception Perception)
    {
        if (!ensure(IsValid(AI)))
            return nullptr;
        if (!ensure(IsValid(AI.CrimeProcessingSubsystem)))
            return nullptr;

        return GetCurrent(AI, Perception);
    }

    UCrimeTuningConfig_Pickpocket GetTuning(const UGameplayAbility_CharacterAI_Gothic AI)
    {
        if (!IsValid(AI) || !IsValid(AI.CrimeProcessingSubsystem))
            return nullptr;

        return AI.CrimeProcessingSubsystem.PickpocketTuning;
    }

    UAIValueSet_Pickpocket GetCurrent(const UGameplayAbility_CharacterAI_Gothic AI, FRememberedPerception Perception)
    {
        if (!IsValid(AI))
            return nullptr;

        UAIValueSet_Pickpocket Ctx = AI.SpawnedStorage(UAIValueSet_Pickpocket);
        if (!IsValid(Ctx))
            return nullptr;

        EnsurePreparedFor(Ctx, AI, Perception);
        return Ctx;
    }

    /** Populate Ctx from AI + Perception if stale; idempotent when already populated for the same pickpocket. */
    void EnsurePreparedFor(UAIValueSet_Pickpocket Ctx, const UGameplayAbility_CharacterAI_Gothic AI, FRememberedPerception Perception)
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

        FCrimeEntry LatestPickpocket;
        bool bFound = FindLatestPickpocketEntry(AI, Criminal, LatestPickpocket);

        int LatestCrimeID = bFound ? LatestPickpocket.ID : -1;

        if (Ctx.bIsPopulated &&
            Ctx.CachedEventTag == EventTag &&
            Ctx.CachedCriminalGlobalID == CriminalID &&
            Ctx.CachedCrimeID == LatestCrimeID)
        {
            return;
        }

        ResetContext(Ctx);

        Ctx.CachedEventTag = EventTag;
        Ctx.CachedCriminalGlobalID = CriminalID;
        Ctx.CachedCrimeID = LatestCrimeID;
        Ctx.CachedPopulationTime = FInGameTime::Now();
        Ctx.PerceivedCumulativeSeverity = Perception.Magnitude;
        Ctx.PerceivedSeverityLevel = AI.CrimeProcessingSubsystem.GetCrimeSeverityLevelFromValue(Perception.Magnitude);

        if (!bFound)
        {
            Ctx.bIsPopulated = true;
            return;
        }

        Ctx.bHasCrimeEntry = true;
        Ctx.CrimeType = LatestPickpocket.CrimeType;
        Ctx.LatestCrimeTimeCommitted = LatestPickpocket.TimeCommitted;
        Ctx.LatestCrimeEvaluatedSeverity = AI.CrimeProcessingSubsystem.EvaluateCrimeEntry(AI.CharacterState, LatestPickpocket);
        Ctx.LatestCrimeSeverityLevel = AI.CrimeProcessingSubsystem.GetCrimeSeverityLevelFromValue(Ctx.LatestCrimeEvaluatedSeverity);

        // Delegate all crime-agnostic fields (including reputation escalation flags) to the shared populator.
        CrimeContext::EnsurePreparedFor_Common(Ctx, AI, LatestPickpocket, GetTuning(AI));

        PopulateAttemptOutcome(Ctx, LatestPickpocket);
        PopulateItemFacts(Ctx, AI, LatestPickpocket);
        PopulatePickpocketMemoryStats(Ctx, AI, LatestPickpocket);

        Ctx.bIsPopulated = true;
    }

    void ResetContext(UAIValueSet_Pickpocket Ctx)
    {
        Ctx.bIsPopulated = false;
        Ctx.bHasCrimeEntry = false;
        Ctx.CachedCriminalGlobalID = FName();
        Ctx.CachedCrimeID = -1;
        Ctx.CachedEventTag = FGameplayTag::Empty;

        Ctx.CrimeType = FGameplayTag::Empty;
        Ctx.PerceivedCumulativeSeverity = 0.0f;
        Ctx.LatestCrimeEvaluatedSeverity = 0.0f;
        Ctx.PerceivedSeverityLevel = ECrimeSeverityLevel::None;
        Ctx.LatestCrimeSeverityLevel = ECrimeSeverityLevel::None;
        Ctx.LatestCrimeTimeCommitted = FInGameTime();

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

        Ctx.bAttemptSucceeded = false;
        Ctx.bAttemptFailed = false;
        Ctx.ItemValue = 0.0f;
        Ctx.ItemDefinitionClass = nullptr;
        Ctx.PickpocketCountByCriminalAgainstWitness = 0;
        Ctx.PickpocketFailCountByCriminalAgainstWitness = 0;
    }

    bool FindLatestPickpocketEntry(const UGameplayAbility_CharacterAI_Gothic AI, AGothicCharacterState Criminal, FCrimeEntry&out OutEntry)
    {
        if (!IsValid(AI) || !IsValid(AI.CharacterState) || !IsValid(AI.CrimeProcessingSubsystem) || !IsValid(Criminal))
            return false;

        TArray<FCrimeEntry> Candidates = AI.CrimeProcessingSubsystem
            .FilterRelativeCrimesOfWitness(AI.CharacterState)
            .ByCriminal(Criminal)
            .OfCrimeType(GameplayTag::Crime_Pickpocket)
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

    void PopulateAttemptOutcome(UAIValueSet_Pickpocket Ctx, const FCrimeEntry&in Pickpocket)
    {
        Ctx.bAttemptSucceeded = Pickpocket.CrimeType.MatchesTag(GameplayTag::Crime_Pickpocket_Success);
        Ctx.bAttemptFailed = Pickpocket.CrimeType.MatchesTag(GameplayTag::Crime_Pickpocket_Fail);
    }

    /** Item is only registered for Success entries. Fail entries leave ItemValue / ItemDefinitionClass at defaults. */
    void PopulateItemFacts(UAIValueSet_Pickpocket Ctx, const UGameplayAbility_CharacterAI_Gothic AI, const FCrimeEntry&in Pickpocket)
    {
        Ctx.ItemDefinitionClass = Pickpocket.ItemDefinitionClass;
        if (!IsValid(Pickpocket.ItemDefinitionClass))
            return;

        UItemDefinition ItemDefault = Pickpocket.ItemDefinitionClass.GetDefaultObject();
        if (!IsValid(ItemDefault))
            return;

        Ctx.ItemValue = ItemDefault.m_Value;
    }

    void PopulatePickpocketMemoryStats(UAIValueSet_Pickpocket Ctx, const UGameplayAbility_CharacterAI_Gothic AI, const FCrimeEntry&in Pickpocket)
    {
        AGothicCharacterState Witness = AI.CharacterState;
        AGothicCharacterState Criminal = AGothicCharacterState::FindByGlobalId(Pickpocket.CriminalGlobalID);

        if (!IsValid(Criminal))
            return;

        TArray<FCrimeEntry> ActivePickpockets = AI.CrimeProcessingSubsystem
            .FilterRelativeCrimesOfWitness(Witness)
            .ByCriminal(Criminal)
            .OfCrimeType(GameplayTag::Crime_Pickpocket)
            .WithForgivenessValue(false)
            .GetFullCrimeDataArray();

        // Decay window: fail entries older than this threshold are excluded from combat-escalation
        UCrimeTuningConfig_Pickpocket Tuning = Cast<UCrimeTuningConfig_Pickpocket>(AI.CrimeProcessingSubsystem.PickpocketTuning);
        float DecayWindowSec = (IsValid(Tuning) && Tuning.FailCountDecayWindowSeconds > 0.0f)
            ? Tuning.FailCountDecayWindowSeconds
            : MAX_flt;

        int Count = 0;
        int FailCount = 0;
        for (auto Entry : ActivePickpockets)
        {
            if (Entry.bIsSuppressed)
                continue;
            Count++;
            if (Entry.CrimeType.MatchesTag(GameplayTag::Crime_Pickpocket_Fail) &&
                Entry.TimeCommitted.AgeInRealtimeSeconds < DecayWindowSec)
                FailCount++;
        }
        Ctx.PickpocketCountByCriminalAgainstWitness = Count;
        Ctx.PickpocketFailCountByCriminalAgainstWitness = FailCount;
    }
}
