USTRUCT()
struct FEventResponseReason
{
    FEventResponseReason(FGameplayTag InResponse, FGameplayTag InReason)
    {
        Reason = InReason;
        Response = InResponse;
    }

    FGameplayTag Response;
    FGameplayTag Reason;
}

class UAIEventResponse_AssessCrime : UAIEventResponse_ProcessCrimes
{
    default Category = GameplayTag::AIResponse_Crime_Register;

    UAIEventResponse_AssessCrime(FGameplayTag CrimeType, EPerceptionCharacterType CriminalPerceptionCharacterType, EPerceptionCharacterType VictimPerceptionCharacterType)
    {
        _VictimPerceptionCharacterType = VictimPerceptionCharacterType;
        _PotentialCriminalPerceptionCharacterType = CriminalPerceptionCharacterType;
        _CrimeType = CrimeType;
    }

    UPROPERTY()
    protected EPerceptionCharacterType _VictimPerceptionCharacterType = EPerceptionCharacterType::None;

    UPROPERTY()    
    protected FGameplayTag _CrimeType;

#if WITH_IMGUI
    UFUNCTION(BlueprintOverride)
    void DrawImGui() const
    {
        Super::DrawImGui();        
    }
#endif

    /** Only attribute transformed crimes to the caster if this assessor witnessed the transform; otherwise keep wolf as criminal so NPC does not react to Hero later. */
    const float WitnessedTransformationMemoryMaxAgeSecondsForCrime = 600.0f;

