class USpellConfigurationContainer_Rune_DeathToTheUndead : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UDeathToTheUndeadSpellConfig::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_DeathToTheUndead;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();

    default m_OnLaunchSpellCastFinishByAnimNotify = true;

}


class UGE_EquipAbilitiesWhen_RuneEquip_DeathToTheUndead : UGE_EquipAbilitiesWhen_RuneEquip_Base
{

    //default AddAbilityWithSpellConfiguration(USpellConfigurationContainer_Rune_DeathToTheUndead::StaticClass(), UGA_CastSpell_ChargeByDuration::StaticClass(), EAbilityInputID::Attack);
    default AddAbility(UGA_CastSpell_DeathToTheUndead::StaticClass(), EAbilityInputID::Attack);
}


