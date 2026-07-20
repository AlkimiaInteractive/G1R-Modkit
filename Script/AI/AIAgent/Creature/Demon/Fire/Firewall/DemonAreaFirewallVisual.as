UCLASS()
class ADemonAreaFirewallVisual : ADemonAreaVisual//AGothicGASActor//AFireDemonHellArmsAreaVisual
{

    //@DE - Only for visual reference. Delete me
    UPROPERTY(EditAnywhere, VisibleAnywhere, DefaultComponent, Attach=m_RootComp)
    UHitSphereCollisionComponent m_HitSphereCollisionComponent_SafeZone_Visual;

    UPROPERTY(EditAnywhere)
    float m_ExtraAreaIncrement;

    UPROPERTY(EditAnywhere, BlueprintReadWrite, Replicated)
    float m_AreaExteriorRadius;
    UPROPERTY(EditAnywhere)
    float m_MinDistanceToBorder;

    UPROPERTY(EditAnywhere)
    FVector m_RingLocation;

    UPROPERTY()
    TArray<AActor> m_Targets;

    UPROPERTY()
    TArray<AActor> m_FirewallBoundaryCheckers;

    UPROPERTY()
    UGothicAbilitySystemComponent m_OwnerAbComp;

    default m_SpawnActorPath = n"Blueprint'/Game/Items/Magic/FireDemon/HellArms/Ring/BP_FireDemon_HellArms_Barrier_Ring.BP_FireDemon_HellArms_Barrier_Ring_C'";

    default m_AreaSpellConfig = UFireDemonFirewallAreaRingSpellConfig::StaticClass();
    default m_AreaType = EDemonAreaTypes::Ring;

    UPROPERTY()
    TSubclassOf<UWeaponDefinition> m_WeaponDefinition = UFireDemon_FireFirewall_Definition::StaticClass();
    UPROPERTY()
    FGothicFXInstanceHandle m_SFXHandle;

    void SetUpConfig() override
    {
        Super::SetUpConfig();

        UFirewallAreaBaseSpellConfig config = Cast<UFirewallAreaBaseSpellConfig>(m_AreaSpellConfig.Get().GetDefaultObject());
        if(config == nullptr)
            DestroyActor();

        m_ExtraAreaIncrement = config.m_ExtraAreaIncrement;
        m_AreaExteriorRadius = m_AreaRadius + m_ExtraAreaIncrement;
    }
      
    void InitializeArea(AGothicCharacter target) override
    {
        Super::InitializeArea(target);

        m_HitBoxDamageActorSpawn.Deactivate();
        m_HitBoxDamageActorSpawn.SetHiddenInGame(true);
        
        m_HitSphereCollisionComponent.SetSphereRadius(m_AreaExteriorRadius);
        
        m_HitSphereCollisionComponent.SetHiddenInGame(true);

        m_HitSphereCollisionComponent_SafeZone_Visual.SetHiddenInGame(true);
        m_HitSphereCollisionComponent_SafeZone_Visual.SetSphereRadius(m_AreaRadius);
        if(HasAuthority())
        {
            m_HitSphereCollisionComponent.OnComponentBeginOverlap.AddUFunction(this, n"OnInnerSphereBeginOverlap");
            m_HitSphereCollisionComponent.OnComponentEndOverlap.AddUFunction(this, n"OnInnerSphereEndOverlap");
        }

        if(m_EnableDebugLines)
        {
            //System::DrawDebugArrow(GetActorLocation(), GetActorLocation() + GetActorForwardVector() * m_RingExteriorRadius, 12.f, FLinearColor::Gray, m_LifeSpan, 5.f);

            // System::DrawDebugCircle(m_RingLocation, m_AreaRadius, 360.f, FLinearColor::Red, m_LifeSpan, 5.f, FVector::RightVector, FVector::ForwardVector);
            // System::DrawDebugCircle(m_RingLocation, m_AreaExteriorRadius, 360.f, FLinearColor::Purple, m_LifeSpan, 5.f, FVector::RightVector, FVector::ForwardVector);
        
            //System::DrawDebugCircle(m_RingLocation, m_AreaRadius - m_MinDistanceToBorder, 360.f, FLinearColor::Green, m_LifeSpan, 5.f, FVector::RightVector, FVector::ForwardVector);
            //System::DrawDebugCircle(m_RingLocation, m_RingExteriorRadius + m_MinDistanceToBorder, 360.f, FLinearColor::Blue, m_LifeSpan, 5.f, FVector::RightVector, FVector::ForwardVector);
        }
        if(HasAuthority())
        {
            m_HitSphereCollisionComponent.SetState(EHitColliderState::Damage);
            m_HitSphereCollisionComponent_SafeZone_Visual.SetState(EHitColliderState::None);
        }

        InitializeVisuals();
        m_SFXHandle = GetFXComponent().PlayEffect(GameplayTag::FX_Creature_FireDemon_FireWall_Wall, nullptr);
    }


