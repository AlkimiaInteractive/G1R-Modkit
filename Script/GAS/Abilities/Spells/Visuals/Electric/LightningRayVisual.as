UCLASS(Blueprintable)
class ALightningRayVisual : AActor

{
    default bNeverApplyTickOptimizations = true;
    
    UPROPERTY(BlueprintReadWrite, EditAnywhere)
	AActor m_Source = nullptr;

    UPROPERTY()
    UMeshComponent m_SourceMesh;

	UPROPERTY(BlueprintReadWrite, EditAnywhere)
	FName m_SourceSocketName;

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
	FName TargetSocketName = n"spine_01";

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
	FName ParticleEndPositionParameterName = n"Final_Pos";

	UPROPERTY(BlueprintReadWrite, EditAnywhere, Replicated)
	AActor m_Target = nullptr;

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    UCapsuleComponent m_TargetCapsule;

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    UHurtBoxCollisionComponent m_TargetHurtBox;

    
    UPROPERTY(DefaultComponent, RootComponent)
	USceneComponent m_RootComp;

    UPROPERTY(DefaultComponent, Attach =m_RootComp, EditAnywhere, VisibleAnywhere)
	UNiagaraComponent Particle = nullptr;

    UPROPERTY(EditAnywhere, VisibleAnywhere)
	FVector m_FinalPosition;
    
    UPROPERTY(EditAnywhere, VisibleAnywhere)
	FRotator m_Rotation;

    default ActorTickEnabled = true;
    default bReplicates = true;

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    ABeamHitEffect m_VisualHitEffect;

    // UPROPERTY(BlueprintReadWrite, EditAnywhere)
    // TSoftClassPtr<ABeamHitEffect> m_VisualHitEffectClass = n"Blueprint'/Game/Items/Magic/Misc/BP_BeamHitEffectBase.BP_BeamHitEffectBase_C'";

    // UPROPERTY(EditAnywhere, VisibleAnywhere, DefaultComponent)
    // UArrowComponent m_arrow;

    // UPROPERTY()
    // FOnSoftClassLoaded m_OnSoftClassLoaded;
    // UPROPERTY()
    // bool m_WaitingLoadHitEffect = false;

    // UFUNCTION(BlueprintOverride)
    // void BeginPlay()
    // {
    //     m_OnSoftClassLoaded.BindUFunction(this, n"OnSoftClassLoaded");
    //     m_VisualHitEffectClass.LoadAsync(m_OnSoftClassLoaded);
    //     auto a = m_VisualHitEffectClass.Get();
    //     if(a == nullptr)
    //         PrintError(FString("NULLL TSOFTCLASSOFF"));
    // }

