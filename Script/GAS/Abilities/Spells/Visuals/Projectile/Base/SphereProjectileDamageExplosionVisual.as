UCLASS()
class ASphereProjectileDamageExplosionVisual : AProjectileDamageExplosionVisual
{

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UHitSphereCollisionComponent m_CollisionComp;
    default m_CollisionComp.SetState(EHitColliderState::None);
    default m_CollisionComp.SetSphereRadius(0.f);
    default m_CollisionComp.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");
    default m_CollisionComp.OnComponentEndOverlap.AddUFunction(this, n"OnEndOverlap");

    UPROPERTY()
    float m_RadiusIncrement = 75.f;

    void ActivateDamage(FVector NormalVector) override
    {
        auto normalizedNormal = NormalVector;
        normalizedNormal.Normalize();
        auto compLocation = GetCollisionComponent().GetRelativeLocation();
        auto rotation = MagicScript::FindLookAtRotation(compLocation, compLocation + normalizedNormal * 100);
        SetActorRotation(rotation);

        compLocation.X = m_XOffset;

        GetCollisionComponent().SetRelativeLocation(compLocation);
        
        Super::ActivateDamage(NormalVector);
    }

    void SetRadius(float Radius)
    {
        m_CollisionComp.SetSphereRadius(Radius + m_RadiusIncrement);
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