class USpellConfigurationContainer_Rune_TeleportToMagiciansOfWater : USpellConfigurationContainer_Scriptable
{
    default m_SpellConfigClass = UTeleportSpellConfig_MagiciansOfWater::StaticClass();
    default m_SpellTag = GameplayTag::Item_Weapon_Rune_Teleport;
	default m_AnimatorDirectorClass = USpellCastAnimationDefaultDirector::StaticClass();

}

class UGE_EquipAbilitiesWhen_RuneEquip_TeleportToMagiciansOfWater : UGE_EquipAbilitiesWhen_RuneEquip_Base
{
    // default AddAbilityWithSpellConfiguration(
    //     USpellConfigurationContainer_Rune_TeleportToMagiciansOfWater::StaticClass(), 
    //     UGA_CastSpell_ChargeByDuration::StaticClass(), 
    //     EAbilityInputID::Attack);

    default AddAbility(UGA_CastSpell_TeleportToMagiciansOfWater::StaticClass(), EAbilityInputID::Attack);
}


