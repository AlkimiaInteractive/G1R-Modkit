event void FPlayerBeginOverlapFireGolemArenaEvent(AActor Actor);
event void FPlayerEndOverlapFireGolemArenaEvent(AActor Actor);

UCLASS()
class A_FireGolem_EnvironmentAttack_PlayerArenaDetector : ACapsuleCollisionShapeVisual
{
    FPlayerBeginOverlapFireGolemArenaEvent OnPlayerBeginOverlapFireGolemArenaEvent;
    FPlayerEndOverlapFireGolemArenaEvent OnPlayerEndOverlapFireGolemArenaEvent;

     UPROPERTY()
    TSubclassOf<UScriptGameplayEffect> m_FireGolemArenaGE = UGE_FireGolem_PlayerArenaDetector::StaticClass();

    default m_CollisionComp.m_WeaponData = UPlayerArenaDetector_FireGolem::StaticClass();
    UPROPERTY()
    private FTimerHandle TaskTimer;

    //Set up manually on the main map.
    bool SetUpCollisionShape() override
    {
        SetColliderState(EHitColliderState::Damage);
        return true;
    }

    UFUNCTION(BlueprintOverride, meta =(NoSuperCall))
    void BeginPlay()
    {
            
    }

    UFUNCTION(BlueprintOverride)
    void Initialize()
    {
        Super::Initialize();
        ActivateOverlapTimer();
    }

    UFUNCTION(BlueprintOverride)
    void Deinitialize()
    {
        Super::Deinitialize();
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
    }

    void DoOnBeginOverlap(UPrimitiveComponent OverlappedComponent, AActor OtherActor,
                          UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep,
                          FHitResult SweepResult) override
    {
        Super::DoOnBeginOverlap(OverlappedComponent, OtherActor, OtherComp, OtherBodyIndex, bFromSweep, SweepResult);
        if(OnPlayerBeginOverlapFireGolemArenaEvent.IsBound())
            OnPlayerBeginOverlapFireGolemArenaEvent.Broadcast(OtherActor);        
    }

    void DoOnEndOverlap(UPrimitiveComponent OverlappedComp, AActor OtherActor,
                        UPrimitiveComponent OtherComp, int32 OtherBodyIndex) override
    {
        if(m_TargetsMap.Contains(OtherActor))
            if(OnPlayerEndOverlapFireGolemArenaEvent.IsBound())
                OnPlayerEndOverlapFireGolemArenaEvent.Broadcast(OtherActor); 

        Super::DoOnEndOverlap(OverlappedComp, OtherActor, OtherComp, OtherBodyIndex);
    }

    FActiveGameplayEffectHandle ApplyGameplayEffectToTarget(
                                                            UGothicAbilitySystemComponent sourceAbComp,
                                                            UGothicAbilitySystemComponent targetAbComp,
                                                            const FHitResult&in SweepResult) override
    {
        if(sourceAbComp == nullptr || targetAbComp == nullptr || GetWeaponDefinitionSubclass() == nullptr || m_TargetsMap.Contains(targetAbComp.GetAvatar()))
        {
            return FActiveGameplayEffectHandle();
        }

        FGameplayEffectContextHandle contextHandle = sourceAbComp.MakeEffectContext();
        contextHandle.AddInstigator( GetOwner()/*Cast<AGothicCharacter>(GetOwner()).GetCharacterState()*/, GetOwner());

        FGameplayEffectSpecHandle geSpecHandle = sourceAbComp.MakeOutgoingSpec(m_FireGolemArenaGE, 1, contextHandle);
        return sourceAbComp.ApplyGameplayEffectSpecToTarget(geSpecHandle, targetAbComp);
    }

    

    void ActivateOverlapTimer()
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"OverlapCheck"), .5f, true);
    }

    UFUNCTION()
    void OverlapCheck()
    {
        TArray<AActor> overlappingActors;
        m_CollisionComp.GetOverlappingActorsCustom(overlappingActors, AGothicPlayerCharacter::StaticClass());
        for(auto overlapActor : overlappingActors)
        {
            if(!m_TargetsMap.Contains(overlapActor))
            {
                OnBeginOverlap(nullptr, overlapActor, nullptr, 0, false, FHitResult());
            }
        }
    }

    bool NeedCheckVisibility() override
    {
        return false;
    }

}
