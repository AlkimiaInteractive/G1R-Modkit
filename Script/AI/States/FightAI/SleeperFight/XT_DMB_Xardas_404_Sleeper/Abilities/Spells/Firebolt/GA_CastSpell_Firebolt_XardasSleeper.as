class UGA_CastSpell_Firebolt_XardasSleeper : UGA_CastSpell_Firebolt
{
    
    default m_GE_Mana = UGE_NoManaBurn::StaticClass();
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Rune_Firebolt_XardasSleeper::StaticClass();
    //default m_TriggerBeginOnSpellTag = FGameplayTag();

    UFUNCTION(BlueprintOverride)
    bool NeedItemInHand_Scriptable() const
    {
        return false;
    }

    // UFUNCTION(BlueprintOverride)
    // bool OnCanActivateAbilityServer_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo) const
    // {
    //     auto abComp = Cast<UGothicAbilitySystemComponent>(GameplayAbilityActorInfo.GetAbilitySystemComponent());
    //     FGameplayTagContainer tagContainer;
    //     tagContainer.AddTag(GameplayTag::State_XardasSleeper_DoingTeleportTo_CentralSpot);
    //     tagContainer.AddTag(GameplayTag::State_XardasSleeper_DoingTeleportTo_MinionSpot);
    //     tagContainer.AddTag(GameplayTag::State_XardasSleeper_DoingTeleportTo_MinionSpotVisibility);
    //     return !abComp.HasAnyGameplayTags(tagContainer); 
    // }

}
