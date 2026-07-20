//Cast ability (Start the spell)
class UGA_CastSpell_Firewall_Orc : UGA_CastSpell_Light
{
    default m_GE_Mana = UGE_NoManaBurn::StaticClass();
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Staff_Firewall_Orc::StaticClass();
    UPROPERTY()
    TSubclassOf<ADemonAreaVisual> m_Area = ADemonAreaFirewallVisual::StaticClass();
    
    UFUNCTION(BlueprintOverride)
    bool NeedItemInHand_Scriptable() const
    {
        return false;
    }

    UFUNCTION(BlueprintOverride)
    bool ShouldForceIgnoreInput_Scriptable()
    {
        return true;
    }

    UFUNCTION(BlueprintOverride)
    bool OnCanActivateAbilityServer_Scriptable(FGameplayAbilityActorInfo GameplayAbilityActorInfo) const
    {
        ADemonAreaVisual area = m_Area.GetDefaultObject();
        auto DemonAreaRegisterComponent = UDemonAreaRegisterComponent::GetOrCreate(GameplayAbilityActorInfo.AvatarActor);
        if(area != nullptr && DemonAreaRegisterComponent != nullptr)
            return DemonAreaRegisterComponent.CanSpawnArea(area.m_AreaType);
        return false;
    }
}


