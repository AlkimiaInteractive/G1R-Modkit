//Spell definition
UCLASS()
class UBreathOfDeathSpellConfig_Orc : UBreathOfDeathSpellConfig
{
    default m_Duration = 3.0f;
    
    default m_EmitterWidth = 10.0f;

    default m_EmitterHeight = 100.0f;

    default m_SpellTargetType = ESpellTargetType::Dynamic;
    default m_SpellManaUsage = ESpellManaUsage::Normal;

    default m_SpellLevels.Empty();

    default AddSpellLevel(-1.0f, 0.1f, -1.0f, UGA_Spell_BreathOfDeath_Orc::StaticClass());// This point define which spell we will create (UGA_Spell_BreathOfDeath_Orc) and the casting time

    default m_AreaRange = 1000.f;
    default m_AreaAngle = 30.f;
}
