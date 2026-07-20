
class UGA_GornSleeper_ElectrifiedAreaController : UGameplayAbilityCreatureBasic
{
    default m_ActivateAbilityOnGranted = true;

    UPROPERTY()
    AGornSleeper_ElectrifiedArea m_ElectrifiedArea;

    UPROPERTY()
    private FTimerHandle TaskTimer;

    // "Current value" attribute.
	UPROPERTY(BlueprintReadWrite, VisibleAnywhere)
	FGameplayAttribute m_CurrentValueAttribute;

	// "Max value" attribute.
	UPROPERTY(BlueprintReadWrite, VisibleAnywhere)
	FGameplayAttribute m_MaxValueAttribute;

    UPROPERTY()
    float m_MaxHealth;

    UPROPERTY()
    UDelegateHandleContainer m_handleActivateCellDelegate;
    UPROPERTY()
    UDelegateHandleContainer m_handleSelectCellDelegate;
    UPROPERTY()
    UDelegateHandleContainer m_handleChargeCellDelegate;
    UPROPERTY()
    UDelegateHandleContainer m_handleSpawnRayOnCellDelegate;
    UPROPERTY()
    UDelegateHandleContainer m_handleForceKnockbackDelegate;

    UPROPERTY()
    UDelegateHandleContainer m_OnDieMeAfterHandle;

    UPROPERTY()
    TSubclassOf<UGothicBaseConfig> m_ArenaDefClass = UElectrifiedArea_GornSleeper::StaticClass();

    UPROPERTY()
    UElectrifiedArea_GornSleeper m_ArenaDef;

