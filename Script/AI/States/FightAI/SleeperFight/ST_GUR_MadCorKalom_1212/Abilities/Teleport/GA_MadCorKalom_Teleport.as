class UGA_MadCorKalom_Teleport : UGA_MadCorKalom_BehaviourScript_Base
{
    UPROPERTY()
    UMadCorKalomTeleportComponent m_TeleportComp;

    UPROPERTY()
    UDelegateHandleContainer m_DisappearDelegateHandle;

    UPROPERTY()
    UDelegateHandleContainer m_AppearDelegateHandle;
    UPROPERTY()
    ATeleportSpotVisual m_CurrentTeleportSpot;

    UPROPERTY(NotVisible, NotEditable)
    FName m_SaveGameKey = n"MadCorKalom_Teleport_Completed";
    
    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        Super::OnActivateAbility_Scriptable(GAActorInfo, TriggerEventData);

        if(!HasAuthority())
        {
            return;
        }
            
        float32 savedState = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveGameKey, savedState);
        if(bLoaded)
        {
            if(savedState > 0.9f)
            {
                auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
                abComp.GiveAbility(UGA_Trance_MadCorKalom_PlayMontage::StaticClass(), 1, -1, nullptr);
                
                FGameplayAbilitySpec outSpec;
                abComp.FindAbilitySpecFromClass(UGA_MadCorKalom_Teleport::StaticClass(), outSpec);
                abComp.ClearAbility(outSpec.Handle);
                return;
            }
        }
        
        m_TeleportComp = UMadCorKalomTeleportComponent::GetOrCreate(GetAvatarActorFromActorInfo());
        m_DisappearDelegateHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Ability_Action_Teleport_Disappear, this, n"OnDisappearCompleted");
        m_AppearDelegateHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Ability_Action_Teleport_Appear, this, n"OnAppearCompleted");

        m_CurrentTeleportSpot = m_TeleportComp.FindFurthestTeleportSpot(m_TeleportComp.m_TeleportSpotFilterClass);
        m_TeleportComp.SetTargetTeleportSpot(m_CurrentTeleportSpot);
        Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).GothicMovementComponent.SetMovementMode(EMovementMode::MOVE_Custom);
        GiveTeleportAbility(GameplayTag::Ability_Action_Teleport_Disappear);
    }

    void GiveTeleportAbility(FGameplayTag TeleportTag)
    {
        FGameplayEventData gameplay_event;
		gameplay_event.EventTag = TeleportTag;
        gameplay_event.Target = m_CurrentTeleportSpot;

        FGameplayAbilitySpec ability_spec = FGameplayAbilitySpec(UGA_Teleport_MadCorKalom_PlayMontage::StaticClass());
        MagicScript::GivePlayRemove(GetAbilitySystemComponentFromActorInfo(), ability_spec, gameplay_event);
    }

    UFUNCTION()
    void OnDisappearCompleted(FGameplayEventData GameplayEventData)
    {
        //auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        //abComp.SendGameplayEvent(GameplayTag::Event_Visuals_Invulnerable_SpawnExplosion);

        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_DisappearDelegateHandle);
        m_TeleportComp.OnMovementCompletedDelegate.BindUFunction(this, n"OnMovementCompleted");
        m_TeleportComp.DoTeleportToSpotVisual();
    }

    UFUNCTION()
    void OnMovementCompleted()
    {
        GiveTeleportAbility(GameplayTag::Ability_Action_Teleport_Appear);
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        //abComp.SendGameplayEvent(GameplayTag::Event_Visuals_Invulnerable_SpawnShield);
    }

    UFUNCTION()
    void OnAppearCompleted(FGameplayEventData GameplayEventData)
    {
        if(HasAuthority())
            AG1RGameState::SaveWorldFloatData(GetWorld(), m_SaveGameKey, 1);
        
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_AppearDelegateHandle);
        //FGameplayEventData Payload;
        //GetAbilitySystemComponentFromActorInfo().SendGameplayEvent(GameplayTag::Ability_Action_Teleport_XardasSleeper_Completed, Payload);
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        abComp.GiveAbility(UGA_Trance_MadCorKalom_PlayMontage::StaticClass(), 1, -1, nullptr);
       
        FGameplayAbilitySpec outSpec;
        abComp.FindAbilitySpecFromClass(UGA_MadCorKalom_Teleport::StaticClass(), outSpec);
        abComp.ClearAbility(outSpec.Handle);
        //EndAbility();
    }


}