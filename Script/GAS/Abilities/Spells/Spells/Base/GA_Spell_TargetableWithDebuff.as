
class UGA_Spell_TargetableWithDebuff : UGameplayAbilitySpellTargetableWithDebuff
{
    UPROPERTY()
    FGameplayTag m_TriggerBeginOnSpellTag;

    default m_GE_Mana = UGE_ManaBurn::StaticClass();

    TSubclassOf<UTargetableWithDebuffSpellConfig> m_SpellConfig;
    
    UTargetableWithDebuffSpellConfig GetConfig()
    {
        return Cast<UTargetableWithDebuffSpellConfig>(m_SpellConfig.Get().GetDefaultObject());
    }

    UGA_Spell_TargetableWithDebuff()
    {
        BindTriggerBeginOnTag(GetTriggerBeginOnTag());
    }

    FGameplayTag GetTriggerBeginOnTag() 
    {
        return FGameplayTag();
    }

    // UFUNCTION(BlueprintOverride)
    // FGameplayTag GetTriggerBeginOnSpellTag_Scriptable()
    // {
    //     return m_TriggerBeginOnSpellTag;
    // }

    UFUNCTION(BlueprintOverride)
    void OnUpdateSpell_Scriptable(float DeltaTime)
    {        
        if(ShouldEndSpell_Scriptable())
            DoEndSpellAction();
    }

    UFUNCTION(BlueprintOverride)
    bool ShouldEndSpell_Scriptable()
    {
        if(m_Target == nullptr)
        {
            //Print("ShouldEndSpell_Scriptable - target == nullptr", 10.f, FLinearColor::Red);            
            return true;
        }
        if(IsTargetDead())
        {
            //Print("ShouldEndSpell_Scriptable - IsDead()", 10.f, FLinearColor::Purple);
            return true;
        }
        if (IsTargetDefeated())
        {
            //Print("ShouldEndSpell_Scriptable - IsDefeated()", 10.f, FLinearColor::Purple);
            return true;
        }
        if(!IsTargetVisibleOnServer())
        {
            //Print("ShouldEndSpell_Scriptable - OnVisualInterruption", 10.f, FLinearColor::Blue);
            return true;
        }
        return false;
    }


    UFUNCTION(BlueprintOverride)
    void OnActivateSpellServer_Scriptable()
    {
        UTargetableWithDebuffSpellConfig config = GetConfig();
        m_DebuffEffect = config.m_DebuffEffect;        
    }

    // UFUNCTION(BlueprintOverride)
    // void OnEndSpellServer_Scriptable()
    // {
    //     //DeactivateAimCameraFromTarget();
    //     //RemoveSpellStateTag();
    // }

    UFUNCTION(BlueprintOverride)
    bool OnShouldFinishSpellAfterActivation_Scriptable()
    {
        return false;
    }

    UFUNCTION(BlueprintOverride)
    void PlayLaunchSpell_Scriptable()
    {
        PlayLaunchSpellMontage(NAME_None, false);
    }

    UFUNCTION(BlueprintOverride)
    void OnNewTarget_Scriptable(AActor NewTarget)
    {
        m_Target = NewTarget;
    }

    void DeactivateAimCameraFromTarget()
    {
        DeactivateTarget();
    }
}