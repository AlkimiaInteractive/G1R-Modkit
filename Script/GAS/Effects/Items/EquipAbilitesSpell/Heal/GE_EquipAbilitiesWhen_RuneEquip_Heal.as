class USpellConfigurationContainer_Rune_Heal : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UHealSpellConfig::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_Heal;
	default m_AnimatorDirectorClass = USpellCastAnimatorVariableInSectionDirector::StaticClass();

    default m_SetStateLockMovementOnCast = false;
    default m_SetStateLockMovementOnSpell = false;
}


class UGE_EquipAbilitiesWhen_RuneEquip_Heal : UGE_EquipAbilitiesWhen_RuneEquip_WithCrosshair
{

    //default AddAbilityWithSpellConfiguration(USpellConfigurationContainer_Rune_Heal::StaticClass(), UGA_CastSpell_Heal::StaticClass(), EAbilityInputID::Attack);
    default AddAbility(UGA_CastSpell_Heal::StaticClass(), EAbilityInputID::Attack);
    default AddAbility(UGA_Spell_Heal::StaticClass());
    default AddAbility(UGA_TraceTarget_Heal::StaticClass());
}
