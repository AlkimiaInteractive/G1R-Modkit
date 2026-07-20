class USpellConfigurationContainer_Rune_UrizielWaveOfDeath : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UUrizielWaveOfDeathSpellConfig::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_UrizielWaveOfDeath;
    default m_SpellCancelTag = GameplayTag::Item_Weapon_Rune_UrizielWaveOfDeath_Cancel;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();

    default m_OnLaunchSpellCastFinishByAnimNotify = true;
}


class UGE_EquipAbilitiesWhen_RuneEquip_UrizielWaveOfDeath : UGE_EquipAbilitiesWhen_RuneEquip_Base
{
    //default AddAbilityWithSpellConfiguration(USpellConfigurationContainer_Rune_UrizielWaveOfDeath::StaticClass(), UGA_CastSpell_Default::StaticClass(), EAbilityInputID::Attack);
    default AddAbility(UGA_CastSpell_UrizielWaveOfDeath::StaticClass(), EAbilityInputID::Attack);
}



