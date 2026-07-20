class UGA_CastSpell_StormFist : UGA_CastSpell_ChargeByDuration
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Rune_StormFist::StaticClass();
}

class UGA_CastSpell_Scroll_StormFist : UGA_CastSpell_StormFist
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Scroll_StormFist::StaticClass();
}