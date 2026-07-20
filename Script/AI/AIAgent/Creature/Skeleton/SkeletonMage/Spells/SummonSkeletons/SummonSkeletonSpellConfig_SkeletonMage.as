UCLASS()
class USummonSkeletonSpellConfig_SkeletonMage : USpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Caster;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(-1.0f, 0.5f, -1.0f, UGA_Spell_Summon_Skeletons_SkeletonMage::StaticClass());
}