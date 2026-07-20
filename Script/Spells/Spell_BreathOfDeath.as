UCLASS()
class UBreathOfDeathSpellConfig : USpellConfig
{
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_Duration = 3.0f;
    
    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_EmitterWidth = 10.0f;

    UPROPERTY(EditAnywhere, BlueprintReadWrite)
    float m_EmitterHeight = 100.0f;

    default m_SpellTargetType = ESpellTargetType::Dynamic;
    default m_SpellManaUsage = ESpellManaUsage::Normal;
    default AddSpellLevel(15.f, 0.5f, .0f, UGA_Spell_BreathOfDeath::StaticClass());

    default m_AreaRange = 1000.f;
    default m_AreaAngle = 30.f;

    float m_DeathEffectDuration = 10.f;

    default m_SpellCategoryTag = GameplayTag::Event_Spell_Wind;

    UFUNCTION(BlueprintOverride)
    bool IsTargetReachable_Scriptable(const AGothicCharacter instigator, const AGothicCharacter target) const
    {
        return MagicScript::IsPointInsideTriangleGiven(target.ActorLocation, instigator.ActorLocation, instigator.ActorForwardVector, m_AreaAngle, m_AreaRange);
    }

    default m_CameraBehaviour = GetCameraBehaviourSpellFrontArea();

    UFUNCTION(BlueprintOverride)
    void ChangeCameraBehaviour_Scriptable(bool moving) 
    {
        m_CameraBehaviour = GetCameraBehaviourSpellFrontArea();
    }
}
