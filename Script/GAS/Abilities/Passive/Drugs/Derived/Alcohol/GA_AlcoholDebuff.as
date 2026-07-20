class UGA_AlcoholDebuff : UGA_DrugDebuffBase
{
    default m_AttributeSetClass = UAttributeSet_Alcohol::StaticClass();
    default m_AttributeName = n"Alcohol";
    default AbilityTags.AddTag(GameplayTag::Ability_Action_Debuff_Alcohol);
	
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_Debuff_Alcohol);

    default TriggerBeginOn(GameplayTag::State_Drugs_Alcohol, EGameplayAbilityTriggerSource::GameplayEvent);
    default TriggerBeginOn(GameplayTag::State_Drugs_Alcohol, EGameplayAbilityTriggerSource::OwnedTagPresent);

    default m_DepletionGEClass = UGE_AlcoholDepletion::StaticClass();
    default m_SwimmingDepletionGEClass = UGE_AlcoholDepletionSwimming::StaticClass();
    default m_ResetDrugAttribute = UGE_Reset_Alcohol_Attribute::StaticClass();

    default m_DrugDebuffThresholds.Add(UAlcoholTipsyThreshold::StaticClass());
    default m_DrugDebuffThresholds.Add(UAlcoholIntoxicatedThreshold::StaticClass());
    default m_DrugDebuffThresholds.Add(UAlcoholDrunkThreshold::StaticClass());

    default m_DebuffStateGEClass = UGE_AlcoholDebuffState::StaticClass();

    default m_StateTag = GameplayTag::State_Drugs_Alcohol;

     UPROPERTY()
    TSoftObjectPtr<UAnimMontage> m_DefaultPukeMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Drunk/Vomit/Man_Puke_Montage.Man_Puke_Montage'";
        
    UPROPERTY()
    UDelegateHandleContainer m_handleWeaponSkillDebuff;

    UDrugDebuffEffectComponentBase GetDrugDebuffComp() override
    {
        if(m_DrugDebuffComp == nullptr)
            m_DrugDebuffComp = Cast<UAlcoholDebuffEffectComponent>(GetAvatarActorFromActorInfo().GetComponentByClass(UAlcoholDebuffEffectComponent::StaticClass()));
        return m_DrugDebuffComp;
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        m_handleWeaponSkillDebuff = MagicScript::RegisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), GameplayTag::Debuff_WeaponSkill_Untrained, EGameplayTagEventType::NewOrRemoved, this, n"OnDebuffWeaponSkill");
        auto alcoholComp = GetDrugDebuffComp();
        if(alcoholComp == nullptr)
            return;
        alcoholComp.m_DrugDebuffThresholds = m_DrugDebuffThresholds;
        alcoholComp.m_AttributeName = m_AttributeName;
        alcoholComp.m_AttributeSetClass = m_AttributeSetClass;
    }

    UFUNCTION(BlueprintOverride)
    void OnAttributeIncreased_Scriptable()
    {
        Super::OnAttributeIncreased_Scriptable();
    }

    UFUNCTION(BlueprintOverride)
    void OnApplyThresholdEffect(UDrugDebuffThreshold NewThreshold)
    {
        auto alcoholComp = GetDrugDebuffComp();
        if(alcoholComp == nullptr)
            return;
        alcoholComp.OnApplyThresholdEffect(NewThreshold);

        //@DE - DDiaz request that AI should not puke.
        auto gothicCharacter = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        if(gothicCharacter.IsPlayerControlled() || gothicCharacter.IsPlayerCharacter())
            TryDoPukeAnimation();
    }

    UFUNCTION()
    void TryDoPukeAnimation()
    {
        bool shouldPuke = AbilitySystemComponentFromActorInfo.GetGameplayTagCount(GameplayTag::Debuff_Alcohol_Drunk) > 0;
        if(shouldPuke)
        {
            TSoftObjectPtr<UAnimMontage> Montage = nullptr;
            if(m_DataModule_Anim != nullptr && m_DataModule_Locomotion != nullptr)
            {
                const UItemAnimConfig animData = m_DataModule_Anim.Get().GetCurrentAnimConfig();
                if (animData != nullptr){
                    Montage = animData.GetPukeMontage(m_DataModule_Locomotion.Get().GetStance());
                }
            }
            
            if(Montage == nullptr){
                Montage = m_DefaultPukeMontage;
            }

            PlayMontageTask(Montage);
        }
    }

    UFUNCTION()
    void OnDebuffWeaponSkill(const FGameplayTag CallbackTag, int32 NewCount)
    {
        UpdateAnimBP();
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo, bool WasCancelled)
    {
        Super::OnEndAbility_Scriptable(GameplayAbilityActorInfo, WasCancelled);
        MagicScript::UnregisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), m_handleWeaponSkillDebuff);
    }
}

