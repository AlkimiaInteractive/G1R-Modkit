UCLASS()
class UIceBlockSpellConfig : UIceAreaSpell
{
    default AddSpellLevel(3.f, 0.2f, 0.0f, UGA_Spell_IceBlock::StaticClass());

    default m_AreaRange = 720.f;
    default m_AreaAngle = 60.f;
    default m_Duration = 0.8f;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_BoxDepth = 75.0f;
        
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_BoxZRadius = 200.0f;

    default m_CameraBehaviour = GetCameraBehaviourSpellFrontArea();

    default m_SpellCategoryTag = GameplayTag::Event_Spell_Ice;
}

