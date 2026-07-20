UCLASS()
class UGE_Orc : UGE_Character_Definition
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_Bleed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_ReactToForcedConversation);
    
    default AddAbility(UGA_Orc_Conversation_Ambient::StaticClass());
    default AddAbility(UGA_Orc_Speak::StaticClass());
    default AddAbility(UGA_Orc_Mumble::StaticClass());
    default AddAbility(UGA_Orc_Gesture::StaticClass());
    
    default AddAbility(UGameplayAbilityCheckClimb::StaticClass());
    default AddAbility(UGameplayAbilityTraverse::StaticClass());
    default AddAbility(UGameplayAbilitySprint::StaticClass(), EAbilityInputID::SprintAction);
    default AddAbility(UGameplayAbilityWalk::StaticClass(), EAbilityInputID::WalkAction);
    default AddAbility(UGameplayAbilityRoll::StaticClass());
    default AddAbility(UGameplayAbilitySwim::StaticClass());
    default AddAbility(UGameplayAbility_EquipItem::StaticClass());
    default AddAbility(UGameplayAbilityDoor::StaticClass());

    default AddAbility(UGA_RememberDefeat::StaticClass());
    default AddAbility(UGA_RememberDeath::StaticClass());
    default AddAbility(UGA_RememberDamage::StaticClass());
    
    default AddAbility(UGA_TargetEnemy::StaticClass(), EAbilityInputID::TargetEnemyAction);
    
    default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());
    default AddAbility(UGameplayAbilityInteractFreePoint::StaticClass());

    default AddAbility(UGameplayAbilityConsumeQuick::StaticClass());

    default AddAbility(UGA_Dodge::StaticClass(), EAbilityInputID::Dodge);
    default AddAbility(UGameplayAbilityTaunt::StaticClass());

}

class UGE_Orc_Equip : UGameplayEffect_AbilitySet
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_Combat_Melee);

    //default AddAbility(UGA_Dodge::StaticClass(), EAbilityInputID::Dodge);

    default AddAbility(UGameplayAbilityCombatStanceSelector::StaticClass());
    //default AddAbility(UGameplayAbilityTaunt::StaticClass());
    default AddAbility(UGA_Parried::StaticClass());
}

class UGE_OrcLiving : UGE_Orc
{
    default AddAbility(UGA_Orc_ForceConversation::StaticClass());
    default AddAbility(UGA_Orc_Conversation::StaticClass());
}

UCLASS()
class UGE_Orc_AI : UGE_OrcLiving
{
    default AddAbility(UGA_Human_OpenContainer::StaticClass());
    default AddAbility(UGameplayAbilityPick::StaticClass());
}

UCLASS()
class UGE_OrcUndead : UGE_Orc
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Undead_Orc);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_BlockInvisibleWall);
}

UCLASS()
class UGE_OrcUndead_Shaman : UGE_OrcUndead
{
    //default AddAbility(UGA_Orc_ForceConversation::StaticClass());
    default AddAbility(UGA_Orc_Conversation::StaticClass());
}

UCLASS()
class UGE_OrcUndead_AI : UGE_OrcUndead
{
    default AddAbility(UGA_Human_OpenContainer::StaticClass());
    default AddAbility(UGameplayAbilityPick::StaticClass());
}

UCLASS()
class UGE_OrcUndead_Shaman_AI : UGE_OrcUndead_Shaman
{
    default AddAbility(UGA_Human_OpenContainer::StaticClass());
    default AddAbility(UGameplayAbilityPick::StaticClass());
    default AddAbility(UGA_DeactivateTickOptimizer::StaticClass());
    default AddAbility(UGA_Boss_HealthMonitor::StaticClass());
}

UCLASS()
class UGE_Orc_Player : UGE_OrcLiving
{
	default AddAbility(UGameplayAbilityJump::StaticClass(), EAbilityInputID::JumpAction);
    default AddAbility(UGameplayAbilityCrouch::StaticClass(), EAbilityInputID::StanceAction);
    default AddAbility(UGameplayAbilityRoll::StaticClass(), EAbilityInputID::StanceAction, EInputEvent::IE_DoubleClick);
    
    default AddAbility(UGameplayAbilityCheckClimb::StaticClass());
   
    default AddAbility(UGameplayAbility_EquipItem::StaticClass());

}

UCLASS()
class UGE_OrcUndead_Player : UGE_Orc_Player
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Undead_Orc);
}