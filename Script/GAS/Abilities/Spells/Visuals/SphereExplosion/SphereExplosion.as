UCLASS()
class ASphereExplosion: AGothicGASActor
{
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UProgressiveCapsuleCollisionByRadius m_CollisionComp;
    default m_CollisionComp.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");
    default m_CollisionComp.OnComponentEndOverlap.AddUFunction(this, n"OnEndOverlap");
    default m_CollisionComp.SetHiddenInGame(true);

    UPROPERTY(DefaultComponent, RootComponent)
	USceneComponent m_RootComp;

    UPROPERTY()
    TArray<UAbilitySystemComponent> m_Targets;

    default bNeverApplyTickOptimizations = true;


    UFUNCTION()
    void OnBeginOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, const FHitResult&in SweepResult)
    {
        if(!IsValidCollision(OtherActor, OtherComp))
            return;
        
        m_CollisionComp.OnTargetDetected.Broadcast(OtherActor, SweepResult);
        
    }

    bool IsValidCollision(AActor OtherActor, UPrimitiveComponent OtherComp)
    {
        auto owner = GetOwner();
        if(OtherActor == owner)
        {
            //m_CollisionComp.OnActorDetected.Broadcast(OtherActor);
            return false;
        }

        UGothicAbilitySystemComponent targetAbComp = GothicGAS::GetAbilitySystemComponent(OtherActor);
        
        if(targetAbComp == nullptr || m_Targets.Contains(targetAbComp))
        {
            return false;
        }

        if(/*targetAbComp.HasGameplayTag(GameplayTag::State_Defeated) ||*/ targetAbComp.HasGameplayTag(GameplayTag::State_Dead))
        {
            return false;
        }

        return MagicScript::IsTargetVisible(owner, OtherActor, GetActorLocation(), OtherComp);
    }

    UFUNCTION()
    void OnEndOverlap(UPrimitiveComponent OverlappedComp, AActor OtherActor, UPrimitiveComponent OtherComp, int32 OtherBodyIndex)
    {
        if(OtherActor != nullptr)
        {
           m_CollisionComp.OnTargetLost.Broadcast(OtherActor);
        }
    }

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        m_CollisionComp.AddCustomCollisionResponse(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Ignore);
        m_CollisionComp.SetState(EHitColliderState::Damage);
    }


    UFUNCTION(BlueprintCallable)
    void DeactivateCollision()
    {
        m_CollisionComp.SetState(EHitColliderState::None);
        m_CollisionComp.OnComponentBeginOverlap.Unbind(this, n"OnBeginOverlap");
    }

}