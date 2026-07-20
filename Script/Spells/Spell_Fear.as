
UCLASS()
class UFearSpellConfig : USpellConfig
{
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_GameplayEffectDuration = 10.0f;

    //@DE - This will be used to calculate speed on each tick. Speed = M_areaRange/m_VisualDuration.
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_VisualDuration = 2.0f;

    default m_SpellTargetType = ESpellTargetType::Area;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(5.f, 0.5f, .0f, UGA_Spell_Fear::StaticClass());

    default m_AreaRange = 1000.f;

    default m_SpellCategoryTag = GameplayTag::Event_Spell_Mind;
}