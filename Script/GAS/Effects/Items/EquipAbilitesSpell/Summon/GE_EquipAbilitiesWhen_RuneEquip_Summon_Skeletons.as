class USpellConfigurationContainer_Scroll_Summon_Skeletons : USpellConfigurationContainer_Scroll_Summon
{
    default m_SpellConfigClass = USummonSpellConfig_Skeletons::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Scroll_Summon_Skeletons;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();
}

class UGE_EquipAbilitiesWhen_ScrollEquip_Summon_Skeletons : UGE_EquipAbilitiesWhen_ScrollEquip_Base
{
    default AddAbility(UGA_CastSpell_Summon_Skeletons::StaticClass(), EAbilityInputID::Attack);
}