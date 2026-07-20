class UGA_TraceTarget_Sleep : UGA_TraceTarget_Character
{
    default m_SpellConfig = USleepSpellConfig::StaticClass();

    default m_CastSpellClass = UGA_CastSpell_Sleep::StaticClass();
}