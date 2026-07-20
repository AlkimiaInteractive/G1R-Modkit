
class UGA_CastSpell_Pyrokinesis : UGA_CastSpell_Targetable_Character_Debuff
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Rune_Pyrokinesis::StaticClass();

    default m_TriggerBeginOnSpellTag = GameplayTag::Ability_Action_Spell_Throw_Pyrokinesis;

    default m_SpellConfigClass = UPyrokinesisSpellConfig::StaticClass();
    default m_WeaponContainer = UItAr_Rune_Pyrokinesis_Base::StaticClass();

    default m_ExecutionValidator = UCastSpellExecutionValidatorPyrokinesis::StaticClass();

    default m_DebuffTag = GameplayTag::Debuff_Pyrokinesis;

    UFUNCTION(BlueprintOverride)
    bool CanLaunchSpellAbilityServer_Scriptable()
    {
        return IsTargetValid_Script(GetAvatarActorFromActorInfo(), GetTarget());
    }

}

class UGA_CastSpell_Scroll_Pyrokinesis : UGA_CastSpell_Pyrokinesis
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Scroll_Pyrokinesis::StaticClass();
}