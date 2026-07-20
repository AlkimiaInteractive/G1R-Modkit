class UGA_CastSpell_StoneWave_StoneGolem : UGA_CastSpell_ChargeByDuration
{
    default m_GE_Mana = UGE_NoManaBurn::StaticClass();
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_GolemWeapon_StoneWave_StoneGolem::StaticClass();

    UFUNCTION(BlueprintOverride)
    bool NeedItemInHand_Scriptable() const
    {
        return false;
    }

    UFUNCTION(BlueprintOverride)
    bool ShouldForceIgnoreInput_Scriptable()
    {
        return true;
    }
}

