namespace BlockingPathWaitBalance
{
	/** Frustration count sentinel: must stay above any realistic tally. Personality / relation rules return this so skip-wait and combat-escalation checks never fire. Keep in sync with AssessmentBits blocking-path helpers. */
	const int FrustrationEscalationSuppressed = 999;
	/** Lowest effective threshold after bravery / guard / strength modifiers (still escalates after one stacked episode if base was 1). */
	const int MinimumEffectiveFrustrationThreshold = 1;
	/** Rare fallback when GothicAI storage is invalid inside ComputeEffectiveThreshold. */
	const int FrustrationEffectiveThresholdFallbackNoAI = 2;
	/** Orc subclass: fixed effective threshold for orcs. */
	const int OrcForcedEffectiveFrustrationThreshold = 1;
}

class UAIValueSet_BlockingPath : UAIValueSet
{
	// --- Runtime / scene context (driven by events, not primary tuning) ---

	TOptional<FVector> InitialConflictPosition;
	/** Cached forward at emit; Wait/Warning use for cone checks. */
	FVector InitialBlockingFacingDirection = FVector::ZeroVector;
	/** Forward at routine start for stationary blocking. */
	FVector StationaryForwardDirection = FVector::ZeroVector;
	/** >0: personal space radius in cm from daily routine; 0 = Wait state uses collision radius * multiplier instead. */
	float ActiveBlockingPathPersonalSpaceRadiusCm = 0.0f;
	/** True when blocked path was emitted while the blocked NPC was pathfollowing. */
	bool bWasPathfollowingAtBlockEmit = false;
	/** Resolved at emit from the daily-routine override. When false and bWasPathfollowingAtBlockEmit is false, Wait skips EscalateToWarning and Warning skips EscalateToCombat. */
	bool bAllowEscalationWhileStationary = true;

	// ------------------------------------------------------------------------------------
	//     Frustration window (episodes before distributors escalate to Warning/Combat)    
	// ------------------------------------------------------------------------------------

	/** Base number of stacked blocking episodes before assessment treats NPC as ready to escalate. Higher = calmer. */
	int BlockingPathFrustrationThreshold = 4;
	/** Realtime seconds; if no frustration increment for this long, BlockingPathFrustrationCount returns to 0. */
	float BlockingPathFrustrationWindowDuration = 45.0f;

	// --- Runtime: frustration tally (driven by Wait/Warning; compared against effective threshold after modifiers) ---

	/** Current tally inside BlockingPathFrustrationWindowDuration; resets when the window elapses. */
	int BlockingPathFrustrationCount = 0;
	FInGameTime BlockingPathWindowStart;

	// -----------------------------------------------------------------------------------------------------------------------
	//     Burst blocking (jitter / step-aside abuse). Happens when blocking path is cleared quickly due to NPC avoidance.    
	// -----------------------------------------------------------------------------------------------------------------------

	/** Realtime seconds; burst counter resets if the blocker keeps clearing longer than this between entries. */
	float BlockingPathNoLongerBlockedWindowDuration = 12.0f;
	/** How many quick re-entries with "no longer blocked" must happen before entry path can emit EscalateToWarning (when still not physically blocking). */
	int BlockingPathNoLongerBlockedBurstThreshold = 2;

	/**
	 * Minimum burst count to play the light MakeWay voiceline on exit when escalation threshold was not reached.
	 * If BlockingPathNoLongerBlockedBurstThreshold is raised above this, players hear the cue on repeated micro-blocks before a full warning candidate fires.
	 */
	int BlockingPathNoLongerBlockedVoiceCueBurstMin = 2;

	// --- Runtime: burst tally (increments on Entry_NoLongerBlocked; compared against thresholds above) ---

	int BlockingPathNoLongerBlockedBurstCount = 0;
	FInGameTime BlockingPathNoLongerBlockedBurstWindowStart;

	// ---------------------------------------------------------------
	//     Daily routine emit / soft gating (see DailyRoutines_OG)    
	// ---------------------------------------------------------------

