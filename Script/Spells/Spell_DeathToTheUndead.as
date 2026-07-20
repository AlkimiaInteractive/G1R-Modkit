
UCLASS()
class UDeathToTheUndeadSpellConfig : USpellConfig
{
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_Duration = 1.0f;

    default m_SpellTargetType = ESpellTargetType::Area;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(25.f, 0.5f, .0f, UGA_Spell_DeathToTheUndead::StaticClass());

    default m_AreaRange = 500.f;

    default m_CameraBehaviour = GetCameraBehaviourSpellAroundArea();

    default m_SpellCategoryTag = GameplayTag::Event_Spell_Mind;

    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellAroundArea();
    }
}