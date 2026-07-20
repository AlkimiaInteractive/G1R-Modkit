class UGE_Bow_Equip : UGE_Weapon_Ranged_Equip
{
    //default AddAbility(UGameplayAbilityAim::StaticClass(), EAbilityInputID::AimAction);
    default AddAbility(UGA_ArcheryBow::StaticClass());
    default AddAbility(UGA_Crosshair::StaticClass());

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_CantTarget);
}