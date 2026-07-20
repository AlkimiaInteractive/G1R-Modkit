delegate void FSoulHarvestVisualDelegate(ASoulHarvestCharacter_Visual CurrentInstance);
UCLASS()
class ASoulHarvestCharacter_Visual : ACharacter
{
    UPROPERTY(DefaultComponent, RootComponent)
    UHitCapsuleCollisionComponent m_DamageCollisionComp;

    UPROPERTY(DefaultComponent)
    UHitSphereCollisionComponent m_DetectionSphereComp;

    UPROPERTY(DefaultComponent, Attach=m_DamageCollisionComp)
    UHurtBoxCollisionComponent m_HurtBoxCollision;

    UPROPERTY(DefaultComponent)
    UGothicAbilitySystemComponent m_AbilitySystemComponent;

    UPROPERTY(DefaultComponent)
    UDataModuleComponent m_DataModuleComponent;
    
    UPROPERTY(DefaultComponent)
    UProjectileMovementComponent m_ProjectileMovementComponent;

    UPROPERTY(BlueprintReadWrite)
    AGothicCharacter m_CurrentTarget;

    UPROPERTY(DefaultComponent, Attach=m_DamageCollisionComp)
    UGothicFXComponent m_FXComp;

    UPROPERTY()
    USoulHarvest_Definition m_SpellConfig;
    UPROPERTY()
    private FTimerHandle m_SwitchTargetTaskTimer;
    UPROPERTY()
    private FTimerHandle m_LifeTimeTaskTimer;

    UPROPERTY()
    TSubclassOf<USpellProjectileDefinition> m_WeaponConfig = USoulHarvest_Definition::StaticClass();

    UPROPERTY()
    float m_MinSwitchTargetTime = 0.f;

    UPROPERTY()
    FSoulHarvestVisualDelegate OnSoulHarvestVisualDieDelegate;

    UPROPERTY(Replicated)
    FVector m_Velocity = FVector::ZeroVector;


    default m_DamageCollisionComp.SetState(EHitColliderState::None);
    default m_DamageCollisionComp.OnComponentBeginOverlap.AddUFunction(this, n"OnDamageBeginOverlap");
    default m_DamageCollisionComp.OnComponentHit.AddUFunction(this, n"OnDamageHit");
    default m_HurtBoxCollision.OnComponentBeginOverlap.AddUFunction(this, n"OnDamageBeginOverlap");
    default m_HurtBoxCollision.OnComponentHit.AddUFunction(this, n"OnDamageHit");
    default m_DetectionSphereComp.OnComponentEndOverlap.AddUFunction(this, n"OnDetectionOverlapEndsServer");

    default m_DetectionSphereComp.m_WeaponData = m_WeaponConfig;
    default m_DamageCollisionComp.m_WeaponData = m_WeaponConfig;

    default bNeverApplyTickOptimizations = true;

    default m_ProjectileMovementComponent.bRotationFollowsVelocity = true;
    default m_ProjectileMovementComponent.InitialSpeed = 0;
	default m_ProjectileMovementComponent.MaxSpeed = 0;
	default m_ProjectileMovementComponent.ProjectileGravityScale = 0.f;
    default m_ProjectileMovementComponent.SetUpdatedComponent(m_DamageCollisionComp);

    default NetPriority = 1;
    default bReplicates = true;
    default bReplicateMovement = true;
    UPROPERTY()
    FGothicFXInstanceHandle m_HoldSFXHandle;

    UPROPERTY()
    FGameplayTag m_FXLoopTag = GameplayTag::FX_Magic_Spell_SkeletonMage_SoulHarvest_Loop;
    UPROPERTY()
    FGameplayTag m_FXImpactTag = GameplayTag::FX_Magic_Spell_SkeletonMage_SoulHarvest_Impact;
    UPROPERTY()
    FGameplayTag m_FXFizzleTag = GameplayTag::FX_Magic_Spell_SkeletonMage_SoulHarvest_Fizzle;

    UPROPERTY()
    FGameplayTag m_FXOnExplosionSelectedTag;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        CharacterMovement.Deactivate();
        m_ProjectileMovementComponent.bRotationFollowsVelocity = true;
        SetActorTickEnabled(true);
        m_DetectionSphereComp.SetState(EHitColliderState::None);
        m_DamageCollisionComp.SetState(EHitColliderState::None);

