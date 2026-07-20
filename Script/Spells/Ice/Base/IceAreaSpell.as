UCLASS(Abstract)
class UIceAreaSpell : USpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Area;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
   
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_Duration = 1.0f;
    
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_EmitterWidth = 10.0f;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_EmitterHeight = 250.0f;
}
