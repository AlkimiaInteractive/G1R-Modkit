
class UGA_Teleport_XardasSleeper : UGameplayAbilityCreatureBasic//UGameplayAbilitySpellCreaturePlayMontage
{
    default AbilityTags.AddTag(GameplayTag::Ability_Action_Teleport_XardasSleeper);
    default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_Teleport_XardasSleeper);
    default AbilityTags.RemoveTag(GameplayTag::AbilitySpec_Transient);
    default AbilityTags.AddTag(GameplayTag::AbilitySpec_Continuous);
    
    default	BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Hit);
	default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Combat);
	default BlockAbilitiesWithTag.AddTag(GameplayTag::State_Hit);
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_MagicBase);

    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Interact);
    default BlockAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_DrawItem);
	
	default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Hit);
	default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Combat);
	default CancelAbilitiesWithTag.AddTag(GameplayTag::State_Hit);
    default CancelAbilitiesWithTag.AddTag(GameplayTag::Ability_Action_MagicBase);

    default ActivationOwnedTags.AddTag(GameplayTag::State_IgnoreMovementInput);
    default ActivationOwnedTags.AddTag(GameplayTag::State_BlockState);
    default ActivationOwnedTags.AddTag(GameplayTag::State_LockMovement);
    default ActivationOwnedTags.AddTag(GameplayTag::State_Rotation_Lock);

    default TriggerBeginOn(GameplayTag::Ability_Action_Teleport_XardasSleeper);

    default m_ActivateAbilityOnGranted = false;

    default ReplicationPolicy = EGameplayAbilityReplicationPolicy::ReplicateYes; //this is necessary because if not the rpc we have not work.

    default ActivationOwnedTags.AddTag(GameplayTag::State_NonInteractable);


    UPROPERTY()
    AXardasSleeperTeleportSpotVisual m_CurrentTeleportSpot;
    UPROPERTY()
    UDelegateHandleContainer m_DisappearDelegateHandle;

    UPROPERTY()
    UDelegateHandleContainer m_AppearDelegateHandle;
    UPROPERTY()
    UXardasSleeperTeleportComponent m_TeleportComponent;

    UPROPERTY()
    UDelegateHandleContainer m_DisappearStunnedDelegateHandle;
        UPROPERTY()
    UDelegateHandleContainer m_DisappearInitialDelegateHandle;

    UFUNCTION(BlueprintOverride)
    bool OnCanActivateAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo) const
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(GameplayAbilityActorInfo.GetAbilitySystemComponent());
        if(abComp.HasTagExact(GameplayTag::State_XardasSleeper_CanTeleportWithoutCheck))
            return true;
        FGameplayTagContainer tagContainer;
        tagContainer.AddTag(GameplayTag::State_XardasSleeper_DoingTeleportTo_CentralSpot);
        tagContainer.AddTag(GameplayTag::State_XardasSleeper_DoingTeleportTo_MinionSpot);
        return !abComp.HasAnyGameplayTags(tagContainer);
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
         if(!HasAuthority())
            return;

        ClearTargetingBy();

        m_CurrentTeleportSpot = Cast<AXardasSleeperTeleportSpotVisual>(TriggerEventData.Target);//SelectTeleportSpot();
        m_TeleportComponent = Cast<UXardasSleeperTeleportComponent>(TriggerEventData.OptionalObject);

           
        //m_CurrentTeleportSpot.SetOwner(GetAvatarActorFromActorInfo());
        m_CurrentTeleportSpot.AddDoingTeleportTag();
        m_TeleportComponent.SetTargetTeleportSpot(m_CurrentTeleportSpot);
        
        m_DisappearDelegateHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Ability_Action_Teleport_XardasSleeper_Disappear, this, n"OnDisappearCompleted");
        m_DisappearStunnedDelegateHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Ability_Action_Teleport_XardasSleeper_Disappear_FromStunned, this, n"OnDisappearCompleted");
        m_DisappearInitialDelegateHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Ability_Action_Teleport_XardasSleeper_Disappear_Initial, this, n"OnDisappearCompleted");
        m_AppearDelegateHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Ability_Action_Teleport_XardasSleeper_Appear, this, n"OnAppearCompleted");
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        if(abComp.HasGameplayTag(GameplayTag::State_XardasSleeper_InitialTeleport))
        {
            //@DE - The first animation is grounded
            abComp.RemoveTag(GameplayTag::State_XardasSleeper_InitialTeleport);
            GiveTeleportAbility(GameplayTag::Ability_Action_Teleport_XardasSleeper_Disappear_Initial);
            return;
        }
        else if(abComp.HasGameplayTag(GameplayTag::State_Stunned))
        {
            GiveTeleportAbility(GameplayTag::Ability_Action_Teleport_XardasSleeper_Disappear_FromStunned);
            return;
        }     
        else
        {
            GiveTeleportAbility(GameplayTag::Ability_Action_Teleport_XardasSleeper_Disappear);
        }

        //OnDisappearCompleted(FGameplayEventData());
        
    }

    void ClearTargetingBy()
    {
        auto targetDataModule = DataModule::GetTargetingDataModule(GetAvatarActorFromActorInfo());

        auto targetedBy = targetDataModule.GetTargetedBy();
        for(auto character : targetedBy)
        {
            ServerReleaseTarget(character);
            ClientReleaseTarget(character);
        }
    }

    void ReleaseTarget(ACharacter Character)
    {
        FGameplayEventData Payload;
        GothicGAS::SendGameplayEvent(Character, GameplayTag::End_Action_TargetEnemy, Payload);
    }

    UFUNCTION(Client)
    void ClientReleaseTarget(ACharacter Character)
    {
        if(ActorInfo.AvatarActor == Character && !ActorInfo.IsNetAuthority())
        {
            ReleaseTarget(Character);
        }
    }

    UFUNCTION(Server)
    void ServerReleaseTarget(ACharacter Character)
    {
        ReleaseTarget(Character);
    }

    void GiveTeleportAbility(FGameplayTag TeleportTag)
    {
        FGameplayEventData gameplay_event;
		gameplay_event.EventTag = TeleportTag;
        gameplay_event.Target = m_CurrentTeleportSpot;

        FGameplayAbilitySpec ability_spec = FGameplayAbilitySpec(UGA_Teleport_XardasSleeper_PlayMontage::StaticClass());
        MagicScript::GivePlayRemove(GetAbilitySystemComponentFromActorInfo(), ability_spec, gameplay_event);
    }

    UFUNCTION()
    void OnDisappearCompleted(FGameplayEventData GameplayEventData)
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        abComp.SendGameplayEvent(GameplayTag::Event_Visuals_Invulnerable_SpawnExplosion);

        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_DisappearDelegateHandle);
        m_TeleportComponent.OnMovementCompletedDelegate.BindUFunction(this, n"OnMovementCompleted");
        m_TeleportComponent.DoTeleportToSpotVisual();
    }

    UFUNCTION()
    void OnMovementCompleted()
    {
        GiveTeleportAbility(GameplayTag::Ability_Action_Teleport_XardasSleeper_Appear);
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        if(!m_CurrentTeleportSpot.IsA(ACentralArenaTeleportSpot::StaticClass()))
            abComp.SendGameplayEvent(GameplayTag::Event_Visuals_Invulnerable_SpawnShield);
    }

    UFUNCTION()
    void OnAppearCompleted(FGameplayEventData GameplayEventData)
    {
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_AppearDelegateHandle);
        m_TeleportComponent.OnTeleportCompleted();
        FGameplayEventData Payload;
        GetAbilitySystemComponentFromActorInfo().SendGameplayEvent(GameplayTag::Ability_Action_Teleport_XardasSleeper_Completed, Payload);
        EndAbility();
    }
}
