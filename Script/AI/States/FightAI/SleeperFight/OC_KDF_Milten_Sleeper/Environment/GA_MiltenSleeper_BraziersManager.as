class UGA_MiltenSleeper_BraziersManager : UGameplayAbilityCreatureBasic
{
    UPROPERTY()
    TArray<AMiltenSleeper_Brazier> m_ArenaBraziers;

    UPROPERTY()
    UDelegateHandleContainer m_DelegateHandleContainer;

    default m_ActivateAbilityOnGranted = true;

    
    UPROPERTY()
    private FTimerHandle TaskTimer;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        FindAreaBraziers();
    }

    UFUNCTION()
    void FindAreaBraziers()
    {
        auto avatarActor = GetAvatarActorFromActorInfo();
        //UNearbyActorsSubsystem::Get().TrackActorsOfClass(AMiltenSleeper_Brazier::StaticClass());
        //auto outActors = UNearbyActorsSubsystem::Get().FindActorsOfClassInRadius(AMiltenSleeper_Brazier::StaticClass(), avatarActor.GetActorLocation(), 15000);
        TArray<AActor> outActors;
        GetAllActorsOfClass(AMiltenSleeper_Brazier::StaticClass(), outActors);
        if(outActors.Num() == 0)
        {
            ActivateDetectionTimer();
            return;
        }

        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        
        RegisterBraziers(outActors);

    }

    void ActivateDetectionTimer()
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"FindAreaBraziers"), .5f, true);
    }

    void RegisterBraziers(TArray<AActor> Actors)
    {
        for(auto actor: Actors)
        {
            auto brazier = Cast<AMiltenSleeper_Brazier>(actor);
            m_ArenaBraziers.Add(brazier);
            brazier.RegisterBrazier(GetAvatarActorFromActorInfo());
        }
    }

}

