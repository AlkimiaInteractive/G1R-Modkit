class USpellConfigurationContainer_Scroll_Summon_Golem : USpellConfigurationContainer_Scroll_Summon
{
    default m_SpellConfigClass = USummonSpellConfig_Golem::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Scroll_Summon_Golem;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();

    //default m_SetStateLockMovementOnCast = true;
    //default m_SetStateLockMovementOnSpell = true;
}

class UGE_EquipAbilitiesWhen_ScrollEquip_Summon_Golem : UGE_EquipAbilitiesWhen_ScrollEquip_Base
{
    default AddAbility(UGA_CastSpell_Summon_Golem::StaticClass(), EAbilityInputID::Attack);
}