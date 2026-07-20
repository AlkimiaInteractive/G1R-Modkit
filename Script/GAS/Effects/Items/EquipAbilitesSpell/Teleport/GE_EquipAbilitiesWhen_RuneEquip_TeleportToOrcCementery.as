class USpellConfigurationContainer_Rune_TeleportToOrcCementery : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UTeleportSpellConfig_OrcCementery::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_Teleport;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();

}

class UGE_EquipAbilitiesWhen_RuneEquip_TeleportToOrcCementery : UGE_EquipAbilitiesWhen_RuneEquip_Base
{
    // default AddAbilityWithSpellConfiguration(
    //     USpellConfigurationContainer_Rune_TeleportToOrcCementery::StaticClass(), 
    //     UGA_CastSpell_ChargeByDuration::StaticClass(), 
    //     EAbilityInputID::Attack);

    default AddAbility(UGA_CastSpell_TeleportToOrcCementery::StaticClass(), EAbilityInputID::Attack);
}