    bool AssessorWitnessedCasterTransform(AGothicCharacterState Self, AGothicCharacterState ResolvedCaster) const
    {
        if (!IsValid(Self) || !IsValid(ResolvedCaster))
            return false;
        return Self.LongTermMemory.FilterEventsAffectingMe(GameplayTag::Memory_WitnessedTransformation)
            .CausedBy(ResolvedCaster.CharacterGlobalId)
            .AfterTime(FInGameTime::XRealtimeSecondsAgo(WitnessedTransformationMemoryMaxAgeSecondsForCrime))
            .Count >= 1;
    }

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        PerformResponseForCrimeType(_CrimeType, AIEvent, Perception, false);
    }

    void PerformResponseForCrimeType(FGameplayTag CrimeType, FGameplayTag AIEvent, FRememberedPerception Perception, bool bForceWitnessRegister) const
    {
        // Get main involved character states
        AGothicCharacterState Self = AI.CharacterState;
        AGothicCharacterState OriginalCriminal = TargetCharacterState(_PotentialCriminalPerceptionCharacterType, Perception);
        AGothicCharacterState CriminalCharacterState = nullptr;
        AGothicCharacterState ActualDamager = nullptr;

        CrimeProcessingSubsystem.ResolveCriminalForCrime(OriginalCriminal, CriminalCharacterState, ActualDamager);
        if (!IsValid(CriminalCharacterState))
        {
            CriminalCharacterState = OriginalCriminal;
        }

        // If we resolved to caster (wolf = Hero), only attribute crime to Hero when this assessor witnessed the transform; otherwise keep wolf as criminal so NPC does not react to Hero when they return as human.
        if (IsValid(ActualDamager) && !AssessorWitnessedCasterTransform(Self, CriminalCharacterState))
        {
            CriminalCharacterState = OriginalCriminal;
            ActualDamager = nullptr;
        }

        if (Self.HasGameplayTag(GameplayTag::State_IgnoreCrimes_Party) && Self.IsInPartyWith(CriminalCharacterState))
            return;

        AGothicCharacterState VictimCharacterState = TargetCharacterState(_VictimPerceptionCharacterType, Perception);

        // Find Criminal's current area tag
        FGameplayTagContainer AreaTagFilter;
        AreaTagFilter.AddTag(GameplayTag::Area);
        
        FGameplayTagContainer AreaTags = Perception.Instigator.Tags.Filter(AreaTagFilter);
        FGameplayTag AreaTag = FGameplayTag::Empty;
        if (!AreaTags.IsEmpty())
        {
            AreaTag = AreaTags.Last();
        }

        auto CrimeDefinition = CrimeProcessingSubsystem.GetCrimeDefinition(CrimeType);
        if (!IsValid(CrimeDefinition))
            return;
        
        if (CrimeDefinition.bPlayerOnly && !CriminalCharacterState.IsPlayerCharacter())
            return;

        auto NewCrimeRegisterData = CrimeProcessingSubsystem.MakeNewCrimeRegisterData(CrimeType, CriminalCharacterState, ActualDamager, VictimCharacterState, AreaTag, Perception.PerceivedObject);
        // Abort if CrimeRegisterData is not valid

        if (Perception.EventTag.MatchesTag(GameplayTag::Event_Perception_Crime))
        {
            bool bFailedCrimeCheckFound = false;
            for (auto FailedCrimeData : AI.SpawnedStorage(UAIValueSet_CrimeUpdateRecheck).CrimeNotFoundData)
            {
                if (!DoRegistersMatch(FailedCrimeData, NewCrimeRegisterData))
                    continue;

                bFailedCrimeCheckFound = true;
                break;
            }

            if (!bFailedCrimeCheckFound)
                return;
        }

        if (!NewCrimeRegisterData.bIsValid)
            return;
        
        FGlobalCrimeDataEntry GlobalCrimeData;
        if (bForceWitnessRegister ||
            (CrimeDefinition.RegistrationMode == ECrimeRegistrationMode::FromCriminal && CriminalCharacterState == Self) ||
            (CrimeDefinition.RegistrationMode == ECrimeRegistrationMode::FromVictim && VictimCharacterState == Self) ||
            CrimeDefinition.RegistrationMode == ECrimeRegistrationMode::FromWitness ||
            CrimeDefinition.RegistrationMode == ECrimeRegistrationMode::FromEvent)
        {
            // Register new crime
            int CrimeID = CrimeProcessingSubsystem.RegisterCrimeFromWitness(Self, NewCrimeRegisterData);
            if (CrimeID == -1)
                return;

            if (!CrimeMemory.GetCrimeByID(GlobalCrimeData, CrimeID))
                return;
        }
        else
        {
            if (!FindMatchingCrimeForCriminal(CriminalCharacterState, NewCrimeRegisterData, GlobalCrimeData))
            {
                AI.SpawnedStorage(UAIValueSet_CrimeUpdateRecheck).CrimeNotFoundData.Add(NewCrimeRegisterData);
                return;
            }
            
            if (CrimeDefinition.DurationType == ECrimeDurationType::Continuous)
            {
                FInGameTime NewTime = FInGameTime::Now();
                GlobalCrimeData.TimeCommitted = NewTime;
                CrimeMemory.ChangeCrimeTimeCommitted(GlobalCrimeData.ID, NewTime);
            }

            if (!CrimeMemory.CharacterHasRelativeCrime(Self, GlobalCrimeData.ID))
            {
                CrimeMemory.CreateRelativeMemoriesToCrime(Self, GlobalCrimeData.ID, ERelativeCrimeOrigin::Witness);
            }
        }

        FRelativeCrimeDataEntry RelativeCrimeData;
        if (!CrimeMemory.GetRelativeCrime(RelativeCrimeData, GlobalCrimeData.ID, Self))
            return;
        
        FCrimeEntry CrimeEntry = FCrimeEntry(GlobalCrimeData, RelativeCrimeData);

        if(!CrimeEntry.bIsValid)
            return;

        // Evaluate severity of the new crime
        float Severity = EvaluateCrimeEntry(CrimeEntry);

        // Evaluate cumulative crime value only if new crime is severity non 0
        if (Math::Abs(Severity) > 0.01f || CrimeType.MatchesTag(GameplayTag::Crime_Anti))
        {
            FCrimeSeverityResult SeverityResult = EvaluateCrimesInMemoryForCharacter(CriminalCharacterState);
            Severity = SeverityResult.NormalizedSeverity;
        }

        // Assess crime event for reaction
        AssessCrimeEvent(CrimeEntry, Severity);
    }

    UFUNCTION()
    bool DoRegistersMatch(FCrimeRegisterData CrimeRegisterData_A, FCrimeRegisterData CrimeRegisterData_B) const
    {
        if (CrimeRegisterData_B.TimeCommitted.AgeInRealtimeSeconds - CrimeRegisterData_A.TimeCommitted.AgeInRealtimeSeconds > 1)
            return false;

        if (CrimeRegisterData_A.AffectedEntitySource != CrimeRegisterData_B.AffectedEntitySource)
            return false;

        if (!CrimeRegisterData_A.CrimeType.MatchesTagExact(CrimeRegisterData_B.CrimeType))
            return false;

        if (CrimeRegisterData_A.AreaTag.IsValid() && !CrimeRegisterData_A.AreaTag.MatchesTagExact(CrimeRegisterData_B.AreaTag))
            return false;

        if (!CrimeRegisterData_A.VictimGuilds.HasAllExact(CrimeRegisterData_B.VictimGuilds) ||
            !CrimeRegisterData_A.VictimGuilds.HasAllExact(CrimeRegisterData_B.VictimGuilds))
            return false;

        if (CrimeRegisterData_A.VictimCharacterStates.Num() != CrimeRegisterData_B.VictimCharacterStates.Num())
            return false;

        bool bHasMatchingVictims = true;
        for (AGothicCharacterState VictimCharacterState : CrimeRegisterData_A.VictimCharacterStates)
        {
            if (CrimeRegisterData_B.VictimCharacterStates.Contains(VictimCharacterState))
                continue;

            bHasMatchingVictims = false;
        }

        if (!bHasMatchingVictims)
            return false;

        return true;
    }

    UFUNCTION()
    bool FindMatchingCrimeForCriminal(AGothicCharacterState CriminalCharacterState, FCrimeRegisterData CrimeRegisterData, FGlobalCrimeDataEntry&out GlobalCrimeData) const
    {
        if (!IsValid(CriminalCharacterState))
            return false;

        // Find existing matching crime
        auto GlobalCrimesByCriminal = CrimeMemory.GetAllCrimesCommitedBy(CriminalCharacterState);

        // Newest to oldest
        for (int i = GlobalCrimesByCriminal.Num() - 1; i >= 0; i--)
        {
            int CandidateCrimeID = GlobalCrimesByCriminal[i];

            FGlobalCrimeDataEntry CandidateGlobalCrimeData;
            if (!CrimeMemory.GetCrimeByID(CandidateGlobalCrimeData, CandidateCrimeID))
                continue;
            
            if (CandidateGlobalCrimeData.bIsForgiven)
                continue;

            if (CandidateGlobalCrimeData.AffectedEntitySource != CrimeRegisterData.AffectedEntitySource)
                continue;

            if (!CandidateGlobalCrimeData.CrimeType.MatchesTagExact(CrimeRegisterData.CrimeType))
                continue;

            if (CandidateGlobalCrimeData.AreaTag.IsValid() && !CandidateGlobalCrimeData.AreaTag.MatchesTagExact(CrimeRegisterData.AreaTag))
                continue;

            if (!CandidateGlobalCrimeData.VictimGuilds.HasAllExact(CrimeRegisterData.VictimGuilds) ||
                !CrimeRegisterData.VictimGuilds.HasAllExact(CandidateGlobalCrimeData.VictimGuilds))
                continue;

            if (CandidateGlobalCrimeData.VictimGlobalIDs.Num() != CrimeRegisterData.VictimCharacterStates.Num())
                continue;

            bool bHasMatchingVictims = true;
            for (AGothicCharacterState VictimCharacter : CrimeRegisterData.VictimCharacterStates)
            {
                if (CandidateGlobalCrimeData.VictimGlobalIDs.Contains(VictimCharacter.CharacterGlobalId))
                    continue;

                bHasMatchingVictims = false;
            }

            if (!bHasMatchingVictims)
                continue;

            GlobalCrimeData = CandidateGlobalCrimeData;
            return true;
        }

        return false;
    }

    /** Raises a crime Assessment Event for the latest crime with the accumulated normalized severity as the magnitude */
    UFUNCTION(BlueprintCallable)
    void AssessCrimeEvent(FCrimeEntry CrimeEntry, float NormalizedCrimeSeverity) const
    {
        FRememberedPerception FakePerception;
        
        if (!CreateAssessmentPerceptionFromCrime(FakePerception, CrimeEntry, NormalizedCrimeSeverity))
            return;
        
        // Pass final event to assessment system for reaction
        AI.AssessEventWithExtraTags(FakePerception.EventTag, FakePerception, FakePerception.ContextTags);
    }
}

