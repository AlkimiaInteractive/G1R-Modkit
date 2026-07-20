class UMadCorKalomDemonFightComponent : UCreatureGenericMagicComponent
{
    UPROPERTY()
    private FTimerHandle TaskTimer;
    
    UPROPERTY()
    FName m_TeleportWayPointActorName = n"FP_SC_CORKALOMDEMON_SPAWN_FAIL";

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        StartDeadLockTimer();
    }

    void StartDeadLockTimer()
    {
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"OnDeadLock"), 15.f, false);
    }

    UFUNCTION()
    void OnDeadLock()
    {
        auto gothicChar = Cast<AGothicCharacter>(GetOwner());
        auto abComp = gothicChar.GetAbilitySystemComponent();

        if(!Cast<UGothicAbilitySystemComponent>(abComp).HasGameplayTag(GameplayTag::State_CorKalomDemon_InArena))
        {
            FInteractionSpotHandle Spot(m_TeleportWayPointActorName);
            if(Spot.IsValid())
            {
                FHitResult hitResult;
                gothicChar.SetActorLocation(Spot.GetLocation(), false, hitResult, true);
            }
            else
            {
                TArray<ACorKalomDemonSpawnFinalPositionActor> teleportOutActors;
                GetAllActorsOfClass(ACorKalomDemonSpawnFinalPositionActor::StaticClass(), teleportOutActors);
                if(teleportOutActors.IsEmpty())
                    return;
                FHitResult hitResult;
                gothicChar.SetActorLocation(teleportOutActors[0].GetActorLocation(), false, hitResult, true);
            }
        }
    }

    void StopDeadLockTimer()
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
    }

    UFUNCTION(BlueprintOverride)
    void EndPlay(EEndPlayReason EndPlayReason)
    {
        StopDeadLockTimer();
    }
}