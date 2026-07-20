/**
 * CrimeEvaluationContext
 *
 * Base value-set for all crime-type assessment contexts, plus the shared population
 * logic and the cross-crime dispatch entry point used by generic assessment predicates.
 *
 * --- ARCHITECTURE ---
 * UAIValueSet_Crime         — base class owned by AI.SpawnedStorage; holds the 10 common
 *                             crime facts plus the accumulated severity level for ImGui.
 *                             Crime-type value-sets inherit from this.
 * CrimeContext::EnsurePreparedFor_Common
 *                           — populates all UAIValueSet_Crime fields from a FCrimeEntry,
 *                             witness AI, and a UCrimeTuningConfig_Base. Crime-type
 *                             EnsurePreparedFor implementations call this first, then
 *                             populate their own specific fields.
 * CrimeContext::FetchCrimeContext
 *                           — dispatches on EventTag to the correct crime-type context
 *                             and returns UAIValueSet_Crime (safe upcast from subclass).
 *                             Assessment predicates in AssessmentBits.as call this; they
 *                             never know the concrete type.
 *
 * --- EXTENSION RECIPE (adding a new crime type) ---
 *   1. Create UAIValueSet_X : UAIValueSet_Crime with any X-specific fields.
 *   2. Create XContext::EnsurePreparedFor that calls CrimeContext::EnsurePreparedFor_Common
 *      first, then populates X-specific fields.
 *   3. Add a dispatch branch for the new EventTag(s) in CrimeContext::FetchCrimeContext.
 *   4. Register any X-specific predicates in AssessmentBits.as with self-describing names.
 */

UCLASS()
class UAIValueSet_Crime : UAIValueSet
{
    // --- Criminal vs witness rank ---
    UPROPERTY() bool bCriminalIsPartyMember = false;
    UPROPERTY() bool bCriminalOutranksWitness = false;

    // --- Witness role ---
    UPROPERTY() bool bWitnessIsPersonalVictim = false;
    UPROPERTY() bool bWitnessIsAreaEnforcer = false;
    UPROPERTY() bool bVictimIsOutgroup = false;
    UPROPERTY() bool bVictimOutranksWitness = false;
    // NPCs should never perceive their own crimes, but this guards against
    // any future registration path where that invariant is broken.
    UPROPERTY() bool bWitnessIsCriminal = false;

    // --- Latest matching crime entry ---
    UPROPERTY() bool bLatestCrimeForgiven = false;
    UPROPERTY() bool bLatestCrimeSuppressed = false;

    // --- Accumulated severity vs this witness (all crime types from criminal) ---
    UPROPERTY() ECrimeSeverityLevel AccumulatedCrimeSeverityLevel = ECrimeSeverityLevel::None;
    UPROPERTY() bool bIsReputationEscalated = false;
    UPROPERTY() bool bIsReputationAtExecuteLevel = false;
}

