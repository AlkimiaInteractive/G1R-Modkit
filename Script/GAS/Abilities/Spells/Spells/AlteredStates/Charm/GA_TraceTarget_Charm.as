class UGA_TraceTarget_Charm : UGA_TraceTarget_Character
{
    default m_SpellConfig = UCharmSpellConfig::StaticClass();

    default m_CastSpellClass = UGA_CastSpell_Charm::StaticClass();
}