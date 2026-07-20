UCLASS()
class UPyrokinesisSpellConfig_Orc : USpellTraceConfigBase
{
    default m_SpellTargetType = ESpellTargetType::Focused;
    default m_SpellManaUsage = ESpellManaUsage::Continuous;

    default m_SpellLevels.Empty();
    default AddSpellLevel(-1.0f, 0.1f, -1.0f, UGA_Spell_Pyrokinesis_Orc::StaticClass());

    //Radius of the detection cylinder 
    default m_TraceRadius = 5.f;

    default m_CameraBehaviour = FCameraBehaviour();

    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = FCameraBehaviour();
    }


}