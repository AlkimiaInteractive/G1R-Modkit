class UGA_CastSpell_ChainLightning_Orc : UGA_CastSpell_ChainLightning
{
    default m_GE_Mana = UGE_NoManaBurn::StaticClass();
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Staff_ChainLightning_Orc::StaticClass();

    UFUNCTION(BlueprintOverride)
    bool NeedItemInHand_Scriptable() const
    {
        return false;
    }

}
