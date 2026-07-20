UCLASS()
class UGE_Goblin : UGE_Character_Definition
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_Bleed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_HideInventory_Swimming);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Meat);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Cooked);
    
    default AddAbility(UGameplayAbilityWalk::StaticClass(), EAbilityInputID::WalkAction);
    default AddAbility(UGameplayAbilitySprint::StaticClass(), EAbilityInputID::SprintAction);
    default AddAbility(UGameplayAbility_EquipItem::StaticClass());
    
    default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());
    
    default AddAbility(UGameplayAbilityCheckClimb::StaticClass());
    default AddAbility(UGameplayAbilityTraverse::StaticClass());
    default AddAbility(UGameplayAbilityRoll::StaticClass());
    default AddAbility(UGA_Swim::StaticClass());

    default AddAbility(UGA_TargetEnemy::StaticClass(), EAbilityInputID::TargetEnemyAction);

    default AddAbility(UGameplayAbilityInteractFreePoint::StaticClass());

    default AddAbility(UGA_RememberDefeat::StaticClass());
    default AddAbility(UGA_RememberDeath::StaticClass());
    default AddAbility(UGA_RememberDamage::StaticClass());

    default AddAbility(UGA_RegenerateSuperArmor::StaticClass());
    
    default AddAbility(UGameplayAbilityTaunt::StaticClass());

    default AddAbility(UGA_Dodge::StaticClass(), EAbilityInputID::Dodge);
}

class UGE_Goblin_Equip : UGameplayEffect_AbilitySet
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat_Melee);

    default AddAbility(UGA_Dodge::StaticClass(), EAbilityInputID::Dodge);

    default AddAbility(UGameplayAbilityCombatStanceSelector::StaticClass());
    //default AddAbility(UGameplayAbilityTaunt::StaticClass());
    default AddAbility(UGA_Parried::StaticClass());
    default AddAbility(UGA_Deflected::StaticClass());
}

UCLASS()
class UGE_Goblin_AI : UGE_Goblin
{
    default AddAbility(UGameplayAbilityEatItem);
    default AddAbility(UGameplayAbilityPick::StaticClass());
}

UCLASS()
class UGE_Goblin_Green_AI : UGE_Goblin_AI
{
    
}

UCLASS()
class UGE_Goblin_Black_AI : UGE_Goblin_AI
{

}

UCLASS()
class UGE_Goblin_Warrior_AI : UGE_Goblin_AI
{

}

UCLASS()
class UGE_Goblin_Player : UGE_Goblin
{
    default AddAbility(UGameplayAbilityJump::StaticClass(), EAbilityInputID::JumpAction);
    default AddAbility(UGameplayAbilityCrouch::StaticClass(), EAbilityInputID::StanceAction);
    default AddAbility(UGameplayAbilitySprint::StaticClass(), EAbilityInputID::SprintAction);
    default AddAbility(UGameplayAbilityRoll::StaticClass(), EAbilityInputID::StanceAction, EInputEvent::IE_DoubleClick);
    default AddAbility(UGameplayAbilityWalk::StaticClass(), EAbilityInputID::WalkAction);
    default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());
  
    default AddAbility(UGameplayAbilityCheckClimb::StaticClass());
    
    default AddAbility(UGA_TargetEnemy::StaticClass(), EAbilityInputID::TargetEnemyAction);

    default AddAbility(UGameplayAbility_EquipItem::StaticClass());
}