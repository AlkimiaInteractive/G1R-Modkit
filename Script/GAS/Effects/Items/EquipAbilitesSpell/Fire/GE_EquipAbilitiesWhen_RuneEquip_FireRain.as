class USpellConfigurationContainer_Rune_FireRain : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UFireRainSpellConfig::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_FireRain;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();

    default m_OnLaunchSpellCastFinishByAnimNotify = true;
}

class USpellConfigurationContainer_Scroll_FireRain : USpellConfigurationContainer_Rune_FireRain
{
    default m_SpellTag = GameplayTag::Item_Weapon_Scroll_FireRain;
}

class UGE_EquipAbilitiesWhen_RuneEquip_FireRain : UGE_EquipAbilitiesWhen_RuneEquip_Base
{
    default AddAbility(UGA_CastSpell_FireRain::StaticClass(),  EAbilityInputID::Attack);
}

class UGE_EquipAbilitiesWhen_ScrollEquip_FireRain : UGE_EquipAbilitiesWhen_ScrollEquip_Base
{
    default AddAbility(UGA_CastSpell_Scroll_FireRain::StaticClass(),  EAbilityInputID::Attack);
}


