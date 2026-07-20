
UCLASS()
class UGE_Troll : UGE_Character_Definition
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Meat);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_Bleed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_KeepCollisionsWhenDead);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_CantStrafe);
    
    default AddAbility(UGameplayAbilitySprint::StaticClass(), EAbilityInputID::SprintAction);
    default AddAbility(UGameplayAbilityWalk::StaticClass(), EAbilityInputID::WalkAction);
    default AddAbility(UGameplayAbility_EquipItem::StaticClass());

    default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());
    
    default AddAbility(UGameplayAbilityRoll::StaticClass());
    default AddAbility(UGameplayAbilitySwim::StaticClass());
    default AddAbility(UGA_TargetEnemy::StaticClass(), EAbilityInputID::TargetEnemyAction);

    default AddAbility(UGameplayAbilityInteractFreePoint::StaticClass());

    default AddAbility(UGA_RememberDefeat::StaticClass());
    default AddAbility(UGA_RememberDeath::StaticClass());
    default AddAbility(UGA_RememberDamage::StaticClass());

    default AddAbility(UGA_RegenerateSuperArmor::StaticClass());

    default AddAbility(UGA_BossHealthBar::StaticClass());
    default AddAbility(UGA_DeactivateTickOptimizer::StaticClass());
}

class UGE_Troll_Equip : UGameplayEffect_AbilitySet
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat_Melee);

    default AddAbility(UGA_Dodge::StaticClass(), EAbilityInputID::Dodge);
    default AddAbility(UGameplayAbilityCombatStanceSelector::StaticClass());
    default AddAbility(UGA_Parried::StaticClass());
    default AddAbility(UGameplayAbilityTaunt::StaticClass());
}

UCLASS()
class UGE_Troll_AI : UGE_Troll
{
    default AddAbility(UGameplayAbilityEatItem);
    default AddAbility(UGameplayAbilityPick::StaticClass());
    default AddAbility(UGA_Boss_HealthMonitor::StaticClass());
}

UCLASS()
class UGE_Troll_Player : UGE_Troll
{
    
    default AddAbility(UGameplayAbilitySprint::StaticClass(), EAbilityInputID::SprintActionToggle);
	default AddAbility(UGameplayAbilityJump::StaticClass(), EAbilityInputID::JumpAction);
    
}


UCLASS()
class UGE_JuvenileTroll_AI : UGE_Troll_AI
{
    default RemoveAbility(UGA_BossHealthBar::StaticClass());
    default AddAbility(UGameplayAbilityCheckClimb::StaticClass());
    default AddAbility(UGameplayAbilityTraverse::StaticClass());
}

UCLASS()
class UGE_JuvenileTroll_Player : UGE_Troll_Player
{
    default RemoveAbility(UGA_BossHealthBar::StaticClass());
}  

UCLASS()
class UGE_Troll_AI_Flee : UGE_Troll
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_CantStrafe);
    default AddAbility(UGameplayAbilityPick::StaticClass());
}