class UGA_CastSpell_Firebolt : UGA_CastSpell_Repeatable
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Rune_FireBolt::StaticClass();
}

class UGA_CastSpell_Scroll_Firebolt : UGA_CastSpell_Firebolt
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Scroll_Firebolt::StaticClass();
}