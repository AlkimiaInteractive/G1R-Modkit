class UGA_Mud_Sleeper_WallController : UGameplayAbilityCreatureSpecialState
{
    default m_ActivateAbilityOnGranted = true;

    UPROPERTY()
    FName m_MessagePayloadKey = n"OnMudSleeperDeath";
        UPROPERTY()
    UDelegateHandleContainer m_OnDieMeAfterHandle;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        m_OnDieMeAfterHandle = MagicScript::AttachToEventTag(GetAvatarActorFromActorInfo(), GameplayTag::Event_Die_Me_After, this, n"OnDieMeAfter");
    }

    UFUNCTION()
    void OnDieMeAfter(FGameplayEventData GameplayEventData)
    {
        MagicScript::DetachFromEvent(GetAvatarActorFromActorInfo(), m_OnDieMeAfterHandle);
        Cast<AGothicCharacter>(GetAvatarActorFromActorInfo()).SendGlobalEvent(GameplayTag::Message_Door, m_MessagePayloadKey, n"m_CurrentSection", 1.0f);
        EndAbility();
    }

}