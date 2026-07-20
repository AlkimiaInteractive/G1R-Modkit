
UCLASS()
class UStormOfFireSpellConfig : USpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Dynamic;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(30.f, 0.5f, .0f, UGA_Spell_StormOfFire::StaticClass());
    default m_TimePercentageFromWhichCantCancelSpell = 0.9f;

    default m_CameraBehaviour = GetCameraBehaviourSpellFrontArea();
    //FCameraBehaviour SpellStormOfFire;
    //default SpellStormOfFire.m_IsAim = true;
    //default SpellStormOfFire.m_ArmLength = 175.0f;
    //default SpellStormOfFire.m_SocketOffset = FVector(0.0f, 90.0f, 0.0f);
    //default SpellStormOfFire.m_SpellPitchLimit = 30.0f;
    //default SpellStormOfFire.m_SpellYawLimit = 30.0f;
    ////default SpellStormOfFire.m_SocketOffset = FVector(0.0f, 160.0f, -35.0f);
    //default m_CameraBehaviour = SpellStormOfFire; 

    default m_SpellCategoryTag = GameplayTag::Event_Spell_Fire;

    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellFrontArea();
    }
}