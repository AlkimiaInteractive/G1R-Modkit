
class UGE_Lizard : UGE_Character_Definition
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Meat);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Fruit);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Vegetable);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_Bleed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_CantStrafe);
    
    default AddAbility(UGameplayAbilityWalk::StaticClass(), EAbilityInputID::WalkAction);
    default AddAbility(UGameplayAbilitySprint::StaticClass(), EAbilityInputID::SprintAction);
    default AddAbility(UGameplayAbilityJump::StaticClass(), EAbilityInputID::JumpAction);
    default AddAbility(UGameplayAbility_EquipItem::StaticClass());

    
    default AddAbility(UGameplayAbilityCheckClimb::StaticClass());
    default AddAbility(UGameplayAbilityTraverse::StaticClass());

    default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());
    default AddAbility(UGA_Swim::StaticClass());

    default AddAbility(UGameplayAbilityInteractFreePoint::StaticClass());
    default AddAbility(UGA_TargetEnemy::StaticClass(), EAbilityInputID::TargetEnemyAction);

    default AddAbility(UGA_RememberDefeat::StaticClass());
    default AddAbility(UGA_RememberDeath::StaticClass());
    default AddAbility(UGA_RememberDamage::StaticClass());

    default AddAbility(UGA_RegenerateSuperArmor::StaticClass());
}

class UGE_Lizard_Equip : UGameplayEffect_AbilitySet
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat_Melee);

    default AddAbility(UGA_Dodge::StaticClass(), EAbilityInputID::Dodge);

    default AddAbility(UGameplayAbilityCombatStanceSelector::StaticClass());
    default AddAbility(UGameplayAbilityTaunt::StaticClass());
    default AddAbility(UGA_Parried::StaticClass());
}

UCLASS()
class UGE_Lizard_AI : UGE_Lizard
{
    default AddAbility(UGameplayAbilityEatItem);
    default AddAbility(UGameplayAbilityPick::StaticClass());
}

UCLASS()
class UGE_Lizard_Player : UGE_Lizard
{    
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Transformed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Menu_ManagementBlock);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Meat);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Fruit);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Vegetable);

    default AddAbility(UGA_UnTransform_FireLizard::StaticClass(), EAbilityInputID::Possess);
    default AddAbility(UGameplayAbilityScavenging::StaticClass());
    default AddAbility(UGameplayAbilityInteract::StaticClass(), EAbilityInputID::Interact);
    default AddAbility(UGameplayAbilityConsumeQuick::StaticClass());
    default AddAbility(UGA_Human_SmashMeatBug::StaticClass());
    default AddAbility(UGameplayAbilityEatItem);
    default AddAbility(UGameplayAbilitySprint::StaticClass(), EAbilityInputID::SprintActionToggle);
    default AddAbility(UGameplayAbilityCheckClimb::StaticClass());
}



//OLD
/*
UCLASS()
class UGE_Lizard_AI : UGE_Character_Definition
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_Bleed);
}

UCLASS()
class UGE_Lizard_Player : UGE_Character_Definition
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_Bleed);
    
    default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());
    default AddAbility(UGameplayAbilityCrouch::StaticClass(), EAbilityInputID::StanceAction);
    default AddAbility(UGameplayAbilityJump::StaticClass(), EAbilityInputID::JumpAction);
    default AddAbility(UGameplayAbilitySprint::StaticClass(), EAbilityInputID::SprintAction);
    default AddAbility(UGameplayAbilityWalk::StaticClass(), EAbilityInputID::WalkAction);
    default AddAbility(UGameplayAbilitySwim::StaticClass());
}
*/

UCLASS()
class UGE_Lizard_Fire_AI : UGE_Lizard
{
    default AddAbility(UGameplayAbilityEatItem);    
    default AddAbility(UGameplayAbilityPick::StaticClass());
}

UCLASS()
class UGE_Lizard_Fire_Player : UGE_Lizard_Player
{
}