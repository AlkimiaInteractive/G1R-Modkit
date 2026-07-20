class USpellConfigurationContainer_Scroll_Transform_Shadowbeast : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UTransformShadowbeastSpellConfig::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Scroll_Transform;
	default m_AnimatorDirectorClass = USpellCastAnimatorTransformDirector::StaticClass();
}

class UGE_EquipAbilitiesWhen_ScrollEquip_Transform_Shadowbeast : UGE_EquipAbilitiesWhen_TransformScroll
{
    //default AddAbilityWithSpellConfiguration(USpellConfigurationContainer_Scroll_Transform_Shadowbeast::StaticClass(), UGA_CastSpell_Default::StaticClass(), EAbilityInputID::Attack);  
    default AddAbility(UGA_CastSpell_Transform_Shadowbeast::StaticClass(), EAbilityInputID::Attack);   
}
