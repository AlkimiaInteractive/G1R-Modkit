class UGA_CastSpell_LesterSleeper_FistOfWind : UGA_CastSpell_FistOfWind
{
    default m_GE_Mana = UGE_NoManaBurn::StaticClass();
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_LesterSleeper_FistOfWind::StaticClass();

    UFUNCTION(BlueprintOverride)
    bool NeedItemInHand_Scriptable() const
    {
        return false;
    }

}