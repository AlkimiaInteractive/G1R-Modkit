class UGA_Minecrawler_Queen_Phase2_FightManager : UGameplayAbilityCreatureSpecialState
{
    default m_ActivateAbilityOnGranted = true;

    UPROPERTY()
    UMCQueenDamageLimiterComponent m_DamageLimiterComp;

    UPROPERTY()
    UMCBossDamageLimiterComponent m_DamageLimiterComp2;
    UPROPERTY()
    UDelegateHandleContainer m_OnDieMeBeforeHandle;


    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        m_DamageLimiterComp2 = UMCBossDamageLimiterComponent::GetOrCreate(GetAvatarActorFromActorInfo());

        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto gothicAbComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        if(gothicChar.IsDead())
        {
            EndAbility();
        }
           
        DoActivateCeilingSpawner();
        m_OnDieMeBeforeHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_Die_Me_Before, this, n"OnDieMeBefore");
        

    }

    void DoActivateCeilingSpawner()
    {
        TArray<AActor> outActors;
        GetAllActorsOfClass(AMCQueen_MinionCeilingSpawner::StaticClass(), outActors);

        for(auto actor : outActors)
        {
            auto ceilingSpawner = Cast<AMCQueen_MinionCeilingSpawner>(actor);
            if(actor != nullptr)
            {
                ceilingSpawner.SetOwner(GetAvatarActorFromActorInfo());
                ceilingSpawner.ActivateSpawner();
            }
        }
    }

    UFUNCTION()
    void OnDieMeBefore(FGameplayEventData GameplayEventData)
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnDieMeBeforeHandle);
        //send event die / or spawn egg.
        
        EndAbility();
    }
}