    // UFUNCTION()
    // void OnSoftClassLoaded(UClass LoadedClass)
    // {
    //     m_OnSoftClassLoaded.Clear();
    //     if(m_WaitingLoadHitEffect)
    //         SpawnHitEffect();
    // }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        UpdateRayPosition();
    }

    void UpdateRayPosition()
    {
        if(Particle != nullptr && m_Source != nullptr && m_Target != nullptr)
        {
            FVector pos = m_Source.GetActorLocation();
            if(m_SourceSocketName != n"")
            {
                if(m_SourceMesh.DoesSocketExist(m_SourceSocketName))
                {
                    pos = m_SourceMesh.GetSocketLocation(m_SourceSocketName); 
                }
                else
                {
                    auto sourceCapsule = Cast<AGothicCharacter>(m_Source).CapsuleComponent;
                    pos = sourceCapsule.GetWorldLocation();//Target.GetActorLocation();
                }
            }
            
            //FVector targetPos = m_Target.GetActorLocation();
            // if(TargetSocketName != n"")
            // {
            //     ACharacter character = Cast<ACharacter>(Target);
            //     if(character.Mesh.DoesSocketExist(TargetSocketName))
            //     {
            //         targetPos = character.Mesh.GetSocketLocation(TargetSocketName); 
            //     }
            //     else
            //     {
            //         auto targetCapsule = Cast<AGothicCharacter>(Target).CapsuleComponent;
            //         targetPos = targetCapsule.GetWorldLocation();//Target.GetActorLocation();
            //     }
            // }
            FVector targetPos = GetTargetPosition();     

           

            // We only need rotate the particle system to look at the target and extend the X axis in the distance between target and source.
            FRotator rotation = MagicScript::FindLookAtRotation(pos, targetPos);
            FVector Direction =   targetPos - pos;
            Direction.Normalize();
            float distance = pos.Distance(targetPos);

            SetActorRotation(rotation);
            SetActorLocation(pos);
            Particle.SetVectorParameter(ParticleEndPositionParameterName, FVector(distance,0,0));

            //System::DrawDebugBox(pos, FVector(5,5,5), FLinearColor::Red);

            //System::DrawDebugCapsule(m_arrow.GetWorldLocation(), 5, 10, FRotator(), FLinearColor::Red);
        }
    }

    FVector GetTargetPosition()
    {
        FVector targetPos = m_Target.GetActorLocation();
        if(m_TargetHurtBox != nullptr)
        {
            targetPos = m_TargetHurtBox.GetWorldLocation();
        }
        else if(m_TargetCapsule != nullptr)
        {
            targetPos = m_TargetCapsule.GetWorldLocation();
        }   

        return targetPos;
    }

    UFUNCTION(BlueprintCallable, Client)
    void UpdateRotation_Client(FRotator rotation)
    {
        SetActorRotation(rotation);
    }

    UFUNCTION(NetMulticast)
    void Initialize(AActor NewTarget, AActor NewSource, UMeshComponent InSourceMesh, FName InSocketName, bool ShouldSpawnHitEffect)
    {
        m_Target = NewTarget;
        m_Source = NewSource;
        m_SourceSocketName = InSocketName;
        m_SourceMesh = InSourceMesh;
        m_TargetCapsule = Cast<AGothicCharacter>(m_Target).CapsuleComponent;

        //         m_arrow.SetHiddenInGame(false);
        // m_arrow.SetArrowColor(FLinearColor::Yellow);
        // m_arrow.AttachToComponent(SourceMesh, SourceSocketName);


        FVector pos = m_Source.GetActorLocation();
        if(m_SourceSocketName != n"")
        {
            pos = m_SourceMesh.GetSocketTransform(m_SourceSocketName, ERelativeTransformSpace::RTS_Actor).Location; 
        }

        FindValidTargetComponent();
        UpdateRayPosition();
        
        if(ShouldSpawnHitEffect)
        {
            // if(m_VisualHitEffectClass.Get() == nullptr)
            //     m_WaitingLoadHitEffect = true;
            // else
                SpawnHitEffect();
        }
            
    }

    void SpawnHitEffect()
    {
        // if(m_VisualHitEffectClass == nullptr || m_VisualHitEffectClass.Get() == nullptr)
        //     return;
        if(m_VisualHitEffect != nullptr)
            return;

        FVector targetPosition = GetTargetPosition();
        USceneComponent comp;
        if(m_TargetHurtBox != nullptr)
        {
            comp = m_TargetHurtBox;
        }
        else
        {
            comp = m_TargetCapsule;
        }  

        targetPosition += m_Target.GetActorForwardVector() * -10.f;
        //m_VisualHitEffect = Cast<ABeamHitEffect>(SpawnActor(m_VisualHitEffectClass.Get(), targetPosition));
        //m_VisualHitEffect.AttachToComponent(comp, comp.GetAttachSocketName(), EAttachmentRule::SnapToTarget);

        DoSpawnHitEffect(targetPosition, comp);
    }


    UFUNCTION(BlueprintEvent)
    void DoSpawnHitEffect(FVector targetPosition, USceneComponent comp)
    {
    }

    void FindValidTargetComponent()
    {
        TArray<UHurtBoxCollisionComponent> targetBoxComponents;
        m_Target.GetComponentsByClass(UHurtBoxCollisionComponent::StaticClass(), targetBoxComponents);
        if(targetBoxComponents.Num() > 0)
        {
            m_TargetHurtBox = targetBoxComponents[0];
            for(auto comp : targetBoxComponents)
            {
                if(comp.AttachSocketName.ToString().Contains(FString("spine")))
                {
                    m_TargetHurtBox = comp;
                    return;
                }
                else
                {
                    if(comp.AttachSocketName.ToString().Contains(FString("head")))
                    {
                        m_TargetHurtBox = comp;
                    }
                }
                
            }
        }
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        if(Particle != nullptr)
        {
            Particle.Deactivate();
        }

        if(m_VisualHitEffect != nullptr)
            m_VisualHitEffect.DestroyActor();
    }
}