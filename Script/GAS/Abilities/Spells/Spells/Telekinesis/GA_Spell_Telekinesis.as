class UGA_Spell_Telekinesis : UGameplayAbilitySpell_Telekinesis
{
    UPROPERTY()
    FGameplayTag m_TriggerBeginOnSpellTag = GameplayTag::Ability_Action_Spell_Throw_Telekinesis;
    //UPROPERTY()
    //TSoftObjectPtr<UAnimMontage> m_PickFrontRight = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Telekinesis/A_Man_Telekinesis_Launch_PickUp_End_Montage.A_Man_Telekinesis_Launch_PickUp_End_Montage'";
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<UActorComponent> m_SpawnComponentPath = n"Blueprint'/Game/Items/Magic/Components/Telekinesis/BP_TelekinesisVisualsComponent.BP_TelekinesisVisualsComponent_C'";

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
	TSoftClassPtr<ATelekinesisItemMovement> m_SpawnItemMovementPath = n"Blueprint'/Game/Items/Magic/Telekinesis/BP_TelekinesisItemMovementVisual.BP_TelekinesisItemMovementVisual_C'";

    default m_GE_Mana = UGE_Mana_AimingLaunchingSpell::StaticClass();

    TSubclassOf<USpellConfig> m_SpellConfigClass = UTelekinesisSpellConfig::StaticClass();


    bool m_FirstExecution = true;
    FString m_TransitionBase = "Launch";
    
    bool m_ResetToInitialPositionItemOscillation = false;

    FRotator m_OriginalRotation;
    float m_AccumulatedRotationTime = 0.f;

    float m_accumulatedAngleTime = 0.f;

    UPROPERTY()
    UTelekinesisSpellConfig m_TelekinesisSpellConfig;

    UPROPERTY()
    UInteractiveComponent m_ItemInteractComponent;
    UPROPERTY()
    FTransform m_InitialBoneTransform;

    UPROPERTY()
    FName m_SocketBoneName = FName("hand_l");

    default m_SpellStateTag = GameplayTag::State_LaunchingSpell_Telekinesis;

    default ActivationOwnedTags.AddTag(GameplayTag::State_LaunchingSpell_Telekinesis);

    // Pickpocketing - Sight settings.
    default m_PickpocketingSight.m_Modifier = 25.0f;
    default m_PickpocketingSight.m_MinTimeSeconds = 1.0f;
    default m_PickpocketingSight.m_AwarenessThreshold = 100.0f;

    UTelekinesisSpellConfig GetConfig()
    {
        if(m_TelekinesisSpellConfig == nullptr)
            m_TelekinesisSpellConfig = Cast<UTelekinesisSpellConfig>(m_SpellConfigClass.Get().GetDefaultObject());
        return m_TelekinesisSpellConfig;
    }

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
    UClass GetComponentClass_Scriptable() const
    {
        return m_SpawnComponentPath.Get();
    }

    UFUNCTION(BlueprintOverride)
    UClass GetItemMovmentVisualClass_Scriptable() const
    {
        return m_SpawnItemMovementPath.Get();
    }

    // float GetRange()
    // {
    //     return GetConfig().m_AreaRange;
    // }

    // float GetTraceRadius()
    // {
    //     return GetConfig().m_TraceRadius;
    // }
    
    // float GetItemOscillationFrecuency()
    // {
    //     return GetConfig().m_ItemOscillationFrecuency;
    // }
    // float GetItemOscillationAmplitude()
    // {
    //     return GetConfig().m_ItemOscillationAmplitude;
    // }

    FVector GetFallVelocity()
    {
        return GetConfig().m_FallVelocity;
    }

    float GetMoveSpeed()
    {
        return GetConfig().m_MovingSpeed;
    }

    float GetMinDistanceToInteractItem()
    {
        return GetConfig().m_MinDistanceToInteractItem;
    }

    UFUNCTION(BlueprintOverride)
    float GetDropRotation_Scriptable()
    {
        return GetConfig().m_DropRotation;
    }

    UFUNCTION(BlueprintOverride)
    bool IsUsingImpulseOnDrop_Scriptable()
    {
        return GetConfig().m_IsUsingImpulseOnDrop;
    }
    
    UFUNCTION(BlueprintOverride)
    FVector GetDropImpulse_Scriptable()
    {
        return GetConfig().m_DropImpulse;
    }

    // We allow the visual interruption of the ItemVisualWorld
    UFUNCTION(BlueprintOverride)
    bool IsTargetVisibleServer_Scriptable()
    {
        if(m_Target == nullptr)
            return false;

        FCollisionResponseContainer responses;
        responses.SetAllChannels(ECollisionResponse::ECR_Ignore);
        responses.SetResponse(ECollisionChannel::ECC_Pawn, ECollisionResponse::ECR_Block);
        return MagicScript::IsTargetReachable(GetAvatarActorFromActorInfo(), GetTarget(), ECollisionChannel::ECC_Visibility, responses);
    }

    // UFUNCTION(BlueprintOverride)
    // float GetItemOscillationAmplitudeServer_Scriptable()
    // {
    //    return GetItemOscillationAmplitude();
    // }

    // UFUNCTION(BlueprintOverride)
    // float GetItemOscillationFrecuencyServer_Scriptable()
    // {
    //    return GetItemOscillationFrecuency();
    // }

    UFUNCTION(BlueprintOverride)
    FVector GetFallVelocity_Scriptable()
    {
        return GetFallVelocity();
    }

    UFUNCTION(BlueprintOverride)
    void OnActivateSpellServer_Scriptable()
    {
        //Print(FString("OnActivateSpellServer_Scriptable"), 10.f, FLinearColor::Green);
    
        m_ResetToInitialPositionItemOscillation = false;
        m_OriginalRotation = m_Target.GetActorRotation().Clamp();

        if(m_Target != nullptr)
            m_ItemInteractComponent = Cast<UInteractiveComponent>(m_Target.GetComponentByClass(UInteractiveComponent::StaticClass()));

        if(m_InteractSensor == nullptr || m_Target == nullptr || m_ItemInteractComponent == nullptr)
        {
            OnLaunchSpellMontageInterrupted();
            return;
        }

        auto gothicChar = Cast<AGothicCharacter>(GetActorInfo().GetAvatarActor());
        m_InitialBoneTransform = gothicChar.Mesh.GetSocketTransform(m_SocketBoneName, ERelativeTransformSpace::RTS_World);
        StopItemMovement(m_Target);

    }
    
    void StopItemMovement(AActor Actor)
    {
        if(!GetAvatarActorFromActorInfo().HasAuthority())
            return;
        auto itemVisualWorld = Cast<AItemVisualWorld>(Actor);
        if(itemVisualWorld != nullptr)
            itemVisualWorld.PutToSleep();
    }

    UFUNCTION(BlueprintOverride)
    void DoActivateAbility_Scriptable()
    {
        
        m_TelekinesisItemMovementVisual.StartMovement_Scriptable(m_Target, m_SocketBoneName, GetMoveSpeed());
    }

    UFUNCTION(BlueprintOverride)
    void OnEndSpell_Scriptable()
    {
        if(HasAuthority() && m_TelekinesisItemMovementVisual != nullptr)
            m_TelekinesisItemMovementVisual.DestroyActor();

    }

    UFUNCTION(BlueprintOverride)
    void OnVisualInterruption_Scriptable()
    {
        m_TelekinesisItemMovementVisual.StopMovement_Scriptable();
    }
   
    UFUNCTION(BlueprintOverride)
    void OnUpdateSpell_Scriptable(float DeltaTime)
    {
        //Print(FString("OnUpdateSpell_Scriptable"));

        //System::DrawDebugSphere(m_TelekinesisItemMovementVisual.GetActorLocation(), 15.f, 32, FLinearColor::Red, 0.1f, 10.f);

        if(m_IsDoingInteractAction)
            return;
        if(HasAuthority())
        {
            CheckDistanceToInteract();
        }
        
    }


    void CheckDistanceToInteract()
    {
        if(!HasAuthority())
            return;
        if(m_Target != nullptr && m_ItemInteractComponent != nullptr)
        {            
            if(m_IsDoingInteractAction)
                return;

            if(m_TelekinesisItemMovementVisual.GetDistance_Scriptable() < GetMinDistanceToInteractItem())
            {
                m_TelekinesisItemMovementVisual.StopMovement_Scriptable();               
                PickUpItem();
                return;
            }            

            if(m_TelekinesisItemMovementVisual.GetDistance_Scriptable() < GetMinDistanceToInteractItem())
            {   
                return;
            }
        }
    }

    UFUNCTION(BlueprintOverride)
    void StartItemVisuals_Scriptable()
    {
        //StartItemOscillation();
    }

    UFUNCTION(BlueprintOverride)
    void StopItemVisuals_Scriptable()
    {
        //ResetToInitialPositionItemOscillation();
    }

    // void End()
    // {
    //     Print(FString("End Server"), 20.f, FLinearColor::Yellow);
    // }

    // UFUNCTION(Client)
    // void End_Client()
    // {
    //     Print(FString("End CLIENT"), 20.f, FLinearColor::Purple);
    // }

    void RotateToInitialPosition(float DeltaTime)
    {
        if(m_Target != nullptr)
        {
            if(m_AccumulatedRotationTime < 1.f)
            {
                m_AccumulatedRotationTime += DeltaTime;
                FRotator newRotation = Math::LerpShortestPath(m_OriginalRotation, FRotator::ZeroRotator, m_AccumulatedRotationTime);
                m_Target.SetActorRotation(newRotation);
            }
            else
            {
                m_Target.SetActorRotation(FRotator::ZeroRotator);
            }
        }
    }

    
}