namespace CrimeContext
{
    /** Fills all UAIValueSet_Crime fields; crime-type EnsurePreparedFor calls this first. */
    void EnsurePreparedFor_Common(
        UAIValueSet_Crime Ctx,
        const UGameplayAbility_CharacterAI_Gothic AI,
        const FCrimeEntry&in Entry,
        const UCrimeTuningConfig_Base Tuning)
    {
        if (!IsValid(Ctx) || !IsValid(AI) || !IsValid(AI.CharacterState) || !IsValid(AI.CrimeProcessingSubsystem))
            return;

        AGothicCharacterState Witness = AI.CharacterState;

        Ctx.bCriminalIsPartyMember = Entry.bCriminalIsInPartyWithWitness;
        Ctx.bCriminalOutranksWitness =
            Entry.RelativeRankTowardsCriminal == ERelationshipRelativeRank::HigherThanMe ||
            Entry.RelativeRankTowardsCriminal == ERelationshipRelativeRank::Boss;

        AGothicCharacterState CriminalState = AGothicCharacterState::FindByGlobalId(Entry.CriminalGlobalID);
        if (IsValid(CriminalState) && IsValid(Witness))
            Ctx.bWitnessIsCriminal = CriminalState == Witness;

        bool bWitnessGuildIsVictim = false;
        bool bWitnessIsFriendOfPersonalVictim = false;

        // Theft is inherently Direct, so this is a no-op for the current call sites but correct-by-construction for future ports.
        bool bDirectCrime = Entry.Directness == ECrimeDirectness::Direct;

        for (auto VictimHandle : Entry.VictimCharacterHandles)
        {
            if (bDirectCrime && VictimHandle.VictimGlobalID == Witness.CharacterGlobalId)
                Ctx.bWitnessIsPersonalVictim = true;

            if (VictimHandle.RelationshipTowardsPerson == ERelationship::Friend)
                bWitnessIsFriendOfPersonalVictim = true;
        }

        for (auto GuildHandle : Entry.VictimGuildHandles)
        {
            if (Witness.Guild.MatchesTag(GuildHandle.Guild))
            {
                bWitnessGuildIsVictim = true;
                break;
            }
        }

        Ctx.bWitnessIsAreaEnforcer = ResolveWitnessIsAreaEnforcer(AI, Entry);

        Ctx.bVictimIsOutgroup =
            !Ctx.bWitnessIsPersonalVictim &&
            !bWitnessGuildIsVictim &&
            !bWitnessIsFriendOfPersonalVictim;

        Ctx.bVictimOutranksWitness = false;
        for (auto VictimHandle : Entry.VictimCharacterHandles)
        {
            if (VictimHandle.RelativeRankTowardsPerson == ERelationshipRelativeRank::HigherThanMe ||
                VictimHandle.RelativeRankTowardsPerson == ERelationshipRelativeRank::Boss)
            {
                Ctx.bVictimOutranksWitness = true;
                break;
            }
        }

        // Ctx.bLatestCrimeForgiven = Entry.bIsForgiven;
        Ctx.bLatestCrimeSuppressed = Entry.bIsSuppressed;

        if (IsValid(CriminalState))
        {
            auto AccumulatedSeverityResult = AI.CrimeProcessingSubsystem
                .EvaluateCrimesInMemoryForCharacter(Witness, CriminalState);
            Ctx.AccumulatedCrimeSeverityLevel = AI.CrimeProcessingSubsystem
                .GetCrimeSeverityLevelFromValue(AccumulatedSeverityResult.NormalizedSeverity);

            ECrimeSeverityLevel EscalationBand = IsValid(Tuning)
                ? Tuning.ReputationEscalationLevel
                : ECrimeSeverityLevel::High;
            Ctx.bIsReputationEscalated = Ctx.AccumulatedCrimeSeverityLevel >= EscalationBand;

            ECrimeSeverityLevel ExecuteBand = IsValid(Tuning)
                ? Tuning.ExecuteOnDefeatLevel
                : ECrimeSeverityLevel::Critical;
            Ctx.bIsReputationAtExecuteLevel = Ctx.AccumulatedCrimeSeverityLevel >= ExecuteBand;
        }
    }

    bool WitnessHasEnforcerRole(AGothicCharacterState Witness)
    {
        if (!IsValid(Witness))
            return false;
        return Witness.HasGameplayTag(GameplayTag::CampRole_Guard)
            || Witness.HasGameplayTag(GameplayTag::CampRole_Leadership)
            || Witness.HasGameplayTag(GameplayTag::Role_BodyGuard)
            || Witness.HasGameplayTag(GameplayTag::CampRole_Boss);
    }

