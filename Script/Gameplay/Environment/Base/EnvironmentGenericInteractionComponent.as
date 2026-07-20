class UEnvironmentGenericInteractionComponent : UGothicGenericMagicComponent
{
    default bAutoActivate = true;

    UPROPERTY()
    TMap<AActor, FActiveGameplayEffectHandle> m_TargetsMap;

    UPROPERTY()
    TSubclassOf<UScriptGameplayEffect> m_GameplayEffect;
    UPROPERTY(DefaultComponent)
	UGothicAbilitySystemComponent m_AbilitySystem;

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    TArray<UStaticMeshComponent> m_CustomMeshes;

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    bool m_ActiveOverlap = true;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        InitializeComponent();       
    }
    UFUNCTION()
    void InitializeComponent()
    {
        if(!System::IsServer())
        {
            return;
        }

        m_AbilitySystem = UGothicAbilitySystemComponent::GetOrCreate(GetOwner());
        UBFGTickOptimizerSystem::SetTickOptimizationRuntime_Enabled(GetOwner(), true);

        if(m_CustomMeshes.IsEmpty())   
        {
            auto staticMeshComp = Cast<UStaticMeshComponent>(GetOwner().GetComponentByClass(UStaticMeshComponent::StaticClass()));
            InitializeMesh(staticMeshComp);
        }
        else
        {
            for(auto mesh : m_CustomMeshes)
            {
                InitializeMesh(mesh);
            }
        }
    }

    void InitializeMesh(UStaticMeshComponent StaticMeshComp)
    {
        StaticMeshComp.OnComponentBeginOverlap.AddUFunction(this, n"OnComponentBeginOverlap");
        StaticMeshComp.OnComponentEndOverlap.AddUFunction(this, n"OnComponentEndOverlap");
        

        StaticMeshComp.SetCollisionProfileName(n"Custom");
        StaticMeshComp.SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Ignore);
        StaticMeshComp.SetCollisionResponseToChannel(ECollisionChannel::ItemWorld, ECollisionResponse::ECR_Overlap);
        StaticMeshComp.SetCollisionResponseToChannel(ECollisionChannel::Projectile, ECollisionResponse::ECR_Overlap);
        StaticMeshComp.SetCollisionResponseToChannel(ECollisionChannel::ArrowProjectile, ECollisionResponse::ECR_Overlap);
        StaticMeshComp.SetCollisionResponseToChannel(ECollisionChannel::ECC_Pawn, ECollisionResponse::ECR_Overlap);
        StaticMeshComp.GenerateOverlapEvents = true;
    }

    // UFUNCTION()
    // void OnActorBeginOverlap(AActor OverlappedActor, AActor OtherActor)
    // {
    //     Print("OnActorBeginOverlap", 5.f, FLinearColor::Green);
    // }

    //     UFUNCTION()
    // void OnActorEndOverlap(AActor OverlappedActor, AActor OtherActor)
    // {
    //     Print("OnActorEndOverlap", 5.f, FLinearColor::Green);
    // }

    UFUNCTION()
    void OnComponentBeginOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, const FHitResult&in SweepResult)
    {
        //Print("OnComponentBeginOverlap", 5.f, FLinearColor::Green);

        if(!m_ActiveOverlap)
            return;

        auto otherAsGothicChar = Cast<AGothicCharacter>(OtherActor);

        if(otherAsGothicChar == nullptr)
        {
            DoHandleItemEnteringRegion(OtherActor, SweepResult);
            return;
        }

        UGothicAbilitySystemComponent sourceAbComp = m_AbilitySystem;
        UGothicAbilitySystemComponent targetAbComp = Cast<UGothicAbilitySystemComponent>(otherAsGothicChar.GetAbilitySystemComponent());

        if(!CanApplyEffect(sourceAbComp, targetAbComp, otherAsGothicChar))
        {
            return;
        }
        
        DoHandleCharacterEnteringRegion(sourceAbComp, targetAbComp, SweepResult);
    }

    UFUNCTION()
    void OnComponentEndOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor,
                             UPrimitiveComponent OtherComp, int OtherBodyIndex)
    {
        //Print("OnComponentEndOverlap", 5.f, FLinearColor::Red);
        if(GetOwner().IsOverlappingActor(OtherActor))
            return;
        if(RemoveEffectToTarget(OtherActor))
        {
            //Print("Removed");
            if(m_TargetsMap.Contains(OtherActor))
                m_TargetsMap.Remove(OtherActor);
        }
    }


    bool CanApplyEffect(UGothicAbilitySystemComponent sourceAbComp, UGothicAbilitySystemComponent targetAbComp, AGothicCharacter character)
    {
        if(sourceAbComp == nullptr || targetAbComp == nullptr || character == nullptr || m_TargetsMap.Contains(character))
        {
            return false;
        }
        return true;
    }

    //Override this function if your overlap shape needs more functionality
    void DoHandleItemEnteringRegion(AActor OtherActor, const FHitResult&in SweepResult)
    {

    }

    //Override this function if your overlap shape needs more functionality
    void DoHandleCharacterEnteringRegion( UGothicAbilitySystemComponent SourceAbComp,  UGothicAbilitySystemComponent TargetAbComp, const FHitResult&in SweepResult)
    {

        FActiveGameplayEffectHandle handle = ApplyGameplayEffectToTarget(SourceAbComp, TargetAbComp);
        if(MagicScript::IsValidGameplayEffectHandle(handle) || MagicScript::WasSuccessfullyApplied(handle))
            OnEffectAppliedSuccessfully(TargetAbComp.GetAvatar(), handle);
    }
    
    //Override this function if your overlap shape need other interaction
    //Default behaviour its apply a GE
    UFUNCTION()
    FActiveGameplayEffectHandle ApplyGameplayEffectToTarget( UGothicAbilitySystemComponent sourceAbComp, UGothicAbilitySystemComponent targetAbComp)
    {
        FGameplayEffectContextHandle context = sourceAbComp.MakeEffectContext();

        //For perception, we use AGothicCharacterState as Instigator
        context.AddInstigator(sourceAbComp.GetAvatar(), sourceAbComp.GetAvatar());
        FGameplayEffectSpecHandle specStackHandle = sourceAbComp.MakeOutgoingSpec(m_GameplayEffect, 1.0f, context);
        return sourceAbComp.ApplyGameplayEffectSpecToTarget(specStackHandle, targetAbComp);       
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

    bool RemoveEffectToTarget(AActor OtherActor)
    {
        if(!m_TargetsMap.Contains(OtherActor))
            return false;

        UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(OtherActor);
        return RemoveGameplayEffectToTarget(targetAbComp, m_TargetsMap[OtherActor]);
    }


    UFUNCTION()
    bool RemoveGameplayEffectToTarget(UGothicAbilitySystemComponent TargetAbComp, FActiveGameplayEffectHandle Handle)
    {
        if(TargetAbComp != nullptr && m_TargetsMap.Contains(TargetAbComp.GetAvatar()))
        {
            return TargetAbComp.RemoveActiveGameplayEffect(Handle);
        }
        return false;
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
         
        for(auto target : m_TargetsMap)
        {
            UGothicAbilitySystemComponent targetGothicAbComp = Cast<UGothicAbilitySystemComponent>(GothicGAS::GetAbilitySystemComponent(target.Key));
            if(targetGothicAbComp != nullptr)
            {
                RemoveGameplayEffectToTarget(targetGothicAbComp, target.Value);
            }
              
        }

        m_TargetsMap.Empty();
     }
}
