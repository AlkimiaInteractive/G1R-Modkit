
UCLASS()
class UGE_Skeleton_Base : UGE_Character_Definition
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Undead_Skeleton);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_HideInventory_Swimming);

    default AddAbility(UGameplayAbilityWalk::StaticClass(), EAbilityInputID::WalkAction);
    default AddAbility(UGameplayAbilitySprint::StaticClass(), EAbilityInputID::SprintAction);
    default AddAbility(UGameplayAbility_EquipItem::StaticClass());
    
    default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());
    default AddAbility(UGameplayAbilityRoll::StaticClass());
    default AddAbility(UGameplayAbilitySwim::StaticClass());
    default AddAbility(UGameplayAbilityTraverse::StaticClass());

    default AddAbility(UGameplayAbilityInteractFreePoint::StaticClass());

    default AddAbility(UGA_TargetEnemy::StaticClass(), EAbilityInputID::TargetEnemyAction);

    default AddAbility(UGA_RememberDefeat::StaticClass());
    default AddAbility(UGA_RememberDeath::StaticClass());
    default AddAbility(UGA_RememberDamage::StaticClass());

    default AddAbility(UGA_RegenerateSuperArmor::StaticClass());

    default AddAbility(UGameplayAbilityTaunt::StaticClass());

    default AddAbility(UGA_Summon_Skeleton::StaticClass());
    default AddAbility(UGA_Skeleton_FX_Ambient::StaticClass());
}


class UGE_Skeleton_Equip : UGameplayEffect_AbilitySet
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat_Melee);

    default AddAbility(UGA_Dodge_Flying::StaticClass(), EAbilityInputID::Dodge);
    default AddAbility(UGameplayAbilityCombatStanceSelector::StaticClass());
    default AddAbility(UGA_Parried::StaticClass());
    //default AddAbility(UGameplayAbilityTaunt::StaticClass());
}

UCLASS()
class UGE_Skeleton_AI : UGE_Skeleton_Base
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_CantStrafe);
    
    default AddAbility(UGA_AllowStrafeOnNonStrafableCreaturesDuringCombat::StaticClass());
    default AddAbility(UGameplayAbilityPick::StaticClass());
    // default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NonInteractable);
}

UCLASS()
class UGE_Skeleton_AI_Summon : UGE_Skeleton_Base
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_CantStrafe);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_NonInteractable);

    default AddAbility(UGA_AllowStrafeOnNonStrafableCreaturesDuringCombat::StaticClass());
    default AddAbility(UGameplayAbilityPick::StaticClass());
}

UCLASS()
class UGE_Skeleton_Player : UGE_Skeleton_Base
{
    default AddAbility(UGameplayAbilityCheckClimb::StaticClass());
	default AddAbility(UGameplayAbilityJump::StaticClass(), EAbilityInputID::JumpAction);
}

UCLASS()
class UGE_Skeleton_Warrior_AI : UGE_Skeleton_AI
{
    default AddAbility(UGameplayAbilityPick::StaticClass());
}

UCLASS()
class UGE_Skeleton_Warrior_Player : UGE_Skeleton_Player
{
    default AddAbility(UGameplayAbilityCheckClimb::StaticClass());
	default AddAbility(UGameplayAbilityJump::StaticClass(), EAbilityInputID::JumpAction);
}

//-------Mage

UCLASS()
class UGE_Skeleton_Mage_AI : UGE_Skeleton_Base
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Control);
    default AddAbility(UGA_Fly_SkeletonMage::StaticClass(), EAbilityInputID::JumpAction);
    default AddAbility(UGameplayAbilityPick::StaticClass());
    default RemoveAbility(UGA_Skeleton_FX_Ambient::StaticClass());
    default AddAbility(UGA_Skeleton_Mage_FX_Ambient::StaticClass());
}

UCLASS()
class UGE_Skeleton_Mage_Player : UGE_Skeleton_Base
{
    default AddAbility(UGA_Fly_SkeletonMage::StaticClass(), EAbilityInputID::JumpAction);
    default RemoveAbility(UGA_Skeleton_FX_Ambient::StaticClass());
    default AddAbility(UGA_Skeleton_Mage_FX_Ambient::StaticClass());
}

class UGE_Skeleton_Mage_Equip : UGE_Skeleton_Equip
{
    
}


// GEs for Summoned Skeletons by Skeleton Mage


UCLASS()
class UGE_SkMageSummonedSkeleton : UGE_Character_Definition
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Undead_Skeleton);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_HideInventory_Swimming);

    default AddAbility(UGameplayAbilityWalk::StaticClass(), EAbilityInputID::WalkAction);
    default AddAbility(UGameplayAbilitySprint::StaticClass(), EAbilityInputID::SprintAction);
    default AddAbility(UGameplayAbility_EquipItem::StaticClass());
    
    default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());
    
    default AddAbility(UGameplayAbilityRoll::StaticClass());
    default AddAbility(UGameplayAbilitySwim::StaticClass());

    default AddAbility(UGameplayAbilityInteractFreePoint::StaticClass());

    default AddAbility(UGA_TargetEnemy::StaticClass(), EAbilityInputID::TargetEnemyAction);

    default AddAbility(UGA_RememberDefeat::StaticClass());
    default AddAbility(UGA_RememberDeath::StaticClass());
    default AddAbility(UGA_RememberDamage::StaticClass());

    default AddAbility(UGA_RegenerateSuperArmor::StaticClass());

    default AddAbility(UGA_SkeletonMage_Summon_Skeleton::StaticClass());
}

UCLASS()
class UGE_SkMageSummonedSkeleton_AI : UGE_SkMageSummonedSkeleton
{
    default AddAbility(UGameplayAbilityPick::StaticClass());
}

UCLASS()
class UGE_SkMageSummonedSkeleton_Player : UGE_SkMageSummonedSkeleton
{
    default AddAbility(UGameplayAbilityCheckClimb::StaticClass());
    default AddAbility(UGameplayAbilitySprint::StaticClass(), EAbilityInputID::SprintActionToggle);
	default AddAbility(UGameplayAbilityJump::StaticClass(), EAbilityInputID::JumpAction);
}