
UCLASS()
class UWindSpellConfig : USpellConfig
{
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_Duration = 1.0f;
    
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_EmitterWidth = 10.0f;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_EmitterHeight = 100.0f;

    default m_SpellCategoryTag = GameplayTag::Event_Spell_Wind;
}
UCLASS()
class UFistOfWindSpellConfig : UWindSpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Dynamic;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(2.f, 0.0f, 0.0f, UGA_Spell_FistOfWind::StaticClass());

    default m_Duration = 0.7f;
    default m_AreaRange = 700.f;
    default m_AreaAngle = 45.f;
    default m_CameraBehaviour = GetCameraBehaviourSpellFrontArea();

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_BoxDepth = 75.0f;
        
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_BoxZRadius = 200.0f;

    UFUNCTION(BlueprintOverride)
    bool IsTargetReachable_Scriptable(const AGothicCharacter instigator, const AGothicCharacter target) const
    {
        return MagicScript::IsPointInsideTriangleGiven(target.ActorLocation, instigator.ActorLocation, instigator.ActorForwardVector, m_AreaAngle, m_AreaRange);
    }
}

UCLASS()
class UStormFistSpellConfig : UWindSpellConfig
{
    default m_SpellTargetType = ESpellTargetType::Dynamic;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(10.f, .5f, 0.0f, UGA_Spell_StormFist::StaticClass());

    default m_AreaRange = 700.f;
    default m_Duration = 0.7f;
    default m_CameraBehaviour = GetCameraBehaviourSpellAroundArea();
}
