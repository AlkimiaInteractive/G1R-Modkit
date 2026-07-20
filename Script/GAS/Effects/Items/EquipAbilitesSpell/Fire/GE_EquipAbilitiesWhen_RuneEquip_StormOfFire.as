class USpellConfigurationContainer_Rune_StormOfFire : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UStormOfFireSpellConfig::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_StormFire;
	default m_AnimatorDirectorClass = USpellCastAnimatorVariableInSectionDirector::StaticClass();

    default m_OnLaunchSpellCastFinishByAnimNotify = true;
}

class USpellConfigurationContainer_Scroll_StormOfFire : USpellConfigurationContainer_Rune_StormOfFire
{
    default m_SpellTag = GameplayTag::Item_Weapon_Scroll_StormOfFire;
}

class UGE_EquipAbilitiesWhen_RuneEquip_StormOfFire : UGE_EquipAbilitiesWhen_RuneEquip_WithCrosshair
{
   default AddAbility(UGA_CastSpell_StormOfFire::StaticClass(), EAbilityInputID::Attack);    
}

class UGE_EquipAbilitiesWhen_ScrollEquip_StormOfFire : UGE_EquipAbilitiesWhen_ScrollEquip_WithCrosshair
{
    default AddAbility(UGA_CastSpell_Scroll_StormOfFire::StaticClass(), EAbilityInputID::Attack);    
}

