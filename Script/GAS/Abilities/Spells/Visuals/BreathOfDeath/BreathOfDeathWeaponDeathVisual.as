UCLASS()
class ABreathOfDeathWeaponDeathVisual : AWeaponDeathVisualBase
{
    default m_SpellConfigClass = UBreathOfDeathSpellConfig::StaticClass();
    
    void SetLifeSpanInternal() override
    {
        auto spellConfig = Cast<UBreathOfDeathSpellConfig>(m_SpellConfigClass.Get().GetDefaultObject());
        SetLifeSpan(spellConfig.m_DeathEffectDuration);
        
    }
}