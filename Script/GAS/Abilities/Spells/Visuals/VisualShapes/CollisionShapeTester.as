UCLASS()
class ACollisionShapeTester : AGothicGASActor
{
    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent m_RootComp;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UHitConeCollisionComponent m_ConeCollisionComp;
    default m_ConeCollisionComp.SetState(EHitColliderState::None);
    default m_ConeCollisionComp.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");
    default m_ConeCollisionComp.OnComponentEndOverlap.AddUFunction(this, n"OnEndOverlap");

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UHitSphereCollisionComponent m_SphereCollisionComp;
    default m_SphereCollisionComp.SetState(EHitColliderState::None);
    default m_SphereCollisionComp.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");
    default m_SphereCollisionComp.OnComponentEndOverlap.AddUFunction(this, n"OnEndOverlap");

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UHitBoxCollisionComponent m_BoxCollisionComp;
    default m_BoxCollisionComp.SetState(EHitColliderState::None);
    default m_BoxCollisionComp.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");
    default m_BoxCollisionComp.OnComponentEndOverlap.AddUFunction(this, n"OnEndOverlap");

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UHitCapsuleCollisionComponent m_CapsuleCollisionComp;
    default m_CapsuleCollisionComp.SetState(EHitColliderState::None);
    default m_CapsuleCollisionComp.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");
    default m_CapsuleCollisionComp.OnComponentEndOverlap.AddUFunction(this, n"OnEndOverlap");

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UProgressiveBoxCollisionByAngle m_ProgressiveBoxCollisionComp;
    default m_ProgressiveBoxCollisionComp.SetState(EHitColliderState::None);
    default m_ProgressiveBoxCollisionComp.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");
    default m_ProgressiveBoxCollisionComp.OnComponentEndOverlap.AddUFunction(this, n"OnEndOverlap");


    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UProgressiveCapsuleCollisionByRadius m_ProgressiveCapsuleComp;
    default m_ProgressiveCapsuleComp.SetState(EHitColliderState::None);
    default m_ProgressiveCapsuleComp.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");
    default m_ProgressiveCapsuleComp.OnComponentEndOverlap.AddUFunction(this, n"OnEndOverlap");


    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        // m_ConeCollisionComp.SetComponentTickEnabled(true);
        // m_SphereCollisionComp.SetComponentTickEnabled(true);
        // m_BoxCollisionComp.SetComponentTickEnabled(true);
        // m_CapsuleCollisionComp.SetComponentTickEnabled(true);
        // m_ProgressiveBoxCollisionComp.SetComponentTickEnabled(true);
        // m_ProgressiveCapsuleComp.SetComponentTickEnabled(true);

        // m_ConeCollisionComp.AddCustomCollisionResponse(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Ignore);
        // m_SphereCollisionComp.AddCustomCollisionResponse(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Ignore);
        // m_BoxCollisionComp.AddCustomCollisionResponse(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Ignore);
        // m_CapsuleCollisionComp.AddCustomCollisionResponse(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Ignore);
        // m_ProgressiveBoxCollisionComp.AddCustomCollisionResponse(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Ignore);
        // m_ProgressiveCapsuleComp.AddCustomCollisionResponse(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Ignore);

        // m_ConeCollisionComp.SetState(EHitColliderState::Damage);
        // m_SphereCollisionComp.SetState(EHitColliderState::Damage);
        // m_BoxCollisionComp.SetState(EHitColliderState::Damage);
        // m_CapsuleCollisionComp.SetState(EHitColliderState::Damage);
        // m_ProgressiveBoxCollisionComp.SetState(EHitColliderState::Damage);
        // m_ProgressiveCapsuleComp.SetState(EHitColliderState::Damage);
    }


    UFUNCTION()
    void OnBeginOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, const FHitResult&in SweepResult)
    {
        FString a = FString(OverlappedComponent.GetName());
        a.Append(FString(" - "));
        a.Append(OtherComp.GetName());
        Print(a, 15.f, FLinearColor::Green);
    }


    UFUNCTION()
    void OnEndOverlap(UPrimitiveComponent OverlappedComp, AActor OtherActor, UPrimitiveComponent OtherComp, int32 OtherBodyIndex)
    {
        FString a = FString(OverlappedComp.GetName());
        a.Append(FString(" - "));
        a.Append(OtherComp.GetName());
        Print(a, 15.f, FLinearColor::Red);     
    }
}