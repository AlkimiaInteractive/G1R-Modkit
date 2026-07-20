class UGA_Scripted_Teleport : UGA_Creature_BehaviourScript_Base
{
    default AbilityTags.AddTag(GameplayTag::Ability_Action_Teleport_Scripted);
    default ActivationOwnedTags.AddTag(GameplayTag::Ability_Action_Teleport_Scripted);
    default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_Teleport_Scripted);
    default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_Teleport_Scripted);
    default m_ActivateAbilityOnGranted = false;
    UPROPERTY()
    UCreatureTeleportComponent m_TeleportComp;

    UPROPERTY()
    UDelegateHandleContainer m_DisappearDelegateHandle;

    UPROPERTY()
    UDelegateHandleContainer m_AppearDelegateHandle;
    UPROPERTY()
    ATeleportSpotVisual m_CurrentTeleportSpot;

    UPROPERTY(NotVisible, NotEditable)
    FName m_SaveGameKey = n"";

    UPROPERTY(NotVisible, NotEditable)
    FName m_TeleportWayPointActorName = n"";
    
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
                OnActivatedSavegameCompleted();
                return;
            }
        }
        
        m_TeleportComp = CreateTeleportComponent(GetAvatarActorFromActorInfo());//UXardas_404_TeleportComponent::GetOrCreate(GetAvatarActorFromActorInfo());
        m_DisappearDelegateHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Ability_Action_Teleport_Disappear, this, n"OnDisappearCompleted");
        m_AppearDelegateHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Ability_Action_Teleport_Appear, this, n"OnAppearCompleted");

        Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).GothicMovementComponent.SetMovementMode(EMovementMode::MOVE_Custom);
        GiveTeleportAbility(GameplayTag::Ability_Action_Teleport_Disappear);

    }

    void OnActivatedSavegameCompleted()
    {
    }

    UCreatureTeleportComponent CreateTeleportComponent(AActor Avatar)
    {
        return nullptr;
    }

    bool ShouldClearAbility()
    {
        return true;
    }

    void GiveTeleportAbility(FGameplayTag TeleportTag)
    {
        FGameplayEventData gameplay_event;
		gameplay_event.EventTag = TeleportTag;
        //gameplay_event.Target = m_CurrentTeleportSpot;

        FGameplayAbilitySpec ability_spec = GetTeleportAbilitySpec();
        MagicScript::GivePlayRemove(GetAbilitySystemComponentFromActorInfo(), ability_spec, gameplay_event);
    }

    FGameplayAbilitySpec GetTeleportAbilitySpec()
    {
        return FGameplayAbilitySpec();
    }

    UFUNCTION()
    void OnDisappearCompleted(FGameplayEventData GameplayEventData)
    {
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_DisappearDelegateHandle);
        m_TeleportComp.OnMovementCompletedDelegate.BindUFunction(this, n"OnMovementCompleted");
        m_TeleportComp.DoTeleportToWayPointActor(m_TeleportWayPointActorName);
    }

    UFUNCTION()
    void OnMovementCompleted()
    {
        GiveTeleportAbility(GameplayTag::Ability_Action_Teleport_Appear);
    }

    UFUNCTION()
    void OnAppearCompleted(FGameplayEventData GameplayEventData)
    {
        if(HasAuthority())
            AG1RGameState::SaveWorldFloatData(GetWorld(), m_SaveGameKey, 1);
        
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_AppearDelegateHandle);

    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo, bool WasCancelled)
    {
    }


}