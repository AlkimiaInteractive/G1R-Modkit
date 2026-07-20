class USpellConfigurationContainer_Rune_Control : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UControlSpellConfig::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_Control;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();
}

class USpellConfigurationContainer_Scroll_Control : USpellConfigurationContainer_Rune_Control
{
    default m_SpellTag = GameplayTag::Item_Weapon_Scroll_Control;
}

class UGE_EquipAbilitiesWhen_RuneEquip_Control : UGE_EquipAbilitiesWhen_RuneEquip_WithCrosshair
{
    //default AddAbilityWithSpellConfiguration(USpellConfigurationContainer_Rune_Control::StaticClass(), UGA_CastSpell_Control::StaticClass(), EAbilityInputID::Attack);   
    default AddAbility(UGA_CastSpell_Control::StaticClass(), EAbilityInputID::Attack);   
    default AddAbility(UGA_TraceTarget_Control::StaticClass());
}

class UGE_EquipAbilitiesWhen_ScrollEquip_Control : UGE_EquipAbilitiesWhen_ScrollEquip_WithCrosshair
{
    //default AddAbilityWithSpellConfiguration(USpellConfigurationContainer_Rune_Control::StaticClass(), UGA_CastSpell_Control::StaticClass(), EAbilityInputID::Attack);   
    default AddAbility(UGA_CastSpell_Scroll_Control::StaticClass(), EAbilityInputID::Attack);   
    default AddAbility(UGA_TraceTarget_Control::StaticClass());
}