/** Picks guild vs person trespass crime (mirrors CharacterAI_Gothic::PerceptionEvent_CharacterSeenInArea) then registers via AssessCrime. */
class UAIEventResponse_AssessStillPresentTrespassCrime : UAIEventResponse_AssessCrime
{
    UAIEventResponse_AssessStillPresentTrespassCrime(EPerceptionCharacterType CriminalPerceptionCharacterType)
    {
        _VictimPerceptionCharacterType = EPerceptionCharacterType::None;
        _PotentialCriminalPerceptionCharacterType = CriminalPerceptionCharacterType;
        _CrimeType = GameplayTag::Crime_Trespassing_OnGuild;
    }

    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        AGothicCharacterState OriginCharacterState = TargetCharacterState(_PotentialCriminalPerceptionCharacterType, Perception);
        if (!IsValid(OriginCharacterState))
            return;

        auto TrespassingContext = OriginCharacterState.GetTrespassingContextFor(AI.CharacterState);
        switch (TrespassingContext.Result)
        {
            case ETrespassingResult::Trespassing_OnPerson_Self:
            case ETrespassingResult::Trespassing_OnPerson_Friendly:
                PerformResponseForCrimeType(GameplayTag::Crime_Trespassing_OnPerson, AIEvent, Perception, true);
                return;
            case ETrespassingResult::Trespassing_OnGuild_Self:
            case ETrespassingResult::Trespassing_OnGuild_Friendly:
                PerformResponseForCrimeType(GameplayTag::Crime_Trespassing_OnGuild, AIEvent, Perception, true);
                return;
            default:
                return;
        }
    }
}

