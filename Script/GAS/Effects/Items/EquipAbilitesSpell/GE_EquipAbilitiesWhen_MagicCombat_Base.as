
class UGE_EquipAbilitiesWhen_MagicCombat_Base : UGE_Weapon_Equip//UEquipAbilitiesRuneEquip
{
    //@DE This tag is necessary to allow target the enemies
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat_Magic);

    // This tag ensures the npc will use the full item animconfig
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Aggressive);
  
    //default AddAbility(UGA_Dodge::StaticClass(), EAbilityInputID::Dodge);
    //default AddAbility(UGameplayAbilityRoll::StaticClass());  
    
    //The magic stance blocks abilities that the player should not execute with a rune equipped
    default AddAbility(UGameplayAbilityMagicCombatStance::StaticClass());
    //This is for the AI
    default AddAbility(UGameplayAbilityTaunt::StaticClass());

    default AddAbility(UGameplayAbilitySpellCameraBase::StaticClass());

}