	/** Seconds to wait after sensing overlap before treating stationary block as confirmed (reduces flicker). Keep low to reduce turnarounds */
	float BlockConfirmationDelay = 0.3f;
	/** Minimum seconds between AIEvent_Seen_CharacterBlockingPath assessments for the same flow. */
	float BlockReassessCooldownSeconds = 2.5f;
	/** Soft signals (overlap without hard path block) required before emit when not using forced emit. */
	int BlockSoftSignalThreshold = 2;
	/** Multiplies simple collision radius when no custom personal-space radius is stored (non-stationary). */
	float BlockPersonalSpaceRadiusMultiplier = 5.0f;
	/** After defeat-by-blocker, seconds in which we treat escalation as suppressed; 0 = indefinite immunity while that defeat memory exists. */
	float BlockingPathDefeatImmunityDurationSeconds = 0.0f;
	/** Seconds after a conversation ends where blocking-path percepts are ignored (prevents immediate re-bark). */
	float PostConversationGraceSeconds = 4.0f;

	// --- Runtime: emit / assess bookkeeping ---

	bool bBlockingPathFrustrationIncrementedThisCycle = false;
	bool bHasEmittedBlockingPathAssess = false;
	FInGameTime LastBlockingPathAssessTime;
	int BlockSoftSignalCount = 0;
	FInGameTime PostConversationGraceStart;
	bool bPostConversationGraceActive = false;
	int BlockingPathLastEffectiveThreshold = BlockingPathWaitBalance::FrustrationEffectiveThresholdFallbackNoAI;
}

class UAIState_WaitForBlockedPath : UAIState_PerceptionResponse
{
	default OwnedGameplayTags.AddTag(GameplayTag::AIState_Wait_BlockedPath);
	default AIStateTag = GameplayTag::AIState_Wait_BlockedPath;
	default SwitchAIStateMode = ESwitchAIStateMode::Interrupt;
	default EndInteractionMode = ESwitchAIStateEndInteractionMode::None;

	/** Multiplies Self simple collision radius when SpawnedStorage has no custom ActiveBlockingPathPersonalSpaceRadiusCm. */
	UPROPERTY(EditDefaultsOnly, Category = "Blocking Path")
	float PersonalSpaceRadiusMultiplier = 5.0f;

	/**
	 * When using a custom personal-space radius, the blocker must sit inside a forward cone from InitialBlockingFacingDirection.
	 * Dot product between 2D "to blocker" and recorded forward; 1 = straight ahead, 0 = 90° half-angle, 0.5 ≈ 60° total cone.
	 */
	UPROPERTY(EditDefaultsOnly, Category = "Blocking Path")
	float InitialFacingConeDotProductMin = 0.5f;

	UPROPERTY()
	protected AGothicCharacter BlockingCharacter;

	/** Realtime seconds per "pity" timer before the next voiceline or final escalation emit while still blocked. */
	UPROPERTY(EditDefaultsOnly, Category = "Blocking Path")
	float WaitPityTimeSeconds = 5.0f;

	float GetActivePersonalSpaceRadius() const
	{
		auto GothicAI = Cast<UGameplayAbility_CharacterAI_Gothic>(AI);
		if (IsValid(GothicAI))
		{
			float Stored = GothicAI.SpawnedStorage(UAIValueSet_BlockingPath).ActiveBlockingPathPersonalSpaceRadiusCm;
			if (Stored > 0.0f)
				return Stored;
		}
		return Self.GetSimpleCollisionRadius() * PersonalSpaceRadiusMultiplier;
	}

	/** Returns true when the blocking character is within the initial-facing cone recorded at emit time. */
	bool IsBlockerInInitialFacingCone() const
	{
		if (!IsValid(BlockingCharacter))
			return false;

		auto GothicAI = Cast<UGameplayAbility_CharacterAI_Gothic>(AI);
		if (IsValid(GothicAI))
		{
			FVector InitDir = GothicAI.SpawnedStorage(UAIValueSet_BlockingPath).InitialBlockingFacingDirection;
			if (!InitDir.IsNearlyZero())
			{
				FVector ToBlocker = (BlockingCharacter.GetActorLocation() - Self.GetActorLocation()).GetSafeNormal2D();
				return ToBlocker.DotProduct(InitDir.GetSafeNormal2D()) > InitialFacingConeDotProductMin;
			}
		}
		return Self.IsFacingOtherCharacter(BlockingCharacter);
	}

	bool WasPathfollowingAtBlockEmit() const
	{
		auto GothicAI = Cast<UGameplayAbility_CharacterAI_Gothic>(AI);
		if (!IsValid(GothicAI))
			return true;
		return GothicAI.SpawnedStorage(UAIValueSet_BlockingPath).bWasPathfollowingAtBlockEmit;
	}

