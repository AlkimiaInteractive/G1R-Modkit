UCLASS()
class AProjectileDamageExplosionVisual : AExplosionVisual
{
    UPROPERTY(DefaultComponent)
    UGothicAbilitySystemComponent m_AbComp;

    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent m_RootComp;
    // UPROPERTY(DefaultComponent, Attach=m_RootComp)
    // UHitSphereCollisionComponent m_CollisionComp;
    // default m_CollisionComp.SetState(EHitColliderState::None);
    // default m_CollisionComp.SetSphereRadius(0.f);
    // default m_CollisionComp.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");
    // default m_CollisionComp.OnComponentEndOverlap.AddUFunction(this, n"OnEndOverlap");

    UPROPERTY(NotVisible)
    TSubclassOf<UWeaponDefinition> m_WeaponDefClass;// = UEnvironment_LavaDefinition::StaticClass();

    // UPROPERTY()
    // float m_RadiusIncrement = 75.f;
    UPROPERTY()
    float m_XOffset = 50.f;

    UPROPERTY()
    TMap<AActor, FActiveGameplayEffectHandle> m_TargetsMap;

    default bNeverApplyTickOptimizations = true;

    UPROPERTY()
    FGameplayTag m_OnApplyEnvironmentDebuff = GameplayTag::Event_Debuff_Environment;
    UPROPERTY()
    FGameplayTag m_ProjectileDebuffTag = FGameplayTag();
    
