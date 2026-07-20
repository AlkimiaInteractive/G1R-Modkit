//@DE - Only for testing purposes. DELETE this when Xardas has a proper fight activation.
UCLASS()
class UGA_TESTING_AUTOACTIVATIONONLOADALL_XARDASSLEEPER : UGameplayAbilityCreatureBasic
{
    default m_ActivateAbilityOnGranted = true;

    UPROPERTY()
    private FTimerHandle TaskTimer;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        

        TaskTimer = System::SetTimerDelegate(FTimerDynamicDelegate(this, n"CheckAutoActivation"), .5f, true);
    }

    UFUNCTION()
    void CheckAutoActivation()
    {
        TArray<AActor> outActors;
        GetAllActorsOfClass(AMinionSpot_XardasSleeper::StaticClass(), outActors);
        if(outActors.Num() == 0)
        {
            return;
        }

        for(auto actor : outActors)
        {
            auto minionSpot = Cast<AMinionSpot_XardasSleeper>(actor);
            if(minionSpot == nullptr) 
                return;
     
            for(auto tuple : minionSpot.m_Minions)
            {
                auto char = tuple.Key.GetCharacter();
                if(char == nullptr)
                    return;
                if(!char.IsGameplayReady())
                    return;
            }
        }

        GetAbilitySystemComponentFromActorInfo().SendGameplayEvent(GameplayTag::Event_XardasSleeper_StartFight, FGameplayEventData());

        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
        EndAbility();
    }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo, bool WasCancelled)
    {
        if(System::IsTimerActiveHandle(TaskTimer))
            System::ClearAndInvalidateTimerHandle(TaskTimer);
    }

}