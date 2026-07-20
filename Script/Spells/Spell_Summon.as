UCLASS()
class USummonSpellConfig_Base : USpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Caster;
    default m_SpellManaUsage = ESpellManaUsage::Normal;


    default m_CameraBehaviour = GetCameraBehaviourSpellAroundArea();

    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellAroundArea();
    }

    USpell_Summon_Config_Base GetSummonConfig()
    {
        return Cast<USpell_Summon_Config_Base>(Cast<UGA_Spell_SummonAI>(m_SpellLevels[0].m_SpellClass.Get().GetDefaultObject()).m_SpellConfigClass.Get().GetDefaultObject());
    }
}


UCLASS()
class USummonSpellConfig_Demon : USummonSpellConfig_Base
{
    default AddSpellLevel(20.f, 0.5f, .0f, UGA_Spell_Summon_Demon::StaticClass());
}

UCLASS()
class USummonSpellConfig_Golem : USummonSpellConfig_Base
{
    default AddSpellLevel(15.f, 0.5f, .0f, UGA_Spell_Summon_Golem::StaticClass());
}

UCLASS()
class USummonSpellConfig_Skeletons : USummonSpellConfig_Base
{
    default AddSpellLevel(10.f, 0.5f, 0.0f, UGA_Spell_Summon_Skeletons::StaticClass());
}

UCLASS()
class USummonSpellConfig_ArmyOfDarkness : USummonSpellConfig_Base
{
    default AddSpellLevel(25.f, 0.5f, .0f, UGA_Spell_Summon_ArmyOfDarkness::StaticClass());
}