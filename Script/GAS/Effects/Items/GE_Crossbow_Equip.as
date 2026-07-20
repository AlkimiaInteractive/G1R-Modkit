
class UGE_Crossbow_Equip : UGE_Weapon_Ranged_Equip
{
    default AddAbility(UGA_ArcheryCrossbow::StaticClass());
    default AddAbility(UGA_Crosshair::StaticClass());

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_CantTarget);
}