class UGA_CastSpell_FireBall_MiltenSleeper : UGA_CastSpell_FireBall
{
    default m_GE_Mana = UGE_NoManaBurn::StaticClass();
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Rune_FireBall_Milten_Sleeper::StaticClass();
    //default m_TriggerBeginOnSpellTag = FGameplayTag();

    UFUNCTION(BlueprintOverride)
    bool NeedItemInHand_Scriptable() const
    {
        return false;
    }

}




