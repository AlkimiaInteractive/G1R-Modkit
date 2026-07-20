class UGE_Conversation_Cooldown : UGameplayEffectBase
{
    default TargetTagsComponent.InheritableGrantedTagsContainer.AddTag(GameplayTag::Ability_Conversation);

    default DurationPolicy = EGameplayEffectDurationType::HasDuration;
	default DurationMagnitude.ScalableFloatMagnitude.Value = 3.0f; 
}

class UGA_Human_Conversation : UGameplayAbilityConversationV2
{
    // Commented out: Cooldown doesn't play well with interrupting an ongoing conversation and starting a new one.
    //                It's not clear whether we really want a cooldown here anyways, so let's just go without it.
    // default CooldownGameplayEffectClass = UGE_Conversation_Cooldown;

    default PreferredDistanceToTarget = 100.0f;
    default MaxAllowedDistanceFromPreferred = 10.0f;

    /**
	 *	PreferredConversationDistanceOverrideFromTag is a Map From Tag to Preferred Conversation Distance
	 *	Use this to add overrides for the conversation distance based on owned Tags
	 *	If a character has multiple of these tags it will apply the highest Preferred Distance
	 *	Remember that Character_AllowCloseAsPossibleInteractions takes priority over this
	 */
    default PreferredConversationDistanceOverrideFromTag.Add(GameplayTag::Action_Interact_Sit_Chair, 200.0f);

    default PreferredConversationDistanceOverrideFromTag.Add(GameplayTag::Character_AllowFarInteractions, 350.0f);

    default HeyYouVoicelineTag = GameplayTag::Sound_Voice_Address_Call;
    default NotNowVoicelineTag = GameplayTag::Sound_Voice_Reaction_General_NotNow;
    default HeyTurnAroundVoicelineTag = GameplayTag::Sound_Voice_Player_Conversation_Request_HeyTurnAround;
    default WaitASecondVoicelineTag = GameplayTag::Sound_Voice_Player_Conversation_Request_HeyWaitASecond;
  

