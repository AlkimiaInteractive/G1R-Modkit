class USpellConfigurationContainer_Scroll_Summon_Demon : USpellConfigurationContainer_Scroll_Summon
{
    default m_SpellConfigClass = USummonSpellConfig_Demon::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Scroll_Summon_Demon;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();
}

class UGE_EquipAbilitiesWhen_ScrollEquip_Summon_Demon : UGE_EquipAbilitiesWhen_ScrollEquip_Base
{
    default AddAbility(UGA_CastSpell_Summon_Demon::StaticClass(), EAbilityInputID::Attack);
}