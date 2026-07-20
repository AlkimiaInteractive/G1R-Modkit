
class UGE_InitialMovementLock : UGameplayEffectBase
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::State_IgnoreMovementInput);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Block_Action_Jump);

    default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.ScalableFloatMagnitude.Value = 2.0f; 
}

class UGE_Player_Definition : UGE_Character_Definition
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Player);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_Bleed);
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_ReactToForcedConversation);
    //default TargetTagRequirements.ApplicationTagRequirements.IgnoreTags.AddTag(GameplayTag::Character_Can_Bleed);
    //default AssetTagsComponent.InheritableAssetTags.AddTag(GameplayTag::Character_Can_Bleed);
    //default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Player);
    //default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Character_Can_Bleed);
    //default InheritableOwnedTagsContainer.AddTag(GameplayTag::Character_Can_ReactToForcedConversation);

    // FIXME: This would also trigger on safegame loads. Needs to be revisted.
    // Commented out: Was needed for demo. Disabled until we find a better way to do this.
    // default AdditionalEffects.OnApplicationGameplayEffects.Add(FConditionalGameplayEffect());
    // default AdditionalEffects.OnApplicationGameplayEffects.Last().EffectClass = UGE_InitialMovementLock;

    default AddAbility(UGA_Defeated::StaticClass(), EAbilityInputID::None, EInputEvent::IE_Pressed, EGameplayEffectGrantedAbilityRemovePolicy::RemoveAbilityOnEnd);
    
    default AddAbility(UGA_Dodge::StaticClass());
    default AddAbility(UGameplayAbilityRoll::StaticClass());
    default AddAbility(UGA_Human_Conversation_WithUI::StaticClass());
    default AddAbility(UGA_Human_Conversation_Ambient::StaticClass());
    default AddAbility(UGA_Human_Gesture::StaticClass());
    default AddAbility(UGameplayAbilitySelfConversation::StaticClass());
    default AddAbility(UGA_Human_Speak::StaticClass());
    default AddAbility(UGA_ControlDebug::StaticClass(), EAbilityInputID::Possess);
    default AddAbility(UGameplayAbilityLoot::StaticClass());
    default AddAbility(UGameplayAbilityTargetPointOfInterest::StaticClass(), EAbilityInputID::TargetPOIAction);
    default AddAbility(UGameplayAbilityTargetPOIPassive::StaticClass());
    default AddAbility(UGA_Human_OpenContainer::StaticClass());
    default AddAbility(UGA_Human_OpenContainer_Swimming::StaticClass());
    default AddAbility(UGA_Human_Sleep_Bed_Low::StaticClass());
    default AddAbility(UGA_Human_Sleep_Bed_High::StaticClass());
    default AddAbility(UGA_Human_Sleep_Bed_Ground::StaticClass());
    default AddAbility(UGameplayAbilityMining::StaticClass());
    default AddAbility(UGameplayAbilityTrading::StaticClass());
    default AddAbility(UGameplayAbilityCrafting::StaticClass());
    default AddAbility(UGA_Human_CallInteractFunction::StaticClass());
    default AddAbility(UGameplayAbilityActivateStation::StaticClass());
    default AddAbility(UGameplayAbilityTrigger::StaticClass());
    default AddAbility(UGameplayAbilityStatue::StaticClass());
    default AddAbility(UGameplayAbilityLavaExtractor::StaticClass());
    default AddAbility(UGameplayAbilityPuzzleSwitch::StaticClass());
    default AddAbility(UGA_Human_OpenDoor::StaticClass());
    default AddAbility(UGA_Human_Lever::StaticClass());
    default AddAbility(UGameplayAbilityEffectStation::StaticClass());
    default AddAbility(UGameplayAbilityMessage::StaticClass());
    default AddAbility(UGA_Human_Ride_Scavenger::StaticClass());
    default AddAbility(UGA_Human_CallMount_Scavenger::StaticClass());
    default AddAbility(UGameplayAbilityCustomizeArmor::StaticClass());
    default AddAbility(UGameplayAbilityEquipWeaponAuto::StaticClass());
    default AddAbility(UGameplayAbilityShelveWeapon::StaticClass());

    //This ability can be use for override whatever movement state that the player has
    //default AddAbility(UGameplayAbilityMovementOverride::StaticClass());
    default AddAbility(UGameplayAbilityJump::StaticClass(), EAbilityInputID::JumpAction);
    default AddAbility(UGameplayAbilityCrouch::StaticClass(), EAbilityInputID::StanceAction);
    default AddAbility(UGameplayAbilitySprint::StaticClass(), EAbilityInputID::SprintAction);
    default AddAbility(UGameplayAbilityWalk::StaticClass(), EAbilityInputID::WalkAction);
    default AddAbility(UGameplayAbilityGroundedMovement::StaticClass());
    default AddAbility(UGameplayAbilityInWaterMovement::StaticClass());
    default AddAbility(UGameplayAbilityInLavaMovement::StaticClass());
    default AddAbility(UGameplayAbilityTorchStartFire::StaticClass());
    default AddAbility(UGameplayAbilityInteract::StaticClass(), EAbilityInputID::Interact);
    default AddAbility(UGameplayAbilityInteractSecondary::StaticClass());
    default AddAbility(UGA_Human_Pick::StaticClass());
    default AddAbility(UGA_Human_SmashMeatBug::StaticClass());
    default AddAbility(UGA_Human_StationTeleport::StaticClass());
    default AddAbility(UGA_Human_Pickpocket::StaticClass());
    default AddAbility(UGameplayAbilityExecution::StaticClass());
    default AddAbility(UGameplayAbilityConsumeQuick::StaticClass());
    default AddAbility(UGameplayAbilityCheckClimb::StaticClass());
    default AddAbility(UGA_Human_Pet::StaticClass());
    
    default AddAbility(UGameplayAbilityTraverse::StaticClass());
    default AddAbility(UGA_WallClimbing::StaticClass());
    default AddAbility(UGameplayAbilityInteractWallClimb::StaticClass());
    default AddAbility(UGA_Swim_Human::StaticClass());
    default AddAbility(UGA_GameplayAbilityThrow::StaticClass());
    default AddAbility(UGA_TargetEnemy::StaticClass(), EAbilityInputID::TargetEnemyAction);
    default AddAbility(UGameplayAbilityAim::StaticClass(), EAbilityInputID::AimAction);
    default AddAbility(UGameplayAbilityReadWriting::StaticClass());

    default AddAbility(UGameplayAbility_EquipItem::StaticClass());
    default AddAbility(UGameplayAbilityPickAndEquip::StaticClass());
    
    default AddAbility(UGA_RememberDamage::StaticClass());
    default AddAbility(UGA_RememberDefeat::StaticClass());
    default AddAbility(UGA_RememberDeath::StaticClass());

    default AddAbility(UGA_Human_GiveItem::StaticClass());
    default AddAbility(UGA_Human_GiveItemLookAt::StaticClass());
    default AddAbility(UGA_Human_ReceiveItem::StaticClass());
    default AddAbility(UGA_Human_ReceiveAndLookAtItem::StaticClass());
    default AddAbility(UGA_Human_GiveItem_Seated::StaticClass());
    default AddAbility(UGA_Human_ReceiveItem_Seated::StaticClass());

    default AddAbility(UGameplayAbilityInteractFreePoint::StaticClass());

    default AddAbility(UGA_RegenerateSuperArmor::StaticClass());
    default AddAbility(UGA_RecoverSleepTime::StaticClass());

    default AddAbility(UGameplayAbilityAttributeLevelUp::StaticClass());
    default AddAbility(UGameplayAbilityPhotoMode::StaticClass());

    default AddAbility(UGA_AlcoholDebuff::StaticClass());
    default AddAbility(UGA_AlcoholForcedDebuff::StaticClass());
    default AddAbility(UGA_SwampweedDebuff::StaticClass());
    default AddAbility(UGA_SwampweedForcedDebuff::StaticClass());

    default AddAbility(UGA_Human_Gesture::StaticClass());

    default AddAbility(UGA_MarvinMode::StaticClass());
}