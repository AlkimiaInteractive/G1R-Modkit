
UCLASS()
class UChainLightningSpellConfig : USpellTraceConfigBase
{
    default m_SpellTargetType = ESpellTargetType::Focused;
    default m_SpellManaUsage = ESpellManaUsage::Continuous;
    default AddSpellLevel(5.f, 0.5f, 1.0f, UGA_Spell_ChainLightning::StaticClass());

    default m_CameraBehaviour = GetCameraBehaviourSpellFrontArea();

    //Distance to trace the target
    default m_AreaRange = 1500.f;
    //Radius of the detection cylinder 
    default m_TraceRadius = 5.f;

    default m_SpellCategoryTag = GameplayTag::Event_Spell_Energy;

    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellFrontArea();
    }

}