    UPROPERTY()
    private FTimerHandle TaskTimer;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        if(!HasAuthority())
            return;        
        InitializeCollisions(); 
        //m_CollisionComp.SetHiddenInGame(false);
    }

    void InitializeCollisions()
    {
    }

    UShapeComponent GetCollisionComponent()
    {
        return nullptr;
    }

    // void SetRadius(float Radius)
    // {
    //     //m_CollisionComp.SetSphereRadius(Radius + m_RadiusIncrement);
    // }

    UFUNCTION(BlueprintCallable)
    void ActivateDamage(FVector NormalVector)
    {
        if(!HasAuthority())
            return;   
            
        SetCollisionState(EHitColliderState::Damage);
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"DeactivateDamage"), .3f, false);
    }

    void SetCollisionState(EHitColliderState State)
    {
    }

    UFUNCTION()
    void DeactivateDamage()
    {
        System::ClearAndInvalidateTimerHandle(TaskTimer);
        SetCollisionState(EHitColliderState::None);
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        System::ClearAndInvalidateTimerHandle(TaskTimer);
        SetCollisionState(EHitColliderState::None);
    }

    UFUNCTION()
    void OnBeginOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, const FHitResult&in SweepResult)
    {
        if(!HasAuthority())
            return;

        auto owner = GetOwner();
        //if(OtherActor == owner)
        {
            //m_CollisionComp.OnActorDetected.Broadcast(OtherActor);
        //    return;
        }
        // FString a = FString(OtherActor.GetName());
        // a.Append(FString(" - "));
        // a.Append(OtherComp.GetName());
        // Print(a, 15.f, FLinearColor::Red);

        UGothicAbilitySystemComponent sourceAbComp = GothicGAS::GetAbilitySystemComponent(Owner);
        UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(OtherActor);
        
        if(targetAbComp == nullptr || m_TargetsMap.Contains(OtherActor))
        {
            return;
        }

        if(targetAbComp.HasGameplayTag(GameplayTag::State_Defeated) || targetAbComp.HasGameplayTag(GameplayTag::State_Dead))
        {
            return;
        }

        if(!CanReachTarget(this, OtherActor, GetVisibilityOriginPoint(), OtherComp))
        {
            return;
        }

        if(sourceAbComp == nullptr || targetAbComp == nullptr || GetWeaponDefinitionSubclass() == nullptr)
        {
            return;
        }

        auto interactiveActor = Cast<AInteractiveGasObjectActor>(OtherActor);
        if(interactiveActor != nullptr)
        {
            auto interactiveActorAbilitySystemComponent = interactiveActor.GetAbilitySystemComponent();
            if(interactiveActorAbilitySystemComponent != nullptr)
            {
                GothicGAS::ApplyDebuffGameplayEffects(interactiveActorAbilitySystemComponent, GetDebuffGameplayEffectsToApplyWhenOverlap_Scriptable());
                NotifyEnvironmentDebuffToInteractableGasObjectActor(interactiveActorAbilitySystemComponent);
                //Those effects are premanent. So we dont need manage the handle. Its for optimize
                m_TargetsMap.Add(interactiveActor, FActiveGameplayEffectHandle());
                interactiveActor.OnImpact();
            }
            return;
        }
        else
        {
            auto environmentSpellComp = UEnvironmentInteractableSpellComponent::Get(OtherActor);
            if(environmentSpellComp != nullptr)
            {
                NotifyEnvironmentDebuffToInteractableGasObjectActor(environmentSpellComp.m_AbComp);
                m_TargetsMap.Add(OtherActor, FActiveGameplayEffectHandle());
                return;
            }
        }

        AGothicCharacter targetCharacter = Cast<AGothicCharacter>(OtherActor);
        if(targetCharacter == nullptr)
            return;

        //@DE - Avoid damage allies or players.
        AGothicCharacter target = Cast<AGothicCharacter>(targetAbComp.GetAvatar());
        AGothicCharacter source = Cast<AGothicCharacter>(sourceAbComp.GetAvatar());
        //@DE - Target character can be null, like environment damage elements. Ej. Milten Braziers
        if(target != nullptr && source != nullptr)
        {
            if(source.IsPlayerControlled())
            {
                if(target.IsPlayerControlled() || target.IsFriendlyTowards(source))
                {
                    m_TargetsMap.Add(target, FActiveGameplayEffectHandle());
                    return;
                }

            }
            else if(target.IsFriendlyTowards(source))
            {
                m_TargetsMap.Add(target, FActiveGameplayEffectHandle());
                return;
            }
        }

        DoOnBeginOverlap(OverlappedComponent, OtherActor, OtherComp, OtherBodyIndex, bFromSweep, SweepResult);
    }

    bool CanReachTarget(AActor SourceActor, AActor TargetActor, FVector OriginPoint, UPrimitiveComponent OtherComp)
    {
        return MagicScript::IsTargetVisible(SourceActor, TargetActor, OriginPoint, OtherComp);
    }

    FVector GetVisibilityOriginPoint()
    {
        return GetCollisionComponent().GetWorldLocation();
    }

    void OnTargetNotVisible(AActor OtherActor)
    {
    }

    bool NeedCheckVisibility()
    {
        return true;
    }

    //Override this function if your overlap shape needs more functionality (Example A_FireGolem_EnvironmentAttack_PlayerArenaDetector)
    void DoOnBeginOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, FHitResult SweepResult)
    {
        UGothicAbilitySystemComponent sourceAbComp = GothicGAS::GetAbilitySystemComponent(Owner);
        UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(OtherActor);

        FActiveGameplayEffectHandle handle = ApplyGameplayEffectToTarget(sourceAbComp, targetAbComp, SweepResult);
        if(MagicScript::IsValidGameplayEffectHandle(handle) || MagicScript::WasSuccessfullyApplied(handle))
            OnEffectAppliedSuccessfully(OtherActor, handle);
    }
    
    //Override this function if your overlap shape doesnt need do damage.
    //Default behaviour its do damage (Example A_FireGolem_EnvironmentAttack_PlayerArenaDetector)
    UFUNCTION()
    FActiveGameplayEffectHandle ApplyGameplayEffectToTarget( UGothicAbilitySystemComponent sourceAbComp, UGothicAbilitySystemComponent targetAbComp, const FHitResult&in SweepResult)
    {
        return DoDamage(sourceAbComp, targetAbComp, SweepResult);
    }

    FActiveGameplayEffectHandle DoDamage(UGothicAbilitySystemComponent sourceAbComp, UGothicAbilitySystemComponent targetAbComp, FHitResult SweepResult)
    {
        if(sourceAbComp == nullptr || targetAbComp == nullptr || GetWeaponDefinitionSubclass() == nullptr || m_TargetsMap.Contains(targetAbComp.GetAvatar()))
        {
            return FActiveGameplayEffectHandle();
        }

        FGameplayEffectContext_HitResponse hit_data;
        hit_data.Impact = GetAttackType();
        hit_data.WeaponUsed = GetWeaponDefinitionSubclass();
                
        if(GetAttackType() != GameplayTag::Combat_HitType_Dot)
        {
            hit_data.SourceDirection = MagicScript::GetCombatDirectionGivenHitLocation(
            targetAbComp.GetAvatar().GetActorForwardVector(), 
            targetAbComp.GetAvatar().GetActorRightVector(), 
                -sourceAbComp.GetAvatar().GetActorForwardVector());
        }
        //Print("DoDamage");
        return GothicGAS::ApplyDamageTo(sourceAbComp, sourceAbComp.GetAvatar(), this, targetAbComp, hit_data, SweepResult);
    }

    void OnEffectAppliedSuccessfully(AActor TargetActor, FActiveGameplayEffectHandle handle)
    {
        m_TargetsMap.Add(TargetActor, handle);
        ApplyTargetVisuals(TargetActor);
    }


    //@DE - Event to notify the actor blueprint about a new target. Used for visuals on bp.
    UFUNCTION(BlueprintEvent, NetMulticast)
    void ApplyTargetVisuals(AActor TargetActor)
    {

    }

    UFUNCTION()
    void OnEndOverlap(UPrimitiveComponent OverlappedComp, AActor OtherActor, UPrimitiveComponent OtherComp, int32 OtherBodyIndex)
    {
        if(!HasAuthority())
            return;
        if(CheckIsOverlappingActor(OtherActor))
            return;
        DoOnEndOverlap(OverlappedComp, OtherActor, OtherComp, OtherBodyIndex);        
    }

    //Override this function if your overlap shape needs more functionality (Example A_FireGolem_EnvironmentAttack_PlayerArenaDetector)
    void DoOnEndOverlap(UPrimitiveComponent OverlappedComp, AActor OtherActor, UPrimitiveComponent OtherComp, int32 OtherBodyIndex)
    {
       
    }

    bool CheckIsOverlappingActor(AActor OtherActor)
    {
        if(GetCollisionState() != EHitColliderState::Damage)
            return false;
        TArray<AActor> overlappingActors;
        GetOverlappingActorsCustom(overlappingActors, AGothicCharacter::StaticClass());
        for(auto actor : overlappingActors)
        {
            if(actor == OtherActor)
                return true;
        }
        return false;
    }

    void GetOverlappingActorsCustom(TArray<AActor>& overlappingActors, UClass StaticClass)
    {
    }

    EHitColliderState GetCollisionState()
    {
        return EHitColliderState::None;
    }

    UFUNCTION()
	TArray<TSubclassOf<UGameplayEffect>> GetDebuffGameplayEffectsToApplyWhenOverlap_Scriptable() const
    {
        TArray<TSubclassOf<UGameplayEffect>> effects;
        return effects;        
    }

    UFUNCTION()
    FGameplayTag GetAttackType()
    {
        return GameplayTag::Combat_HitType_Standard;
    }

    UFUNCTION()
    TSubclassOf<UWeaponDefinition> GetWeaponDefinitionSubclass()
    {
        return m_WeaponDefClass;
    }


    UFUNCTION()
    UWeaponDefinition GetWeaponDefinition()
    {
        return Cast<UWeaponDefinition>(GetWeaponDefinitionSubclass().Get().GetDefaultObject());
    }


    //@DE - They need know each application of the interactable debuff effect. I send the event due the GE is not applied if it already applied
    void NotifyEnvironmentDebuffToInteractableGasObjectActor(UAbilitySystemComponent InteractiveActorAbilitySystemComponent)
    {
        InteractiveActorAbilitySystemComponent.SendGameplayEvent(m_OnApplyEnvironmentDebuff, GetPayloadEnvironmentDebuff());
    }

    FGameplayEventData GetPayloadEnvironmentDebuff()
    {
        FGameplayEventData payload = FGameplayEventData();
        payload.EventTag = m_ProjectileDebuffTag;
        payload.Instigator = this;
        return payload;
    }
}