	bool ShouldEscalateGivenStationaryGate() const
	{
		if (WasPathfollowingAtBlockEmit())
			return true;

		auto GothicAI = Cast<UGameplayAbility_CharacterAI_Gothic>(AI);
		if (!IsValid(GothicAI))
			return true;
		return GothicAI.SpawnedStorage(UAIValueSet_BlockingPath).bAllowEscalationWhileStationary;
	}

	bool IsCharacterStillBlockingPath() const
	{
		if (!IsValid(BlockingCharacter))
			return false;

		float Radius = GetActivePersonalSpaceRadius();
		float Dist = Self.GetDistanceTo(BlockingCharacter);
		if (Dist > Radius)
			return false;

		auto GothicAI = Cast<UGameplayAbility_CharacterAI_Gothic>(AI);
		bool bUsingCustomRadius = IsValid(GothicAI)
			&& GothicAI.SpawnedStorage(UAIValueSet_BlockingPath).ActiveBlockingPathPersonalSpaceRadiusCm > 0.0f;

		if (bUsingCustomRadius)
			return IsBlockerInInitialFacingCone();

		if (Self.IsPathBlockedByGivenCharacter(BlockingCharacter, false))
			return true;

		return Self.IsFacingOtherCharacter(BlockingCharacter);
	}

	void SelectCharacterOfInterest()
	{
		if (!IsCharacterStillBlockingPath())
		{
			CharacterOfInterest = nullptr;
		}

		if (CharacterOfInterest == nullptr)
			return;

		AI.TargetCharacterOfInterest(FocusPriority, this);
	}

	int ComputeEffectiveThreshold() const
	{
		auto GothicAI = Cast<UGameplayAbility_CharacterAI_Gothic>(AI);
		int Effective = BlockingPathWaitBalance::FrustrationEffectiveThresholdFallbackNoAI;
		if (IsValid(GothicAI))
			Effective = GothicAI.SpawnedStorage(UAIValueSet_BlockingPath).BlockingPathFrustrationThreshold;

		if (IsValid(BlockingCharacter) && CharacterState.IsInPartyWith(BlockingCharacter.CharacterState))
			return BlockingPathWaitBalance::FrustrationEscalationSuppressed;

		if (IsValid(BlockingCharacter) && CharacterState.IsFriendlyTowards(BlockingCharacter.CharacterState))
			return BlockingPathWaitBalance::FrustrationEscalationSuppressed;

		if (IsValid(BlockingCharacter) && BlockingCharacter.IsStrongerThan(Self))
			return BlockingPathWaitBalance::FrustrationEscalationSuppressed;

		if (CharacterState.ShouldActCoward())
			return BlockingPathWaitBalance::FrustrationEscalationSuppressed;

		if (CharacterState.IsPatientPersonality())
			return BlockingPathWaitBalance::FrustrationEscalationSuppressed;

		if (IsValid(BlockingCharacter) && IsValid(BlockingCharacter.CharacterState))
		{
			if (IsValid(GothicAI))
			{
				float DefeatImmunityDuration = GothicAI.SpawnedStorage(UAIValueSet_BlockingPath).BlockingPathDefeatImmunityDurationSeconds;
				if (DefeatImmunityDuration > 0.0f)
				{
					if (CharacterState.WasDefeatedBy(BlockingCharacter.CharacterState, FInGameTime::XRealtimeSecondsAgo(DefeatImmunityDuration)))
						return BlockingPathWaitBalance::FrustrationEscalationSuppressed;
				}
				else if (CharacterState.WasDefeatedBy(BlockingCharacter.CharacterState))
				{
					return BlockingPathWaitBalance::FrustrationEscalationSuppressed;
				}
			}
			else if (CharacterState.WasDefeatedBy(BlockingCharacter.CharacterState))
			{
				return BlockingPathWaitBalance::FrustrationEscalationSuppressed;
			}
		}

		if (CharacterState.ShouldActBrave())
			Effective = Math::Max(BlockingPathWaitBalance::MinimumEffectiveFrustrationThreshold, Effective - 1);

		if (CharacterState.HasGameplayTag(GameplayTag::CampRole_Guard))
			Effective = Math::Max(BlockingPathWaitBalance::MinimumEffectiveFrustrationThreshold, Effective - 1);

		if (IsValid(BlockingCharacter) && Self.IsStrongerThan(BlockingCharacter))
			Effective = Math::Max(BlockingPathWaitBalance::MinimumEffectiveFrustrationThreshold, Effective - 1);

		return Effective;
	}

