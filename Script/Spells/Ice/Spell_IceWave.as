
UCLASS()
class UIceWaveSpellConfig : UIceAreaSpell
{
    default AddSpellLevel(15.f, 0.2f, .0f, UGA_Spell_IceWave::StaticClass());
    default m_AreaRange = 600.f;
    default m_AreaAngle = 360.f;
    default m_Duration = 1.0f;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_InitialRangeOffset = 200.f;
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_RangeStep = 45.f;
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_MaxAngleStep = 35.f;
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_MinAngleStep = 4.5f;
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_AngleStepOffset = 5.f;
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_MaxSlope = 500.f;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_IceSpikeLifeTime = 4.f;

    default m_CameraBehaviour = GetCameraBehaviourSpellAroundArea();

    default m_SpellCategoryTag = GameplayTag::Event_Spell_Ice;

    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellAroundArea();
    }
}
