class USpellConfigurationContainer_Scroll_InnosPray : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UInnosPraySpellConfig::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Scroll_InnosPray;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();

    default m_OnLaunchSpellCastFinishByAnimNotify = true;
}


class UGE_EquipAbilitiesWhen_ScrollEquip_InnosPray : UGE_EquipAbilitiesWhen_ScrollEquip_Base
{
    default AddAbility(UGA_CastSpell_Scroll_InnosPray::StaticClass(),  EAbilityInputID::Attack);
}


