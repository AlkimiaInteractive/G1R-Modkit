UCLASS()
class ATraceTarget_XardasSleeper : AActor
{
    default bNeverApplyTickOptimizations = true;
    UPROPERTY()
    private FTimerHandle TaskTimer;
    UPROPERTY()
    AGothicCharacter m_XardasCharacter;

    UPROPERTY(DefaultComponent, RootComponent)
    USceneComponent m_RootComp;

    UPROPERTY(DefaultComponent, Attach=m_RootComp)
    UArrowComponent m_Arrow;
    default m_Arrow.SetHiddenInGame(true);

    void Initialize(AGothicCharacter XardasCharacter)
    {
        m_XardasCharacter = XardasCharacter;
    }

    void StartTrace()
    {
        
    }

    void StopTrace()
    {

    }

    bool IsTargetVisible()
    {
        auto targetActor = m_XardasCharacter.GetTargetedActor();
        if(targetActor == nullptr)
        {
            //System::DrawDebugSphere(GetActorLocation(), 30.f, 16, FLinearColor::Red, 0.5f, 10.f);
            return false;
        }
            

        TArray<AActor> actorsIgnore;
        actorsIgnore.Add(m_XardasCharacter);

        ETraceTypeQuery trace_type = UCollisionProfile::ConvertToTraceType(ECollisionChannel::ECC_Visibility);

        FHitResult hitResult;
        //Print(FString::ApplyFormat(GetActorLocation(), FString()));
        //System::DrawDebugSphere(GetActorLocation(), 30.f, 32, FLinearColor::MakeRandomColor(), 0.5f, 10.f);
        //System::DrawDebugSphere(TargetActor.GetActorLocation(), 30.f, 32, FLinearColor::MakeRandomColor(), .5f, 10.f);

        bool hasHit = System::LineTraceSingle(
            GetActorLocation(),
            targetActor.GetActorLocation(),
            trace_type,
            false,
            actorsIgnore,
            EDrawDebugTrace::None,
            hitResult,
            true);

        if(hasHit)
        {
            if(hitResult.Actor == targetActor)
            {
                //System::DrawDebugSphere(GetActorLocation(), 30.f, 16, FLinearColor::Green, 0.5f, 10.f);
                return true;
            }
            auto a = hitResult.Actor;
        }
        //System::DrawDebugSphere(GetActorLocation(), 30.f, 16, FLinearColor::Red, 0.5f, 10.f);
        return false;
    }

}