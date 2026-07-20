class USpellConfigurationContainer_Scroll_Transform_OrcDog : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UTransformOrcDogSpellConfig::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Scroll_Transform;
	default m_AnimatorDirectorClass = USpellCastAnimatorTransformDirector::StaticClass();
}

class UGE_EquipAbilitiesWhen_ScrollEquip_Transform_OrcDog : UGE_EquipAbilitiesWhen_TransformScroll
{
    //default AddAbilityWithSpellConfiguration(USpellConfigurationContainer_Scroll_Transform_OrcDog::StaticClass(), UGA_CastSpell_Default::StaticClass(), EAbilityInputID::Attack); 
    default AddAbility(UGA_CastSpell_Transform_OrcDog::StaticClass(), EAbilityInputID::Attack);   
}
