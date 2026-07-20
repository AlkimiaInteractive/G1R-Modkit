class UGA_AllowStrafeOnNonStrafableCreaturesDuringCombat : UGameplayAbilityManageTagUpdate
{
    default m_ActivateAbilityOnGranted = true;
    
    default m_LookForTags.Add(GameplayTag::State_Combat);

    UFUNCTION(BlueprintOverride)
    void OnTagUpdate_Scriptable(const FGameplayTag InTag, int32 NewCount)
    {
        auto abComp = Cast<UGothicAbilitySystemComponent>(GetAbilitySystemComponentFromActorInfo());
        if(abComp != nullptr)
        {
            abComp.SetLooseGameplayTagCount(GameplayTag::Character_CantStrafe, NewCount > 0 ? 0 : 1);
        }
    }
}