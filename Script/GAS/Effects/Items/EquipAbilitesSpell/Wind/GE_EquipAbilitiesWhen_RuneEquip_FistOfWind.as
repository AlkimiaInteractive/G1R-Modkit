class USpellConfigurationContainer_Rune_FistOfWind : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UFistOfWindSpellConfig::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_FistOfWind;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();

    default m_OnLaunchSpellCastFinishByAnimNotify = true;
}

class USpellConfigurationContainer_Scroll_FistOfWind : USpellConfigurationContainer_Rune_FistOfWind
{
    default m_SpellTag = GameplayTag::Item_Weapon_Scroll_FistOfWind;
}

class UGE_EquipAbilitiesWhen_RuneEquip_FistOfWind : UGE_EquipAbilitiesWhen_RuneEquip_WithCrosshair
{
    //default AddAbilityWithSpellConfiguration(USpellConfigurationContainer_Rune_FistOfWind::StaticClass(), UGA_CastSpell_ChargeByDuration::StaticClass(), EAbilityInputID::Attack);
    default AddAbility(UGA_CastSpell_FistOfWind::StaticClass(), EAbilityInputID::Attack);
}

class UGE_EquipAbilitiesWhen_ScrollEquip_FistOfWind : UGE_EquipAbilitiesWhen_ScrollEquip_WithCrosshair
{
    default AddAbility(UGA_CastSpell_Scroll_FistOfWind::StaticClass(), EAbilityInputID::Attack);
}