    default AllowedInteractions.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default AllowedInteractions.AddTag(GameplayTag::Action_Interact_Sit_Chair_Demo);
    default AllowedInteractions.AddTag(GameplayTag::Action_Ambient_Eat_Inventory);
    default AllowedInteractions.AddTag(GameplayTag::Action_Ambient_Eat_Seated);
    default AllowedInteractions.AddTag(GameplayTag::Action_Ambient_Eat_Seated_Bowl);
    default AllowedInteractions.AddTag(GameplayTag::Action_Ambient_Eat_Seated_Thigh);
    default AllowedInteractions.AddTag(GameplayTag::Action_Ambient_Drink_Seated);
    default AllowedInteractions.AddTag(GameplayTag::Action_Ambient_Disturb);
    default AllowedInteractions.AddTag(GameplayTag::Action_Ambient_SmokeWeed_Seated);
    default AllowedInteractions.AddTag(GameplayTag::Action_Ambient_Campfire_Seated);
    default AllowedInteractions.AddTag(GameplayTag::Action_Ambient_CarveWood);
    default AllowedInteractions.AddTag(GameplayTag::Action_Ambient_CarveWoodDemo); // TODO  this is a quickfix remove after demo
    default AllowedInteractions.AddTag(GameplayTag::Action_Ambient_LeanWall);
    default AllowedInteractions.AddTag(GameplayTag::Action_Ambient_CutWood_OnTrunk);
    // default AllowedInteractions.AddTag(GameplayTag::Action_Ambient_GuardPassage); // Disabled for Demo

    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Interact_Sit_Throne);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_Campfire);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_TuneInstrument);
    // Action_Crafting interactions that belong to Smithing should be cancelled. Carrying around an item over multiple interactions 
    // was never designed and implemented properly. Best we can do now is restarting the interaction and making conversation cancel it
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_GuardPassage);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_ThorusGuardPassage);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_PlayDarts);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_PlayStone);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_PlayStone_Seated);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_CountOreSeated);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_CountOre);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_PlayKnife);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_PlayTune_Seated);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_Sweep);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_Fan);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_BrushHair);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_HoldTray);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_Eat);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_Eat_Bowl);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_Eat_Thigh);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_Eat_Seated_Item);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_Drink);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_SmokeWeed);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_LeanBar);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_LeanBar_Pose02);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_Meditate);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_MeditateYberion);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_MeditateYberion_Pose02);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_CutWood_OnTrunk);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_Cook_Cauldron);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_Cook);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_Wounded);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_SharpWeapon);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_TakeNotes);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_WarmHands);
    default AllowedInteractionsNotFromBehind.AddTag(GameplayTag::Action_Ambient_ReadBook_Seated);

    

    // We go as close as possible if a character does one of those action when an NPC starts the conversation
    // --------------------------------
    // NOTE: these are only for the rare case where an NPC forces a conversation while he or the player do one of those actions
    // To define actions for the case where the player talks to an NPC set these values in UGA_Human_Conversation_WithUI
    default ParticipantInteractionsToGoAsCloseAsPossible.AddTag(GameplayTag::Action_Crafting_Cook);
    default ParticipantInteractionsToGoAsCloseAsPossible.AddTag(GameplayTag::Action_Ambient_LeanBar);
    default ParticipantInteractionsToGoAsCloseAsPossible.AddTag(GameplayTag::Action_Crafting_Anvil);
    default ParticipantInteractionsToGoAsCloseAsPossible.AddTag(GameplayTag::Action_Crafting_Anvil_Spawn);
    default ParticipantInteractionsToGoAsCloseAsPossible.AddTag(GameplayTag::Action_Crafting_WhetStone);
    default ParticipantInteractionsToGoAsCloseAsPossible.AddTag(GameplayTag::Action_Crafting_Forge);

    default InteractionPreferredExitDirection.FindOrAdd(GameplayTag::Action_Interact_Sit, EInteractionSpotEntryDirection::Front);

    default AllowedAIStateTags.AddTag(GameplayTag::AIState_DailyRoutine);
    default AllowedAIStateTags.AddTag(GameplayTag::AIState_Wait_BlockedPath);
    default AllowedAIStateTags.AddTag(GameplayTag::AIState_Conflict_BlockedPath);
    default AllowedAIStateTags.AddTag(GameplayTag::AIState_Wait_DemandPaymentForCrimes);
    default AllowedAIStateTags.AddTag(GameplayTag::AIState_Conversation);
    default AllowedAIStateTags.AddTag(GameplayTag::AIState_Wait_WaryOfPerceivedNearbyCharacter);
    default AllowedAIStateTags.AddTag(GameplayTag::AIState_Follow);
    default AllowedAIStateTags.AddTag(GameplayTag::AIState_Conflict_InvestigateIdentifiedSound);
    default AllowedAIStateTags.AddTag(GameplayTag::AIState_Conflict_Warning_Pickpocket);
    default AllowedAIStateTags.AddTag(GameplayTag::AIState_Conflict_Warning_Threat);
    default AllowedAIStateTags.AddTag(GameplayTag::AIState_Conflict_Warning_NotWelcomeHere);
    default AllowedAIStateTags.AddTag(GameplayTag::AIState_Conflict_WatchHostile);

    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Eat_Bowl);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Eat_Thigh);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Eat_Inventory);
    //default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_LeanWall_Side);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_LookAround);
    //default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Leatherworking);
    //default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Pee);
    //default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_RepairBuilding);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Smalltalk);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_WashSelf_High);
    //default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_PlayTune);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_CountOre);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_RoastScavenger);
    //default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_TeachTrain);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Listen);
    //default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Preach);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_GuardPassage);
    //default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Dance);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_WomanDance);
    default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_ReadBook_Shell);
    //default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_PracticeMagic);
    //default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_HerbAlchemy);
    //default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_PotionAlchemy);
    //default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_PickOre);
    // default AllowInstantCancelInteractions.AddTag(GameplayTag::Action_Ambient_Sleep_Standing);

    default ActivationBlockedTags.AddTag(GameplayTag::AIState_Conflict_Combat);
    default ActivationBlockedTags.AddTag(GameplayTag::AIState_Conflict_CombatEndActions);
    default ActivationBlockedTags.AddTag(GameplayTag::AIState_Conflict_Disengage);
    default ActivationBlockedTags.AddTag(GameplayTag::AIState_Conflict_Fear);
    default ActivationBlockedTags.AddTag(GameplayTag::AIState_Conflict_Flee);
    default ActivationBlockedTags.AddTag(GameplayTag::AIState_Conflict_GetBackBelongings);
    default ActivationBlockedTags.AddTag(GameplayTag::AIState_Conflict_GoGetGuard);
    default ActivationBlockedTags.AddTag(GameplayTag::AIState_Conflict_InvestigateAlarm);
    default ActivationBlockedTags.AddTag(GameplayTag::AIState_Conflict_InvestigateCombatSound);
    default ActivationBlockedTags.AddTag(GameplayTag::AIState_Conflict_InvestigatePickpocket);
    default ActivationBlockedTags.AddTag(GameplayTag::AIState_Conflict_InvestigatePouch);
    default ActivationBlockedTags.AddTag(GameplayTag::AIState_Conflict_Paralyzed);
    default ActivationBlockedTags.AddTag(GameplayTag::AIState_Conflict_ReactToTakingDamage);
    default ActivationBlockedTags.AddTag(GameplayTag::AIState_Conflict_TrainingFightResult);
    default ActivationBlockedTags.AddTag(GameplayTag::AIState_Conflict_TurnToAttacker);
    default ActivationBlockedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Interaction);
    default ActivationBlockedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Lockpicking);
    default ActivationBlockedTags.AddTag(GameplayTag::AIState_Conflict_Warning_Theft);
    default ActivationBlockedTags.AddTag(GameplayTag::AIState_Conflict_WatchFight);
    default ActivationBlockedTags.AddTag(GameplayTag::AIState_Conflict_WatchHostileFight);
}

