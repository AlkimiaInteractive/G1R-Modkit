class UGA_Spell_Summon_Demon : UGA_Spell_SummonAI
{
    default m_SpellConfigClass = USpell_Summon_Demon_Config::StaticClass();

    default m_SummonCreatureVisualEffectClass = n"Blueprint'/Game/Items/Magic/Summon/BP_SummonFireDemonVisualEffect.BP_SummonFireDemonVisualEffect_C'";

}