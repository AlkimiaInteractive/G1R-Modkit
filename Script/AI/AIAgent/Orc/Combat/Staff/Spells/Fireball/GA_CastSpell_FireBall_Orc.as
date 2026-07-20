class UGA_CastSpell_FireBall_Orc : UGA_CastSpell_RechargeableWithoutTransitions
{
    default m_GE_Mana = UGE_NoManaBurn::StaticClass();
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Staff_FireBall_Orc::StaticClass();
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