class UAIEventResponse_CheckUnresolvedConflict : UAIEventResponse_SingleTargetDetermined
{
    UAIEventResponse_CheckUnresolvedConflict(EPerceptionCharacterType _TargetType)
    {
        TargetType = _TargetType;
    }

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        auto CharacterToCheck = GetTargetCharacterState(Perception);

        auto JoinFightMemories = AI.CharacterState.LongTermMemory.Filter()
            .WithTag(GameplayTag::Memory_Conflict_JoinedFight)
            .CausedBy(AI.CharacterState.CharacterGlobalId)
            .Affecting(CharacterToCheck.CharacterGlobalId).ArrayOldestToNewest;
        
        if (JoinFightMemories.IsEmpty())
            return;

        auto LastJoinFightMemory = JoinFightMemories.Last();

        auto DefeatedMemories = CharacterToCheck.LongTermMemory.Filter()
            .WithTag(GameplayTag::Memory_Character_Defeated)
            .AfterTime(LastJoinFightMemory.Time).ArrayOldestToNewest;
        
        for (auto DefeatedMemory : DefeatedMemories)
        {
            auto Defeater = DefeatedMemory.GetInstigatorCharacterState();
            if (AI.CharacterState.IsFriendlyTowards(Defeater) || 
                AI.CharacterState.IsProtecting(Defeater) || 
                Defeater.IsProtecting(AI.CharacterState))
                return;
        }

        AI.AssessEvent(GameplayTag::AIEvent_UnresolvedConflictFight, Perception);
    }
}

class UAIEventResponse_EvaluatePastCrimes : UAIEventResponse_ProcessCrimes
{
    default Category = FGameplayTag::Empty;

    UAIEventResponse_EvaluatePastCrimes(EPerceptionCharacterType PotentialCriminalPerceptionCharacterType)
    {
        _PotentialCriminalPerceptionCharacterType = PotentialCriminalPerceptionCharacterType;
    }

    UPROPERTY()
    protected EPerceptionCharacterType _VictimPerceptionCharacterType = EPerceptionCharacterType::None;

#if WITH_IMGUI
    UFUNCTION(BlueprintOverride)
    void DrawImGui() const
    {
        Super::DrawImGui();
        
    }
#endif

    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        AGothicCharacterState PotentialCriminalCharacterState = TargetCharacterState(_PotentialCriminalPerceptionCharacterType, Perception);

