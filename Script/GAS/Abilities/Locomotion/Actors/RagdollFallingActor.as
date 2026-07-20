delegate void FFallingRagdollDelegate(const FHitResult& SweepResult);

class ARagdollFallingActor : AActor
{
    UPROPERTY(DefaultComponent, RootComponent)
	USphereComponent m_SphereHitDetector;

    UPROPERTY()
    FName m_FollowingBone = n"Pelvis";

    FFallingRagdollDelegate OnWorldOverlap;
    default bNeverApplyTickOptimizations = true;
    
    void Initialize(AGothicCharacter OwnerCharacter)
    {
        SetOwner(OwnerCharacter);
        auto gothicChar = OwnerCharacter;

        m_SphereHitDetector.SetSphereRadius(50.f);
        m_SphereHitDetector.SetHiddenInGame(true);
        //m_SphereHitDetector.SetVisibility(true);

        m_SphereHitDetector.IgnoreActorWhenMoving(gothicChar, true);
        gothicChar.CapsuleComponent.IgnoreActorWhenMoving(this, true);
        TArray<AActor> outActors;
        gothicChar.GetAllChildActors(outActors);
        for (auto OutActor : outActors)
        {
            m_SphereHitDetector.IgnoreActorWhenMoving(OutActor, true);
        }

        m_SphereHitDetector.SetCollisionProfileName(FName("Custom"));
        m_SphereHitDetector.SetCollisionResponseToAllChannels(ECollisionResponse::ECR_Ignore);
        m_SphereHitDetector.SetCollisionResponseToChannel(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Overlap);
        m_SphereHitDetector.SetCollisionResponseToChannel(ECollisionChannel::ECC_WorldDynamic, ECollisionResponse::ECR_Overlap);
        m_SphereHitDetector.SetGenerateOverlapEvents(true);
        m_SphereHitDetector.OnComponentBeginOverlap.AddUFunction(this, n"OnComponentBeginOverlap");
    }

    UFUNCTION()
    void OnComponentBeginOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, const FHitResult&in SweepResult)
    {
        OnWorldOverlap.ExecuteIfBound(SweepResult);
    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        if(GetOwner() == nullptr)
            return;

        auto gothicChar = Cast<AGothicCharacter>(GetOwner());
        FHitResult outHit;
	    SetActorLocation(MagicScript::GetCharacterBoneTransformGivenABoneName(gothicChar, m_FollowingBone).Location, true, outHit, false);
    }
}
