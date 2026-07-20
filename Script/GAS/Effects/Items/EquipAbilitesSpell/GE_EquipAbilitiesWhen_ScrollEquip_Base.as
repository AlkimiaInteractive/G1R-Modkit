
class UGE_EquipAbilitiesWhen_ScrollEquip_Base : UGE_EquipAbilitiesWhen_MagicCombat_Base
{
    //@DE This tag is necessary to allow target the enemies
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat_Magic_Scroll);
    default AddAbility(UGA_GameplayAbilityFloatingScrollItem::StaticClass());
}

class UGE_EquipAbilitiesWhen_TransformScroll : UGE_EquipAbilitiesWhen_MagicCombat_Base
{
    //@DE This tag is necessary to allow target the enemies
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat_Magic_Scroll);
    default AddAbility(UGA_GameplayAbilityFloatingTransformScrollItem::StaticClass());
}