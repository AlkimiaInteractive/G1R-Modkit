class UGA_CastSpell_SummonSkeletons_SkeletonMage : UGA_CastSpell_Default
{
    default m_GE_Mana = UGE_NoManaBurn::StaticClass();
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_SkeletonMageWeapon_SummonSkeletons::StaticClass();    

    UFUNCTION(BlueprintOverride)
    bool NeedItemInHand_Scriptable() const
    {
        return false;
    }

    UFUNCTION(BlueprintOverride)
    bool OnCanActivateAbilityServer_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo) const
    {
        USkeletonMageSummonManagerComponent summonComponent = USkeletonMageSummonManagerComponent::GetOrCreate(GameplayAbilityActorInfo.AvatarActor);
        if(summonComponent == nullptr)
            return false;
        return summonComponent.CanSummonSkeletons();
    }
}