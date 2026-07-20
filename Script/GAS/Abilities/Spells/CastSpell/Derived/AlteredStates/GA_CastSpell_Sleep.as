
class UGA_CastSpell_Sleep : UGA_CastSpell_Targetable_Character_Debuff
{
    default m_SpellConfigurationContainerClass = USpellConfigurationContainer_Rune_Sleep::StaticClass();
    default m_SpellConfigClass = USleepSpellConfig::StaticClass();
    default m_WeaponContainer = UItAr_Rune_Sleep_Base::StaticClass();

    default m_ExecutionValidator = UCastSpellExecutionValidatorSleep::StaticClass();

    default m_DebuffTag = GameplayTag::Debuff_Sleep;

    UFUNCTION(BlueprintOverride)
    bool CanLaunchSpellAbilityServer_Scriptable()
    {
        //bool a = IsTargetValid_Script(GetAvatarActorFromActorInfo(), GetTarget());
        // FString text = FString("CanLaunchSpellAbilityServer_Scriptable - ");
        // auto result = FString::ApplyFormat(a, FString());
        // text.Append(result);
        // Print(text);
        return IsTargetValid_Script(GetAvatarActorFromActorInfo(), GetTarget());
    }

}