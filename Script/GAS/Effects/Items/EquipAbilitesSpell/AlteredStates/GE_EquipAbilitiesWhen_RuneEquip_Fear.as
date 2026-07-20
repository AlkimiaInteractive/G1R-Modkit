class USpellConfigurationContainer_Rune_Fear : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UFearSpellConfig::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Scroll_Fear;
	default m_AnimatorDirectorClass = USpellCastAnimatorVariableInSectionDirector::StaticClass();

    default m_SetStateLockMovementOnCast = true;
    default m_SetStateLockMovementOnSpell = true;

    default m_OnLaunchSpellCastFinishByAnimNotify = true;
}

class UGE_EquipAbilitiesWhen_RuneEquip_Fear : UGE_EquipAbilitiesWhen_RuneEquip_Base
{
    // default AddAbilityWithSpellConfiguration(
    //     USpellConfigurationContainer_Rune_Fear::StaticClass(), 
    //     UGA_CastSpell_Default::StaticClass(), 
    //     EAbilityInputID::Attack); 

    default AddAbility(UGA_CastSpell_Fear::StaticClass(), EAbilityInputID::Attack);   
}


