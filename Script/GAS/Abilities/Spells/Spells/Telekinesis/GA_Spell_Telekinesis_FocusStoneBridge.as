class UGA_Spell_Telekinesis_FocusStoneBridge : UGA_Spell_Telekinesis
{

    UPROPERTY()
    UDelegateHandleContainer m_OnBridgeExtendedHandle;

    UPROPERTY()
    AFocusStoneBridgeItem m_TelekinesisBridgeItem;

    default m_SpellConfigClass = UTelekinesisFocusStoneBridgeSpellConfig::StaticClass();

    // We allow the visual interruption of the ItemVisualWorld
    UFUNCTION(BlueprintOverride)
    bool IsTargetVisibleServer_Scriptable() override
    {
         if(m_Target == nullptr)
             return false;
        return true;
    }


    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void OnActivateSpellServer_Scriptable()
    {
        if(m_Target == nullptr)
        {
            OnLaunchSpellMontageInterrupted();
            return;
        }

        m_TelekinesisBridgeItem = Cast<AFocusStoneBridgeItem>(GetTarget());
        m_OnBridgeExtendedHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_FocusStone_TelekinesisBridge_Extended, this, n"OnBridgeExtended");
    }

    
    UFUNCTION()
    void OnBridgeExtended(FGameplayEventData GameplayEventData)
    {

        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnBridgeExtendedHandle);
        if(m_TelekinesisBridgeItem == nullptr)
        {
            DoEndSpellAction();
            return;
        }

        if(HasAuthority())
            ClearInteractableBehaviours();
        ClearReleaseTargetDelegate();
	    DeactivateTarget();
        DoEndSpellAction();
    }
    
    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void DoActivateAbility_Scriptable() override
    {
        
        if(m_TelekinesisBridgeItem == nullptr)
        {
            DoEndSpellAction();
            return;
        }
            
        m_TelekinesisBridgeItem.m_TelekinesisBridgeActor.m_UserCharacter = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        m_TelekinesisBridgeItem.m_TelekinesisBridgeActor.ActivateVisuals();
    }

    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void OnEndSpell_Scriptable() override
    {
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnBridgeExtendedHandle);
        if(!HasAuthority())
            return;
        
        if(m_TelekinesisItemMovementVisual != nullptr)
            m_TelekinesisItemMovementVisual.DestroyActor();        
        if(m_TelekinesisBridgeItem != nullptr)
        {
            if(m_TelekinesisBridgeItem.m_TelekinesisBridgeActor.m_Extended)
                m_TelekinesisBridgeItem.m_TelekinesisBridgeActor.DestroyInteractActor();  
            else
                m_TelekinesisBridgeItem.m_TelekinesisBridgeActor.DoStopMovement();
        }
                

    }

    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void OnVisualInterruption_Scriptable() override
    {
    }
   
    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void OnUpdateSpell_Scriptable(float DeltaTime)
    {
        if(m_IsDoingInteractAction)
            return;
        if(HasAuthority())
        {
            CheckDistanceToInteract();
        }
        
    }


    void CheckDistanceToInteract() override
    {
        if(!HasAuthority())
            return;
    }

    UFUNCTION(BlueprintOverride)
    void StartItemVisuals_Scriptable()
    {
    }

    UFUNCTION(BlueprintOverride)
    void StopItemVisuals_Scriptable()
    {
    
    }

    UFUNCTION(BlueprintOverride)
    bool AvoidRestoreTargetGravity_Scriptable()
    {
        return true;
    }
    UFUNCTION(BlueprintOverride)
    bool ShouldDetachFromOwner_Scriptable()
    {
        return false;
    }


    
}