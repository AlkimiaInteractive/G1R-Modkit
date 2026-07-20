class USpellConfigurationContainer_Rune_TeleportToSunkenTower : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UTeleportSpellConfig_SunkenTower::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_Teleport;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();

}

class UGE_EquipAbilitiesWhen_RuneEquip_TeleportToSunkenTower : UGE_EquipAbilitiesWhen_RuneEquip_Base
{
    // default AddAbilityWithSpellConfiguration(
    //     USpellConfigurationContainer_Rune_TeleportToSleepersTemple::StaticClass(), 
    //     UGA_CastSpell_ChargeByDuration::StaticClass(), 
    //     EAbilityInputID::Attack);

    default AddAbility(UGA_CastSpell_TeleportToSunkenTower::StaticClass(), EAbilityInputID::Attack);
}