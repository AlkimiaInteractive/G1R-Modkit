UCLASS()
class UGE_Harpy : UGE_Character_Definition
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Meat);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Fruit);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Cooked);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Grounded);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_Fly);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_Bleed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Cant_Swim);
    
    default AddAbility(UGameplayAbility_EquipItem::StaticClass());

    default AddAbility(UGameplayAbilityWalk::StaticClass(), EAbilityInputID::WalkAction);
    default AddAbility(UGameplayAbilitySprint::StaticClass(), EAbilityInputID::SprintAction);
    default AddAbility(UGameplayAbilityInteractFreePoint::StaticClass());

    default AddAbility(UGA_Fly_Harpy::StaticClass(), EAbilityInputID::JumpAction);
    default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());

    default AddAbility(UGA_TargetEnemy::StaticClass(), EAbilityInputID::TargetEnemyAction);

    default AddAbility(UGA_RememberDefeat::StaticClass());
    default AddAbility(UGA_RememberDeath::StaticClass());
    default AddAbility(UGA_RememberDamage::StaticClass());

    default AddAbility(UGA_RegenerateSuperArmor::StaticClass());

    default AddAbility(UGA_SwapCombatModes_Harpy::StaticClass());
}

class UGE_Harpy_Equip : UGameplayEffect_AbilitySet
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat_Melee);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Movement_PreferStrafe);

    default AddAbility(UGA_Dodge_Flying::StaticClass(), EAbilityInputID::Dodge);

    default AddAbility(UGameplayAbilityCombatStanceSelector::StaticClass());
    default AddAbility(UGameplayAbilityTaunt::StaticClass());
    default AddAbility(UGA_Parried::StaticClass());
    default AddAbility(UGA_Deflected::StaticClass());
}

class UGE_Harpy_Equip_Grounded : UGE_Harpy_Equip
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_CantStrafe);
}

UCLASS()
class UGE_Harpy_AI : UGE_Harpy
{
    default AddAbility(UGameplayAbilityEatItem);
    default AddAbility(UGameplayAbilityPick::StaticClass());    
}

UCLASS()
class UGE_Harpy_Player: UGE_Harpy
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Transformed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Menu_ManagementBlock);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Meat);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Fruit);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Cooked);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Cant_Swim);
    default AddAbility(UGA_UnTransform_Harpy::StaticClass(), EAbilityInputID::Possess);
    default AddAbility(UGameplayAbilityScavenging::StaticClass());
    default AddAbility(UGameplayAbilityInteract::StaticClass(), EAbilityInputID::Interact);
    default AddAbility(UGameplayAbilityConsumeQuick::StaticClass());
    default AddAbility(UGameplayAbilityEatItem);
}