UCLASS()
class UGA_Summon_NotVisible : UGA_Summon
{
    UPROPERTY()
    TSubclassOf<UGameplayEffect> m_SummonGEInvisible = UGE_SummonedNotVisibleConditional::StaticClass();
    UPROPERTY()
    UDelegateHandleContainer m_handleShowCharacterDelegate;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        Super::OnActivateAbility_Scriptable(GAActorInfo, TriggerEventData);
        m_handleShowCharacterDelegate = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_ShowCharacter, this, n"OnShowCharacter");
    }

    UFUNCTION()
    void OnShowCharacter(FGameplayEventData GameplayEventData)
    {
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_handleShowCharacterDelegate);
        
        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        if(gothicChar != nullptr)
            gothicChar.ShowCharacter();
    }


    UFUNCTION(BlueprintOverride)
    void OnEndAbility_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo, bool WasCancelled)
    {
        Super::OnEndAbility_Scriptable(GameplayAbilityActorInfo, WasCancelled);
        Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo()).RemoveActiveGameplayEffectBySourceEffect(m_SummonGEInvisible, nullptr);
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_handleShowCharacterDelegate);
    }
}