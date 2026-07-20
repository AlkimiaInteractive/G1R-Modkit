class UGA_SwampweedDebuff : UGA_DrugDebuffBase
{
    default m_AttributeSetClass = UAttributeSet_Swampweed::StaticClass();
    default m_AttributeName = n"Swampweed";
    default AbilityTags.AddTag(GameplayTag::Ability_Action_Debuff_Swampweed);
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_Debuff_Swampweed);

    default TriggerBeginOn(GameplayTag::State_Drugs_Swampweed, EGameplayAbilityTriggerSource::GameplayEvent);
    default TriggerBeginOn(GameplayTag::State_Drugs_Swampweed, EGameplayAbilityTriggerSource::OwnedTagPresent);

    default m_DepletionGEClass = UGE_SwampweedDepletion::StaticClass();
    default m_SwimmingDepletionGEClass = UGE_SwampweedDepletionSwimming::StaticClass();
    default m_ResetDrugAttribute = UGE_Reset_Swampweed_Attribute::StaticClass();

    default m_DrugDebuffThresholds.Add(USwampweedDopedThreshold::StaticClass());
    default m_DrugDebuffThresholds.Add(USwampweedHighThreshold::StaticClass());
    default m_DrugDebuffThresholds.Add(USwampweedTrippingThreshold::StaticClass());

    default m_DebuffStateGEClass = UGE_SwampweedDebuffState::StaticClass();

    default m_StateTag = GameplayTag::State_Drugs_Swampweed;

    UPROPERTY()
    TMap<TSubclassOf<UItemDefinition>, FJointExperienceData> m_ExperienceJoints;
    default m_ExperienceJoints.Add(UItMi_Joint_01::StaticClass(), FJointExperienceData(n"InstaExp_Joint_01", 5.f));
    default m_ExperienceJoints.Add(UItMi_Joint_02::StaticClass(), FJointExperienceData(n"InstaExp_Joint_02", 10.f));
    default m_ExperienceJoints.Add(UItMi_Joint_03::StaticClass(), FJointExperienceData(n"InstaExp_Joint_03", 20.f));

    UPROPERTY(BlueprintReadWrite, VisibleAnywhere)
	TSubclassOf<UGameplayEffect> m_GE_Experience = UGE_Item_Experience_Insta::StaticClass();

    UPROPERTY()
    UDelegateHandleContainer m_handleWeaponSkillDebuff;

    default m_ShouldNotifyConsumeItem = true;

    UDrugDebuffEffectComponentBase GetDrugDebuffComp() override
    {
        if(m_DrugDebuffComp == nullptr)
            m_DrugDebuffComp = Cast<USwampweedDebuffEffectComponent>(GetAvatarActorFromActorInfo().GetComponentByClass(USwampweedDebuffEffectComponent::StaticClass()));
        return m_DrugDebuffComp;
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        m_handleWeaponSkillDebuff = MagicScript::RegisterGameplayTagEvent(GetAbilitySystemComponentFromActorInfo(), GameplayTag::Debuff_WeaponSkill_Untrained, EGameplayTagEventType::NewOrRemoved, this, n"OnDebuffWeaponSkill");
        auto swampweedComp = GetDrugDebuffComp();
        if(swampweedComp == nullptr)
            return;
        swampweedComp.m_DrugDebuffThresholds = m_DrugDebuffThresholds;
        swampweedComp.m_AttributeName = m_AttributeName;
        swampweedComp.m_AttributeSetClass = m_AttributeSetClass;
    }

    UFUNCTION(BlueprintOverride)
    void OnAttributeIncreased_Scriptable()
    {
        Super::OnAttributeIncreased_Scriptable();

    }

    UFUNCTION(BlueprintOverride)
    void OnApplyThresholdEffect(UDrugDebuffThreshold NewThreshold)
    {
        auto swampweedComp = GetDrugDebuffComp();
        if(swampweedComp == nullptr)
            return;
        swampweedComp.OnApplyThresholdEffect(NewThreshold);

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

    UFUNCTION(BlueprintOverride)
    void OnConsumeItem_Scriptable(FItemVirtualData ItemVirtualData)
    {
        auto itemDefinition = ItemVirtualData.m_SlotData.m_ItemDefinition;
        if(m_ExperienceJoints.Contains(itemDefinition))
            CheckApplyExperience(itemDefinition);
    }

    void CheckApplyExperience(TSubclassOf<UItemDefinition> ItemDefinition)
    {
        FJointExperienceData jointData = m_ExperienceJoints[ItemDefinition];
        if(!ExistsSaveKey(jointData.m_SaveKey))
        {
            GiveExperience(jointData.m_ExperienceAmount);
            SaveKey(jointData.m_SaveKey);
        }
       
    }

    void SaveKey(FName SaveKey)
    {
        if(GetAvatarActorFromActorInfo().GetLocalRole() == ENetRole::ROLE_Authority)
            AG1RGameState::SaveWorldFloatData(GetWorld(), SaveKey, 1);
    }

    void GiveExperience(float ExperienceAmount)
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        FGameplayEffectContextHandle context = abComp.MakeEffectContext();
        FGameplayEffectSpecHandle effect = abComp.MakeOutgoingSpec(m_GE_Experience, 1.0f, context);
        effect.GetSpec().SetByCallerMagnitude(GameplayTag::GE_Param_Experience, float(ExperienceAmount));
        abComp.ApplyGameplayEffectSpecToSelf(effect);
    }

    bool ExistsSaveKey(FName SaveKey)
    {
         float32 savedState = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, SaveKey, savedState);
        if(bLoaded)
        {
            if(savedState > 0.9f)
            {
                return true;
            }
        }
        return false;
    }
}

USTRUCT()
struct FJointExperienceData
{
    FJointExperienceData(FName SaveKey, float ExperienceAmount)
    {
        m_SaveKey = SaveKey;
        m_ExperienceAmount = ExperienceAmount;
    }

    UPROPERTY()
    FName m_SaveKey;

    UPROPERTY()
    float m_ExperienceAmount;
}

class USwampweedDopedThreshold : UDrugDebuffThreshold
{
    default MinValue = 1.f;
    default MaxValue = 40.f;
    default m_DrugDebuffGEClass = UGE_SwampweedDebuffDoped::StaticClass();
}


class USwampweedHighThreshold : UDrugDebuffThreshold
{
    default MinValue = 41.f;
    default MaxValue = 120.f;
    default m_DrugDebuffGEClass = UGE_SwampweedDebuffHigh::StaticClass();
}

class USwampweedTrippingThreshold : UDrugDebuffThreshold
{
    default MinValue = 121.f;
    default MaxValue = 200.f;
    default m_DrugDebuffGEClass = UGE_SwampweedDebuffTripping::StaticClass();
}