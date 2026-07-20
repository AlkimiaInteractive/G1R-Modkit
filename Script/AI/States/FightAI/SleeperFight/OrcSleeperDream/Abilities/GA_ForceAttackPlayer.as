class UGA_ForceAttackPlayer : UGameplayAbilityCreatureSpecialState
{
    default m_ActivateAbilityOnGranted = true;

    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        auto gothicChar = Cast<AGothicCharacter>(GetAvatarActorFromActorInfo());
        auto players = MagicScript::GetAllPlayersNearCurrentLocation(gothicChar.GetWorld(), gothicChar, 50000);
        if(players.IsEmpty())
            return;
        players.Shuffle();
        gothicChar.AI.StartAttackingImmediately(players[0]);
    }
}