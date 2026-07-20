class UGA_TraceTarget_Pyrokinesis : UGA_TraceTarget_Character
{
    default m_SpellConfig = UPyrokinesisSpellConfig::StaticClass();

    default m_CastSpellClass = UGA_CastSpell_Pyrokinesis::StaticClass();
}