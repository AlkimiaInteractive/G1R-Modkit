
UCLASS()
class UGE_Razor : UGE_Character_Definition
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Meat);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_Bleed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_CantStrafe);

    default AddAbility(UGameplayAbilityWalk::StaticClass(), EAbilityInputID::WalkAction);
    default AddAbility(UGameplayAbilitySprint::StaticClass(), EAbilityInputID::SprintAction);
    default AddAbility(UGameplayAbilityJump::StaticClass(), EAbilityInputID::JumpAction);
    default AddAbility(UGameplayAbility_EquipItem::StaticClass());
    
    default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());
    
    default AddAbility(UGameplayAbilityCheckClimb::StaticClass());
    default AddAbility(UGameplayAbilityTraverse::StaticClass());
    default AddAbility(UGA_Swim::StaticClass());

    default AddAbility(UGA_TargetEnemy::StaticClass(), EAbilityInputID::TargetEnemyAction);

    default AddAbility(UGameplayAbilityInteractFreePoint::StaticClass());

    default AddAbility(UGA_RememberDefeat::StaticClass());
    default AddAbility(UGA_RememberDeath::StaticClass());
    default AddAbility(UGA_RememberDamage::StaticClass());

    default AddAbility(UGA_RegenerateSuperArmor::StaticClass());
}

class UGE_Razor_Equip : UGameplayEffect_AbilitySet
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat_Melee);

    default AddAbility(UGA_Dodge::StaticClass(), EAbilityInputID::Dodge);

    default AddAbility(UGameplayAbilityCombatStanceSelector::StaticClass());
    default AddAbility(UGameplayAbilityTaunt::StaticClass());
    default AddAbility(UGA_Parried::StaticClass());
}
UCLASS()
class UGE_Razor_AI : UGE_Razor
{
    default AddAbility(UGameplayAbilityEatItem);
    default AddAbility(UGameplayAbilityPick::StaticClass());
}

UCLASS()
class UGE_Razor_Player : UGE_Razor
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Transformed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Menu_ManagementBlock);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Meat);

    default AddAbility(UGA_UnTransform_Razor::StaticClass(), EAbilityInputID::Possess);
    default AddAbility(UGameplayAbilityScavenging::StaticClass());
    default AddAbility(UGameplayAbilityInteract::StaticClass(), EAbilityInputID::Interact);
    default AddAbility(UGameplayAbilityConsumeQuick::StaticClass());
    default AddAbility(UGA_Human_SmashMeatBug::StaticClass());
    default AddAbility(UGameplayAbilityEatItem);
    default AddAbility(UGameplayAbilityJump::StaticClass(), EAbilityInputID::JumpAction);
    default AddAbility(UGameplayAbilityCheckClimb::StaticClass());

}