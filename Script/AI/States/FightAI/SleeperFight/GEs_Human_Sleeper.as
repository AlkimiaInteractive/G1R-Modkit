UCLASS()
class UGE_Human_AI_Mage_SixthCircle_Sleeper : UGE_Human_AI
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Killable);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Ability_Effect_FloatingItem_Blocked);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Charm);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Control);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Fear);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Heal_OnlyWasteMana);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Debuff_Blocked_Sleep);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Paralyzed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Cant_Freeze);
    
	default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_SendDeathEvent);
    default RemoveAbility(UGA_Defeated_NPC::StaticClass());
    default RemoveAbility(UGA_Falling::StaticClass());
    default RemoveAbility(UGameplayAbilityInteractFreePoint::StaticClass());

    default AddAbility(UGA_BossHealthBar::StaticClass());

    FConditionalGameplayEffect conditionalGE;
	default conditionalGE.EffectClass = UGE_Dissolve::StaticClass(); 
    default AdditionalEffects.OnApplicationGameplayEffects.Add(conditionalGE); 

    default RemoveAbility(UGA_Death::StaticClass());
    default AddAbility(UGA_Death_Dissolve::StaticClass());
    default AddAbility(UGA_DeactivateTickOptimizer::StaticClass());
    default AddAbility(UGA_ForceEnemyRelationship::StaticClass());  
}

UCLASS()
class UGE_Human_AI_Mage_SixthCircle_Sleeper_Extended : UGE_Human_AI_Mage_SixthCircle_Sleeper
{
    default RemoveAbility(UGA_LightHit::StaticClass());
    default RemoveAbility(UGA_Deflected::StaticClass());
    default RemoveAbility(UGA_Riposte::StaticClass());
    default RemoveAbility(UGA_BreakSuperArmor::StaticClass());
    default RemoveAbility(UGA_Deflected::StaticClass());
    default RemoveAbility(UGA_Parry::StaticClass());
    default RemoveAbility(UGA_Parried::StaticClass());
    default RemoveAbility(UGA_Dodge::StaticClass());
    default RemoveAbility(UGA_WallClimbing::StaticClass());
    default RemoveAbility(UGameplayAbilityInteractWallClimb::StaticClass());
    default RemoveAbility(UGameplayAbilityPick::StaticClass());
    default RemoveAbility(UGameplayAbilityJump::StaticClass());
    default RemoveAbility(UGA_Human_OpenContainer::StaticClass());
    default RemoveAbility(UGA_Swim::StaticClass());
    default RemoveAbility(UGA_Human_ReceiveItem::StaticClass());
    default RemoveAbility(UGA_Human_GiveItem::StaticClass());
    default RemoveAbility(UGE_Human_PickAndCarryBags::StaticClass());
    default RemoveAbility(UGE_Human_PickAndCarrySacks::StaticClass());
    default RemoveAbility(UGE_Human_PickAndCarryBoxes::StaticClass());
    default RemoveAbility(UGE_Human_PickAndCarryBoxesMidHigh::StaticClass());
    default RemoveAbility(UGE_Human_PickAndCarryPlanks::StaticClass());
    default RemoveAbility(UGE_Human_PickAndCarryPlanksFromWall::StaticClass());
    default RemoveAbility(UGE_Human_PickAndCarryWood::StaticClass());
    default RemoveAbility(UGE_Human_PickAndCarryWoodFromWall::StaticClass());
    default RemoveAbility(UGameplayAbilityInLavaMovement::StaticClass());
    default RemoveAbility(UGameplayAbilityInWaterMovement::StaticClass());
    default RemoveAbility(UGA_GameplayAbilityThrow::StaticClass());
    default RemoveAbility(UGA_Human_Lever::StaticClass());
    default RemoveAbility(UGA_Human_OpenContainer::StaticClass());
    default RemoveAbility(UGA_Human_OpenDoor::StaticClass());
    default RemoveAbility(UGameplayAbilityRoll::StaticClass());
    default RemoveAbility(UGameplayAbilitySprint::StaticClass());
    default AddAbility(UGameplayAbilityCheckClimb::StaticClass());
    default RemoveAbility(UGameplayAbilityTraverse::StaticClass());
    default RemoveAbility(UGameplayAbilityLanding::StaticClass());
    default RemoveAbility(UGA_Dodge::StaticClass());
    default RemoveAbility(UGameplayAbilityCrouch::StaticClass());
    default RemoveAbility(UGameplayAbilityAim::StaticClass());
}