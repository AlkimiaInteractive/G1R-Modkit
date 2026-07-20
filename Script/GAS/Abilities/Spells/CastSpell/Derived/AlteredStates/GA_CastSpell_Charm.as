class UGA_CastSpell_Charm : UGA_CastSpell_Targetable_Character_Debuff
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Rune_Charm::StaticClass();
    default m_SpellConfigClass = UCharmSpellConfig::StaticClass();
    default m_WeaponContainer = UItAr_Rune_Charm_Base::StaticClass();

    default m_DebuffTag = GameplayTag::Debuff_Charm;

    default m_ExecutionValidator = UCastSpellExecutionValidatorCharm::StaticClass();

    UFUNCTION(BlueprintOverride)
    bool CanLaunchSpellAbilityServer_Scriptable()
    {
        return IsTargetValid_Script(GetAvatarActorFromActorInfo(), GetTarget());
    }
}