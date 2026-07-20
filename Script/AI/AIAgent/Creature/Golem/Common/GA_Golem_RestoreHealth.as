class UGA_Golem_RestoreHealth : UGameplayAbilityCreatureBasic
{   
	// "Current value" attribute.
	UPROPERTY(BlueprintReadWrite, VisibleAnywhere)
	FGameplayAttribute m_CurrentValueAttribute;

	// "Max value" attribute.
	UPROPERTY(BlueprintReadWrite, VisibleAnywhere)
	FGameplayAttribute m_MaxValueAttribute;

    UPROPERTY()
    bool m_Spawned = false;

    UPROPERTY()
    float m_MaxHealth;

    default m_ActivateAbilityOnGranted = true;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        if(!HasAuthority())
            return;
        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto npcState = Cast<AGothicNPCState>(gothicChar.GetCharacterState());
        npcState.OnCharacterSpawned.AddUFunction(this, n"OnCharacterSpawned");
        npcState.OnCharacterDestroyed.AddUFunction(this, n"OnCharacterDestroyed");
        
        m_MaxValueAttribute = UAngelscriptAttributeSet::GetGameplayAttribute(UAttributeSet_Health::StaticClass(), n"MaxHealth");

        bool success = false;
        m_MaxHealth = AbilitySystem::GetFloatAttributeFromAbilitySystemComponent(GetAbilitySystemComponentFromActorInfo(), m_MaxValueAttribute, success);
    }


    UFUNCTION()
    void OnCharacterSpawned(AGothicNPCState CharacterState, AGothicCharacter Character)
    {

        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        if(gothicChar.IsDead() || gothicChar.IsDefeated())
            return;

        GetAbilitySystemComponentFromActorInfo().ApplyGameplayEffectToSelf(UGE_Revive::StaticClass(), 0, GetAbilitySystemComponentFromActorInfo().MakeEffectContext());
    
    }
    
    UFUNCTION()
    void OnCharacterDestroyed(AGothicNPCState CharacterState)
    {

    }

     

    // void RestartMinigolemSpawners()
    // {
    //     TArray<AActor> outActors;
    //     GetAllActorsOfClass(AMiniGolemIceRockSpawnerVisual::StaticClass(), outActors);
    //     for(AActor Actor : outActors)
    //     {
    //         auto spawnerRock = Cast<AMiniGolemIceRockSpawnerVisual>(Actor);
    //         if(spawnerRock != nullptr)
    //         {
    //             spawnerRock.Restart();
    //         }
    //     }
    // }

    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo Info, bool WasCancelled)
    {
        if(!HasAuthority())
            return;
        //UnregisterGameplayAttributeEvent(m_CurrentValueAttribute);
        UnregisterGameplayAttributeEvent(m_MaxValueAttribute);

        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto npcState = Cast<AGothicNPCState>(gothicChar.GetCharacterState());
        npcState.OnCharacterSpawned.Unbind(this, n"OnCharacterSpawned");
        npcState.OnCharacterDestroyed.Unbind(this, n"OnCharacterDestroyed");
    }
}