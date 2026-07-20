class UGA_Invulnerable : UGameplayAbilityCreatureSpecialState
{
    default AbilityTags.AddTag(GameplayTag::Ability_Effect_Debuff_Invulnerable);
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Effect_Debuff_Invulnerable);
    default m_ActivateAbilityOnGranted = true;

    UPROPERTY()
    TSubclassOf<UGameplayEffect> m_EffectClass = UGE_State_Invulnerable::StaticClass();
    UPROPERTY()
    FActiveGameplayEffectHandle m_GEHandle;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        auto abComp = GetAbilitySystemComponentFromActorInfo();
        m_GEHandle = abComp.ApplyGameplayEffectToSelf(m_EffectClass, 0, abComp.MakeEffectContext());
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo, bool WasCancelled)
    {
        auto abComp = GetAbilitySystemComponentFromActorInfo();
        abComp.RemoveActiveGameplayEffect(m_GEHandle);
    }
}