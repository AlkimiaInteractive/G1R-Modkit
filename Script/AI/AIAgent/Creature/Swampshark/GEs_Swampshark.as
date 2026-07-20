
UCLASS()
class UGE_Swampshark : UGE_Character_Definition
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Meat);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_Bleed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_CantStrafe);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_KeepCollisionsWhenDead);

    default AddAbility(UGameplayAbilityInteractFreePoint::StaticClass());

    default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());
    default AddAbility(UGameplayAbilitySprint::StaticClass(), EAbilityInputID::SprintAction);
    default AddAbility(UGameplayAbilityWalk::StaticClass(), EAbilityInputID::WalkAction);
    default AddAbility(UGameplayAbility_EquipItem::StaticClass());
    default AddAbility(UGA_Swim::StaticClass());
    default AddAbility(UGA_TargetEnemy::StaticClass(), EAbilityInputID::TargetEnemyAction);
    default AddAbility(UGA_RememberDefeat::StaticClass());
    default AddAbility(UGA_RememberDeath::StaticClass());
    default AddAbility(UGA_RememberDamage::StaticClass());

    default AddAbility(UGA_RegenerateSuperArmor::StaticClass());
}

class UGE_Swampshark_Equip : UGameplayEffect_AbilitySet
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat_Melee);

    // default AddAbility(UGA_Dodge::StaticClass(), EAbilityInputID::Dodge);
    default AddAbility(UGameplayAbilityCombatStanceSelector::StaticClass());
    default AddAbility(UGA_Parried::StaticClass());
    default AddAbility(UGameplayAbilityTaunt::StaticClass());
}

UCLASS()
class UGE_Swampshark_AI : UGE_Swampshark
{
    default AddAbility(UGameplayAbilityEatItem);
    default AddAbility(UGameplayAbilityPick::StaticClass());
}

UCLASS()
class UGE_Swampshark_Player : UGE_Swampshark
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Transformed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Menu_ManagementBlock);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Meat);

    default AddAbility(UGA_UnTransform_Swampshark::StaticClass(), EAbilityInputID::Possess);
    default AddAbility(UGameplayAbilityScavenging::StaticClass());
    default AddAbility(UGameplayAbilityInteract::StaticClass(), EAbilityInputID::Interact);
    default AddAbility(UGameplayAbilityConsumeQuick::StaticClass());
    default AddAbility(UGameplayAbilityEatItem);
	//default AddAbility(UGameplayAbilityCrouch::StaticClass(), EAbilityInputID::StanceAction);
    default AddAbility(UGameplayAbilityJump::StaticClass(), EAbilityInputID::JumpAction);
    default AddAbility(UGameplayAbilitySprint::StaticClass(), EAbilityInputID::SprintActionToggle);
    default AddAbility(UGameplayAbility_EquipItem::StaticClass());
    
}