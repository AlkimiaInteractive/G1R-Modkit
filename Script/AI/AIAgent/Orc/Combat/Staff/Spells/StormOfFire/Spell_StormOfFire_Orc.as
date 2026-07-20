//Spell definition
UCLASS()
class UStormOfFireSpellConfig_Orc : USpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Dynamic;
    default m_SpellManaUsage = ESpellManaUsage::Normal;

    default m_SpellLevels.Empty();
    default AddSpellLevel(-1.0f, 0.1f, -1.0f, UGA_Spell_StormOfFire_Orc::StaticClass());// This point define which spell we will create (UGA_Spell_StormOfFire_Orc) and the casting time
    default m_TimePercentageFromWhichCantCancelSpell = 0.9f;
}


