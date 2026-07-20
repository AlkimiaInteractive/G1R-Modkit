class UGA_CastSpell_BallLightning : UGA_CastSpell_RechargeableWithoutTransitions
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Rune_BallLightning::StaticClass();

    UFUNCTION(BlueprintOverride)
    void PlayNextCastLevel_Scriptable()
    {
        Super::PlayNextCastLevel_Scriptable();
        PlayChargeFXSound();
    }

    void PlayChargeFXSound()
    {
    }
}

class UGA_CastSpell_Scroll_BallLightning : UGA_CastSpell_RechargeableWithoutTransitions
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Scroll_BallLightning::StaticClass();

    UFUNCTION(BlueprintOverride)
    void PlayNextCastLevel_Scriptable()
    {
        Super::PlayNextCastLevel_Scriptable();
        PlayChargeFXSound();
    }

    void PlayChargeFXSound()
    {
    }
}