class USpellConfigurationContainer_Rune_BreathOfDeath : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UBreathOfDeathSpellConfig::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_BreathOfDeath;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();

    default m_OnLaunchSpellCastFinishByAnimNotify = true;
}


class UGE_EquipAbilitiesWhen_RuneEquip_BreathOfDeath : UGE_EquipAbilitiesWhen_RuneEquip_WithCrosshair
{
    //default AddAbilityWithSpellConfiguration(USpellConfigurationContainer_Rune_BreathOfDeath::StaticClass(), UGA_CastSpell_ChargeByDuration::StaticClass(), EAbilityInputID::Attack);
    default AddAbility(UGA_CastSpell_BreathOfDeath::StaticClass(), EAbilityInputID::Attack);
}