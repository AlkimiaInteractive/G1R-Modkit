class UGA_Human_SkipTime_Sit : UGameplayAbilitySkipTime
{
	default m_InteractionSpotTag = GameplayTag::Action_Interact_Sit;

	default m_SkipTimeEffect = UGE_SkipTime_Sit::StaticClass();

	default m_TimeBetweenFadeOutAndFadeIn = 2.0f;
	default m_TimeBetweenStartAndSit = 1.0f;
	default m_TimeBetweenSitAndFadeOut = 1.0f;

	default m_FadeSetup.m_Duration = 2.0f;
	default m_FadeSetup.m_Color = FLinearColor::Black;
	default m_FadeSetup.m_TargetAlpha = 1.0f;
	default m_FadeSetup.m_FadeAudio = false;
	default m_FadeSetup.m_LerpType = EAbilityTaskCameraFadeSetupLerpType::InterpEaseInOut;
	default m_FadeSetup.m_LerpParam1 = 2.0f;

	default m_ActivateAbilityOnGranted = true;

	UPROPERTY()
	bool m_CanSkipTime = false;


	default m_WaitEndedMessages.FindOrAdd(GameplayTag::Status_SkipTime_Default).m_Messages.Add(LocText("UI_WaitRefusedMessage_1"));


	UPROPERTY()
	FSkipTimeData m_SkipTimeData;


	//default m_SleepEndedMessages.FindOrAdd(FGameplayTag::Empty).m_Messages.Add(LocText("UI_SleepEndedMessage_Well_1"));

	UFUNCTION(BlueprintOverride)
	void OnActivateAbilityBeforeAssetPreload_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
														FGameplayEventData TriggerEventData)
	{
		m_SkipTimeData = FSkipTimeData();
	}

	UFUNCTION(BlueprintOverride)
	bool CanSkipTime_Scriptable()
	{
		m_CanSkipTime = CheckCanSkipTime();
		return m_CanSkipTime;		
	}

	bool CheckCanSkipTime()
	{
		auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
	    FGameplayTagContainer cantSkipTimeTags;
        cantSkipTimeTags.AddTag(GameplayTag::Debuff_Death);
        cantSkipTimeTags.AddTag(GameplayTag::Debuff_Defeated);
        cantSkipTimeTags.AddTag(GameplayTag::Debuff_Defeated_Stay);
        cantSkipTimeTags.AddTag(GameplayTag::Debuff_Paralyzed);
        cantSkipTimeTags.AddTag(GameplayTag::Debuff_Electrified);
        cantSkipTimeTags.AddTag(GameplayTag::Debuff_Freeze);
        cantSkipTimeTags.AddTag(GameplayTag::Debuff_Fear);
        cantSkipTimeTags.AddTag(GameplayTag::Debuff_Sleep);
        cantSkipTimeTags.AddTag(GameplayTag::State_Knockback);

		cantSkipTimeTags.AddTag(GameplayTag::GameplayCue_State_Targeted);
		cantSkipTimeTags.AddTag(GameplayTag::State_Conversation);
		cantSkipTimeTags.AddTag(GameplayTag::State_Ragdoll);
		cantSkipTimeTags.AddTag(GameplayTag::State_Hiding);
		cantSkipTimeTags.AddTag(GameplayTag::State_Dead);
		cantSkipTimeTags.AddTag(GameplayTag::State_Controlling);
		cantSkipTimeTags.AddTag(GameplayTag::State_Controlled);
		cantSkipTimeTags.AddTag(GameplayTag::State_ConsumingItem);
		cantSkipTimeTags.AddTag(GameplayTag::State_Burn);
		cantSkipTimeTags.AddTag(GameplayTag::State_Channeling);
		cantSkipTimeTags.AddTag(GameplayTag::State_Hit);
		cantSkipTimeTags.AddTag(GameplayTag::State_DoingMagic);
		cantSkipTimeTags.AddTag(GameplayTag::State_LaunchingSpell);
		cantSkipTimeTags.AddTag(GameplayTag::State_PartOfCinematic);

        if(abComp.HasAnyGameplayTags(cantSkipTimeTags))
            return false;

		if(!m_SkipTimeData.CanSkipTime(m_SkipTimeEndReason))
			return false;

        return true;
	}

	UFUNCTION(BlueprintOverride)
	bool OnCanActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo) const
	{
		auto gothicChar = Cast<AGothicCharacter>(GAActorInfo.GetAvatarActor());
		if(Cast<UGothicAbilitySystemComponent>(gothicChar.GetAbilitySystemComponent()).HasTagExact(GameplayTag::State_Controlled))
			return false;
		return gothicChar.IsPlayerCharacterOrPlayerControlled();
	}

	UFUNCTION(BlueprintOverride)
	bool ShouldNPCInterruptWaitingDueToTrespassing(const AGothicNPCState NPCState,
													const AGothicPlayerState PlayerState) const
	{
		auto Relationship = NPCState.GetRelationshipTowards(PlayerState);
		if (Relationship == ERelationship::Enemy || Relationship == ERelationship::Hostile)
			return true;

		if (!NPCState.IsHuman())
			return false;

		auto TrespassingContext = PlayerState.GetTrespassingContextFor(NPCState);
		if (TrespassingContext.IsNotTrespassing() || TrespassingContext.IsTrespassingIgnored())
			return false;

		return true;
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
	FGameplayTag GetEndWaitMessageTag_Scriptable()
	{
		if(m_CanSkipTime)
		{
			return GetEndWaitTagByReason();
		}
		else
		{
			return GetCantSkipTimeTagByReason();
		}
	}

	FGameplayTag GetCantSkipTimeTagByReason() const
	{
		return GameplayTag::Status_SkipTime_Default;
	}

	FGameplayTag GetEndWaitTagByReason() const
	{
		return FGameplayTag::Empty;//No message
	}

}

class UGE_SkipTime_Sit : UScriptGameplayEffect
{
    default DurationPolicy = EGameplayEffectDurationType::Infinite;
 
	// Tags added to the character (This will also make the tag visible in ImGui)
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_IgnoreAllInputButCamera);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Invulnerable);
}
