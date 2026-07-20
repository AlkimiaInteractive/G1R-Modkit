UCLASS()
class UFistOfWindSpellConfig_LesterSleeper : UWindSpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Dynamic;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(3.f, 0.0f, 0.0f, UGA_Spell_LesterSleeper_FistOfWind::StaticClass());

    default m_Duration = 0.7f;
    default m_AreaRange = 700.f;
    default m_AreaAngle = 45.f;
    default m_CameraBehaviour = GetCameraBehaviourSpellFrontArea();

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_BoxDepth = 75.0f;
        
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_BoxZRadius = 200.0f;

}