    //Damage capsule overlap event
    UFUNCTION()
    void OnInnerSphereBeginOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, const FHitResult&in SweepResult)
    {
        //Print("OnInnerSphereBeginOverlap", 5.f, FLinearColor::Blue);
        if(!HasAuthority())
            return;
        if(OtherActor == GetOwner())
            return;

        auto gothicChar = Cast<AGothicCharacter>(OtherActor);
        if(gothicChar == nullptr)
        {
            return;
        }

        if(!m_Targets.Contains(OtherActor))
        {
            m_Targets.Add(OtherActor);
        //addoffset
            auto firewallBoundaryChecker = Cast<AFirewallBoundaryChecker>(SpawnActor(AFirewallBoundaryChecker::StaticClass(), OtherActor.GetActorLocation()));
            firewallBoundaryChecker.AttachToActor(OtherActor, NAME_None, EAttachmentRule::SnapToTarget, EAttachmentRule::SnapToTarget, EAttachmentRule::SnapToTarget, false);
            firewallBoundaryChecker.InitializeChecker(this, gothicChar);
            firewallBoundaryChecker.m_WeaponDefinition = m_WeaponDefinition;
            m_FirewallBoundaryCheckers.Add(firewallBoundaryChecker);
            //add delegate to destroy all when the area is destroyed.
        }
        
        
    }

    //Detection shape overlap end
    UFUNCTION()
    void OnInnerSphereEndOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor,
                             UPrimitiveComponent OtherComp, int OtherBodyIndex)
    {
        //Print("OnInnerSphereEndOverlap", 5.f, FLinearColor::Red);
       
    }


    void PredictTargetMovement(AGothicCharacter CurrentTarget) override
    {
        //Super::PredictTargetMovement(CurrentTarget);
    }

    void MoveSpawnCube(float DeltaSeconds, UHitBoxCollisionComponent CurrentBox) override
    {
        //Super::MoveSpawnCube(DeltaSeconds, CurrentBox);
    }

    UFUNCTION(BlueprintOverride, meta=(NoSuperCall))
    void Tick(float DeltaSeconds)
    {
        
        
    }

    void OnLifeSpanEnds() override
    {
        Super::OnLifeSpanEnds();
        for(auto checker : m_FirewallBoundaryCheckers)
        {
            checker.DestroyActor();
        }
        GetFXComponent().StopFXInstance(m_SFXHandle, true);;
    }

}

UCLASS()
class AFirewallBoundaryChecker : AActor
{
    default bNeverApplyTickOptimizations = true;
  
    UPROPERTY(EditAnywhere)
    float m_MinInnerDistance;
    UPROPERTY(EditAnywhere)
    float m_MaxOuterDistance;

    UPROPERTY()
    ADemonAreaFirewallVisual m_OwnerArea;
    UPROPERTY()
    AGothicCharacter m_TargetCharacter;
    UPROPERTY()
    UGothicAbilitySystemComponent m_OwnerAbComp;

