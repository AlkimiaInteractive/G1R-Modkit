class USpellConfigurationContainer_Rune_Sleep : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = USleepSpellConfig::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_Sleep;
	default m_AnimatorDirectorClass = USpellCastAnimatorVariableInSectionDirector::StaticClass();
    default m_SetStateLockMovementOnCast = true;
    default m_SetStateLockMovementOnSpell = true;

    default m_OnLaunchSpellCastFinishByAnimNotify = true;
}


class UGE_EquipAbilitiesWhen_RuneEquip_Sleep : UGE_EquipAbilitiesWhen_RuneEquip_WithCrosshair
{

    //default AddAbilityWithSpellConfiguration(USpellConfigurationContainer_Rune_Sleep::StaticClass(), UGA_CastSpell_Sleep::StaticClass(), EAbilityInputID::Attack);
    default AddAbility(UGA_CastSpell_Sleep::StaticClass(), EAbilityInputID::Attack);
    default AddAbility(UGA_TraceTarget_Sleep::StaticClass());
}
