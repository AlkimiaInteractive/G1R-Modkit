UCLASS()
class AUrizielWaveOfDeathWeaponDeathVisual : AWeaponDeathVisualBase
{
    default m_SpellConfigClass = UUrizielWaveOfDeathSpellConfig::StaticClass();

    void SetLifeSpanInternal() override
    {
        auto spellConfig = Cast<UUrizielWaveOfDeathSpellConfig>(m_SpellConfigClass.Get().GetDefaultObject());
        SetLifeSpan(spellConfig.m_DeathEffectDuration);
    }
}