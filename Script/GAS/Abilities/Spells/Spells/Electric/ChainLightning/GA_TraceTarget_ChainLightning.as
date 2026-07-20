class UGA_TraceTarget_ChainLightning : UGA_TraceTarget_Character
{
    default m_SpellConfig = UChainLightningSpellConfig::StaticClass();

    default m_CastSpellClass = UGA_CastSpell_ChainLightning::StaticClass();
}