class UGA_TraceTarget_Heal : UGA_TraceTarget_Character
{
    default m_SpellConfig = UHealSpellConfig::StaticClass();

    default m_CastSpellClass = UGA_CastSpell_Heal::StaticClass();

    UPROPERTY()
    AGothicCharacter m_OwnerCharacter;
    UPROPERTY()
    UGothicAbilitySystemComponent m_GothicAbComp;

    // UPROPERTY()
    // FGameplayTag m_IgnoreTraceTag = GameplayTag::State_Ignore_TraceTarget;

    UPROPERTY()
    TSubclassOf<UScriptGameplayEffect> m_GEIgnoreTrace = UGE_Heal_IgnoreTrace::StaticClass();

    UPROPERTY()
    FActiveGameplayEffectHandle m_IgnoreTraceHandle;

    //Note for the future monday.
    //Add this to the on equip rune/scroll
    //Use get target to check it and put the crosshair or hide it

    UFUNCTION(BlueprintOverride)
    void OnActivateSpellServer_Scriptable()
    {
        Super::OnActivateSpellServer_Scriptable();
        m_OwnerCharacter = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        m_GothicAbComp = m_OwnerCharacter.GetGothicAbilitySystemComponent();
        CheckAimingTarget();
    }

    UFUNCTION(BlueprintOverride)
    void OnUpdateAbility_Scriptable(float DeltaTime)
    {
        CheckAimingTarget();
    }

    void CheckAimingTarget()
    {
        if(m_OwnerCharacter == nullptr)
            return;
        auto target = m_OwnerCharacter.GetTargetedActor();
        if(target == nullptr || target == m_OwnerCharacter)
            IgnoreTrace();
        else
            AllowTrace();
    }

    void AllowTrace()
    {
        if(!HasIgnoreTraceTag())
            return;
        m_GothicAbComp.RemoveActiveGameplayEffect(m_IgnoreTraceHandle);
        m_IgnoreTraceHandle = FActiveGameplayEffectHandle();
    }

    bool HasIgnoreTraceTag()
    {
        return MagicScript::IsValidGameplayEffectHandle(m_IgnoreTraceHandle) && m_GothicAbComp.HasActiveGameplayEffectByHandle(m_IgnoreTraceHandle);
    }

    void IgnoreTrace()
    {
        if(HasIgnoreTraceTag())
            return;

        FGameplayEffectContextHandle context = m_GothicAbComp.MakeEffectContext();
        FGameplayEffectSpecHandle effect = m_GothicAbComp.MakeOutgoingSpec(m_GEIgnoreTrace, 1.0f, context);
        m_IgnoreTraceHandle = m_GothicAbComp.ApplyGameplayEffectSpecToSelf(effect);
    }

    UFUNCTION(BlueprintOverride)
    void OnEndSpellServer_Scriptable()
    {
        m_GothicAbComp.RemoveActiveGameplayEffect(m_IgnoreTraceHandle);
        Super::OnEndSpellServer_Scriptable();
    }
    
}


class UGE_Heal_IgnoreTrace : UScriptGameplayEffect
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	//default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_Controlling);
	//default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Debuff_Unconscious);

	//Tags added to the character
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Ignore_TraceTarget);
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Crosshair_Hide);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Defeated);
	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_Dead);

	default DurationPolicy = EGameplayEffectDurationType::Infinite;
}

