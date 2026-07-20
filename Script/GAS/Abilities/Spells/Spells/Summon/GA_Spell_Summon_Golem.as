class UGA_Spell_Summon_Golem : UGA_Spell_SummonAI
{
    default m_SpellConfigClass = USpell_Summon_Golem_Config::StaticClass();

    default m_SummonCreatureVisualEffectClass = n"Blueprint'/Game/Items/Magic/Summon/BP_SummonGolemVisualEffect.BP_SummonGolemVisualEffect_C'";
}