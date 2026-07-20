UCLASS()
class ASphereCollisionShapeVisual : AOverlapCollisionShapeVisual
{
    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UHitSphereCollisionComponent m_CollisionComp;
    default m_CollisionComp.SetState(EHitColliderState::None);
    default m_CollisionComp.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");
    default m_CollisionComp.OnComponentEndOverlap.AddUFunction(this, n"OnEndOverlap");


    TSubclassOf<UWeaponDefinition> GetWeaponDefinitionSubclass() override
    {
         if(m_CollisionComp.m_WeaponData != nullptr)
        {
            return m_CollisionComp.m_WeaponData;
        }
        return nullptr;
    }

    UFUNCTION(BlueprintEvent)
    void SpawnVisuals()
    {
        
    }

    UShapeComponent GetCollisionComponent() override
    {
        return m_CollisionComp;
    }

    void SetColliderState(EHitColliderState State) override
    {
        m_CollisionComp.SetState(State);
    }
        
    void AddCustomCollisionResponse(ECollisionChannel CollisionChannel,
                                    ECollisionResponse CollisionResponse) override
    {
         m_CollisionComp.AddCustomCollisionResponse(CollisionChannel, CollisionResponse);      
    }

    bool CheckIsOverlappingActor(AActor OtherActor) override
    {
        if(m_CollisionComp.GetState() != EHitColliderState::Damage)
            return false;
        TArray<AActor> overlappingActors;
        m_CollisionComp.GetOverlappingActorsCustom(overlappingActors, AGothicCharacter::StaticClass());
        for(auto actor : overlappingActors)
        {
            if(actor == OtherActor)
                return true;
        }
        return false;
    }
}
