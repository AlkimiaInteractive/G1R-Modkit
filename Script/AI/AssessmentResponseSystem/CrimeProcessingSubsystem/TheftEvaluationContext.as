/**
 * TheftEvaluationContext
 *
 * Per-AI cache of resolved theft-specific facts. Inherits from UAIValueSet_Crime
 * (CrimeEvaluationContext.as) which holds all crime-agnostic cached facts.
 * TheftContext::EnsurePreparedFor delegates common-field population to
 * CrimeContext::EnsurePreparedFor_Common, then populates theft-only fields.
 * Helper methods also held here (not in AssessmentBits):
 */
enum ETheftStakes
{
    None,
    LowStakes,
    HighStakes,
    ETheftStakes_MAX
}

class UAIValueSet_Theft : UAIValueSet_Crime
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

    // --- Theft-specific fields ---
    float ItemValue = 0.0f;
    TSubclassOf<UItemDefinition> ItemDefinitionClass;
    ETheftStakes ItemStakes = ETheftStakes::None;
    ETheftStakes CircumstanceStakes = ETheftStakes::None;
    int TheftCountByCriminalAgainstWitness = 0;
}

namespace TheftContext
{
    bool IsTheftEventTag(FGameplayTag EventTag)
    {
        if (EventTag.MatchesTag(GameplayTag::Crime_Theft))
            return true;

        if (EventTag.MatchesTag(GameplayTag::AIEvent_Seen_PastCrimeInstigator))
            return true;

        return false;
    }

    UAIValueSet_Theft FetchContext(const UGameplayAbility_CharacterAI_Gothic AI, FRememberedPerception Perception)
    {
        if (!ensure(IsValid(AI)))
            return nullptr;
        if (!ensure(IsValid(AI.CrimeProcessingSubsystem)))
            return nullptr;

        return GetCurrent(AI, Perception);
    }

    UCrimeTuningConfig_Theft GetTuning(const UGameplayAbility_CharacterAI_Gothic AI)
    {
        if (!IsValid(AI) || !IsValid(AI.CrimeProcessingSubsystem))
            return nullptr;

        return AI.CrimeProcessingSubsystem.TheftTuning;
    }

    UAIValueSet_Theft GetCurrent(const UGameplayAbility_CharacterAI_Gothic AI, FRememberedPerception Perception)
    {
        if (!IsValid(AI))
            return nullptr;

        UAIValueSet_Theft Ctx = AI.SpawnedStorage(UAIValueSet_Theft);
        if (!IsValid(Ctx))
            return nullptr;

        EnsurePreparedFor(Ctx, AI, Perception);
        return Ctx;
    }

    /** Populate Ctx from AI + Perception if stale; idempotent when already populated for the same theft. */
    void EnsurePreparedFor(UAIValueSet_Theft Ctx, const UGameplayAbility_CharacterAI_Gothic AI, FRememberedPerception Perception)
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

        FCrimeEntry LatestTheft;
        bool bFound = FindLatestTheftEntry(AI, Criminal, LatestTheft);

        int LatestCrimeID = bFound ? LatestTheft.ID : -1;

        // Cache hit: same event tag + same criminal + same latest crime ID
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
        Ctx.CrimeType = LatestTheft.CrimeType;
        Ctx.LatestCrimeTimeCommitted = LatestTheft.TimeCommitted;
        Ctx.LatestCrimeEvaluatedSeverity = AI.CrimeProcessingSubsystem.EvaluateCrimeEntry(AI.CharacterState, LatestTheft);
        Ctx.LatestCrimeSeverityLevel = AI.CrimeProcessingSubsystem.GetCrimeSeverityLevelFromValue(Ctx.LatestCrimeEvaluatedSeverity);

        // Delegate all crime-agnostic fields (including reputation escalation flags) to the shared populator.
        CrimeContext::EnsurePreparedFor_Common(Ctx, AI, LatestTheft, GetTuning(AI));

        PopulateItemFacts(Ctx, AI, LatestTheft);
        PopulateCircumstanceFacts(Ctx, AI, LatestTheft, Perception);
        PopulateTheftMemoryStats(Ctx, AI, LatestTheft);

