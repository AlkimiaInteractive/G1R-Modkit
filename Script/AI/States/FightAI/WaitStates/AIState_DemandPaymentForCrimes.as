class UAIState_DemandPaymentForCrimes : UAIState_PerceptionResponse
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Wait_DemandPaymentForCrimes);
    default AIStateTag = GameplayTag::AIState_Wait_DemandPaymentForCrimes;
    default StateGroupClass = UAIGroup_Warning_Theft;

    UPROPERTY()
	FInGameTime AttackTime;

    UPROPERTY()
    AGothicCharacterState Criminal;

    UPROPERTY()
    float LeaveDistance = MAX_flt;

	UPROPERTY(EditDefaultsOnly)
	float TimeUntilAttack = 15.0f;

    UPROPERTY(EditDefaultsOnly)
    float BaseMaxDistance = 1000.0f;

    UPROPERTY(EditDefaultsOnly)
    float MinimumLeaveDistanceDelta = 350.0f;

    UPROPERTY()
    bool bEndAssessmentDone = false;

    UPROPERTY()
    bool bHasWarned = false;

    UPROPERTY()
    FInGameTime _TimeForWarning;

    FInGameTime GetTimeForWarning() const property
    {
        auto WarningGroup = Cast<UAIGroup_Warning_Base>(StateGroup);
        if (!IsValid(WarningGroup))
            return _TimeForWarning;

        return WarningGroup.TimeForWarning;
    }

    void SetTimeForWarning()
    {
        _TimeForWarning = FInGameTime::XRealtimeSecondsFromNow(TimeUntilAttack / 2.0f);

        auto WarningGroup = Cast<UAIGroup_Warning_Base>(StateGroup);
        if (!IsValid(WarningGroup))
            return;

        WarningGroup.TimeForWarning = FInGameTime::XRealtimeSecondsFromNow(TimeUntilAttack / 2.0f);
    }

    UFUNCTION(BlueprintOverride)
    void DoTask() final
    {
        Super::DoTask();

        Criminal = RememberedPerception.Instigator.CharacterState;
        if (!IsValid(Criminal))
        {
            EndTaskAsFailure();
        }

        LeaveDistance = Math::Max(CharacterState.GetDistanceTo(Criminal) + MinimumLeaveDistanceDelta, BaseMaxDistance);
        SetTimeToAttack();
        SetTimeForWarning();

		while (!bShouldExitState)
		{
            if (bEndAssessmentDone)
            {
                WaitSeconds(5.0f);
                EndTaskAsFailure();
                return;
            }

			if (!IsValid(CharacterOfInterest))
			{
				AI.AssessEvent(GameplayTag::AIEvent_State_Done, RememberedPerception);
                bEndAssessmentDone = true;
				WaitOneTick();
				continue;
			}

            if (!bHasWarned && TimeForWarning.IsTimeInThePast())
            {
                FGenericVoicelineRequestContext VoicelineContext;
                VoicelineContext.TagsOther.AddTag(GameplayTag::VoicelineContext_Pay);
                AI.CharacterState.Voiceline.SayVoicelineWithContext(
                    GameplayTag::Sound_Voice_Reaction_Warning_InsistPayUpForCrimes, 
                    CharacterOfInterest.CharacterState,
                    VoicelineContext, 
                    EPerceptionNoiseLoudness::Loud
                );

                bHasWarned = true;
            }

			if (CharacterState.GetDistanceTo(Criminal) > LeaveDistance || IsItTimeToAttack())
			{
                FRememberedPerception Perception;
                Perception.Instigator.Character = TargetCharacter;

                AI.AssessEvent(GameplayTag::AIEvent_TargetRefusedToPayFine, Perception);
                bEndAssessmentDone = true;
			}

			WaitOneTick();
		}
    }

    bool IsItTimeToAttack()
	{
		return FInGameTime::IsAfter(FInGameTime::Now(), AttackTime);
	}

	void SetTimeToAttack()
	{
		AttackTime = FInGameTime::XRealtimeSecondsFromNow(TimeUntilAttack);
	}

    FString GetDisplayName() const override
    {
        return "Demand Payment for Crimes";
    }
}