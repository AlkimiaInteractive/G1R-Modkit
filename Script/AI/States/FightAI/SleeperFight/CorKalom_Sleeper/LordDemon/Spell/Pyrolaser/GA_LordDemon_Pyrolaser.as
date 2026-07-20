class UGA_LordDemon_Pyrolaser : UGA_AttackCapsuleLoop
{
    default ActivationRequiredTags.RemoveTag(GameplayTag::State_Grounded);
    default ActivationRequiredTags.AddTag(GameplayTag::State_Flying);

    UPROPERTY()
    UPyrolaserHitCapsuleComponent m_Comp;
    UPROPERTY()
    UPyrolaserOriginPointComponent m_OriginPoint;
    UPROPERTY()
    UAttackMeleeConfig_Pyrolaser m_PyrolaserConfig;

    UPROPERTY()
    TArray<AActor> m_CooldownActors;

    UFUNCTION(BlueprintOverride)
    bool ShouldCheckMovementMode_Scriptable() const
    {
        return false;
    }

    UFUNCTION(BlueprintOverride)
    bool NeedCalculateSourceDirection_Scriptable()
    {
        return true;
    }

    FVector GetShapeOriginPosition() override
    {
        return m_OriginPoint.GetWorldLocation();
    }

    UFUNCTION(BlueprintOverride)
    FGameplayTag GetCombatHitType_Scriptable()
    {
        return GameplayTag::Combat_HitType_Knockback;
    }

    void SetCapsuleLocalDisplacement(UHitCapsuleCollisionComponent HitComp, float CapsuleHalfHeight) override
    {
        Super::SetCapsuleLocalDisplacement(HitComp, CapsuleHalfHeight);
        FVector displacementPoint = m_OriginPoint.GetDisplacementPoint(CapsuleHalfHeight);
        HitComp.SetWorldLocation(displacementPoint);
        HitComp.SetHiddenInGame(true);
    }

    UFUNCTION(BlueprintOverride)
    void OnUpdateAbility_Scriptable(float DeltaTime)
    {
        if(!HasAuthority())
            return;
        Super::OnUpdateAbility_Scriptable(DeltaTime);
        UpdateXAxisToTarget(DeltaTime);
        UpdateVisualLength();
        // if(m_Comp != nullptr)
        //     m_Comp.DrawDebugVisual();
    }

    void UpdateVisualLength()
    {
        if(m_Comp != nullptr)
            Cast<ALordDemon>(GetAvatarActorFromActorInfo()).UpdatePyrolaserLength(m_Comp.GetScaledCapsuleHalfHeight());
    }

    void UpdateXAxisToTarget(float DeltaTime)
    {
        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        if(m_OriginPoint == nullptr || m_PyrolaserConfig == nullptr)
            return;

        auto target = gothicChar.GetTargetedActor();
        if(target == nullptr)
            return;

        FVector endCapsulePoint = m_OriginPoint.GetDisplacementPoint(m_PyrolaserConfig.m_CapsuleHalfHeight);

        if(endCapsulePoint.Z < target.GetActorLocation().Z)
        {
            auto currentRotation = m_OriginPoint.GetRelativeRotation();
            currentRotation.Roll += m_PyrolaserConfig.m_RotationVelocity * DeltaTime;
            m_OriginPoint.SetRelativeRotation(currentRotation);
        }
        else
        {   
            auto currentRotation = m_OriginPoint.GetRelativeRotation();
            currentRotation.Roll -= m_PyrolaserConfig.m_RotationVelocity * DeltaTime;
            m_OriginPoint.SetRelativeRotation(currentRotation);
        }
        
    }

    UFUNCTION(BlueprintOverride)
    void InitializeCollisionComponent(UPrimitiveComponent CollisionComp,
                                      const UAttackLoopConfig configAttack)
    {
        m_CooldownActors.Empty();

        m_OriginPoint = UPyrolaserOriginPointComponent::Get(GetAvatarActorFromActorInfo());
        m_OriginPoint.ResetRotation();

        m_Comp = Cast<UPyrolaserHitCapsuleComponent>(CollisionComp);
        m_PyrolaserConfig = Cast<UAttackMeleeConfig_Pyrolaser>(configAttack);

        Super::InitializeCollisionComponent(CollisionComp, configAttack);
        // if(m_Comp != nullptr)
        //     m_Comp.ActivateDebugVisuals();

        Cast<ALordDemon>(GetAvatarActorFromActorInfo()).ActivatePyrolaserVisuals();
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility(bool bWasCancelled)
    {
        // if(m_Comp != nullptr)
        //     m_Comp.DeactivateDebugVisuals();
        Cast<ALordDemon>(GetAvatarActorFromActorInfo()).DeactivatePyrolaserVisuals();

        //Print("OnEndAbility??????", 5.f, FLinearColor::Purple);

    }

    UFUNCTION(BlueprintOverride)
    bool IsTargetValid_Scriptable(AActor TargetActor)
    {
        if(TargetActor == nullptr)
            return false;

        FCollisionResponseContainer responses;
        responses.SetAllChannels(ECollisionResponse::ECR_Ignore);
        responses.SetResponse(ECollisionChannel::ECC_Pawn, ECollisionResponse::ECR_Block);
        
        bool result = MagicScript::IsTargetReachable(
            GetAvatarActorFromActorInfo(), 
            TargetActor, 
            ECollisionChannel::ECC_Visibility,
            responses);
        //if(!result)
        //    PrintError("UGA_LordDemon_Pyrolaser - IsTargetValid_Scriptable - Target not reachable");
        return result;
    }

    UFUNCTION(BlueprintOverride)
    void OnOverlapEnterDamage_Scriptable(UPrimitiveComponent HitComp, FHitResult Hit)
    {
        auto targetCharacter = Cast<AGothicCharacter>(Hit.GetActor());
        m_CooldownActors.Add(targetCharacter);
        auto weaponDef = Cast<ULordDemon_Pyrolaser>(GetWeaponDefinition(HitComp));
        if(weaponDef == nullptr)
            return;

        auto sourceAbComp = GetAbilitySystemComponentFromActorInfo();

        FGameplayEffectContextHandle contextHandle = sourceAbComp.MakeEffectContext();
        contextHandle.AddInstigator( GetAvatarActorFromActorInfo(), GetAvatarActorFromActorInfo());

        FGameplayEffectSpecHandle geSpecHandle = sourceAbComp.MakeOutgoingSpec(weaponDef.m_ForcedKnockbackEffect, 1, contextHandle);
        sourceAbComp.ApplyGameplayEffectSpecToTarget(geSpecHandle, targetCharacter.GetAbilitySystemComponent());

    }

    UFUNCTION(BlueprintOverride)
    bool IsValidTarget_Scriptable(AActor Target)
    {
        if(!Super::IsValidTarget_Scriptable(Target))
            return false;
        if(m_CooldownActors.Contains(Target))
        {
            //Print("Cooldown actor");
            return false;
        }

        return true;
    }
}