        m_SpellConfig = Cast<USoulHarvest_Definition>(m_WeaponConfig.Get().GetDefaultObject());

        TArray<UPrimitiveComponent> primitiveComponents;
        GetComponentsByClass(UPrimitiveComponent::StaticClass(), primitiveComponents);

        for(auto primitiveComp : primitiveComponents)
        {
            InitializeComponents(primitiveComp, primitiveComponents);
        }
        
    }

    void InitializeComponents(UPrimitiveComponent PrimitiveComponent, TArray<UPrimitiveComponent> PrimitiveComponents)
    {
        PrimitiveComponent.IgnoreActorWhenMoving(this, true);	
        for(auto CollisionComponent : PrimitiveComponents)
        {
            m_DetectionSphereComp.IgnoreComponentWhenMoving(CollisionComponent, true);
        }
    }

    UFUNCTION(BlueprintEvent, BlueprintCallable)
    void OnProjectileFired()
    { 
        m_DetectionSphereComp.SetSphereRadius(m_SpellConfig.m_Radius);

        m_DetectionSphereComp.SetCollisionProfileName(FName("HitProfile"), true); 
        m_DamageCollisionComp.SetCollisionProfileName(FName("HitProfile"), true);
        
        SetColliderState(EHitColliderState::Damage);
        m_ProjectileMovementComponent.InitialSpeed = m_SpellConfig.m_Speed;
        m_ProjectileMovementComponent.MaxSpeed = m_SpellConfig.m_Speed;
        m_Velocity = GetActorForwardVector() * m_SpellConfig.m_Speed;

        SetTick(true);
        ActivateInitialSwitchTargetTimer();
        ActivateLifetimeTimer();

        ActiveLoopFX();
    }

    void ActiveLoopFX()
    {
        m_HoldSFXHandle = m_FXComp.PlayEffect(m_FXLoopTag, nullptr);
    }

    UFUNCTION(NetMulticast)
    void SetTick(bool Value)
    {
        SetActorTickEnabled(Value);
    }

    void SetColliderState(EHitColliderState State)
    {
        m_DetectionSphereComp.SetState(State);
        m_DamageCollisionComp.SetState(State);
    }

    //Detection shape overlap begin -> Should Refresh manually each time? Ask Sara
    UFUNCTION()
    void OnDetectionOverlapBeginServer(UPrimitiveComponent OverlappedComp, AActor OtherActor,
                              UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep,
                              const FHitResult&in SweepResult)
    {
        //Print(FString("OnOverlapBeginServer"));
        if(Owner == OtherActor)
        {
            //Print(FString("Soul Harvest Visual - OnOverlapBeginServer: Owner == OtherActor"), 5.f, FLinearColor::Red);
            return;
        }

        auto gothicCharacter = Cast<AGothicCharacter>(OtherActor);
        if(gothicCharacter == nullptr)
        {
            //Avoid other kind of characters (Projectiles)
            //Print(FString("Soul Harvest Visual - OnOverlapBeginServer: OtherActor not AGothicCharacter"), 5.f, FLinearColor::Red);
            return;
        }
        
        auto ownerCharacter = Cast<AGothicCharacter>(GetOwner());
        if(ownerCharacter == nullptr)
        {
            //Print(FString("Soul Harvest Visual - OnOverlapBeginServer: Owner not AGothicCharacter"), 5.f, FLinearColor::Red);
            return;
        }

        if(!ownerCharacter.IsEnemyTowards(gothicCharacter))
        {
            //Print(FString("Soul Harvest Visual - OnOverlapBeginServer: !ownerCharacter.IsEnemyTowards(OtherActor)"), 5.f, FLinearColor::Red);
            return;
        }

        if(m_CurrentTarget != nullptr)
        {
            float distanceCurrentTarget = GetActorLocation().Distance(m_CurrentTarget.GetActorLocation());
            float newTargetDistance = GetActorLocation().Distance(OtherActor.GetActorLocation());
            if(newTargetDistance > distanceCurrentTarget)
            {
                //Print(FString("Soul Harvest Visual - OnOverlapBeginServer: newTargetDistance > distanceCurrentTarget"), 5.f, FLinearColor::Red);
                return;
            }
        }

        m_CurrentTarget = gothicCharacter;     
    }

    UFUNCTION(BlueprintCallable)
    void RefreshOverlappingTarget()
    {
        TArray<AActor> overlappingActors;
        m_DetectionSphereComp.GetOverlappingActorsCustom(overlappingActors, AGothicCharacter::StaticClass());
        if(overlappingActors.Num() == 1 && overlappingActors.Contains(m_CurrentTarget))
        {
            //Print(FString("Optimization"), 5.f, FLinearColor::Green);
            return;
        }
        //Optimize
        for(auto actor : overlappingActors)
        {
            OnDetectionOverlapBeginServer(nullptr, actor, nullptr, 0, false, FHitResult());
        }
    }

    void ActivateInitialSwitchTargetTimer()
    {
        ActivateSwitchTargetTimer(n"InitialCheckSwitchTarget", 0.3, false);
    }

    void ActivateLoopingSwitchTargetTimer()
    {
        ActivateSwitchTargetTimer(n"CheckSwitchTarget", m_SpellConfig.m_MinSwitchTargetTime, true);
    }


    void ActivateSwitchTargetTimer(FName FunctionName, float TimeToActivate, bool Looping)
    {
        if(System::IsTimerActiveHandle(m_SwitchTargetTaskTimer))
            System::ClearAndInvalidateTimerHandle(m_SwitchTargetTaskTimer);
        m_SwitchTargetTaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, FunctionName), TimeToActivate, Looping);
    }

    void ActivateLifetimeTimer()
    {
        m_LifeTimeTaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"OnLifeTimeEnds"), m_SpellConfig.m_LifeTime, false);
    }

    UFUNCTION()
    void InitialCheckSwitchTarget()
    {
        ActivateLoopingSwitchTargetTimer();
        CheckSwitchTarget();
    }

    UFUNCTION()
    void OnLifeTimeEnds()
    {
        m_FXOnExplosionSelectedTag = m_FXFizzleTag;
        DoExplosion(FHitResult());
    }

    UFUNCTION()
    void CheckSwitchTarget()
    {
        RefreshOverlappingTarget();
    }

    //Detection shape overlap end
    UFUNCTION()
    void OnDetectionOverlapEndsServer(UPrimitiveComponent OverlappedComponent, AActor OtherActor,
                             UPrimitiveComponent OtherComp, int OtherBodyIndex)
    {
        //Print(FString("OnOverlapEndsServer"), 10.f, FLinearColor::Purple);
        if(OtherActor == m_CurrentTarget)
            m_CurrentTarget = nullptr;
        
    }

    //Damage capsule overlap event
    UFUNCTION()
    void OnDamageBeginOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, const FHitResult&in SweepResult)
    {
        //
        if(ShouldAvoidDamage(OtherActor))
            return;
                
        ApplyDamageTo(OtherActor, SweepResult);
        m_FXOnExplosionSelectedTag = m_FXImpactTag;   
        DoExplosion(SweepResult);
    }

    //Damage capsule hit event
    UFUNCTION(BlueprintCallable)
    void OnDamageHit(UPrimitiveComponent HitComp, AActor OtherActor, UPrimitiveComponent OtherComp,
                     FVector NormalImpulse, const FHitResult&in Hit)
    {
        //if(ShouldAvoidDamage(OtherActor))
        //    return;
        m_FXOnExplosionSelectedTag = m_FXImpactTag;
        DoExplosion(Hit);
        
    }

    bool ShouldAvoidDamage(AActor OtherActor)
    {
        if(GetOwner() == OtherActor)
            return true;
        if(GetOwner() == OtherActor.GetOwner())
            return true;
        if(OtherActor.IsA(ASoulHarvestCharacter_Visual::StaticClass()))
            return true;
        if(OtherActor.IsA(AFearVisual::StaticClass()))
            return true;
        if(OtherActor.IsA(ABaseFlameActor::StaticClass()))
            return true;
        AGothicCharacter targetCharacter = Cast<AGothicCharacter>(OtherActor);
        if(targetCharacter == nullptr)
            return true;
        return false;
    }

    void DeactivateProjectile()
    {
        if(System::IsTimerActiveHandle(m_SwitchTargetTaskTimer))
            System::ClearAndInvalidateTimerHandle(m_SwitchTargetTaskTimer);

        if(System::IsTimerActiveHandle(m_LifeTimeTaskTimer))
            System::ClearAndInvalidateTimerHandle(m_LifeTimeTaskTimer);

        m_DamageCollisionComp.OnComponentBeginOverlap.Clear();
        m_DamageCollisionComp.OnComponentHit.Clear();
        SetTick(false);
        SetColliderState(EHitColliderState::None);
    }

    void DoExplosion(const FHitResult HitResult)
    {
        m_FXComp.StopFXInstance(m_HoldSFXHandle, false);
        DeactivateProjectile();
        Explode(HitResult);
        BP_DoExplosion();
        OnSoulHarvestVisualDieDelegate.ExecuteIfBound(this);
        DestroyActor();
    }


    UFUNCTION(BlueprintEvent)
    void BP_DoExplosion()
    {
    }

    void Explode(const FHitResult& HitResult)
    {
        auto explosionVisual = SpawnExplosion();
        if(explosionVisual != nullptr)
        {
            explosionVisual.m_FXTag = m_FXOnExplosionSelectedTag;
            Log("[AProjectileVisual_AS::Explode} spell level " + 1);
            explosionVisual.Multicast_OnExplode(HitResult, 1);
        }
    }

    UFUNCTION(BlueprintCallable)
    AExplosionVisual SpawnExplosion()
    {
        if(m_SpellConfig != nullptr)
        {
            UClass asset = Cast<UClass>(m_SpellConfig.m_ExplosionPath.ToSoftObjectPath().TryLoad());
        
            if(asset != nullptr)
            {
                AActor actor_default = Cast<AActor>(asset.GetDefaultObject());
                return Cast<AExplosionVisual>(SpawnActor(actor_default.Class, GetActorLocation(), GetActorRotation()));
            }
        }
        return nullptr;
    }

    void ApplyDamageTo(AActor OtherActor, const FHitResult& HitResult)
    {
        UGothicAbilitySystemComponent sourceAbComp = GothicGAS::GetAbilitySystemComponent(GetOwner());
        UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(OtherActor);

        if(sourceAbComp != nullptr && targetAbComp != nullptr)
        {
            FGameplayEffectContext_HitResponse hit_data;
            hit_data.Impact = GameplayTag::Combat_HitType_Standard;
            hit_data.WeaponUsed = m_DamageCollisionComp.m_WeaponData;
            hit_data.SourceDirection = MagicScript::GetCombatDirectionGivenHitLocation(
                        OtherActor.GetActorForwardVector(), 
                        OtherActor.GetActorRightVector(), -GetOwner().GetActorForwardVector());
            //The instigator should be the Caster
            GothicGAS::ApplyDamageTo(sourceAbComp, sourceAbComp.GetAvatar(), this, targetAbComp, hit_data, HitResult);
        }
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        DeactivateProjectile();
    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        if(HasAuthority())
            MoveToTarget();

        m_ProjectileMovementComponent.Velocity = m_Velocity;
    }    

    void MoveToTarget()
    {
        if(m_CurrentTarget == nullptr)
        {
            //Print(FString("m_CurrentTarget == nullptr"), 10.f, FLinearColor::Red);
            return;
        }
            

        FVector targetLocation = m_CurrentTarget.GetActorLocation();

        const FVector projectileLocation = GetActorLocation();
	    const FVector projectileForward = GetActorForwardVector();
        FVector projectileRightDirection = GetActorRightVector();

        //Direction from me to the target
	    FVector direction = targetLocation - projectileLocation;
	    direction.Normalize();
        //Check if its in front or back using dot product with forward vector >0 front 
	    const float ForwardDot = projectileForward.DotProduct(direction);
        //Check if its in right or left using dot product with right vector >0 right
        const float RightDot = projectileRightDirection.DotProduct(direction);
        const float ForwardAngle = Math::RadiansToDegrees(Math::Acos(ForwardDot));

        FVector VelocityVector = FVector::ZeroVector;
              
        
        if(Math::Abs(RightDot) < 0.1 && ForwardDot >= 0)
        {
            VelocityVector = GetActorForwardVector() * m_SpellConfig.m_Speed;
            //return;
        }
  
        if(RightDot >= 0)
        {
            VelocityVector = projectileForward * m_SpellConfig.m_Speed + projectileRightDirection * m_SpellConfig.m_TurnSpeed;
        }
        else
        {
            projectileRightDirection = projectileRightDirection * -1;
            VelocityVector = projectileForward * m_SpellConfig.m_Speed + projectileRightDirection * m_SpellConfig.m_TurnSpeed;
        }

        auto heightMultiplier = 0;

        if(Math::Abs(targetLocation.Z - projectileLocation.Z) > m_SpellConfig.m_HeightOffset)
        {
            heightMultiplier = 1;
        }

        if(targetLocation.Z > projectileLocation.Z)
        {
            VelocityVector.Z = heightMultiplier * m_SpellConfig.m_HeightTurnSpeed;
        }
        else if(targetLocation.Z < projectileLocation.Z) 
        {
            VelocityVector.Z = -heightMultiplier * m_SpellConfig.m_HeightTurnSpeed;
        }
        
        //SetVelocity(VelocityVector);
        /*m_ProjectileMovementComponent.Velocity =*/ 
        m_Velocity = VelocityVector;

        DebugMoveToTarget(ForwardAngle, RightDot, ForwardDot, projectileLocation, projectileForward, targetLocation, VelocityVector);        
    }

    void DebugMoveToTarget(float ForwardAngle, float RightDot, float ForwardDot, FVector ProjectileLocation,
                FVector ProjectileForward, FVector TargetLocation, FVector VelocityVector)
    {
        if(m_SpellConfig.m_EnableDebug)
        {
            System::DrawDebugLine(GetActorLocation(), TargetLocation, FLinearColor::Gray, 0.f, 10.f);
            System::DrawDebugSphere(GetActorLocation(), 10.f, 12, FLinearColor::Red, 0, 10);
            System::DrawDebugSphere(TargetLocation, 10.f, 12, FLinearColor::Green, 0, 10);

            Print(FString::ApplyFormat(ForwardAngle, FString()));
            Print(FString::ApplyFormat(RightDot, FString()));   

            if(ForwardDot >= 0)
            {
                Print(FString("Front"));
                //@DE - Find closest point to a given direction and location
                FVector point = MagicScript::FindClosestPointOnLine(TargetLocation, ProjectileLocation, ProjectileForward);
                auto distance = ProjectileLocation.Distance(point);
                auto abDirection = TargetLocation-ProjectileLocation;
                auto abDotProduct = abDirection.DotProduct(ProjectileForward);
                FVector extendedCalculus = ProjectileLocation + ProjectileForward * abDotProduct;
                //@DE - C++ Operators used on extended calculus.
                //FVector compressedCalculus = location + (forward * ((targetLocation-location) | forward));
                if(point == extendedCalculus) Print(FString("Good Calculus"));
                System::DrawDebugSphere(point, 10.f, 12, FLinearColor::Purple, 0, 10);
                System::DrawDebugLine(GetActorLocation(), GetActorLocation() + ProjectileForward * distance, FLinearColor::Yellow, 0.f, 10.f);

                //auto cosine = distance / (location.Distance(targetLocation));
                //Print(FString::ApplyFormat(cosine, FString()));
            }
            else
            {
                FVector point = MagicScript::FindClosestPointOnLine(TargetLocation, ProjectileLocation, -ProjectileForward);
                auto distance = ProjectileLocation.Distance(point);
                System::DrawDebugSphere(point, 10.f, 12, FLinearColor::Purple, 0, 10);
                System::DrawDebugLine(GetActorLocation(), GetActorLocation() + ProjectileForward * distance * -1, FLinearColor::Yellow, 0.f, 10.f);
                Print(FString("Back"));

                //auto cosine = distance / (location.Distance(targetLocation));
                //Print(FString::ApplyFormat(cosine, FString()));
            }
            
            if(RightDot >= 0)
            {
                Print(FString("Right"));
            }
            else
            {
                Print(FString("Left"));
            }
            System::DrawDebugLine(GetActorLocation(), GetActorLocation() + (VelocityVector), FLinearColor::Yellow, 0.f, 10.f);
        }
    }
}