class UGA_CastSpell_MagicBeam_SkeletonMage : UGA_CastSpell_Default
{
    default m_GE_Mana = UGE_NoManaBurn::StaticClass();
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_SkeletonMageWeapon_MagicBeam::StaticClass();

    UFUNCTION(BlueprintOverride)
    bool NeedItemInHand_Scriptable() const
    {
        return false;
    }
    
}