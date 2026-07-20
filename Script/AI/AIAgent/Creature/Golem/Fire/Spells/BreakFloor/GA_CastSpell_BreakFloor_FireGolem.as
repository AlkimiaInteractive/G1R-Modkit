class UGA_CastSpell_BreakFloor_FireGolem : UGA_CastSpell_Default
{
    default m_GE_Mana = UGE_NoManaBurn::StaticClass();
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_GolemWeapon_BreakFloor_FireGolem::StaticClass();    

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