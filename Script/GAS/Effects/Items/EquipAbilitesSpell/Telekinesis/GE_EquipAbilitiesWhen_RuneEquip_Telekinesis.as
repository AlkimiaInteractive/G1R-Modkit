class USpellConfigurationContainer_Rune_Telekinesis : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UTelekinesisSpellConfig::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_Telekinesis;
	default m_AnimatorDirectorClass = USpellCastAnimatorVariableInSectionDirector::StaticClass();
    default m_SetStateLockMovementOnCast = true;
    default m_SetStateLockMovementOnSpell = true;

}


class UGE_EquipAbilitiesWhen_RuneEquip_Telekinesis : UGE_EquipAbilitiesWhen_RuneEquip_WithCrosshair
{
    //default AddAbilityWithSpellConfiguration(USpellConfigurationContainer_Rune_Telekinesis::StaticClass(), UGA_CastSpell_Telekinesis::StaticClass(), EAbilityInputID::Attack);
    default AddAbility(UGA_CastSpell_Telekinesis::StaticClass(), EAbilityInputID::Attack);
    default AddAbility(UGA_TraceItem_Telekinesis::StaticClass());
    //default AddAbility(UGA_Spell_Telekinesis::StaticClass());
}
