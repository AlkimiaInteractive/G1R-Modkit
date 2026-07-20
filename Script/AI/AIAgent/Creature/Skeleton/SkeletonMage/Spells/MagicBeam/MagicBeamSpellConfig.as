UCLASS()
class UMagicBeamSpellConfig : USpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Area;
    default m_SpellManaUsage = ESpellManaUsage::Continuous;

    default AddSpellLevel(-1.0f, 0.1f, -1.0f, UGA_Spell_MagicBeam::StaticClass());


    default m_CameraBehaviour = FCameraBehaviour();

    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = FCameraBehaviour();
    }


}