UCLASS()
class UUrizielWaveOfDeathSpellConfig : USpellConfig
{
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_Duration = 15.0f;
    
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_EmitterWidth = 10.0f;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_EmitterHeight = 100.0f;

    default m_SpellCategoryTag = GameplayTag::Event_Spell_Energy;


    default m_SpellTargetType = ESpellTargetType::Dynamic;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(40.f, 0.3f, 0.0f, UGA_Spell_UrizielWaveOfDeath::StaticClass());

    default m_AreaRange = 750.f;
    default m_AreaAngle = 360.f;

    default m_CameraBehaviour = GetUrizielWaveOfDeathCameraBehaviour();

    float m_DeathEffectDuration = 10.f;

    UFUNCTION(BlueprintOverride)
    bool IsTargetReachable_Scriptable(const AGothicCharacter instigator, const AGothicCharacter target) const
    {
        return MagicScript::IsPointInsideTriangleGiven(target.ActorLocation, instigator.ActorLocation, instigator.ActorForwardVector, m_AreaAngle, m_AreaRange);
    }
}
