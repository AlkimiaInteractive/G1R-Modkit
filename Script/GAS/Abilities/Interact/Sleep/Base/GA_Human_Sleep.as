class UGA_Human_Sleep : UGameplayAbilitySleep
{
	default m_InteractionTaskClass = UAbilityTask_Interaction_Player_SitAndSleep::StaticClass();

    default m_RecoverAttributesBySleepingEffect = UGE_RecoverAttributesBySleeping::StaticClass();
    default m_DecreaseSleepTimeEffect = UGE_DecreaseSleepTime::StaticClass();
    default m_OwnBedStatusEffect = UGE_Sleeping_OwnBed::StaticClass();

	default m_TimeBetweenFadeOutAndFadeIn = 4.0f;
	default m_TimeBetweenStartAndSit = 2.0f;
	default m_TimeBetweenSitAndFadeOut = 2.0f;

	default m_FadeSetup.m_Duration = 2.0f;
	default m_FadeSetup.m_Color = FLinearColor::Black;
	default m_FadeSetup.m_TargetAlpha = 1.0f;
	default m_FadeSetup.m_FadeAudio = false;
	default m_FadeSetup.m_LerpType = EAbilityTaskCameraFadeSetupLerpType::InterpEaseInOut;
	default m_FadeSetup.m_LerpParam1 = 2.0f;

	UPROPERTY()
	FSkipTimeData m_SkipTimeData;
	UPROPERTY()
	bool m_CanSkipTime = false;

	// ===========================================
	// DEFAULT MESSAGES (no strange dreams)
	// ===========================================
	default m_SleepEndedMessages.FindOrAdd(FGameplayTag::Empty).m_Messages.Add(LocText("UI_SleepEndedMessage_Well_1"));
	default m_SleepEndedMessages.FindOrAdd(FGameplayTag::Empty).m_Messages.Add(LocText("UI_SleepEndedMessage_Well_2"));
	default m_SleepEndedMessages.FindOrAdd(FGameplayTag::Empty).m_Messages.Add(LocText("UI_SleepEndedMessage_Well_3"));
	default m_SleepEndedMessages.FindOrAdd(FGameplayTag::Empty).m_Messages.Add(LocText("UI_SleepEndedMessage_Well_4"));
	default m_SleepEndedMessages.FindOrAdd(FGameplayTag::Empty).m_Messages.Add(LocText("UI_SleepEndedMessage_Well_5"));

	// ===========================================
	// CHAPTER 1 POOL
	// ===========================================
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch1).m_Messages.Add(LocText("UI_SleepEndedMessage_Well_1"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch1).m_Messages.Add(LocText("UI_SleepEndedMessage_Well_2"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch1).m_Messages.Add(LocText("UI_SleepEndedMessage_Well_3"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch1).m_Messages.Add(LocText("UI_SleepEndedMessage_Well_4"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch1).m_Messages.Add(LocText("UI_SleepEndedMessage_Well_5"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch2).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch1_1"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch2).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch1_2"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch2).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch1_3"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch2).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch1_4"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch2).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch1_5"));

	// ===========================================
	// CHAPTER 2 POOL
	// ===========================================
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch2).m_Messages.Add(LocText("UI_SleepEndedMessage_Well_1"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch2).m_Messages.Add(LocText("UI_SleepEndedMessage_Well_2"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch2).m_Messages.Add(LocText("UI_SleepEndedMessage_Well_3"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch2).m_Messages.Add(LocText("UI_SleepEndedMessage_Well_4"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch2).m_Messages.Add(LocText("UI_SleepEndedMessage_Well_5"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch2).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch1_1"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch2).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch1_2"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch2).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch1_3"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch2).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch1_4"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch2).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch1_5"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch2).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch2_1"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch2).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch2_2"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch2).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch2_3"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch2).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch2_4"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch2).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch2_5"));

	// ===========================================
	// CHAPTER 3 POOL
	// ===========================================
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch3).m_Messages.Add(LocText("UI_SleepEndedMessage_Well_1"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch3).m_Messages.Add(LocText("UI_SleepEndedMessage_Well_2"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch3).m_Messages.Add(LocText("UI_SleepEndedMessage_Well_3"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch3).m_Messages.Add(LocText("UI_SleepEndedMessage_Well_4"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch3).m_Messages.Add(LocText("UI_SleepEndedMessage_Well_5"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch3).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch1_1"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch3).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch1_2"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch3).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch1_3"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch3).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch1_4"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch3).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch1_5"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch3).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch2_1"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch3).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch2_2"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch3).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch2_3"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch3).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch2_4"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch3).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch2_5"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch3).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch3_1"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch3).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch3_2"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch3).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch3_3"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch3).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch3_4"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch3).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch3_5"));

	// ===========================================
	// CHAPTER 4 POOL
	// ===========================================
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch4).m_Messages.Add(LocText("UI_SleepEndedMessage_Well_1"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch4).m_Messages.Add(LocText("UI_SleepEndedMessage_Well_2"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch4).m_Messages.Add(LocText("UI_SleepEndedMessage_Well_3"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch4).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch2_1"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch4).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch2_2"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch4).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch2_3"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch4).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch2_4"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch4).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch2_5"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch4).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch3_1"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch4).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch3_2"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch4).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch3_3"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch4).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch3_4"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch4).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch3_5"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch4).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch4_1"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch4).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch4_2"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch4).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch4_3"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch4).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch4_4"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch4).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch4_5"));

	// ===========================================
	// CHAPTER 5 POOL
	// ===========================================
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch5).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch3_1"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch5).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch3_2"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch5).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch3_3"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch5).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch3_4"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch5).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch3_5"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch5).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch4_1"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch5).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch4_2"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch5).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch4_3"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch5).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch4_4"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch5).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch4_5"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch5).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch5_1"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch5).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch5_2"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch5).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch5_3"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch5).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch5_4"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch5).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch5_5"));

	// ===========================================
	// CHAPTER 6 POOL
	// ===========================================
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch6).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch4_1"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch6).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch4_2"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch6).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch4_3"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch6).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch4_4"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch6).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch4_5"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch6).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch5_1"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch6).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch5_2"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch6).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch5_3"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch6).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch5_4"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch6).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch5_5"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch6).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch6_1"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch6).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch6_2"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch6).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch6_3"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch6).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch6_4"));
	default m_SleepEndedMessages.FindOrAdd(GameplayTag::Status_Dreams_Strange_Ch6).m_Messages.Add(LocText("UI_SleepEndedMessage_Strange_Ch6_5"));

	// ===========================================
	// DEFAULT MESSAGES (no strange dreams)
	// ===========================================

	UPROPERTY()
	FActiveGameplayEffectHandle m_StrangerDreamsSpecHandle;

	// Gameplay effects for each chapter (created in GE_Human_Sleep.as)
	UPROPERTY()
	TSubclassOf<UGameplayEffect> m_StrangerDreamsGE_Ch1 = UGE_Sleeping_StrangeDreams_Ch1::StaticClass();
	UPROPERTY()
	TSubclassOf<UGameplayEffect> m_StrangerDreamsGE_Ch2 = UGE_Sleeping_StrangeDreams_Ch2::StaticClass();
	UPROPERTY()
	TSubclassOf<UGameplayEffect> m_StrangerDreamsGE_Ch3 = UGE_Sleeping_StrangeDreams_Ch3::StaticClass();
	UPROPERTY()
	TSubclassOf<UGameplayEffect> m_StrangerDreamsGE_Ch4 = UGE_Sleeping_StrangeDreams_Ch4::StaticClass();
	UPROPERTY()
	TSubclassOf<UGameplayEffect> m_StrangerDreamsGE_Ch5 = UGE_Sleeping_StrangeDreams_Ch5::StaticClass();
	UPROPERTY()
	TSubclassOf<UGameplayEffect> m_StrangerDreamsGE_Ch6 = UGE_Sleeping_StrangeDreams_Ch6::StaticClass();


	UFUNCTION(BlueprintOverride)
	void OnActivateAbilityBeforeAssetPreload_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
														FGameplayEventData TriggerEventData)
	{
		m_SkipTimeData = FSkipTimeData();
	}

	UFUNCTION(BlueprintOverride)
	bool CanSkipTime_Scriptable()
	{
		m_CanSkipTime = m_SkipTimeData.CanSkipTime(m_SkipTimeEndReason);
		return m_CanSkipTime;
	}

	UFUNCTION(BlueprintOverride)
	void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
									  FGameplayEventData TriggerEventData)
	{
		int currentChapter = GetCurrentDreamChapter();
		if(currentChapter > 0)
			ActivateStrangerDreams(currentChapter);
	}

	// Returns 0 if no strange dreams, 1-6 for chapter-based dreams
	int GetCurrentDreamChapter()
	{
		#ifdef WITH_STORY_G1R
			auto StoryG1R = G1R::UStoryG1R::Get();
			if(StoryG1R == nullptr)
				return 0;

			// Check from highest to lowest chapter
			if(StoryG1R.HasReachedChapter(6)) return 6;
			if(StoryG1R.HasReachedChapter(5)) return 5;
			if(StoryG1R.HasReachedChapter(4)) return 4;
			if(StoryG1R.HasReachedChapter(3)) return 3;
			if(StoryG1R.HasReachedChapter(2)) return 2;
			if(StoryG1R.HasReachedChapter(1)) return 1;
		#endif
		
		return 0; // No strange dreams yet
	}

	void ActivateStrangerDreams(int chapter)
	{
		if (!HasAuthority())
            return;

        auto ASC = GetAbilitySystemComponentFromActorInfo();
        if (ASC == nullptr)
            return;

		// Select the appropriate gameplay effect for the chapter
		TSubclassOf<UGameplayEffect> effectClass = nullptr;
		switch(chapter)
		{
			case 1: effectClass = m_StrangerDreamsGE_Ch1; break;
			case 2: effectClass = m_StrangerDreamsGE_Ch2; break;
			case 3: effectClass = m_StrangerDreamsGE_Ch3; break;
			case 4: effectClass = m_StrangerDreamsGE_Ch4; break;
			case 5: effectClass = m_StrangerDreamsGE_Ch5; break;
			case 6: effectClass = m_StrangerDreamsGE_Ch6; break;
			default: return;
		}

		if(effectClass == nullptr)
			return;

        auto SpecHandle = ASC.MakeOutgoingSpec(effectClass, 0.0f, ASC.MakeEffectContext());
        m_StrangerDreamsSpecHandle = ASC.ApplyGameplayEffectSpecToSelf(SpecHandle);
	}

	
	UFUNCTION(BlueprintOverride)
	void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo, bool WasCancelled)
	{
		RemoveStrangerDreams();
	}

	void RemoveStrangerDreams()
	{
		if (!HasAuthority())
            return;

        auto ASC = GetAbilitySystemComponentFromActorInfo();
        if (ASC == nullptr)
            return;

		ASC.RemoveActiveGameplayEffect(m_StrangerDreamsSpecHandle);
		
		// Clean up any lingering effects from all chapters
		TArray<TSubclassOf<UGameplayEffect>> allEffects;
		allEffects.Add(m_StrangerDreamsGE_Ch1);
		allEffects.Add(m_StrangerDreamsGE_Ch2);
		allEffects.Add(m_StrangerDreamsGE_Ch3);
		allEffects.Add(m_StrangerDreamsGE_Ch4);
		allEffects.Add(m_StrangerDreamsGE_Ch5);
		allEffects.Add(m_StrangerDreamsGE_Ch6);

		for(auto effectClass : allEffects)
		{
			if(effectClass != nullptr && ASC.GetGameplayEffectCount(effectClass, ASC) > 0)
			{
				ASC.RemoveActiveGameplayEffectBySourceEffect(effectClass, ASC);
			}
		}

		m_StrangerDreamsSpecHandle = FActiveGameplayEffectHandle();
	}

	UFUNCTION(BlueprintOverride)
	void OnSkipTime_Scriptable(float hoursToSkip)
	{
		m_SkipTimeData.OnSkipTime(hoursToSkip);
	}

	UFUNCTION(BlueprintOverride)
	void OnHourSkipped_Scriptable()
	{
		m_SkipTimeData.OnHourSkipped();
	}

	UFUNCTION(BlueprintOverride)
	FGameplayTag GetEndSkipTimeTag_Scriptable() const
	{
		if(m_SkipTimeEndReason == ESkipTimeEndReason::None)
			return FGameplayTag::Empty;
		if(m_CanSkipTime)
		{
			return GetEndSleepTagByReason();
		}
		else
			return GetCantSkipTimeTagByReason();
	}

	FGameplayTag GetCantSkipTimeTagByReason() const
	{
		return FGameplayTag::Empty;
	}

	FGameplayTag GetEndSleepTagByReason() const
	{
		return FGameplayTag::Empty;
	}
}