        Ctx.bIsPopulated = true;
    }

    void ResetContext(UAIValueSet_Theft Ctx)
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

        Ctx.ItemValue = 0.0f;
        Ctx.ItemDefinitionClass = nullptr;
        Ctx.ItemStakes = ETheftStakes::None;
        Ctx.CircumstanceStakes = ETheftStakes::None;
        Ctx.TheftCountByCriminalAgainstWitness = 0;
    }

    // TODO(future): "latest by TimeCommitted" is stable for today's rule shapes because all
    // WarningEscalation rules only check role predicates which are stable across multiple
    // thefts by the same criminal against the same witness. If a warning-escalation rule
    // ever consumes item-stakes predicates (TheftStakesAreHigh, etc.), the active-theft CrimeID
    // must be threaded through the emitted perception (e.g. as a tag or magnitude cookie) so
    // this function can look up by ID and fall back to "latest" only when no ID is present.
    bool FindLatestTheftEntry(const UGameplayAbility_CharacterAI_Gothic AI, AGothicCharacterState Criminal, FCrimeEntry&out OutEntry)
    {
        if (!IsValid(AI) || !IsValid(AI.CharacterState) || !IsValid(AI.CrimeProcessingSubsystem) || !IsValid(Criminal))
            return false;

        TArray<FCrimeEntry> Candidates = AI.CrimeProcessingSubsystem
            .FilterRelativeCrimesOfWitness(AI.CharacterState)
            .ByCriminal(Criminal)
            .OfCrimeType(GameplayTag::Crime_Theft)
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

    void PopulateItemFacts(UAIValueSet_Theft Ctx, const UGameplayAbility_CharacterAI_Gothic AI, const FCrimeEntry&in Theft)
    {
        Ctx.ItemDefinitionClass = Theft.ItemDefinitionClass;
        if (!IsValid(Theft.ItemDefinitionClass))
            return;

        UItemDefinition ItemDefault = Theft.ItemDefinitionClass.GetDefaultObject();
        if (!IsValid(ItemDefault))
            return;

        Ctx.ItemValue = ItemDefault.m_Value;

        UCrimeTuningConfig_Theft Tuning = GetTuning(AI);
        float LowClamp = IsValid(Tuning) ? Tuning.LowValueClamp : 2.0f;
        float HighClamp = IsValid(Tuning) ? Tuning.HighValueClamp : 5.0f;

        bool bItemIsLowValue = Ctx.ItemValue < LowClamp;
        bool bItemIsHighValue = Ctx.ItemValue > HighClamp;

        if (bItemIsHighValue)
            Ctx.ItemStakes = ETheftStakes::HighStakes;
        else if (bItemIsLowValue)
            Ctx.ItemStakes = ETheftStakes::LowStakes;
        else
            Ctx.ItemStakes = ETheftStakes::None;
    }

    void PopulateCircumstanceFacts(UAIValueSet_Theft Ctx, const UGameplayAbility_CharacterAI_Gothic AI, const FCrimeEntry&in Theft, const FRememberedPerception&in Perception)
    {
        // A theft from a personal victim who was unconscious at the time counts as aggravating for Humans, neutral for Orcs.
        bool bTheftFromUnconsciousCharacter = false;
        if (Theft.AffectedEntitySource == ECrimeAffectedEntitySource::Item &&
            !Theft.VictimCharacterHandles.IsEmpty())
        {
            for (auto VictimHandle : Theft.VictimCharacterHandles)
            {
                AGothicCharacterState VictimState = AGothicCharacterState::FindByGlobalId(VictimHandle.VictimGlobalID);
                if (IsValid(VictimState) && VictimState.IsDefeated())
                {
                    bTheftFromUnconsciousCharacter = true;
                    break;
                }
            }
        }

        UCrimeTuningConfig_Theft Tuning = GetTuning(AI);
        if (bTheftFromUnconsciousCharacter && IsValid(Tuning))
            Ctx.CircumstanceStakes = Tuning.UnconsciousLootingStakes;
        else
            Ctx.CircumstanceStakes = ETheftStakes::None;
    }

    void PopulateTheftMemoryStats(UAIValueSet_Theft Ctx, const UGameplayAbility_CharacterAI_Gothic AI, const FCrimeEntry&in Theft)
    {
        AGothicCharacterState Witness = AI.CharacterState;
        AGothicCharacterState Criminal = AGothicCharacterState::FindByGlobalId(Theft.CriminalGlobalID);

        if (!IsValid(Criminal))
            return;

        TArray<FCrimeEntry> ActiveThefts = AI.CrimeProcessingSubsystem
            .FilterRelativeCrimesOfWitness(Witness)
            .ByCriminal(Criminal)
            .OfCrimeType(GameplayTag::Crime_Theft)
            .WithForgivenessValue(false)
            .GetFullCrimeDataArray();

        int Count = 0;
        for (auto Entry : ActiveThefts)
        {
            if (!Entry.bIsSuppressed)
                Count++;
        }
        Ctx.TheftCountByCriminalAgainstWitness = Count;
    }
}