    UPROPERTY()
    TArray<float> m_ElectrifiedAreaHealthPercentage;


    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        FindAreaActor();
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo, bool WasCancelled)
    {
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_handleActivateCellDelegate);
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_handleSelectCellDelegate);
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_handleChargeCellDelegate);
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_handleSpawnRayOnCellDelegate);
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_handleForceKnockbackDelegate);
        
    }

    void ActivateDetectionTimer()
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"FindAreaActor"), .5f, true);
    }

    UFUNCTION()
    void FindAreaActor()
    {
        auto avatarActor = GetAvatarActorFromActorInfo();
        //UNearbyActorsSubsystem::Get().TrackActorsOfClass(AGornSleeper_ElectrifiedArea::StaticClass());
        //auto actors = UNearbyActorsSubsystem::Get().FindActorsOfClassInRadius(AGornSleeper_ElectrifiedArea::StaticClass(), avatarActor.GetActorLocation(), 2000);
        TArray<AActor> outActors;
        GetAllActorsOfClass(AGornSleeper_ElectrifiedArea::StaticClass(), outActors);
        if(outActors.Num() == 0)
        {
            ActivateDetectionTimer();
            return;
        }

        m_ElectrifiedArea = Cast<AGornSleeper_ElectrifiedArea>(outActors[0]);
        if(m_ElectrifiedArea == nullptr)
        {
            ActivateDetectionTimer();
            return;
        }

        m_ElectrifiedArea.InitializeOwner(avatarActor);
        
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);

        Initialize();
    }


    void Initialize()
    {
        m_ArenaDef = Cast<UElectrifiedArea_GornSleeper>(m_ArenaDefClass.Get().DefaultObject);
        m_ElectrifiedAreaHealthPercentage = m_ArenaDef.m_ElectrifiedAreaHealthPercentage;
        m_CurrentValueAttribute = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Health::StaticClass(), n"Health");
        m_MaxValueAttribute = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Health::StaticClass(), n"MaxHealth");

        m_OnDieMeAfterHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_Die_Me_After, this, n"OnDieMeAfter");

        RegisterGameplayAttributeEvent(m_CurrentValueAttribute);
        RegisterGameplayAttributeEvent(m_MaxValueAttribute);

        bool success = false;
        m_MaxHealth = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(GetAbilitySystemComponentFromActorInfo(), m_MaxValueAttribute, success);

        m_handleSelectCellDelegate = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Spell_Sleeper_ElectrifiedArea_Gorn_SelectCell, this, n"OnRequestSelectCell");
        m_handleActivateCellDelegate = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Spell_Sleeper_ElectrifiedArea_Gorn_Activate, this, n"OnRequestActivateCell");
        m_handleChargeCellDelegate = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Spell_Sleeper_ElectrifiedArea_Gorn_ChargeCell, this, n"OnRequestChargeCell");
        m_handleSpawnRayOnCellDelegate = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Spell_Sleeper_ElectrifiedArea_Gorn_SpawnRayOnCell, this, n"OnRequestSpawnRayOnCell");
        m_handleForceKnockbackDelegate = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Spell_Sleeper_ElectrifiedArea_Gorn_ForceKnockback, this, n"OnRequestForceKnockback");

        // m_ElectrifiedArea.SelectCellToActivate(nullptr);
        // m_ElectrifiedArea.ActivateCell();
        //         m_ElectrifiedArea.SelectCellToActivate(nullptr);
        // m_ElectrifiedArea.ActivateCell();
        //         m_ElectrifiedArea.SelectCellToActivate(nullptr);
        // m_ElectrifiedArea.ActivateCell();
        //         m_ElectrifiedArea.SelectCellToActivate(nullptr);
        // m_ElectrifiedArea.ActivateCell();
    }

    UFUNCTION(BlueprintOverride)
    void OnAttributeValueChanged_Scriptable(FGameplayAttribute Attribute, float OldValue,
                                            float NewValue)
    {
        if(AttributeEquals(Attribute, m_CurrentValueAttribute))
        {
            OnCurrentAttributeValueChanged(Attribute, OldValue, NewValue);
            return;
        }
            
        if(AttributeEquals(Attribute, m_MaxValueAttribute))
        {
            OnMaxAttributeValueChanged(Attribute, OldValue, NewValue);
            return;
        }
    }

    bool AttributeEquals(FGameplayAttribute AttributeA, FGameplayAttribute AttributeB)
    {
        return AttributeA.AttributeSetClass == AttributeB.AttributeSetClass;
    }

    void OnCurrentAttributeValueChanged(FGameplayAttribute Attribute, float OldValue, float NewValue)
    {
        TryToActivateElectrifiedArea(NewValue);
    }

    void TryToActivateElectrifiedArea(float HealthValue)
    {
        if(m_ElectrifiedAreaHealthPercentage.Num() == 0)
            return;
        if(m_ElectrifiedArea.IsWaitingForCellActivation())
            return;
        auto healthThreshold = m_ElectrifiedAreaHealthPercentage[0];
        if(HealthValue < m_MaxHealth * healthThreshold)
        {
            m_ElectrifiedArea.m_WaitingForCellActivation = true;
            m_ElectrifiedAreaHealthPercentage.RemoveAt(0);
            Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo()).AddTag(GameplayTag::Spell_Sleeper_ElectrifiedArea_Gorn);
        }
    }

    UFUNCTION()
    void OnRequestSelectCell(FGameplayEventData GameplayEventData)
    {
        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        m_ElectrifiedArea.SelectCellToActivate(gothicChar.GetTargetedActor());

    }

    UFUNCTION()
    void OnRequestForceKnockback(FGameplayEventData GameplayEventData)
    {
        DoKnockbackHitOnArea();
    }

    void DoKnockbackHitOnArea()
    {
        auto characters = GetCharactersInsideExpandedSafeZone();
        for(auto character : characters)
        {
            ApplyKnockback(character);
        }
    }

    void ApplyKnockback(AGothicCharacter character)
    {
        auto sourceAbComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        auto targetAbComp = Cast<UGothicAbilitySystemComponent>(character.GetAbilitySystemComponent());

        if(sourceAbComp == nullptr || targetAbComp == nullptr)
        {
            return;
        }

        //@DE - First: set a GE to allow get a knockback (ignore superarmor value)
        FGameplayEffectContextHandle contextHandle = sourceAbComp.MakeEffectContext();
        FGameplayEffectSpecHandle geSpecHandle = sourceAbComp.MakeOutgoingSpec(UGE_GornSleeperCombat_ForceKnockback::StaticClass(), 1, contextHandle);
        sourceAbComp.ApplyGameplayEffectSpecToTarget(geSpecHandle, targetAbComp);

        FGameplayEventData payload;

        FGameplayEffectContext_HitResponse hit_data;
        hit_data.Impact = GameplayTag::Combat_HitType_Knockback;
        hit_data.CustomKnockbackData = UKnockbackDataGornSleeper::StaticClass();
        
        // hit_data.SourceDirection = MagicScript::GetCombatDirectionGivenHitLocation(
        // targetAbComp.GetAvatar().GetActorForwardVector(), 
        // targetAbComp.GetAvatar().GetActorRightVector(), 
        //     -sourceAbComp.GetAvatar().GetActorForwardVector());

        hit_data.SourceDirection = GameplayTag::Combat_Direction_Front;
        
        GothicGAS::InitializeHitData(payload, hit_data);
        //@DE - Second: force knockback.
        GothicGAS::SendGameplayEvent(character, GameplayTag::Event_Hit_BreakArmorHit, payload);
    }

    TArray<AGothicCharacter> GetCharactersInsideExpandedSafeZone()
    {
        auto Actors = UNearbyActorsSubsystem::Get().FindActorsOfClassInRadius(AGothicCharacter::StaticClass(), GetAvatarActorFromActorInfo().GetActorLocation(), 100);
        TArray<AGothicCharacter> GothicCharacters;

        for (auto Actor : Actors)
        {
            auto GothicCharacter = Cast<AGothicCharacter>(Actor);
            if (GothicCharacter == nullptr)
                continue;
            if (GothicCharacter == GetAvatarActorFromActorInfo())
                continue;

            GothicCharacters.Add(GothicCharacter);
        }

        return GothicCharacters;
    }
    

    UFUNCTION()
    void OnRequestSpawnRayOnCell(FGameplayEventData GameplayEventData)
    {
        AGothicCharacter instigatorCharacter = Cast<AGothicCharacter>(GameplayEventData.Instigator);
        m_ElectrifiedArea.OnRequestSpawnRayOnCell(instigatorCharacter); 
    }

    UFUNCTION()
    void OnRequestChargeCell(FGameplayEventData GameplayEventData)
    {
        m_ElectrifiedArea.EnableVisualWarning();
    }

    UFUNCTION()
    void OnRequestActivateCell(FGameplayEventData GameplayEventData)
    {
        auto result = m_ElectrifiedArea.ActivateCell();
        if(result)
        {
            Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo()).RemoveTag(GameplayTag::Spell_Sleeper_ElectrifiedArea_Gorn);
            bool success = false;
            auto HealthValue = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(GetAbilitySystemComponentFromActorInfo(), m_CurrentValueAttribute, success);
            //Check if it need activate another electrified area.
            TryToActivateElectrifiedArea(HealthValue);
        }
        
    }
    
    void OnMaxAttributeValueChanged(FGameplayAttribute Attribute, float OldValue, float NewValue)
    {
    }

    UFUNCTION()
    void OnDieMeAfter(FGameplayEventData EventData)
    {
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnDieMeAfterHandle);

        m_ElectrifiedArea.DeactivateArea();
    }
}

class UKnockbackDataGornSleeper : UKnockbackDataGeneric
{
    default m_KnockbackFloorRange = 0.5f;
    default m_KnockbackTopRange = 1.f;

    default m_RootMotionMultiplierKnockback = 2.5f;
}

class UGE_GornSleeperCombat_ForceKnockback : UScriptGameplayEffect
{
    //Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_IgnoreSuperarmorValue);

	default DurationPolicy = EGameplayEffectDurationType::HasDuration;
    default DurationMagnitude.ScalableFloatMagnitude.Value = 3; // Duration in seconds of the effect
	default DurationMagnitude.MagnitudeCalculationType = EGameplayEffectMagnitudeCalculation::ScalableFloat;


	//Tags added to the character
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_IgnoreSuperarmorValue);

	default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::State_IgnoreSuperarmorValue);
}