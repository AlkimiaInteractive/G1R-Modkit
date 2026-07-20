class UGA_Trance_MadCorKalom_PlayMontage : UGA_MadCorKalom_PlayMontage
{ 

    default m_Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Interactable/SleeperAltar/A_CorKalom_SleeperAltar_Trance_Montage.A_CorKalom_SleeperAltar_Trance_Montage'";
    UPROPERTY()
    TSoftObjectPtr<UAnimMontage> m_TransformMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Interactable/SleeperAltar/A_CorKalom_SleeperAltar_Transform_Montage.A_CorKalom_SleeperAltar_Transform_Montage'";
    
    UPROPERTY()
    FGameplayMessageListenerHandle m_OnTransformHandle;
    UPROPERTY()
    UGothicGlobalEventListenerComponent m_GlobalEventComp;
    UPROPERTY()
    AKalomTranceCharge m_KalomTranceCharge;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        Super::OnActivateAbility_Scriptable(GAActorInfo, TriggerEventData);

        if(Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo()).HasTagExact(GameplayTag::State_Transforming))
        {
            m_GlobalEventComp = UGothicGlobalEventListenerComponent::GetOrCreate(GetAvatarActorFromActorInfo());
            //@DE - Triggered by Teleport_StabHearth04_Montage notify global event.
            m_OnTransformHandle = m_GlobalEventComp.RegisterListener(GameplayTag::Event_Anim_MadCorKalom_Transform, this, n"OnStartTransform");
        }
    }

    UFUNCTION()
    void OnStartTransform(FGameplayTag channel, const FGothicBasicVerbMessage& payload)
    {
        m_GlobalEventComp.UnregisterListener(m_OnTransformHandle);
        m_Montage = m_TransformMontage;
        NotifyStartTransform();
        PlayMontage();
    }

    void NotifyStartTransform()
    {
        auto kalomTranceCharge = GetKalomTranceChargeActor();
        if(kalomTranceCharge != nullptr)
        {
            kalomTranceCharge.m_MadCorKalomCharacter = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
            kalomTranceCharge.OnMadCorKalomStartFalling();
        }
    }

    UFUNCTION(BlueprintOverride)
    void OnLaunchSpell_Scriptable()
    {
        NotifyRequestCorKalomDemonSpawn();
        UWorldPointManager::Get().CallGlobalEvent(n"OnCarKalomDemonSpawn");
        Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).SetVisibilityCharacterAndEverythingItCarries(false);
        Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).GetCharacterState().NPCState.RemoveFromWorld();
        Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).SendGlobalEvent(GameplayTag::Message_Door, n"CorKalomDemon", n"m_CurrentSection", 1.0f);
    }

    void NotifyRequestCorKalomDemonSpawn()
    {
        auto kalomTranceCharge = GetKalomTranceChargeActor();
        if(kalomTranceCharge != nullptr)
            kalomTranceCharge.OnCorKalomDemonSpawnRequest();
    }

    AKalomTranceCharge GetKalomTranceChargeActor()
    {
        if(m_KalomTranceCharge != nullptr)
            return m_KalomTranceCharge;

        TArray<AActor> outActors;
        GetAllActorsOfClass(AKalomTranceCharge::StaticClass(), outActors);
        if(outActors.IsEmpty())
            return nullptr;
        m_KalomTranceCharge = Cast<AKalomTranceCharge>(outActors[0]);
        return m_KalomTranceCharge;
    }
}

