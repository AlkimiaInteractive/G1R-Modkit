class USpellConfigurationContainer_Scroll_Transform_Molerat : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UTransformMoleratSpellConfig::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Scroll_Transform;
	default m_AnimatorDirectorClass = USpellCastAnimatorTransformDirector::StaticClass();
}

class UGE_EquipAbilitiesWhen_ScrollEquip_Transform_Molerat : UGE_EquipAbilitiesWhen_TransformScroll
{
    //default AddAbilityWithSpellConfiguration(USpellConfigurationContainer_Scroll_Transform_Molerat::StaticClass(), UGA_CastSpell_Default::StaticClass(), EAbilityInputID::Attack);
    default AddAbility(UGA_CastSpell_Transform_Molerat::StaticClass(), EAbilityInputID::Attack);   
}