        if (PotentialCriminalCharacterState.IsDead())
            return;

        if (AI.CharacterState.IsFriendlyTowards(PotentialCriminalCharacterState))
            return;

        // Evaluate perceived character's past crimes
        // Get worst crime committed by criminal
        FCrimeSeverityResult SeverityResult = EvaluateCrimesInMemoryForCharacter(PotentialCriminalCharacterState);

        if (!SeverityResult.IsValid())
            return;

        if (!SeverityResult.MostSevereCrime.bIsValid || SeverityResult.NormalizedSeverity < 0.0f)
            return;

        // Assess crimes
        AssessPastCrimeEvent(SeverityResult.MostSevereCrime, SeverityResult.NormalizedSeverity);
    }

    /** Raises a crime Assessment Event for the latest crime with the accumulated normalized severity as the magnitude */
    UFUNCTION(BlueprintCallable)
    void AssessPastCrimeEvent(FCrimeEntry WorstCrimeEntry, float NormalizedCrimeSeverity) const
    {
        // Fake perception to send information to the assessment system
        FRememberedPerception FakePerception;
        if (!CreateAssessmentPerceptionFromCrime(FakePerception, WorstCrimeEntry, NormalizedCrimeSeverity))
            return;
        
        FakePerception.EventTag = GameplayTag::AIEvent_Seen_PastCrimeInstigator;
        FakePerception.ContextTags.AddTag(WorstCrimeEntry.CrimeType);

        // Pass worst crime type to inform reaction
        FGameplayTagContainer EventExtraTags;
        EventExtraTags.AddTag(WorstCrimeEntry.CrimeType);

        // Pass final event to assessment system for reaction
        AI.AssessEventWithExtraTags(FakePerception.EventTag, FakePerception, EventExtraTags);
    }
}

class UAIEventResponse_UpdateCrimeSeverityTowardsPlayer : UGothicAIEventResponse
{
    default Category = FGameplayTag::Empty;
    
    UFUNCTION(BlueprintOverride)
    void PerformResponse(FGameplayTag AIEvent, FRememberedPerception Perception) const
    {
        AI.UpdateCrimeSeverityTowardsPlayer();
    }
}

UCLASS(Abstract)
class UAIEventResponse_ProcessCrimes : UAIEventResponse_SingleTarget
{
    UAIEventResponse_ProcessCrimes(EPerceptionCharacterType CriminalPerceptionCharacterType)
    {
        _PotentialCriminalPerceptionCharacterType = CriminalPerceptionCharacterType;
    }

    UPROPERTY()
    protected EPerceptionCharacterType _PotentialCriminalPerceptionCharacterType = EPerceptionCharacterType::None;

    UCrimeProcessingSubsystem GetCrimeProcessingSubsystem() const property
    {
        return AI.CrimeProcessingSubsystem;
    }

    UCrimeMemorySubsystem GetCrimeMemory() const property
    {
        return UCrimeMemorySubsystem::Get(AI);
    }

    UFUNCTION(BlueprintCallable)
    FCrimeSeverityResult EvaluateCrimesInMemoryForCharacter(AGothicCharacterState Criminal) const
    {
        return CrimeProcessingSubsystem.EvaluateCrimesInMemoryForCharacter(AI.CharacterState, Criminal);
    }

    UFUNCTION(BlueprintCallable)
    float EvaluateCrimeEntry(FCrimeEntry CrimeEntry) const
    {
        return CrimeProcessingSubsystem.EvaluateCrimeEntry(AI.CharacterState, CrimeEntry);
    }

    UFUNCTION()
    bool CreateAssessmentPerceptionFromCrime(FRememberedPerception&out RememberedPerception, FCrimeEntry CrimeEntry, float NormalizedCrimeSeverity) const
    {
        return CrimeProcessingSubsystem.CreateAssessmentPerceptionFromCrime(RememberedPerception, CrimeEntry, NormalizedCrimeSeverity);
    }
}