class USpellConfigurationContainer_Scroll_Transform_Wolf : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UTransformWolfSpellConfig::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Scroll_Transform;
	default m_AnimatorDirectorClass = USpellCastAnimatorTransformDirector::StaticClass();
}

class UGE_EquipAbilitiesWhen_ScrollEquip_Transform_Wolf : UGE_EquipAbilitiesWhen_TransformScroll
{
    default AddAbility(UGA_CastSpell_Transform_Wolf::StaticClass(), EAbilityInputID::Attack);   
}