    UPROPERTY()
    bool m_ActivateCheck;

    UPROPERTY()
    TSubclassOf<UWeaponDefinition> m_WeaponDefinition = UFireDemon_FireFirewall_Definition::StaticClass();
    UPROPERTY()
    FActiveGameplayEffectHandle m_EffectHandle;

    
    void InitializeChecker(ADemonAreaFirewallVisual OwnerArea, AGothicCharacter TargetCharacter)
    {
        m_OwnerArea = OwnerArea;
        m_TargetCharacter = TargetCharacter;
        m_MaxOuterDistance = m_OwnerArea.m_AreaExteriorRadius;
        m_MinInnerDistance = m_OwnerArea.m_AreaRadius;
        m_OwnerAbComp = m_OwnerArea.m_OwnerAbComp;
        m_ActivateCheck = true;
    }

    bool IsCloseToBorder(FVector TargetLocation, FVector CenterArea)
    {
        auto a = CenterArea.Distance(TargetLocation);
        return (CenterArea.Distance(TargetLocation) >= m_MinInnerDistance) && (CenterArea.Distance(TargetLocation) <= m_MaxOuterDistance);
    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        if(!HasAuthority())
            return;
        if(!m_ActivateCheck)
            return;
        if(IsCloseToBorder(m_TargetCharacter.GetActorLocation(), m_OwnerArea.GetActorLocation()))
        {
            ApplyDamage();
        }
        else
        {
            RemoveDamage();
        }
    }

    void ApplyDamage()
    {
        if(!HasAuthority())
            return;
        if(MagicScript::IsValidGameplayEffectHandle(m_EffectHandle))
            return;
        auto targetAbComp = m_TargetCharacter.GetGothicAbilitySystemComponent();
        m_EffectHandle = ApplyGameplayEffectToTarget(m_OwnerAbComp, targetAbComp);
    }
    
    void RemoveDamage()
    {   if(!HasAuthority())
            return;
        auto targetAbComp = m_TargetCharacter.GetGothicAbilitySystemComponent();
        RemoveGameplayEffectToTarget(m_OwnerAbComp, targetAbComp, m_EffectHandle);
    }

    UFUNCTION()
    FActiveGameplayEffectHandle ApplyGameplayEffectToTarget( UGothicAbilitySystemComponent sourceAbComp, UGothicAbilitySystemComponent targetAbComp)
    {
        if(sourceAbComp == nullptr || targetAbComp == nullptr || m_WeaponDefinition == nullptr)
        {
            return FActiveGameplayEffectHandle();
        }

        FGameplayEffectContext_HitResponse hit_data;
        hit_data.Impact = GameplayTag::Combat_HitType_Additive;
        hit_data.WeaponUsed = m_WeaponDefinition;
        FHitResult SweepResult;
        return GothicGAS::ApplyDamageTo(sourceAbComp, sourceAbComp.GetAvatar(), this, targetAbComp, hit_data, SweepResult);
    }

    UFUNCTION()
    void RemoveGameplayEffectToTarget( UGothicAbilitySystemComponent sourceAbComp, UGothicAbilitySystemComponent TargetAbComp, FActiveGameplayEffectHandle& GEHandle)
    {
        if(TargetAbComp == nullptr)
        {
           return;
        }
        TargetAbComp.RemoveActiveGameplayEffect(GEHandle);
        GEHandle = FActiveGameplayEffectHandle();
        auto GameplayEffect = m_WeaponDefinition.GetDefaultObject().m_HitEffect;
        if(TargetAbComp.GetGameplayEffectCount(GameplayEffect, nullptr) > 0)
        {
            TargetAbComp.RemoveActiveGameplayEffectBySourceEffect(GameplayEffect, sourceAbComp);
        }
    }


    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        RemoveDamage();
    }
}