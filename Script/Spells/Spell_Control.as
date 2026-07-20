
UCLASS()
class UControlSpellConfig : USpellTraceConfigBase
{
    default m_SpellTargetType = ESpellTargetType::Focused;
    default m_SpellManaUsage = ESpellManaUsage::TargetLevel;
    default m_AreaRange = 2000;
        
    //Radius of the detection cylinder 
    default m_TraceRadius = 5.f;

    default m_SpellCategoryTag = GameplayTag::Event_Spell_Mind;
    
    default AddSpellLevel(5.f, 0.5f, 4.0f, UGA_Spell_Control::StaticClass());
    }