    bool ResolveWitnessIsAreaEnforcer(const UGameplayAbility_CharacterAI_Gothic AI, const FCrimeEntry&in Entry)
    {
        AGothicCharacterState Witness = AI.CharacterState;
        if (!IsValid(Witness) || !WitnessHasEnforcerRole(Witness))
            return false;

        if (Entry.AreaTag.IsValid())
        {
            TSet<AGothicCharacterState> OwningCharacters =
                AI.CrimeProcessingSubsystem.GetEventAreaOwningCharacterStates(Entry.AreaTag);
            if (OwningCharacters.Contains(Witness))
                return true;

            FGameplayTagContainer OwningGuilds =
                AI.CrimeProcessingSubsystem.GetEventAreaOwningGuilds(Entry.AreaTag);
            if (Witness.Guild.MatchesAny(OwningGuilds))
                return true;

            return false;
        }

        AGothicCharacterState CriminalState = AGothicCharacterState::FindByGlobalId(Entry.CriminalGlobalID);
        if (!IsValid(CriminalState) || !IsValid(CriminalState.Character) || !IsValid(AI.Character))
            return false;

        return AI.IsInSameTerritoryOrCombatRadiusAsOtherCharacter(CriminalState.Character);
    }

    /** Typed crime context for predicates; extend with new branches when adding crime types. */
    UAIValueSet_Crime FetchCrimeContext(
        const UGameplayAbility_CharacterAI_Gothic AI,
        FGameplayTag EventTag,
        FRememberedPerception Perception)
    {
        if (!IsValid(AI) || !IsValid(AI.CrimeProcessingSubsystem))
            return nullptr;

        if (EventTag.MatchesTag(GameplayTag::Crime_Theft) ||
            EventTag.MatchesTag(GameplayTag::AIEvent_Crime_Theft))
        {
            return Cast<UAIValueSet_Crime>(TheftContext::GetCurrent(AI, Perception));
        }

        if (EventTag.MatchesTag(GameplayTag::Crime_Pickpocket) ||
            EventTag.MatchesTag(GameplayTag::AIEvent_Crime_Pickpocket))
        {
            return Cast<UAIValueSet_Crime>(PickpocketContext::GetCurrent(AI, Perception));
        }

        if (EventTag.MatchesTag(GameplayTag::Crime_Creeping) ||
            EventTag.MatchesTag(GameplayTag::AIEvent_Crime_Creeping_EscalateToWarning) ||
            EventTag.MatchesTag(GameplayTag::AIEvent_Crime_Creeping_WarningTimedOut))
        {
            return Cast<UAIValueSet_Crime>(CreepingContext::GetCurrent(AI, Perception));
        }

        // Route to the per-crime context for past-crime-instigator sightings.
        if (EventTag.MatchesTag(GameplayTag::AIEvent_Seen_PastCrimeInstigator))
        {
            if (Perception.ContextTags.HasTag(GameplayTag::Crime_Theft))
                return Cast<UAIValueSet_Crime>(TheftContext::GetCurrent(AI, Perception));
            if (Perception.ContextTags.HasTag(GameplayTag::Crime_Pickpocket))
                return Cast<UAIValueSet_Crime>(PickpocketContext::GetCurrent(AI, Perception));
            if (Perception.ContextTags.HasTag(GameplayTag::Crime_Creeping))
                return Cast<UAIValueSet_Crime>(CreepingContext::GetCurrent(AI, Perception));
            return nullptr;
        }

        // Route to the per-crime context for the generic guard-escort handoff event.
        if (EventTag.MatchesTag(GameplayTag::AIEvent_Guard_ConfrontedCriminalAtCrimeScene))
        {
            if (Perception.ContextTags.HasTag(GameplayTag::Crime_Theft))
                return Cast<UAIValueSet_Crime>(TheftContext::GetCurrent(AI, Perception));
            // TODO Trespassing: if (Perception.ContextTags.HasTag(GameplayTag::Crime_Trespassing))     return Cast<UAIValueSet_Crime>(TrespassingContext::GetCurrent(AI, Perception));
            // TODO Interaction: if (Perception.ContextTags.HasTag(GameplayTag::Crime_Interaction))     return Cast<UAIValueSet_Crime>(InteractionContext::GetCurrent(AI, Perception));
            // TODO Lockpicking: if (Perception.ContextTags.HasTag(GameplayTag::Crime_Lockpicking))     return Cast<UAIValueSet_Crime>(LockpickingContext::GetCurrent(AI, Perception));
            return nullptr;
        }

        return nullptr;
    }
}
