class UGA_CastSpell_FistOfWind : UGA_CastSpell_ChargeByDuration
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Rune_FistOfWind::StaticClass();
}

class UGA_CastSpell_Scroll_FistOfWind : UGA_CastSpell_FistOfWind
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Scroll_FistOfWind::StaticClass();
}