class UGA_BreakSuperArmor_IceGolem : UGA_BreakSuperArmor
{
    UFUNCTION(BlueprintOverride)
    void OnActivateAbility_Scriptable(FGameplayAbilityActorInfo GAActorInfo,
                                      FGameplayEventData TriggerEventData)
    {
        FGameplayEventData payload;
        GothicGAS::SendGameplayEvent(GetAvatarActorFromActorInfo(), GameplayTag::State_Knockback, payload);
    }
}