	/** Builds escalation perception with RelativeRank propagated from the original crime event. */
	FRememberedPerception MakeEscalationPerception() const
	{
		FRememberedPerception Perception;
		if (CharacterOfInterest != nullptr)
		{
			Perception.Instigator.CharacterState = CharacterOfInterest.CharacterState;
			Perception.Instigator.Character = CharacterOfInterest;
			Perception.Origin.CharacterState = CharacterOfInterest.CharacterState;
			Perception.Origin.Character = CharacterOfInterest;
		}
		Perception.Affected.CharacterState = CharacterState;
		Perception.Origin.RelativeRank = RememberedPerception.Origin.RelativeRank;
		return Perception;
	}

	void IncrementFrustrationForCycle(UGameplayAbility_CharacterAI_Gothic GothicAI, const FString&in Reason)
	{
		if (!IsValid(GothicAI))
			return;

		auto BlockingPathStorage = GothicAI.SpawnedStorage(UAIValueSet_BlockingPath);
		float WindowDuration = BlockingPathStorage.BlockingPathFrustrationWindowDuration;
		if (BlockingPathStorage.BlockingPathWindowStart.AgeInRealtimeSeconds > WindowDuration)
			BlockingPathStorage.BlockingPathFrustrationCount = 0;

		BlockingPathStorage.BlockingPathWindowStart = FInGameTime::Now();
		BlockingPathStorage.BlockingPathFrustrationCount++;
		BlockingPathStorage.bBlockingPathFrustrationIncrementedThisCycle = true;
		Log(f"[BlockPath] State:Wait FrustrationIncrement Reason={Reason} (Frustration={BlockingPathStorage.BlockingPathFrustrationCount} Window={WindowDuration}s)");
	}

	void EmitDistributedEscalation(const FRememberedPerception&in Perception, const FString&in Reason)
	{
		auto GothicAI = Cast<UGameplayAbility_CharacterAI_Gothic>(AI);
		int PersistentFrustration = -1;
		int EffectiveThreshold = -1;
		int BurstCount = -1;
		int BurstThreshold = -1;
		if (IsValid(GothicAI))
		{
			auto BlockingPathStorage = GothicAI.SpawnedStorage(UAIValueSet_BlockingPath);
			PersistentFrustration = BlockingPathStorage.BlockingPathFrustrationCount;
			EffectiveThreshold = BlockingPathStorage.BlockingPathLastEffectiveThreshold;
			BurstCount = BlockingPathStorage.BlockingPathNoLongerBlockedBurstCount;
			BurstThreshold = BlockingPathStorage.BlockingPathNoLongerBlockedBurstThreshold;
		}

		// Stationary NPC with escalation disabled by daily routine override ends the cycle quietly instead of waking Warning.
		if (!ShouldEscalateGivenStationaryGate())
		{
			Log(f"[BlockPath][DIST] WaitEmit Suppressed Reason={Reason} (Stationary + AllowEscalationStationary=false; Frustration={PersistentFrustration} Threshold={EffectiveThreshold} Burst={BurstCount}/{BurstThreshold}) -> StateDone");
			AI.AssessEvent(GameplayTag::AIEvent_State_Done, RememberedPerception);
			return;
		}

		Log(f"[BlockPath][DIST] WaitEmit DistributeEscalation Reason={Reason} (Frustration={PersistentFrustration} Threshold={EffectiveThreshold} Burst={BurstCount}/{BurstThreshold})");
		AI.AssessEvent(GameplayTag::AIEvent_BlockingPath_EscalateToWarning, Perception);
	}

	bool WaitPityPhaseAndCheckStillBlocked(const FString&in PhaseName)
	{
		FInGameTime PhaseStart = FInGameTime::Now();
		while (!bShouldExitState && PhaseStart.AgeInRealtimeSeconds < WaitPityTimeSeconds)
		{
			SelectCharacterOfInterest();
			if (CharacterOfInterest == nullptr || !IsCharacterStillBlockingPath())
			{
				Log(f"[BlockPath] State:Wait {PhaseName}_BlockerGone -> StateDone");
				AI.AssessEvent(GameplayTag::AIEvent_State_Done, RememberedPerception);
				return false;
			}

			WaitOneTick();
		}

		return !bShouldExitState && IsCharacterStillBlockingPath();
	}

