class USpellConfigurationContainer_Rune_TeleportToNecromancer : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UTeleportSpellConfig_Necromancer::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_Teleport;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();

}

class UGE_EquipAbilitiesWhen_RuneEquip_TeleportToNecromancer : UGE_EquipAbilitiesWhen_RuneEquip_Base
{
    // default AddAbilityWithSpellConfiguration(
    //     USpellConfigurationContainer_Rune_TeleportToNecromancer::StaticClass(), 
    //     UGA_CastSpell_ChargeByDuration::StaticClass(), 
    //     EAbilityInputID::Attack);

    default AddAbility(UGA_CastSpell_TeleportToNecromancer::StaticClass(), EAbilityInputID::Attack);
}

