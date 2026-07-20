class UGA_CastSpell_Pyrokinesis_Orc : UGA_CastSpell_Pyrokinesis
{
    default m_GE_Mana = UGE_NoManaBurn::StaticClass();
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Staff_Pyrokinesis_Orc::StaticClass();

    UFUNCTION(BlueprintOverride)
    bool NeedItemInHand_Scriptable() const
    {
        return false;
    }
}