	UFUNCTION(BlueprintOverride)
	void DoTask() final
	{
		Super::DoTask();

		BlockingCharacter = CharacterOfInterest;
		bool bEntryBlockerValid = IsValid(BlockingCharacter);
		auto GothicAI = Cast<UGameplayAbility_CharacterAI_Gothic>(AI);
		bool bHasBlockingPathStorage = IsValid(GothicAI);
		float EntryDistanceToBlocker = bEntryBlockerValid ? Self.GetDistanceTo(BlockingCharacter) : -1.0f;
		float EntryPersonalRadius = GetActivePersonalSpaceRadius();
		bool bEntryStillBlocking = bEntryBlockerValid && IsCharacterStillBlockingPath();
		Log(f"[BlockPath][WAIT] EntryEval (BlockerValid={bEntryBlockerValid} Dist={EntryDistanceToBlocker} Radius={EntryPersonalRadius} EntryStillBlocking={bEntryStillBlocking})");
		if (!bEntryStillBlocking)
		{
			if (bHasBlockingPathStorage)
			{
				auto BlockingPathStorage = GothicAI.SpawnedStorage(UAIValueSet_BlockingPath);
				float BurstWindowAge = BlockingPathStorage.BlockingPathNoLongerBlockedBurstWindowStart.AgeInRealtimeSeconds;
				if (BurstWindowAge > BlockingPathStorage.BlockingPathNoLongerBlockedWindowDuration)
				{
					Log(f"[BlockPath] State:Wait Entry_NoLongerBlocked BurstResetByWindow (Age={BurstWindowAge}s > Window={BlockingPathStorage.BlockingPathNoLongerBlockedWindowDuration}s, PrevBurst={BlockingPathStorage.BlockingPathNoLongerBlockedBurstCount})");
					BlockingPathStorage.BlockingPathNoLongerBlockedBurstCount = 0;
				}

				BlockingPathStorage.BlockingPathNoLongerBlockedBurstCount++;
				BlockingPathStorage.BlockingPathNoLongerBlockedBurstWindowStart = FInGameTime::Now();
				Log(f"[BlockPath] State:Wait Entry_NoLongerBlocked Burst={BlockingPathStorage.BlockingPathNoLongerBlockedBurstCount}/{BlockingPathStorage.BlockingPathNoLongerBlockedBurstThreshold} (Window={BlockingPathStorage.BlockingPathNoLongerBlockedWindowDuration}s)");

				if (bEntryBlockerValid && BlockingPathStorage.BlockingPathNoLongerBlockedBurstCount >= BlockingPathStorage.BlockingPathNoLongerBlockedBurstThreshold)
				{
					int EffectiveThreshold = ComputeEffectiveThreshold();
					BlockingPathStorage.BlockingPathLastEffectiveThreshold = EffectiveThreshold;
					// Stationary + AllowEscalationStationary=false: skip frustration increment.
					if (ShouldEscalateGivenStationaryGate())
						IncrementFrustrationForCycle(GothicAI, "EntryNoLongerBlockedBurst");
					else
						Log(f"[BlockPath] State:Wait FrustrationIncrementSuppressed Reason=EntryNoLongerBlockedBurst (Stationary + AllowEscalationStationary=false)");

					FRememberedPerception Perception = MakeEscalationPerception();
					BlockingPathStorage.BlockingPathNoLongerBlockedBurstCount = 0;

					Log(f"[BlockPath] State:Wait Entry_NoLongerBlocked BurstThresholdReached -> DistributeEscalation (WarningCandidate)");
					EmitDistributedEscalation(Perception, "EntryNoLongerBlockedBurst_WarningCandidate");
					return;
				}

				if (bEntryBlockerValid && BlockingPathStorage.BlockingPathNoLongerBlockedBurstCount >= BlockingPathStorage.BlockingPathNoLongerBlockedVoiceCueBurstMin)
				{
					Log(f"[BlockPath] State:Wait Entry_NoLongerBlocked -> AI.Say(MakeWay) (MicroBlock Burst={BlockingPathStorage.BlockingPathNoLongerBlockedBurstCount})");
					AskToMoveOutOfTheWay(GameplayTag::Sound_Voice_Reaction_Blocking_MakeWay, BlockingCharacter);
				}
			}
			Log(f"[BlockPath] State:Wait Entry_NoLongerBlocked -> StateDone (Blocker: {BlockingCharacter})");
			Log(f"[BlockPath][WAIT] Entry_NoLongerBlocked -> StateDone");
			AI.AssessEvent(GameplayTag::AIEvent_State_Done, RememberedPerception);
			return;
		}

		// Keep burst history across short re-block/release jitter so micro-block abuse can accumulate.
		// Window-based expiry in Entry_NoLongerBlocked controls stale bursts.

		Log(f"[BlockPath] State:Wait Entry_StillBlocked (Blocker: {BlockingCharacter})");
		Log(f"[BlockPath][WAIT] Entry_StillBlocked -> BeginPityFlow");
		EnableStrafeMovementAndTurnToTargetMode();
		AI.TargetCharacterOfInterest(FocusPriority, this);
		Log(f"[BlockPath] State:Wait FacingSetup done");

		AskToMoveOutOfTheWay(GameplayTag::Sound_Voice_Reaction_Blocking_MakeWay, BlockingCharacter);

		int EffectiveThreshold = ComputeEffectiveThreshold();
		if (bHasBlockingPathStorage)
		{
			auto BlockingPathStorage = GothicAI.SpawnedStorage(UAIValueSet_BlockingPath);
			BlockingPathStorage.BlockingPathLastEffectiveThreshold = EffectiveThreshold;
			// Stationary + AllowEscalationStationary=false: keep tally at 0 so AIARM SkipWaitToWarning never triggers and the NPC stays in Wait.
			if (ShouldEscalateGivenStationaryGate())
				IncrementFrustrationForCycle(GothicAI, "EntryStillBlocked");
			else
				Log(f"[BlockPath] State:Wait FrustrationIncrementSuppressed Reason=EntryStillBlocked (Stationary + AllowEscalationStationary=false)");
			Log(f"[BlockPath] State:Wait Frustration={BlockingPathStorage.BlockingPathFrustrationCount}/{EffectiveThreshold} (Base: {BlockingPathStorage.BlockingPathFrustrationThreshold})");
		}

		bool bStillBlockedAfterFirstPity = WaitPityPhaseAndCheckStillBlocked("Pity1");
		if (!bStillBlockedAfterFirstPity)
			return;

		Log(f"[BlockPath] State:Wait Pity1_Expired -> AI.Say(InsistMakeWay)");
		AskToMoveOutOfTheWay(GameplayTag::Sound_Voice_Reaction_Blocking_InsistMakeWay, BlockingCharacter);

		bool bStillBlockedAfterSecondPity = WaitPityPhaseAndCheckStillBlocked("Pity2");
		if (!bStillBlockedAfterSecondPity)
			return;

		if (!bShouldExitState)
		{
			FRememberedPerception Perception = MakeEscalationPerception();
			Log(f"[BlockPath] State:Wait Pity2_Expired_StillBlocked -> DistributeEscalation (WarningCandidate)");
			Log(f"[BlockPath][WAIT] Pity2_Expired_StillBlocked -> EmitDistributedEscalation");
			EmitDistributedEscalation(Perception, "Pity2Expired_StillBlocked_WarningCandidate");
		}
	}

	void AskToMoveOutOfTheWay(FGameplayTag VoicelineTag, AGothicCharacter Target)
	{
		if (WasPathfollowingAtBlockEmit())
		{
			AI.Say(VoicelineTag, EPerceptionNoiseLoudness::Moderate, Target);
			return;
		}

		AI.Say(GameplayTag::Sound_Voice_Reaction_Interjection_Angry, EPerceptionNoiseLoudness::Moderate, Target);
		AI.OutOfTheWayHere();
	}

	FString GetDisplayName() const override
	{
		return "Wait for blocked path";
	}
}

class UAIState_WaitForBlockedPath_Orc : UAIState_WaitForBlockedPath
{
	default WaitPityTimeSeconds = 2.5f;

	int ComputeEffectiveThreshold() const override
	{
		return BlockingPathWaitBalance::OrcForcedEffectiveFrustrationThreshold;
	}

	void AskToMoveOutOfTheWay(FGameplayTag VoicelineTag, AGothicCharacter Target) override
	{
		AI.Say(VoicelineTag, EPerceptionNoiseLoudness::Moderate, Target);
	}

	FString GetDisplayName() const override
	{
		return "Wait for blocked path (Orc)";
	}
}
