
UCLASS()
class UGE_Bloodfly : UGE_Character_Definition
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Meat);
    
    //default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Floating);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_Bleed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Cant_Swim);
    
    default AddAbility(UGameplayAbility_EquipItem::StaticClass());
    
    default AddAbility(UGA_Fly_Bloodfly::StaticClass(), EAbilityInputID::JumpAction);

    default AddAbility(UGameplayAbilityWalk::StaticClass(), EAbilityInputID::WalkAction);
    default AddAbility(UGameplayAbilitySprint::StaticClass(), EAbilityInputID::SprintAction);
    default AddAbility(UGameplayAbilityInteractFreePoint::StaticClass());

    default AddAbility(UGA_TargetEnemy::StaticClass(), EAbilityInputID::TargetEnemyAction);

    default AddAbility(UGA_RememberDefeat::StaticClass());
    default AddAbility(UGA_RememberDeath::StaticClass());
    default AddAbility(UGA_RememberDamage::StaticClass());

    default AddAbility(UGA_RegenerateSuperArmor::StaticClass());
    default AddAbility(UGA_Bloodfly_FX_Ambient::StaticClass());
}

class UGE_Bloodfly_Equip : UGameplayEffect_AbilitySet
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat_Melee);

    default AddAbility(UGA_Dodge_Flying::StaticClass(), EAbilityInputID::Dodge);

    default AddAbility(UGameplayAbilityCombatStanceSelector::StaticClass());
    default AddAbility(UGameplayAbilityTaunt::StaticClass());
    default AddAbility(UGA_Parried::StaticClass());
}

UCLASS()
class UGE_Bloodfly_AI : UGE_Bloodfly
{
    default AddAbility(UGameplayAbilityEatItem);
    default AddAbility(UGameplayAbilityPick::StaticClass());
    default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());
}

UCLASS()
class UGE_Bloodfly_Player : UGE_Bloodfly
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Transformed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Menu_ManagementBlock);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Movement_PreferStrafe);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Meat);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Cant_Swim);

    default AddAbility(UGA_UnTransform_Bloodfly::StaticClass(), EAbilityInputID::Possess);
    default AddAbility(UGameplayAbilityScavenging::StaticClass());
    default AddAbility(UGameplayAbilityInteract::StaticClass(), EAbilityInputID::Interact);
    default AddAbility(UGameplayAbilityConsumeQuick::StaticClass());
    default AddAbility(UGameplayAbilityEatItem);
}