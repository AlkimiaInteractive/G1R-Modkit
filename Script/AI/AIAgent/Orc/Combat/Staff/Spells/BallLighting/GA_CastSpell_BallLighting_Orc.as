class UGA_CastSpell_BallLightning_Orc : UGA_CastSpell_RechargeableWithoutTransitions
{
    default m_GE_Mana = UGE_NoManaBurn::StaticClass();
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Staff_BallLightning_Orc::StaticClass();
    //default m_TriggerBeginOnSpellTag = FGameplayTag();

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
}





