class UGA_Gesture : UGameplayAbilityGesture
{
    default StayActiveAndPlayIdleForOwnedTags.AddTag(GameplayTag::State_Conversation);
    
    default ActivationBlockedTags.AddTag(GameplayTag::State_Carrying);
    default ActivationBlockedTags.AddTag(GameplayTag::State_AligningCharacter);

    default bMatchTargetDurationViaPlayRate = true;
    default MatchTargetDurationMaxSpeed = 2.0f;
    default MatchTargetDurationMinSpeed = 0.5f;

    default IdleBlendInSeconds = 1.0f;
    default IdleBlendOutSeconds = 1.0f;
    default GestureBlendInSeconds = 0.5f;
    default GestureBlendOutSeconds = 0.5f;
}

class UGA_Human_Gesture : UGA_Gesture
{   
    // Watch Fight
	default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_ItemInHand);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::AIState_Conflict_WatchFight);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Interact);
    default GestureSets.Last().GestureSet = UGestureSet_Human_WatchFight;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_AmbientConversation);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_Eat);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Crafting);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::AIState_Conflict_WatchFight);
    default GestureSets.Last().RequireAny.AddTag(GameplayTag::Action_Ambient_LeanWall);
    default GestureSets.Last().RequireAny.AddTag(GameplayTag::Action_Ambient_StandAround);
    default GestureSets.Last().RequireAny.AddTag(GameplayTag::Action_Ambient_GuardPassage);
    default GestureSets.Last().RequireAny.AddTag(GameplayTag::Action_Ambient_ThorusGuardPassage);
    default GestureSets.Last().RequireAny.AddTag(GameplayTag::Action_Ambient_GuardWatch);
    default GestureSets.Last().RequireAny.AddTag(GameplayTag::State_WantsToMove);
    default GestureSets.Last().RequireAny.AddTag(GameplayTag::State_Movement_Walking);
    default GestureSets.Last().GestureSet = UGestureSet_Human_AmbientGestures_UpperBody;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_AmbientConversation);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::AIState_Conflict_WatchFight);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Interact);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Crafting);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_WantsToMove);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Movement_Walking);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Movement_Running);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Movement_Sprinting);
    //default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Interact);
    default GestureSets.Last().GestureSet = UGestureSet_Human_AmbientGestures;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Combat_Melee_Torch);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Interact);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Torch_Conversation;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Character_Player);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Interact);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Ambient_Player;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Interact);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::AIState_Conflict_WatchFight);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_WantsToMove);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Movement_Walking);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Movement_Running);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Movement_Sprinting);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Ambient;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_PlayDarts);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_PlayDarts;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_CountOre);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_CountOre;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_PlayStone);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default GestureSets.Last().GestureSet = UGestureSet_Human_PlayStone;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_LeanWall);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_LeanWall_Side);
    default GestureSets.Last().GestureSet = UGestureSet_Human_LeanWall;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_GuardPassage);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_CrossArms);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_GuardPassage_CrossArms;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_GuardPassage);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Posture_Standing_CrossArms);
    default GestureSets.Last().GestureSet = UGestureSet_Human_GuardPassage_JarsArms;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_ThorusGuardPassage);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_CrossArms);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Thorus_GuardPassage_CrossArms;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_ThorusGuardPassage);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Posture_Standing_CrossArms);
    default GestureSets.Last().GestureSet = UGestureSet_Human_GuardPassage_JarsArms;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_Disturb);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Disturb;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_Sweep);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Sweep;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_Fan);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Fanning;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_HoldTray);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_HoldTray;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Crafting_Forge);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Forge;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Crafting_Anvil);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Anvil;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Crafting_WhetStone);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Whetstone;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_Eat_Thigh);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Eat_Thigh;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_Eat_Bowl);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Eat_Bowl;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_Eat_Inventory);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Eat_item;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_SmokeWeed);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Smoke;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_Drink);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Drink;

    // default GestureSets.Add(FGestureSetEntry());
    // default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    // default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_CutWood_OnTrunk);
    // default GestureSets.Last().GestureSet = UGestureSet_Human_CutWood_OnTrunk;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_CountOreSeated);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_CountOre_Seated;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_Eat_Seated_Bowl);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Conversation);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Guild_Human_OldCamp_WomanSlave);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Guild_Human_SwampCamp_WomanSlave);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Sit_Eat_Bowl;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_Eat_Seated_Bowl);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Woman_Sit_Eat_Bowl;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_ReadBook_Seated);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().RequireAny.AddTag(GameplayTag::Guild_Human_OldCamp_WomanSlave);
    default GestureSets.Last().RequireAny.AddTag(GameplayTag::Guild_Human_SwampCamp_WomanSlave);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Woman_Sit_ReadBook;
    
    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_BrushHair);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Conversation_BrushHair_Seated;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_PlayKnife);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_PlayKnife;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_PlayStone_Seated);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Conversation);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Sit_PlayStone;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_Eat_Seated_Thigh);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Conversation);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Sit_Eat_Thigh;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_Eat_Seated_Item);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Conversation);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Sit_Eat_Item;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_SmokeWeed_Seated);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Conversation);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Sit_Smoke;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_Drink_Seated);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Conversation);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Sit_Drink;
    
    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Guild_Human_OldCamp_WomanSlave);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Guild_Human_SwampCamp_WomanSlave);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_Eat_Seated_Thigh);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_Eat_Seated_Bowl);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_Eat_Seated_Item);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_SmokeWeed_Seated);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_Drink_Seated);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_CarveWood);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_TuneInstrument);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_SharpWeapon);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Conversation);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Conversation_Sit;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default GestureSets.Last().RequireAny.AddTag(GameplayTag::Guild_Human_OldCamp_WomanSlave);
    default GestureSets.Last().RequireAny.AddTag(GameplayTag::Guild_Human_SwampCamp_WomanSlave);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_Eat_Seated_Thigh);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_Eat_Seated_Bowl);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_Eat_Seated_Item);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_SmokeWeed_Seated);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_Drink_Seated);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_CarveWood);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_TuneInstrument);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Conversation_Women_Sit;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Interact_Sit_Throne);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Conversation_SitThrone;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Interact_Sit);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_CarveWood);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Conversation_Sit_CarveWood;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Interact_Sit);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_TuneInstrument);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Conversation_Sit_TuneInstrument;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_MeditateYberion);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_MeditateYberion_Pose02);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Meditate_Pose01;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_MeditateYberion);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_MeditateYberion_Pose02);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Meditate_Pose02;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_LeanBar);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_LeanBar_Pose02);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_LeanBar_Pose02;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_LeanBar);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_LeanBar_Pose02);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_LeanBar_Pose03;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Guild_Human_OldCamp_WomanSlave);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Dispute);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Dispute;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_ReadRecipe);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Snaf_ReadRecipe;

    ////////////////////////////////////////////////Xardas Wounded///////////////////////////////////////////////////////////////////////////////////////
        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAny.AddTag(GameplayTag::Action_Ambient_Wounded);
        default GestureSets.Last().RequireAny.AddTag(GameplayTag::Posture_Standing_Wounded);
        default GestureSets.Last().RequireAny.AddTag(GameplayTag::Posture_Standing_Forced_Wounded01);
        default GestureSets.Last().RequireAny.AddTag(GameplayTag::Posture_Standing_Forced_Wounded02);
        default GestureSets.Last().RequireAny.AddTag(GameplayTag::Posture_Standing_Forced_Wounded03);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Human_Xardas_Wounded;
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////Xardas Charge Uriziel Task///////////////////////////////////////////////////////////////////////////
        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_ChargeUriziel01);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Human_Xardas_ChargeUriziel01;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_ChargeUriziel02);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Human_Xardas_ChargeUriziel02;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_ChargeUriziel03);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Human_Xardas_ChargeUriziel03;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_ChargeUriziel04);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Human_Xardas_ChargeUriziel04;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_ChargeUriziel05);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Human_Xardas_ChargeUriziel05;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_ChargeUriziel06);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Human_Xardas_ChargeUriziel06;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_ChargeUriziel07);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Human_Xardas_ChargeUriziel07;
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////Cor Kalom Crisis of Faith///////////////////////////////////////////////////////////////////////////
        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_FaithCrisis01);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Human_CorKalom_FaithCrisis01;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_FaithCrisis02);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Human_CorKalom_FaithCrisis02;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_FaithCrisis03);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Human_CorKalom_FaithCrisis03;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_FaithCrisis04);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Human_CorKalom_FaithCrisis04;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_FaithCrisis05);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Human_CorAngar_FaithCrisis01;
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////Gomez InExtremo Presentation////////////////////////////////////////////////////////////////////////
        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_Presentation01);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Human_Gomez_InExtremo_Presentation01;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_Presentation02);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Human_Gomez_InExtremo_Presentation02;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_Presentation03);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Human_Gomez_InExtremo_Presentation03;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_Presentation04);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Human_Gomez_InExtremo_Presentation04;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_Presentation05);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Human_Gomez_InExtremo_Presentation05;
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Movement);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Interact);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::AIState_Conflict_WatchFight);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Movement_OverrideSpeedVolume);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Movement_Override);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Movement_InLava);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Movement_InWater);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Conversation_Moving;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_TakeNotes);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Posture_Standing_Forced);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_Cook);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_Cook_Cauldron);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_CutWood_OnTrunk);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Interact);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Conversation;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_Campfire);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Interact);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Posture_Standing_Forced);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_Drink);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_Eat);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_SmokeWeed);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Ambient_WarmHands);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_Conversation;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_AmbientConversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_StandAround);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Accusation05);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Human_AmbientConversation_Seraphia;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_AmbientConversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_StandAround);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Posture_Standing_Accusation05);
    default GestureSets.Last().GestureSet = UGestureSet_Human_AmbientConversation;
    
    ////////////////Weapon gesture sets/////////////////////
        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Interact);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Combat_Melee_Sword_OneHanded);
        default GestureSets.Last().GestureSet = UGestureSet_Human_S1H;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Interact);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Combat_Melee_Sword_TwoHanded);
        default GestureSets.Last().GestureSet = UGestureSet_Human_S2H;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Interact);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Combat_Melee_Axe_OneHanded);
        default GestureSets.Last().GestureSet = UGestureSet_Human_A1H;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Interact);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Combat_Melee_Axe_TwoHanded);
        default GestureSets.Last().GestureSet = UGestureSet_Human_A2H;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Interact);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Combat_Melee_Axe_TwoHanded);
        default GestureSets.Last().GestureSet = UGestureSet_Human_A2H;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Interact);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Combat_Melee_Mace_OneHanded);
        default GestureSets.Last().GestureSet = UGestureSet_Human_M1H;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Interact);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Combat_Melee_Mace_TwoHanded);
        default GestureSets.Last().GestureSet = UGestureSet_Human_M2H;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Interact);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Combat_Melee_Staff);
        default GestureSets.Last().GestureSet = UGestureSet_Human_Sff2H;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Interact);
        default GestureSets.Last().RequireAny.AddTag(GameplayTag::State_Combat_Magic_Rune);
        default GestureSets.Last().RequireAny.AddTag(GameplayTag::State_Combat_Magic_Scroll);
        default GestureSets.Last().GestureSet = UGestureSet_Human_Magic;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Interact);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Combat_Melee_Fist);
        default GestureSets.Last().GestureSet = UGestureSet_Human_Fists;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Interact);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Combat_Melee_Torch);
        default GestureSets.Last().GestureSet = UGestureSet_Human_T1H;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Interact);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Combat_Ranged_Bow);
        default GestureSets.Last().GestureSet = UGestureSet_Human_Bow;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Interact);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Combat_Ranged_Crossbow);
        default GestureSets.Last().GestureSet = UGestureSet_Human_Crossbow;
    ////////////////////////////////////////////////////////
}
