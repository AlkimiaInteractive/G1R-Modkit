class USpellConfigurationContainer_Rune_StormFist : USpellConfigurationContainer_Scriptable
{
  default m_SpellConfigClass = UStormFistSpellConfig::StaticClass();
  default m_SpellTag = GameplayTag::Item_Weapon_Rune_StormFist;
  default m_AnimatorDirectorClass = USpellCastAnimatorVariableInSectionDirector::StaticClass();

  default m_OnLaunchSpellCastFinishByAnimNotify = true;
}

class USpellConfigurationContainer_Scroll_StormFist : USpellConfigurationContainer_Rune_StormFist
{
  default m_SpellTag = GameplayTag::Item_Weapon_Scroll_StormFist;
}

class UGE_EquipAbilitiesWhen_RuneEquip_StormFist : UGE_EquipAbilitiesWhen_RuneEquip_Base
{
  default AddAbility(UGA_CastSpell_StormFist::StaticClass(), EAbilityInputID::Attack);
}

class UGE_EquipAbilitiesWhen_ScrollEquip_StormFist : UGE_EquipAbilitiesWhen_ScrollEquip_Base
{
  default AddAbility(UGA_CastSpell_Scroll_StormFist::StaticClass(), EAbilityInputID::Attack);
}
