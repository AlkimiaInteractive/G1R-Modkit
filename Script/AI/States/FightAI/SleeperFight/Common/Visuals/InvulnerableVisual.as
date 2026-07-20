UCLASS()
class AInvulnerableVisual : AActor
{
    default bReplicates = true;
    default ReplicateMovement = false; 
    default bNeverApplyTickOptimizations = true;

    
    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent m_RootComp;

    UPROPERTY(EditAnywhere, VisibleAnywhere, DefaultComponent, Attach=m_RootComp)
    UCapsuleComponent m_CapsuleCollisionComponent_BlockPlayerMovement;

    UPROPERTY(EditAnywhere, VisibleAnywhere, DefaultComponent, Attach=m_RootComp)
    UCapsuleComponent m_CapsuleCollisionComponent_CombatInteractions;

    default m_CapsuleCollisionComponent_BlockPlayerMovement.SetCapsuleHalfHeight(100.f);
    default m_CapsuleCollisionComponent_BlockPlayerMovement.SetCapsuleRadius(100.f);
    //default m_CapsuleCollisionComponent_BlockPlayerMovement.SetCollisionProfileName(n"DeflectProfile"); 

    default m_CapsuleCollisionComponent_CombatInteractions.SetCapsuleHalfHeight(100.f);
    default m_CapsuleCollisionComponent_CombatInteractions.SetCapsuleRadius(100.f);

    UPROPERTY(BlueprintReadWrite, EditAnywhere)
    bool m_AutoActivateOnBeginPlay = true;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UGothicFXComponent m_FXComp;


    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        if(m_AutoActivateOnBeginPlay)
            ActivateVisuals();  
        //m_CapsuleCollisionComponent.SetHiddenInGame(false);
    }

    void SetUpCollisions()
    {
        auto avatarActor = Cast<AGothicCharacter>(GetOwner());
        m_CapsuleCollisionComponent_BlockPlayerMovement.IgnoreActorWhenMoving(avatarActor, true);
        avatarActor.CapsuleComponent.IgnoreActorWhenMoving(this, true);
        
        TArray<AActor> attachedActors;
        avatarActor.GetAttachedActors(attachedActors, true, true);
        for(auto actor : attachedActors)
        {
             m_CapsuleCollisionComponent_BlockPlayerMovement.IgnoreActorWhenMoving(actor, true);
        }
        m_CapsuleCollisionComponent_BlockPlayerMovement.SetCollisionResponseToChannel(ECollisionChannel::ECC_Pawn, ECollisionResponse::ECR_Block);
    }

    UFUNCTION(BlueprintEvent)
    void DoDestroy()
    {
        DeactivateVisuals();
        DestroyActor();
    }

    UFUNCTION(BlueprintEvent, NetMulticast)
    void ActivateVisuals()
    {
        
    }

    UFUNCTION(BlueprintEvent, NetMulticast)
    void DeactivateVisuals()
    {
        
    }
    
    //@DE - Custom activation and explosion visual for teleports while the loop visual is active
    UFUNCTION(BlueprintEvent, NetMulticast)
    void SpawnExplosionVisual()
    {
        
    }
    //@DE - Custom activation and explosion visual for teleports while the loop visual is active
    UFUNCTION(BlueprintEvent, NetMulticast)
    void SpawnShieldVisual()
    {
        
    }

    

}