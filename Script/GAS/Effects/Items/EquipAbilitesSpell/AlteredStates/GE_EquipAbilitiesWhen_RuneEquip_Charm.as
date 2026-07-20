class USpellConfigurationContainer_Rune_Charm : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UCharmSpellConfig::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_Charm;
	default m_AnimatorDirectorClass = USpellCastAnimatorVariableInSectionDirector::StaticClass();
    default m_SetStateLockMovementOnCast = true;
    default m_SetStateLockMovementOnSpell = true;

    default m_OnLaunchSpellCastFinishByAnimNotify = true;

}


class UGE_EquipAbilitiesWhen_RuneEquip_Charm : UGE_EquipAbilitiesWhen_RuneEquip_WithCrosshair
{

    //default AddAbilityWithSpellConfiguration(USpellConfigurationContainer_Rune_Charm::StaticClass(), UGA_CastSpell_Charm::StaticClass(), EAbilityInputID::Attack);
    default AddAbility(UGA_CastSpell_Charm::StaticClass(), EAbilityInputID::Attack);
    default AddAbility(UGA_TraceTarget_Charm::StaticClass());
}