class UGA_Human_Conversation_WithUI : UGameplayAbilityConversationV2WithUI
{
    // Commented out: Cooldown doesn't play well with interrupting an ongoing conversation and starting a new one.
    //                It's not clear whether we really want a cooldown here anyways, so let's just go without it.
    // default CooldownGameplayEffectClass = UGE_Conversation_Cooldown;

    default PreferredDistanceToTarget = 100.0f;
    default MaxAllowedDistanceFromPreferred = 10.0f;

    default PreferredConversationDistanceOverrideFromTag.Add(GameplayTag::Character_AllowFarInteractions, 300.0f);
    // default InteractionsRequiringOtherToFaceParticipant.AddTag(GameplayTag::Action_Interact_Sit);
    // default InteractionsRequiringOtherToFaceParticipant.AddTag(GameplayTag::Action_Ambient_Eat_Seated);
    // default InteractionsRequiringOtherToFaceParticipant.AddTag(GameplayTag::Action_Ambient_Drink_Seated);
    // default InteractionsRequiringOtherToFaceParticipant.AddTag(GameplayTag::Action_Ambient_SmokeWeed_Seated);
    // default InteractionsRequiringOtherToFaceParticipant.AddTag(GameplayTag::Action_Ambient_Campfire_Seated);

    // We go as close as possible if a character does one of those action when the PLAYER starts the conversation
    default ParticipantInteractionsToGoAsCloseAsPossible.AddTag(GameplayTag::Action_Crafting_Cook);
    default ParticipantInteractionsToGoAsCloseAsPossible.AddTag(GameplayTag::Action_Ambient_LeanBar);
    default ParticipantInteractionsToGoAsCloseAsPossible.AddTag(GameplayTag::Action_Crafting_Anvil);
    default ParticipantInteractionsToGoAsCloseAsPossible.AddTag(GameplayTag::Action_Crafting_Anvil_Spawn);
    default ParticipantInteractionsToGoAsCloseAsPossible.AddTag(GameplayTag::Action_Crafting_WhetStone);
    default ParticipantInteractionsToGoAsCloseAsPossible.AddTag(GameplayTag::Action_Crafting_Forge);
    
    default InteractAngleThreshold = 90.0f;

    default ActivationBlockedTags.AddTag(GameplayTag::AIState_Conflict);

    default HeyYouVoicelineTag = GameplayTag::Sound_Voice_Player_Conversation_Request_HeyTurnAround;
    default HeyTurnAroundVoicelineTag = GameplayTag::Sound_Voice_Player_Conversation_Request_HeyTurnAround;
    default WaitASecondVoicelineTag = GameplayTag::Sound_Voice_Player_Conversation_Request_HeyWaitASecond;

    default bInterruptOthersConversationWhenRequesting = true;
    default bInterruptOthersSpeakWhenRequesting = true;
}

class UGA_Human_ForceConversation : UGameplayAbilityForceConversation
{
    default BlockForceWhenSelfHasAnyTags.AddTag(GameplayTag::Action_Ambient_Sleep);
    default BlockForceWhenSelfHasAnyTags.AddTag(GameplayTag::State_BlockState);

    default ForceRangeTypeValues.Add(EConversationForceRangeType::CloseRange, 300.0f);
    default ForceRangeTypeValues.Add(EConversationForceRangeType::DefaultRange, 400.0f);
    default ForceRangeTypeValues.Add(EConversationForceRangeType::FarRange, 750.0f);
    default ForceRangeTypeValues.Add(EConversationForceRangeType::SurroundingRange, 1700.0f);

    default ForceRangeTypeSenses.Add(EConversationForceRangeType::CloseRange, EConversationForceSense::See);
    default ForceRangeTypeSenses.Add(EConversationForceRangeType::DefaultRange, EConversationForceSense::See);
    default ForceRangeTypeSenses.Add(EConversationForceRangeType::FarRange, EConversationForceSense::See);
    default ForceRangeTypeSenses.Add(EConversationForceRangeType::SurroundingRange, EConversationForceSense::Any);


}

class UGA_Human_Conversation_Ambient : UGameplayAbilityAmbientConversation
{
}