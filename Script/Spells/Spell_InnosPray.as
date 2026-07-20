
UCLASS()
class UInnosPraySpellConfig : USpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Area;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(5.f, 0.1f, .0f, UGA_Spell_InnosPray::StaticClass());
    default m_TimePercentageFromWhichCantCancelSpell = 0.9f;  

    default m_CameraBehaviour = GetCameraBehaviourSpellInnosPray();

    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellInnosPray();
    }
}