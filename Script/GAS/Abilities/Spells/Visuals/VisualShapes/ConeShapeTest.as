UCLASS()
class AConeShapeTest : AGothicGASActor
{
    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent m_RootComp;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UHitConeCollisionComponent m_ConeCollisionComp;
    default m_ConeCollisionComp.SetState(EHitColliderState::None);
    default m_ConeCollisionComp.OnComponentBeginOverlap.AddUFunction(this, n"OnBeginOverlap");
    default m_ConeCollisionComp.OnComponentEndOverlap.AddUFunction(this, n"OnEndOverlap");


    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        m_ConeCollisionComp.SetComponentTickEnabled(true);
        m_ConeCollisionComp.AddCustomCollisionResponse(ECollisionChannel::ECC_WorldStatic, ECollisionResponse::ECR_Ignore);
        m_ConeCollisionComp.SetState(EHitColliderState::Damage);
        
    }


    UFUNCTION()
    void OnBeginOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, const FHitResult&in SweepResult)
    {
        FString a = FString(OverlappedComponent.GetName());
        a.Append(FString(" - "));
        a.Append(OtherComp.GetName());
        //Print(a, 15.f, FLinearColor::Green);
    }


    UFUNCTION()
    void OnEndOverlap(UPrimitiveComponent OverlappedComp, AActor OtherActor, UPrimitiveComponent OtherComp, int32 OtherBodyIndex)
    {
        FString a = FString(OverlappedComp.GetName());
        a.Append(FString(" - "));
        a.Append(OtherComp.GetName());
        //Print(a, 15.f, FLinearColor::Red);     
    }
}