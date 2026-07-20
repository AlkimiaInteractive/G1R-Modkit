class UGA_CastSpell_Firebolt_MiltenSleeper : UGA_CastSpell_Firebolt
{
    default m_GE_Mana = UGE_NoManaBurn::StaticClass();
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Rune_Firebolt_MiltenSleeper::StaticClass();
    //default m_TriggerBeginOnSpellTag = FGameplayTag();

    UFUNCTION(BlueprintOverride)
    bool NeedItemInHand_Scriptable() const
    {
        return false;
    }

}
