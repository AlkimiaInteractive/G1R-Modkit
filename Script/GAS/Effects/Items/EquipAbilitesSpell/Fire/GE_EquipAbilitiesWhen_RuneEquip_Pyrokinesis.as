class USpellConfigurationContainer_Rune_Pyrokinesis : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UPyrokinesisSpellConfig::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_Pyrokinesis;
	default m_AnimatorDirectorClass = USpellCastAnimatorVariableInSectionDirector::StaticClass();

    default m_SetStateLockMovementOnCast = true;
    default m_SetStateLockMovementOnSpell = true;
}

class USpellConfigurationContainer_Scroll_Pyrokinesis : USpellConfigurationContainer_Rune_Pyrokinesis
{
    default m_SpellTag = GameplayTag::Item_Weapon_Scroll_Pyrokinesis;
}

class UGE_EquipAbilitiesWhen_RuneEquip_Pyrokinesis : UGE_EquipAbilitiesWhen_RuneEquip_WithCrosshair
{
    default AddAbility(UGA_CastSpell_Pyrokinesis::StaticClass(), EAbilityInputID::Attack);
    default AddAbility(UGA_TraceTarget_Pyrokinesis::StaticClass());
    default AddAbility(UGA_Spell_Pyrokinesis::StaticClass());
}

class UGE_EquipAbilitiesWhen_ScrollEquip_Pyrokinesis : UGE_EquipAbilitiesWhen_ScrollEquip_WithCrosshair
{
    default AddAbility(UGA_CastSpell_Scroll_Pyrokinesis::StaticClass(), EAbilityInputID::Attack);
    default AddAbility(UGA_TraceTarget_Pyrokinesis::StaticClass());
    default AddAbility(UGA_Spell_Pyrokinesis::StaticClass());
}