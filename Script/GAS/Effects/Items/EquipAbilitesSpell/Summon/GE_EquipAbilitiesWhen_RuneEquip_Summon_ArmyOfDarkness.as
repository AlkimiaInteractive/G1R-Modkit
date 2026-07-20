class USpellConfigurationContainer_Scroll_Summon_ArmyOfDarkness : USpellConfigurationContainer_Scroll_Summon
{
    default m_SpellConfigClass = USummonSpellConfig_ArmyOfDarkness::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Scroll_Summon_ArmyOfDarkness;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();
}

class UGE_EquipAbilitiesWhen_ScrollEquip_Summon_ArmyOfDarkness : UGE_EquipAbilitiesWhen_ScrollEquip_Base
{
    default AddAbility( UGA_CastSpell_Summon_ArmyOfDarkness::StaticClass(), EAbilityInputID::Attack);
}

