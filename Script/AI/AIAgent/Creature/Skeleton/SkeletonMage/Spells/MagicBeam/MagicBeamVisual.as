class AMagicBeamVisual : ACapsuleCollisionShapeVisual
{
    UPROPERTY()
    UMagicBeamDefinition_SkeletonMage m_def;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    USceneComponent m_CollisionBasePivot;
    UPROPERTY()
    private FTimerHandle TaskTimer;

    UPROPERTY()
    TArray<AActor> m_TargetInAreaNotReachable;

    default m_CollisionComp.m_WeaponData = UMagicBeamDefinition_SkeletonMage::StaticClass();

    UFUNCTION(BlueprintOverride)
    void Initialize()
    {
        Super::Initialize();
        ShowVisuals();
        //@DE - Security lifespan
        SetLifeSpan(5.f);
    }


    UFUNCTION(BlueprintEvent)
    void ShowVisuals()
    {

    }

    bool SetUpCollisionShape() override
    {
        m_def = Cast<UMagicBeamDefinition_SkeletonMage>(GetWeaponDefinition());
        if(m_def != nullptr)
        {
            //m_CollisionComp.SetSphereRadius(m_def.m_SphereRadius);
            m_CollisionComp.SetCapsuleHalfHeight(m_def.m_CapsuleHalfHeight);
            m_CollisionComp.SetCapsuleRadius(m_def.m_CapsuleRadius);
            //SetLifeSpan(m_def.m_LifeSpan);
            SetColliderState(EHitColliderState::Damage);
            ActivateOverlapTimer();
            return true;
        }
        return false;
    }

    void ActivateOverlapTimer()
    {
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"OverlapCheck"), .5f, true);
    }

    UFUNCTION()
    void OverlapCheck()
    {
        TArray<AActor> overlappingActors;
        m_CollisionComp.GetOverlappingActorsCustom(overlappingActors, AGothicCharacter::StaticClass());
        for(auto overlapActor : overlappingActors)
        {
            if(overlapActor == GetOwner())
                continue;
            if(CanReachTarget(this, overlapActor, m_CollisionBasePivot.GetWorldLocation(), nullptr))
            {
                if(!m_TargetsMap.Contains(overlapActor))
                {
                    //UGothicAbilitySystemComponent sourceAbComp = GothicGAS::GetAbilitySystemComponent(Owner);
                    //UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(overlapActor);
                    FHitResult SweepResult;
                    if(m_TargetInAreaNotReachable.Contains(overlapActor))
                    {
                        m_TargetInAreaNotReachable.Remove(overlapActor);
                    }
                    DoOnBeginOverlap(nullptr, overlapActor, nullptr, 0, false, SweepResult);

                    
                }
            }
            else
            {
                if(m_TargetsMap.Contains(overlapActor))
                {
                    if(!m_TargetInAreaNotReachable.Contains(overlapActor))
                    {
                        m_TargetInAreaNotReachable.Add(overlapActor);
                    }
                    
                    RemoveDamage(overlapActor);
                }
            }
        }
    }

    void OnEffectAppliedSuccessfully(AActor TargetActor, FActiveGameplayEffectHandle handle) override
    {
        Super::OnEffectAppliedSuccessfully(TargetActor, handle);
        const auto character = Cast<AGothicCharacter>(TargetActor);
        if(character != nullptr)
            character.GetFXComponent().PlayEffect(GameplayTag::FX_Magic_Spell_SkeletonMage_MagicBeam, nullptr);
    }

    void DoOnEndOverlap(UPrimitiveComponent OverlappedComp, AActor OtherActor,
                        UPrimitiveComponent OtherComp, int32 OtherBodyIndex) override
    {
        RemoveDamage(OtherActor);
        if(m_TargetInAreaNotReachable.Contains(OtherActor))
            m_TargetInAreaNotReachable.Remove(OtherActor);
    }

    void RemoveDamage(AActor OtherActor)
    {
        if(!m_TargetsMap.Contains(OtherActor))
            return;

        UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(OtherActor);
        if(RemoveEffectToTarget(targetAbComp, m_TargetsMap[OtherActor]))
            m_TargetsMap.Remove(targetAbComp.GetAvatar());
    }

    bool RemoveEffectToTarget(UGothicAbilitySystemComponent TargetAbComp, FActiveGameplayEffectHandle Handle)
    {
        if(TargetAbComp != nullptr && m_TargetsMap.Contains(TargetAbComp.GetAvatar()))
        {
            return TargetAbComp.RemoveActiveGameplayEffect(Handle);
        }
        return false;
    }

    UFUNCTION(BlueprintEvent)
    void DoDestroy()
    {
        
    }

    FGameplayTag GetAttackType() override
    {
        return GameplayTag::Combat_HitType_Additive;
    }

    bool NeedCheckVisibility() override
    {
        return true;
    }

    FVector GetVisibilityOriginPoint() override
    {
        return m_CollisionBasePivot.GetWorldLocation();
    }
}