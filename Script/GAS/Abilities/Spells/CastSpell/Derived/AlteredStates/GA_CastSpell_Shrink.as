
class UGA_CastSpell_Shrink : UGA_CastSpell_Targetable_Character_Debuff
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Scroll_Shrink::StaticClass();
    default m_SpellConfigClass = UShrinkSpellConfig::StaticClass();
    default m_WeaponContainer = UItAr_Scroll_Shrink_Base::StaticClass();

    default m_DebuffTag = GameplayTag::Debuff_Shrink;

    default m_ExecutionValidator = UCastSpellExecutionValidatorShrink::StaticClass();
    
    UFUNCTION(BlueprintOverride)
    bool CanLaunchSpellAbilityServer_Scriptable()
    {

        return IsTargetValid_Script(GetAvatarActorFromActorInfo(),GetTarget());
    }
}