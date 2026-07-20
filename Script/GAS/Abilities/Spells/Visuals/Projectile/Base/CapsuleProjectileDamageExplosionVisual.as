UCLASS()
class ACapsuleProjectileDamageExplosionVisual : AProjectileDamageExplosionVisual
{

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UHitCapsuleCollisionComponent m_CollisionComp;
    default m_CollisionComp.SetState(EHitColliderState::None);
    default m_CollisionComp.SetCapsuleRadius(0.f);
    default m_CollisionComp.SetCapsuleHalfHeight(0.f);
    default m_CollisionComp.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");
    default m_CollisionComp.OnComponentEndOverlap.AddUFunction(this, n"OnEndOverlap");

    UPROPERTY()
    float m_RadiusIncrement = 125.f;
    UPROPERTY()
    float m_HeightIncrement = 150.f;

    void SetRadius(float Radius)
    {
        m_CollisionComp.SetCapsuleRadius(Radius + m_RadiusIncrement);
    }

    void SetCapsuleHalfHeight(float Height) 
    {
        m_CollisionComp.SetCapsuleHalfHeight(Height + m_HeightIncrement);
    }

    UShapeComponent GetCollisionComponent() override
    {
        return m_CollisionComp;
    }

    void InitializeCollisions() override
    {
        Super::InitializeCollisions();
        m_CollisionComp.AddCustomCollisionResponse(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Ignore); 
    }

    void SetCollisionState(EHitColliderState State) override
    {
        m_CollisionComp.SetState(State);
    }

    EHitColliderState GetCollisionState() override
    {
        return m_CollisionComp.GetState();
    }

    void GetOverlappingActorsCustom(TArray<AActor>& overlappingActors, UClass StaticClass) override
    {
        m_CollisionComp.GetOverlappingActorsCustom(overlappingActors, StaticClass);
    }

}