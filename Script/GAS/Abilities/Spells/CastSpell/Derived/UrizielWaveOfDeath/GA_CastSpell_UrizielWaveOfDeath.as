class UGA_CastSpell_UrizielWaveOfDeath : UGA_CastSpell_Default
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Rune_UrizielWaveOfDeath::StaticClass();

    UPROPERTY()
    TSubclassOf<UGameplayEffect> m_GE_Mana_CastToCancelSpell = UGE_NoManaBurn::StaticClass();
    UPROPERTY()
    TSubclassOf<UGameplayEffect> m_GE_StateCastToCancelSpell = UGE_CastToCancelSpell::StaticClass();

    UPROPERTY()
    FActiveGameplayEffectHandle m_StateCastToCancelSpellHande;

    UFUNCTION(BlueprintOverride)
    bool OnCanActivateAbilityServer_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo) const
    {
        if(!Super::OnCanActivateAbilityServer_Scriptable(GameplayAbilityActorInfo))
            return false;
        
        auto abComp = Cast<UGothicAbilitySystemComponent>(GameplayAbilityActorInfo.AbilitySystemComponent);
        if(abComp == nullptr)
            return false;

        return true;
    }

    UFUNCTION(BlueprintOverride)
    bool IsOverridingGetStateLockMovementOnCast_Scriptable()
    {
        return IsCastingToCancelPreviousSpell_Scriptable(GetAbilitySystemComponentFromActorInfo());
    }

    UFUNCTION(BlueprintOverride)
    bool GetOverrideGetStateLockMovementOnCast_Scriptable()
    {
        //@DE - Can walk during spell
        return false;
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateCastSpellServer_Scriptable(const UAnimMontage castMontage)
    {
        if(IsCastingToCancelPreviousSpell_Scriptable(GetAbilitySystemComponentFromActorInfo()))
            ApplyCastToCancelSpellState();
    }

    void ApplyCastToCancelSpellState()
    {
        auto sourceAbComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        FGameplayEffectContextHandle contextHandle = sourceAbComp.MakeEffectContext();
        FGameplayEffectSpecHandle geSpecHandle = sourceAbComp.MakeOutgoingSpec(m_GE_StateCastToCancelSpell, 1, contextHandle);
        m_StateCastToCancelSpellHande = sourceAbComp.ApplyGameplayEffectSpecToSelf(geSpecHandle);
    }

    UFUNCTION(BlueprintOverride)
    void OnEndCastSpellServer_Scriptable(bool WasCancelled)
    {
        if(MagicScript::IsValidGameplayEffectHandle(m_StateCastToCancelSpellHande))
            RemoveCastToCancelSpellState();
    }

    void RemoveCastToCancelSpellState()
    {
        auto sourceAbComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        sourceAbComp.RemoveActiveGameplayEffect(m_StateCastToCancelSpellHande);
        m_StateCastToCancelSpellHande = FActiveGameplayEffectHandle();
        if(sourceAbComp.GetGameplayEffectCount(m_GE_StateCastToCancelSpell, nullptr) > 0)
        {
            sourceAbComp.RemoveActiveGameplayEffectBySourceEffect(m_GE_StateCastToCancelSpell, sourceAbComp);
        }
    }

    UFUNCTION(BlueprintOverride)
    bool IsCastingToCancelPreviousSpell_Scriptable(UAbilitySystemComponent AbComp) const
    {
        if(AbComp == nullptr)
            return false;
        auto gothicAbComp = Cast<UGothicAbilitySystemComponent>(AbComp);
        return gothicAbComp.HasGameplayTag(GameplayTag::State_Spell_UrizielWaveOfDeath); 
    }

    UFUNCTION(BlueprintOverride)
    TSubclassOf<UGameplayEffect> GetConsumeManaGE_Scriptable(UAbilitySystemComponent AbComp) const
    {
        if(IsCastingToCancelPreviousSpell_Scriptable(AbComp))
            return m_GE_Mana_CastToCancelSpell;
        return m_GE_Mana;
    }
}