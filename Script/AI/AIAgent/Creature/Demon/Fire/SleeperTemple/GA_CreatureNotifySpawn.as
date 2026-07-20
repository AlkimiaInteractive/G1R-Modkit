class UGA_CreatureNotifySpawn : UGameplayAbilityCreatureBasic
{
    default m_ActivateAbilityOnGranted = true;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());

        gothicChar.SendGlobalEvent(GameplayTag::Message_Creature_Spawned, gothicChar.GetCharacterUniqueName(),
				                             n"m_Spawned", 0, false, gothicChar.GetCharacterUniqueName());
        ClearAbility();
    }
}