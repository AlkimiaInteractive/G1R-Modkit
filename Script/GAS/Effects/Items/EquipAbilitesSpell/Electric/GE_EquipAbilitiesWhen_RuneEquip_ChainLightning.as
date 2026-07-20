class USpellConfigurationContainer_Rune_ChainLightning : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UChainLightningSpellConfig::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_ChainLightning;
	default m_AnimatorDirectorClass = USpellCastAnimatorVariableInSectionDirector::StaticClass();
    default m_SetStateLockMovementOnCast = true;
    default m_SetStateLockMovementOnSpell = true;
}

class USpellConfigurationContainer_Scroll_ChainLightning : USpellConfigurationContainer_Rune_ChainLightning
{
    default m_SpellTag = GameplayTag::Item_Weapon_Scroll_ChainLightning;
}

class UGE_EquipAbilitiesWhen_RuneEquip_ChainLightning : UGE_EquipAbilitiesWhen_RuneEquip_WithCrosshair
{
    default AddAbility(UGA_CastSpell_ChainLightning::StaticClass(), EAbilityInputID::Attack );
    default AddAbility(UGA_TraceTarget_ChainLightning::StaticClass());
    default AddAbility(UGA_Spell_ChainLightning::StaticClass());
}

class UGE_EquipAbilitiesWhen_ScrollEquip_ChainLightning : UGE_EquipAbilitiesWhen_ScrollEquip_WithCrosshair
{
    default AddAbility(UGA_CastSpell_Scroll_ChainLightning::StaticClass(), EAbilityInputID::Attack );
    default AddAbility(UGA_TraceTarget_ChainLightning::StaticClass());
    default AddAbility(UGA_Spell_ChainLightning::StaticClass());
}