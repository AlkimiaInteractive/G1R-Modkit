
class UGE_Scavenger : UGE_Character_Definition
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Meat);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Fruit);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Cooked);
    
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_Bleed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_CantStrafe);

    default AddAbility(UGameplayAbilityWalk::StaticClass(), EAbilityInputID::WalkAction);
    default AddAbility(UGameplayAbilitySprint::StaticClass(), EAbilityInputID::SprintAction);
    default AddAbility(UGameplayAbilityJump::StaticClass(), EAbilityInputID::JumpAction);
    default AddAbility(UGameplayAbility_EquipItem::StaticClass());
    
    default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());
    
    default AddAbility(UGA_Swim::StaticClass());

    default AddAbility(UGameplayAbilityCheckClimb::StaticClass());
    default AddAbility(UGameplayAbilityTraverse::StaticClass());

    default AddAbility(UGA_TargetEnemy::StaticClass(), EAbilityInputID::TargetEnemyAction);

    default AddAbility(UGameplayAbilityInteractFreePoint::StaticClass());

    default AddAbility(UGA_RememberDefeat::StaticClass());
    default AddAbility(UGA_RememberDeath::StaticClass());
    default AddAbility(UGA_RememberDamage::StaticClass());

    default AddAbility(UGA_RegenerateSuperArmor::StaticClass());
}

class UGE_Scavenger_Equip : UGameplayEffect_AbilitySet
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat_Melee);

    default AddAbility(UGA_Dodge::StaticClass(), EAbilityInputID::Dodge);

    default AddAbility(UGameplayAbilityCombatStanceSelector::StaticClass());
    default AddAbility(UGameplayAbilityTaunt::StaticClass());
    default AddAbility(UGA_Parried::StaticClass());    
    default AddAbility(UGA_Deflected::StaticClass());
}

UCLASS()
class UGE_Scavenger_AI : UGE_Scavenger
{
    default AddAbility(UGameplayAbilityEatItem);
    default AddAbility(UGameplayAbilityPick::StaticClass());
    default AddAbility(UGA_Human_SmashMeatBug::StaticClass());
}

UCLASS()
class UGE_Scavenger_Player : UGE_Scavenger
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Transformed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Menu_ManagementBlock);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Meat);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Fruit);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Food_Cooked);

    default AddAbility(UGA_UnTransform_ScavengerMedium::StaticClass(), EAbilityInputID::Possess);
    default AddAbility(UGameplayAbilityScavenging::StaticClass());
    default AddAbility(UGameplayAbilityInteract::StaticClass(), EAbilityInputID::Interact);
    default AddAbility(UGameplayAbilityConsumeQuick::StaticClass());
    default AddAbility(UGA_Human_SmashMeatBug::StaticClass());
    default AddAbility(UGameplayAbilityEatItem);
    default AddAbility(UGameplayAbilityJump::StaticClass(), EAbilityInputID::JumpAction);
    default AddAbility(UGameplayAbilityCheckClimb::StaticClass());
}

UCLASS()
class UGE_Scavenger_Medium_AI : UGE_Scavenger_AI
{
}

UCLASS()
class UGE_Scavenger_Medium_Player : UGE_Scavenger_Player
{
	
}

UCLASS()
class UGE_Scavenger_Adult_AI : UGE_Scavenger_AI
{
}

UCLASS()
class UGE_Scavenger_AdultRideable_Cohsel_AI : UGE_Scavenger_AI
{
    FConditionalGameplayEffect pettableEffect;
    default pettableEffect.EffectClass = UGE_Pettable_Scavenger::StaticClass(); 
    default AdditionalEffects.OnApplicationGameplayEffects.Add(pettableEffect);
}

UCLASS()
class UGE_Scavenger_Adult_Player : UGE_Scavenger_Player
{
    default AddAbility(UGameplayAbilityPick::StaticClass());

}

UCLASS()
class UGE_Scavenger_Adult_AI_Rideable : UGE_Scavenger
{
    default AddAbility(UGameplayAbilityEatItem);
    default AddAbility(UGameplayAbilityPick::StaticClass());
    default AddAbility(UGameplayAbilityEndRiding::StaticClass());
    default AddAbility(UGA_AlcoholDebuff_RidingScavenger::StaticClass());
    default AddAbility(UGA_SwampweedDebuff::StaticClass());
    default AddAbility(UGA_CheckRideableZone::StaticClass());

    default RemoveAbility(UGameplayAbilityRagdoll::StaticClass());
    default RemoveAbility(UGA_BreakSuperArmor::StaticClass());

    default AddAbility(UGA_BreakSuperArmor_Forced::StaticClass());

    FConditionalGameplayEffect pettableEffect;
    default pettableEffect.EffectClass = UGE_Pettable_Scavenger::StaticClass(); 
    default AdditionalEffects.OnApplicationGameplayEffects.Add(pettableEffect);

    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Mount);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Cant_Dive);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_UnKillable);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_IgnoreSuperarmorValue);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Immunity_KnockBack);
}