class UGA_AlcoholDebuff_RidingScavenger : UGA_DrugDebuffBase
{
   default m_AttributeSetClass = UAttributeSet_Alcohol::StaticClass();
    default m_AttributeName = n"Alcohol";
    default AbilityTags.AddTag(GameplayTag::Ability_Action_Debuff_Alcohol);
	
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_Debuff_Alcohol);

    default TriggerBeginOn(GameplayTag::State_Drugs_Alcohol, EGameplayAbilityTriggerSource::GameplayEvent);
    default TriggerBeginOn(GameplayTag::State_Drugs_Alcohol, EGameplayAbilityTriggerSource::OwnedTagPresent);

    default m_DepletionGEClass = UGE_AlcoholDepletion::StaticClass();
    default m_SwimmingDepletionGEClass = UGE_AlcoholDepletionSwimming::StaticClass();
    default m_ResetDrugAttribute = UGE_Reset_Alcohol_Attribute::StaticClass();

    default m_DrugDebuffThresholds.Add(UAlcoholTipsyThreshold::StaticClass());
    default m_DrugDebuffThresholds.Add(UAlcoholIntoxicatedThreshold::StaticClass());
    default m_DrugDebuffThresholds.Add(UAlcoholDrunkThreshold::StaticClass());

    default m_DebuffStateGEClass = UGE_AlcoholDebuffState::StaticClass();

    default m_StateTag = GameplayTag::State_Drugs_Alcohol;

     UPROPERTY()
    TSoftObjectPtr<UAnimMontage> m_DefaultPukeMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Drunk/Vomit/Man_Puke_Montage.Man_Puke_Montage'";
        
    UPROPERTY()
    UDelegateHandleContainer m_handleWeaponSkillDebuff;

    UDrugDebuffEffectComponentBase GetDrugDebuffComp() override
    {
        if(m_DrugDebuffComp == nullptr)
            m_DrugDebuffComp = Cast<UAlcoholDebuffEffectComponent>(GetAvatarActorFromActorInfo().GetComponentByClass(UAlcoholDebuffEffectComponent::StaticClass()));
        return m_DrugDebuffComp;
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        auto alcoholComp = GetDrugDebuffComp();
        if(alcoholComp == nullptr)
            return;
        alcoholComp.m_DrugDebuffThresholds = m_DrugDebuffThresholds;
        alcoholComp.m_AttributeName = m_AttributeName;
        alcoholComp.m_AttributeSetClass = m_AttributeSetClass;
    }

    UFUNCTION(BlueprintOverride)
    void OnAttributeIncreased_Scriptable()
    {
        Super::OnAttributeIncreased_Scriptable();
    }

    UFUNCTION(BlueprintOverride)
    void OnApplyThresholdEffect(UDrugDebuffThreshold NewThreshold)
    {
        auto alcoholComp = GetDrugDebuffComp();
        if(alcoholComp == nullptr)
            return;
        alcoholComp.OnApplyThresholdEffect(NewThreshold);
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo, bool WasCancelled)
    {
        Super::OnEndAbility_Scriptable(GameplayAbilityActorInfo, WasCancelled);
        MagicScript::UnregisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), m_handleWeaponSkillDebuff);
    } 
}

class UAlcoholTipsyThreshold : UDrugDebuffThreshold
{
    default MinValue = 1.f;
    default MaxValue = 60.f;
    default m_DrugDebuffGEClass = UGE_AlcoholDebuffTipsy::StaticClass();
}


class UAlcoholIntoxicatedThreshold : UDrugDebuffThreshold
{
    default MinValue = 61.f;
    default MaxValue = 120.f;
    default m_DrugDebuffGEClass = UGE_AlcoholDebuffIntoxicated::StaticClass();
}

class UAlcoholDrunkThreshold : UDrugDebuffThreshold
{
    default MinValue = 121.f;
    default MaxValue = 200.f;
    default m_DrugDebuffGEClass = UGE_AlcoholDebuffDrunk::StaticClass();
}