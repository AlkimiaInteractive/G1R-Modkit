
UCLASS()
class UGE_Zombie : UGE_Character_Definition
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Undead_Zombie);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_CantStrafe);

    default AddAbility(UGameplayAbilityWalk::StaticClass(), EAbilityInputID::WalkAction);
    default AddAbility(UGameplayAbility_EquipItem::StaticClass());

    default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());
    
    default AddAbility(UGameplayAbilityRoll::StaticClass());
    default AddAbility(UGameplayAbilitySwim::StaticClass());

    default AddAbility(UGameplayAbilityInteractFreePoint::StaticClass());

    default AddAbility(UGA_RememberDefeat::StaticClass());
    default AddAbility(UGA_RememberDeath::StaticClass());
    default AddAbility(UGA_RememberDamage::StaticClass());

    default AddAbility(UGA_RegenerateSuperArmor::StaticClass());
    default AddAbility(UGA_Zombie_FX_Ambient::StaticClass());
}

class UGE_Zombie_Equip : UGameplayEffect_AbilitySet
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat_Melee);

    default AddAbility(UGA_Dodge::StaticClass(), EAbilityInputID::Dodge);
    default AddAbility(UGameplayAbilityCombatStanceSelector::StaticClass());
    default AddAbility(UGA_Parried::StaticClass());
    default AddAbility(UGameplayAbilityTaunt::StaticClass());
    default AddAbility(UGA_Deflected::StaticClass());
    default AddAbility(UGA_TargetEnemy::StaticClass(), EAbilityInputID::TargetEnemyAction);
}

UCLASS()
class UGE_Zombie_AI : UGE_Zombie
{
    default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());
    default AddAbility(UGameplayAbilityCrouch::StaticClass(), EAbilityInputID::StanceAction);
    default AddAbility(UGameplayAbilityJump::StaticClass(), EAbilityInputID::JumpAction);
    default AddAbility(UGameplayAbilityWalk::StaticClass(), EAbilityInputID::WalkAction);

    default AddAbility(UGameplayAbilityPick::StaticClass());

    default AddAbility(UGameplayAbility_EquipItem::StaticClass());
}

UCLASS()
class UGE_Zombie_Player : UGE_Zombie
{
    default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());
    default AddAbility(UGameplayAbilitySwim::StaticClass());

    default AddAbility(UGameplayAbilityCrouch::StaticClass(), EAbilityInputID::StanceAction);
    default AddAbility(UGameplayAbilityJump::StaticClass(), EAbilityInputID::JumpAction);
    default AddAbility(UGameplayAbilityWalk::StaticClass(), EAbilityInputID::WalkAction);

    default AddAbility(UGA_TargetEnemy::StaticClass(), EAbilityInputID::TargetEnemyAction);

    default AddAbility(UGameplayAbility_EquipItem::StaticClass());

    default AddAbility(UGameplayAbilityCheckClimb::StaticClass());
}