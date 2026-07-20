
UCLASS()
class UCharmSpellConfig : USpellTraceConfigBase
{
    //Custom Target detection allow to manage the type of the target in the cast phase.
    default m_SpellTargetType = ESpellTargetType::Focused; 
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(5.f, 0.5f, .0f, UGA_Spell_Charm::StaticClass());

    //Distance to trace the target
    default m_AreaRange = 1500.f;
    //Radius of the detection cylinder 
    default m_TraceRadius = 5.f;

    float m_Duration = 60.0f;

    default m_SpellCategoryTag = GameplayTag::Event_Spell_Mind;
}