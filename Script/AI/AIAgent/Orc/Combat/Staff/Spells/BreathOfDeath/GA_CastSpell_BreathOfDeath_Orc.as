//Cast ability (Start the spell)
class UGA_CastSpell_BreathOfDeath_Orc : UGA_CastSpell_ChargeByDuration
{
    default m_GE_Mana = UGE_NoManaBurn::StaticClass();
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Staff_BreathOfDeath::StaticClass();
    
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


