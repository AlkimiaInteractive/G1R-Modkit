UCLASS()
class UGE_Human : UGE_Character_Definition
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_Bleed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_ReactToForcedConversation);
    
    default AddAbility(UGA_Defeated_NPC::StaticClass(), EAbilityInputID::None, EInputEvent::IE_Pressed, EGameplayEffectGrantedAbilityRemovePolicy::RemoveAbilityOnEnd);
    
    default AddAbility(UGameplayAbilityExecution::StaticClass());
    default AddAbility(UGA_Human_Loot::StaticClass());
    
    default AddAbility(UGameplayAbilityCheckClimb::StaticClass());
    
    default AddAbility(UGameplayAbilityTraverse::StaticClass());
    default AddAbility(UGameplayAbilitySprint::StaticClass(), EAbilityInputID::SprintAction);
    default AddAbility(UGameplayAbilityWalk::StaticClass(), EAbilityInputID::WalkAction);
    default AddAbility(UGameplayAbilityRoll::StaticClass());
    default AddAbility(UGameplayAbility_EquipItem::StaticClass());
    default AddAbility(UGA_TargetEnemy::StaticClass(), EAbilityInputID::TargetEnemyAction);
    default AddAbility(UGA_Human_OpenDoor::StaticClass());
    default AddAbility(UGA_Human_Lever::StaticClass());

    default AddAbility(UGameplayAbilityCrouch::StaticClass(), EAbilityInputID::StanceAction);
    
    default AddAbility(UGameplayAbilityAim::StaticClass(), EAbilityInputID::AimAction);
    default AddAbility(UGA_GameplayAbilityThrow::StaticClass());

    default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());
    default AddAbility(UGA_Human_InWaterMovement::StaticClass());
    default AddAbility(UGameplayAbilityInLavaMovement::StaticClass());
    default AddAbility(UGameplayAbilityInteractFreePoint::StaticClass());

    default AddAbility(UGA_Human_ForceConversation::StaticClass());
    default AddAbility(UGA_Human_Conversation::StaticClass());
    default AddAbility(UGA_Human_Conversation_Ambient::StaticClass());
    default AddAbility(UGA_Human_Speak::StaticClass());
    default AddAbility(UGA_Human_Smalltalk::StaticClass());
    default AddAbility(UGA_Human_Mumble::StaticClass());
    default AddAbility(UGA_Human_Gesture::StaticClass());
    
    default AddAbility(UGameplayAbilityConsumeQuick::StaticClass());
    default AddAbility(UGameplayAbilityPickAndEquip::StaticClass());
    default AddAbility(UGE_Human_PickAndCarryBags::StaticClass());
    default AddAbility(UGE_Human_PickAndCarrySacks::StaticClass());
    default AddAbility(UGE_Human_PickAndCarryBoxes::StaticClass());
    default AddAbility(UGE_Human_PickAndCarryBoxesMidHigh::StaticClass());
    default AddAbility(UGE_Human_PickAndCarryPlanks::StaticClass());
    default AddAbility(UGE_Human_PickAndCarryPlanksFromWall::StaticClass());
    default AddAbility(UGE_Human_PickAndCarryWoodFromWall::StaticClass());
    default AddAbility(UGE_Human_PickAndCarryWood::StaticClass());
    default AddAbility(UGameplayAbilityPickAndCarry::StaticClass());
    default AddAbility(UGameplayAbilityPutDown::StaticClass());
    default AddAbility(UGA_Human_CoverHeadInRain::StaticClass());
    
    default AddAbility(UGameplayAbilityCrouch::StaticClass());

    default AddAbility(UGA_Human_GiveItem::StaticClass());
    default AddAbility(UGA_Human_GiveItemLookAt::StaticClass());
    default AddAbility(UGA_Human_ReceiveItem::StaticClass());
    default AddAbility(UGA_Human_ReceiveAndLookAtItem::StaticClass());
    default AddAbility(UGA_Human_GiveItem_Seated::StaticClass());
    default AddAbility(UGA_Human_ReceiveItem_Seated::StaticClass());
    
    default AddAbility(UGameplayAbilityTrigger::StaticClass());
    
    //Long term memory
    default AddAbility(UGA_RememberDefeat::StaticClass());
    default AddAbility(UGA_RememberDeath::StaticClass());
    default AddAbility(UGA_RememberDamage::StaticClass());

    default AddAbility(UGA_RegenerateSuperArmor::StaticClass());
    default AddAbility(UGA_Swim_Human::StaticClass());

        default AddAbility(UGA_Dodge::StaticClass(), EAbilityInputID::Dodge);
    default AddAbility(UGameplayAbilityTaunt::StaticClass());

    default AddAbility(UGA_AlcoholDebuff::StaticClass());
    default AddAbility(UGA_AlcoholForcedDebuff::StaticClass());
    default AddAbility(UGA_SwampweedDebuff::StaticClass());
    default AddAbility(UGA_SwampweedForcedDebuff::StaticClass());
}

UCLASS()
class UGE_Human_AI : UGE_Human
{
    default AddAbility(UGA_Human_OpenContainer::StaticClass());
    default AddAbility(UGameplayAbilityJump::StaticClass());
    // default AddAbility(UGA_Human_Sleep::StaticClass());
    
    default AddAbility(UGameplayAbilityPick::StaticClass());

    default AddAbility(UGameplayAbilityInteractWallClimb::StaticClass());
    default AddAbility(UGA_WallClimbing::StaticClass());
    default AddAbility(UGA_Human_SmashMeatBug::StaticClass());
}

UCLASS()
class UGE_Human_Player : UGE_Human
{
	default AddAbility(UGameplayAbilityJump::StaticClass(), EAbilityInputID::JumpAction);
    default AddAbility(UGameplayAbilityCrouch::StaticClass(), EAbilityInputID::StanceAction);
    default AddAbility(UGameplayAbilitySprint::StaticClass(), EAbilityInputID::SprintActionToggle);
      
    default AddAbility(UGameplayAbilityCheckClimb::StaticClass());
    default AddAbility(UGA_Swim_Human::StaticClass());
    default AddAbility(UGA_Human_SmashMeatBug::StaticClass());
}

UCLASS()
class UGE_Human_ReducedDefeatedTime : UGE_Human
{
    default RemoveAbility(UGA_Defeated_NPC::StaticClass());

    default AddAbility(UGA_Defeated_NPC_Reduced::StaticClass());
}

UCLASS()
class UGE_Human_InfinityDefeatedTime : UGE_Human
{
    default RemoveAbility(UGA_Defeated_NPC::StaticClass());

    default AddAbility(UGA_Defeated_NPC_Infinity::StaticClass(), EAbilityInputID::None, EInputEvent::IE_Pressed, EGameplayEffectGrantedAbilityRemovePolicy::RemoveAbilityOnEnd);
}