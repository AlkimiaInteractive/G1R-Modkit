
class UGE_EquipAbilitiesWhen_RuneEquip_Base : UGE_EquipAbilitiesWhen_MagicCombat_Base
{
    //@DE This tag is necessary to allow target the enemies
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat_Magic_Rune);
    default AddAbility(UGA_GameplayAbilityFloatingItem::StaticClass());
}