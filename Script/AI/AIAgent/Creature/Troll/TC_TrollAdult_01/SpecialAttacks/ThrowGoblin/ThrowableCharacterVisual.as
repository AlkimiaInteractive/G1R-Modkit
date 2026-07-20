class AThrowableCharacterVisual : AThrowableVisual
{
    default m_CollisionComp.m_WeaponData = UTrollThrowGoblinProjectile::StaticClass();

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    AGothicCharacter m_VisualCharacter;

    UPROPERTY()
    FActiveGameplayEffectHandle m_ProjectileEffectHandle;
    UPROPERTY()
    FRotator m_VisualCharacterOriginalRotation;

    FGameplayAbilitySpecHandle m_abilityHandle;

    UPROPERTY()
    USkeletalMeshComponent m_mesh;
    UPROPERTY()
    bool m_UseLastHandRotation = false;
    UPROPERTY()
    FRotator m_LastHandRotation = FRotator::ZeroRotator;

    UFUNCTION(BlueprintCallable)
    void OnProjectileSpawned(AGothicCharacter VisualCharacter)
    {
        if(VisualCharacter == nullptr)
            return;

        m_VisualCharacter = VisualCharacter;
        m_VisualCharacterOriginalRotation = m_VisualCharacter.CapsuleComponent.WorldRotation;
        m_VisualCharacter.CapsuleComponent.SetHiddenInGame(true);
        // m_VisualCharacter.CapsuleComponent.SetHiddenInGame(false);
        // m_VisualCharacter.MovementComponent.Deactivate();
        // m_VisualCharacter.MovementComponent.StopActiveMovement();
        // m_VisualCharacter.Mesh.SetAllBodiesBelowSimulatePhysics(FName("root"), false);
        // m_VisualCharacter.Mesh.SetEnableGravityOnAllBodiesBelow(false, FName("root"));

        auto abComp = Cast<UGothicAbilitySystemComponent>(m_VisualCharacter.GetAbilitySystemComponent());
        FGameplayEffectContextHandle context = abComp.MakeEffectContext();
        FGameplayEffectSpecHandle effect = abComp.MakeOutgoingSpec(UGE_State_Projectile::StaticClass(), 1.0f, context);
        //@DE - Example setByCallerManitude.
        //effect.GetSpec().SetByCallerMagnitude(GameplayTag::GE_Param_Experience, float(amount));
        m_ProjectileEffectHandle = abComp.ApplyGameplayEffectSpecToSelf(effect);

        
        FGameplayEventData payload;
        GothicGAS::SendGameplayEvent(m_VisualCharacter, GameplayTag::End_Action_Ragdoll, payload);    
        m_abilityHandle = abComp.GiveAbility(UGameplayAbilityThrowCharacter::StaticClass(), 1, -1, nullptr);
        m_VisualCharacter.AttachToComponent(m_MeshComp, FName("RightHandSocket"), EAttachmentRule::SnapToTarget);//, EAttachmentRule::KeepRelative, EAttachmentRule::KeepRelative, false);

        m_mesh = Cast<USkeletalMeshComponent>(GetOwner().GetComponentByClass(USkeletalMeshComponent::StaticClass()));
        OnProjectileSpawnedEvent();
    }

    UFUNCTION(BlueprintEvent)
    void OnProjectileSpawnedEvent()
    {
    }

    void InitializeProjectile()
    {
        if(m_VisualCharacter == nullptr)
            return;
        m_LastHandRotation = m_mesh.GetSocketRotation(n"weapon_r");
        m_UseLastHandRotation = true;
        OnInitializeProjectile();
    }

    UFUNCTION(BlueprintEvent)
    void OnInitializeProjectile()
    {
    }

    UFUNCTION(BlueprintOverride)
    void ForceDestroy_Scriptable()
    {
        if(m_VisualCharacter == nullptr)
            return;

        m_VisualCharacter.DetachRootComponentFromParent();
        m_VisualCharacter.CapsuleComponent.SetWorldRotation(m_VisualCharacterOriginalRotation);
        // m_VisualCharacter.MovementComponent.StopActiveMovement();
        // m_VisualCharacter.MovementComponent.Activate();
        // m_VisualCharacter.Mesh.SetAllBodiesBelowSimulatePhysics(FName("root"), true);
        // m_VisualCharacter.Mesh.SetEnableGravityOnAllBodiesBelow(true, FName("root"));
        //m_VisualCharacter.GothicMovementComponent.SetMovementMode(EMovementMode::MOVE_Walking);    

        // m_VisualCharacter.Mesh.SetWorldLocation(m_VisualCharacter.CapsuleComponent.GetWorldLocation());
        // m_VisualCharacter.MovementComponent.StopMovementImmediately();
        // m_VisualCharacter.Mesh.ResetAllBodiesSimulatePhysics();

        auto abComp = m_VisualCharacter.GetAbilitySystemComponent();
        abComp.RemoveActiveGameplayEffect(m_ProjectileEffectHandle);
        abComp.ClearAbility(m_abilityHandle);

        FGameplayEventData payload;
        GothicGAS::AddTargetRagdollData(payload, Math::RandRange(0.5f, 1.5f));
        GothicGAS::SendGameplayEvent(m_VisualCharacter, GameplayTag::Action_Ragdoll, payload);
    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        if(m_VisualCharacter == nullptr)
            return;

        m_VisualCharacter.SetActorLocation(GetActorLocation());
        
        if(m_UseLastHandRotation)
        {
            //@DE - Do nothing. Leave the rotation to the config rotaiton.
            //m_VisualCharacter.SetActorRotation(m_LastHandRotation);
        }
        else
            m_VisualCharacter.SetActorRotation(m_mesh.GetSocketRotation(n"weapon_r"));
        
    }
}


class UGE_State_Projectile : UScriptGameplayEffect
{
	//Tags of the gameplay effect (This help to get the effect from the ability system)
	default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::State_Projectile);

	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Projectile);
	default DurationPolicy = EGameplayEffectDurationType::Infinite;
}

