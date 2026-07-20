UCLASS()
class AFearVisual: ASphereExplosionSpellVisual
{
    UPROPERTY()
    TSubclassOf<UScriptGameplayEffect> m_FearGE = UGE_Fear::StaticClass();
    UPROPERTY()
    TSubclassOf<USpellConfig> m_SpellConfigClass = UFearSpellConfig::StaticClass();

    default m_ProjectileDebuffTag = GameplayTag::Debuff_Fear;
    
    // UFUNCTION(BlueprintOverride)
	// TArray<TSubclassOf<UGameplayEffect>> GetDebuffGameplayEffectsToApplyWhenOverlap_Scriptable() const
    // {
    //     TArray<TSubclassOf<UGameplayEffect>> effects;
    //     effects.Add(UGE_FreezeInfinite::StaticClass());
    //     return effects;        
    // }

    bool CanApplyEffect(UGothicAbilitySystemComponent sourceAbComp, UGothicAbilitySystemComponent targetAbComp) override
    {
        if(sourceAbComp == nullptr)
            return false;
        if(targetAbComp == nullptr)
            return false;
        if(m_FearGE == nullptr)
            return false;
        if(m_Targets.Contains(targetAbComp))
            return false;
	    
        //@DE - Wait until design decides if can damage allies and summoned creatures.
	    ////@DE - Avoid damage allies or players.
        //AGothicCharacter target = Cast<AGothicCharacter>(targetAbComp.GetAvatar());
        //AGothicCharacter source = Cast<AGothicCharacter>(sourceAbComp.GetAvatar());
        //auto AIController = Cast<AGothicAIController>(target.Controller);

        //if(AIController == nullptr)
        //    return false;
        //if(target.IsFriendlyTowards(source))
        //    return false;
        
        return true;
    }


    bool ApplyGameplayEffectToTarget(UGothicAbilitySystemComponent sourceAbComp,
                                     UGothicAbilitySystemComponent targetAbComp,
                                     const FHitResult&in SweepResult) override
    {
        if(!CanApplyEffect(sourceAbComp, targetAbComp))
        {
            return false;
        }

        
        auto targetChar = Cast<AGothicCharacter>(targetAbComp.GetAvatar());
        if(targetChar.IsPlayerControlled() || targetChar.IsPlayerCharacter())
            return false;
        
        FGameplayEffectContextHandle contextHandle = sourceAbComp.MakeEffectContext();
        contextHandle.AddInstigator( GetOwner()/*Cast<AGothicCharacter>(GetOwner()).GetCharacterState()*/, GetOwner());
        contextHandle.AddHitResult(SweepResult, true);

        FGameplayEffectSpecHandle geSpecHandle = sourceAbComp.MakeOutgoingSpec(m_FearGE, 1, contextHandle);
        MagicScript::SetGESpecDuration(geSpecHandle, GetDuration());
        FActiveGameplayEffectHandle handle = sourceAbComp.ApplyGameplayEffectSpecToTarget(geSpecHandle, targetAbComp);

        //FActiveGameplayEffectHandle handle = QuickApplyGEToTarget(targetAbComp, m_DebuffGE, GetDuration());

        if(MagicScript::IsValidGameplayEffectHandle(handle) || MagicScript::WasSuccessfullyApplied(handle))
            return true;
        return false;
    }

    float GetDuration()
    {
        auto config = Cast<UFearSpellConfig>(m_SpellConfigClass.Get().GetDefaultObject());
        if(config != nullptr)
            return config.m_GameplayEffectDuration;
        return 0.f;
    }
}
