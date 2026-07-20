UCLASS()
class UBreakFloorSpellConfig_FireGolem : USpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Area;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(-1.0f, 0.1f, -1.0f, UGA_Spell_BreakFloor_FireGolem::StaticClass());
    default m_TimePercentageFromWhichCantCancelSpell = 0.9f;  

    default m_CameraBehaviour = GetCameraBehaviourSpellFireRain();

        UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellFireRain();
    }
}