UCLASS()
class UGA_SpellBasicWithTarget : UGameplayAbilitySpellBasicWithTarget
{

    UPROPERTY()
    TSubclassOf<UScriptGameplayEffect> m_DebuffGE;

    UPROPERTY()
    TSubclassOf<USpellConfig> m_SpellConfigClass;
    
    UFUNCTION(BlueprintOverride)
    void OnNewTarget_Scriptable(AActor NewTarget)
    {
        if(IsValidTarget(NewTarget))
        {
            auto sourceAbComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
            auto targetAbComp = GothicGAS::GetAbilitySystemComponent(NewTarget);
            ApplyGameplayEffectToTarget(sourceAbComp, targetAbComp);
        }
    }

    UFUNCTION(BlueprintOverride)
    void OnEndSpellServer_Scriptable()
    {
        DeactivateAimCameraFromTarget();
    }

    bool IsValidTarget(AActor NewTarget)
    {
        if(NewTarget == nullptr)
            return false;
        return true;
    }

    bool CanApplyEffect(UGothicAbilitySystemComponent sourceAbComp, UGothicAbilitySystemComponent targetAbComp)
    {
       return sourceAbComp != nullptr && targetAbComp != nullptr && m_DebuffGE != nullptr;
    }


    bool ApplyGameplayEffectToTarget(UGothicAbilitySystemComponent sourceAbComp,
                                     UGothicAbilitySystemComponent targetAbComp)
    {
        if(!CanApplyEffect(sourceAbComp, targetAbComp))
        {
            return false;
        }

        auto instigator = GetAvatarActorFromActorInfo();
        
        FGameplayEffectContextHandle contextHandle = sourceAbComp.MakeEffectContext();
        contextHandle.AddInstigator( instigator, instigator);

        FGameplayEffectSpecHandle geSpecHandle = sourceAbComp.MakeOutgoingSpec(m_DebuffGE, 1, contextHandle);
        MagicScript::SetGameplayEffectSpecDuration(geSpecHandle, GetDuration());
        //FActiveGameplayEffectHandle handle = QuickApplyGEToTarget(targetAbComp, m_DebuffGE, GetDuration());
        FActiveGameplayEffectHandle handle = sourceAbComp.ApplyGameplayEffectSpecToTarget(geSpecHandle, targetAbComp);

        if(MagicScript::IsValidGameplayEffectHandle(handle) || MagicScript::WasSuccessfullyApplied(handle))
            return true;
        return false;
    }

    float GetDuration()
    {
        return 0.f;
    }

    void DeactivateAimCameraFromTarget()
    {
        DeactivateTarget();
        //DeactivateTarget_Client();
    }

    // UFUNCTION(Client)
    // void DeactivateTarget_Client()
    // {
    //     DeactivateTarget();
    // }
}
