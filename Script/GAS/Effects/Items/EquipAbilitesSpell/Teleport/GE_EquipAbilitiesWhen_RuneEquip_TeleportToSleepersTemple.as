class USpellConfigurationContainer_Rune_TeleportToSleepersTemple : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UTeleportSpellConfig_SleepersTemple::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_Teleport;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();

}

class UGE_EquipAbilitiesWhen_RuneEquip_TeleportToSleepersTemple : UGE_EquipAbilitiesWhen_RuneEquip_Base
{
    // default AddAbilityWithSpellConfiguration(
    //     USpellConfigurationContainer_Rune_TeleportToSleepersTemple::StaticClass(), 
    //     UGA_CastSpell_ChargeByDuration::StaticClass(), 
    //     EAbilityInputID::Attack);

    default AddAbility(UGA_CastSpell_TeleportToSleepersTemple::StaticClass(), EAbilityInputID::Attack);
}


