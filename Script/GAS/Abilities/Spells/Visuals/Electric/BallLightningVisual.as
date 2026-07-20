UCLASS(Blueprintable)
class ABallLightningVisual : ASpellBallVisual_AS
{
    TArray<AActor> m_CoolDownActors;
    UPROPERTY(EditAnywhere)
    float m_CoolDownActorTime;

    default m_ProjectileDebuffTag = GameplayTag::Debuff_Electrified_Impact;

    UPROPERTY(DefaultComponent, Attach=HitComp)
    UHitSphereCollisionComponent m_DamageHitSphere;

    //@DE - On this projectile m_CollisionComp is the one that collides with the world (hit) and m_DamageHitSphere (overlap) collides with enemies

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        m_CollisionComp.SetState(EHitColliderState::None);
        m_DamageHitSphere.SetState(EHitColliderState::None);

        m_CollisionComp.OnComponentBeginOverlap.Clear();
        m_DamageHitSphere.OnComponentBeginOverlap.AddUFunction(this, n"OnOverlapBeginServer");
        m_CollisionComp.SetSphereRadius(10.f);

        //m_CollisionComp.SetHiddenInGame(false);
        //m_DamageHitSphere.SetHiddenInGame(false);

        m_CoolDownActors.Empty();
    }

    //This is for the Lightning ball
    UFUNCTION(BlueprintEvent)
    void OnProjectileFired(TSubclassOf<UBallLightningDefinition_Base> SpellConfig)
    { 
        m_CollisionComp.SetState(EHitColliderState::None);
        m_DamageHitSphere.SetState(EHitColliderState::None);
        m_CollisionComp.SetCollisionProfileName(FName("HitProfile"), true);
        m_DamageHitSphere.SetCollisionProfileName(FName("HitProfile"), true);
        //@DE - Ignore again due the profile change
        m_DamageHitSphere.SetCollisionResponseToChannel(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Ignore);
        m_DamageHitSphere.SetCollisionResponseToChannel(ECollisionChannel::ECC_WorldDynamic, ECollisionResponse::ECR_Ignore);
        m_DamageHitSphere.SetCollisionResponseToChannel(ECollisionChannel::ECC_GameTraceChannel3, ECollisionResponse::ECR_Ignore);

        m_CollisionComp.SetState(EHitColliderState::Damage);
        m_DamageHitSphere.SetState(EHitColliderState::Damage);
        m_CoolDownActorTime = Cast<UBallLightningDefinition_Base>(SpellConfig.Get().GetDefaultObject()).m_CoolDownActorTime;
    }


    UFUNCTION(BlueprintOverride, meta = (NoSuperCall))
    void OnHitServer_Scriptable(UPrimitiveComponent HitComp, AActor OtherActor, UPrimitiveComponent OtherComp,
                     FVector NormalImpulse, const FHitResult& Hit)
    {

        m_CollisionComp.SetState(EHitColliderState::None);
        m_DamageHitSphere.SetState(EHitColliderState::None);
	    auto interactiveActor = Cast<AInteractiveGasObjectActor>(OtherActor);
        if(interactiveActor != nullptr)
        {
            auto interactiveActorAbilitySystemComponent = interactiveActor.GetAbilitySystemComponent();
            if(interactiveActorAbilitySystemComponent != nullptr)
            {
                GothicGAS::ApplyDebuffGameplayEffects(interactiveActorAbilitySystemComponent, GetDebuffGameplayEffectsToApplyWhenOverlap());
                NotifyEnvironmentDebuffToInteractableGasObjectActor(interactiveActorAbilitySystemComponent);
                interactiveActor.OnImpact();
            }
        }
        else
        {
            auto environmentSpellComp = UEnvironmentInteractableSpellComponent::Get(OtherActor);
            if(environmentSpellComp != nullptr)
            {
                NotifyEnvironmentDebuffToInteractableGasObjectActor(environmentSpellComp.m_AbComp);
            }
        }
        DoExplosion(nullptr, Hit);
    }

    UFUNCTION(BlueprintOverride, meta = (NoSuperCall))
    void OnOverlapBeginServer(UPrimitiveComponent OverlappedComp, AActor OtherActor,
                              UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep,
                              const FHitResult&in SweepResult)
    {
        //Print(FString("OnOverlapBeginServer"));
        if(Owner == OtherActor)
        {
            return;
        }

        auto interactiveActor = Cast<AInteractiveGasObjectActor>(OtherActor);
        if(interactiveActor != nullptr)
        {
            auto interactiveActorAbilitySystemComponent = interactiveActor.GetAbilitySystemComponent();
            if(interactiveActorAbilitySystemComponent != nullptr)
            {
                GothicGAS::ApplyDebuffGameplayEffects(interactiveActorAbilitySystemComponent, GetDebuffGameplayEffectsToApplyWhenOverlap());
                NotifyEnvironmentDebuffToInteractableGasObjectActor(interactiveActorAbilitySystemComponent);
                interactiveActor.OnImpact();
            }
        }
        else
        {
            auto environmentSpellComp = UEnvironmentInteractableSpellComponent::Get(OtherActor);
            if(environmentSpellComp != nullptr)
            {
                NotifyEnvironmentDebuffToInteractableGasObjectActor(environmentSpellComp.m_AbComp);
            }
        }

        if(m_CoolDownActors.Contains(OtherActor))
            return;
        
        AGothicCharacter character = Cast<AGothicCharacter>(OtherActor);
        if(character == nullptr)
            return;
        m_CoolDownActors.Add(OtherActor);
        ApplyDamageTo(OtherActor, SweepResult);

        StartHitActorCoolDown(OtherActor);
                    
    }

    

    UFUNCTION(BlueprintOverride, meta = (NoSuperCall))
    void OnOverlapEndsServer(UPrimitiveComponent OverlappedComponent, AActor OtherActor,
                             UPrimitiveComponent OtherComp, int OtherBodyIndex)
    {

    }

    UFUNCTION(BlueprintEvent)
    void StartHitActorCoolDown(AActor HitActor)
    {

    }

    UFUNCTION(BlueprintCallable)
    void RemoveActorFromCoolDown(AActor HitActor)
    {
        if(HitActor == nullptr)
            return;
        if(m_CoolDownActors.Contains(HitActor))
            m_CoolDownActors.Remove(HitActor);
    }

};