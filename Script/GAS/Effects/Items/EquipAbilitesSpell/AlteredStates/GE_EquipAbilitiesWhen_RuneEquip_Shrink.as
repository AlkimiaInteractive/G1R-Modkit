class USpellConfigurationContainer_Scroll_Shrink : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UShrinkSpellConfig::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Scroll_Shrink;
	default m_AnimatorDirectorClass = USpellCastAnimatorVariableInSectionDirector::StaticClass();
    default m_SetStateLockMovementOnCast = true;
    default m_SetStateLockMovementOnSpell = true;

    default m_OnLaunchSpellCastFinishByAnimNotify = true;

}


class UGE_EquipAbilitiesWhen_RuneEquip_Shrink : UGE_EquipAbilitiesWhen_RuneEquip_WithCrosshair
{

    //default AddAbilityWithSpellConfiguration(USpellConfigurationContainer_Scroll_Shrink::StaticClass(), UGA_CastSpell_Shrink::StaticClass(), EAbilityInputID::Attack);
    default AddAbility(UGA_CastSpell_Shrink::StaticClass(), EAbilityInputID::Attack);
    default AddAbility(UGA_TraceTarget_Shrink::StaticClass());
}
