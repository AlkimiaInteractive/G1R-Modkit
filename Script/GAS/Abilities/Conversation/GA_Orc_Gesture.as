class UGA_Orc_Gesture : UGA_Gesture
{
    // Watch Fight
	default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_ItemInHand);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::AIState_Conflict_WatchFight);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Interact);
    default GestureSets.Last().GestureSet = UGestureSet_Orc_WatchFight;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Interact);
    default GestureSets.Last().GestureSet = UGestureSet_Orc_Ambient;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Interact);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Combat);
    default GestureSets.Last().GestureSet = UGestureSet_Orc_Warning;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_StandAround);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Posture_Standing_CrossArms);
    default GestureSets.Last().GestureSet = UGestureSet_Orc_Conversation;
    
    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_StandAround);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_CrossArms);
    default GestureSets.Last().GestureSet = UGestureSet_Orc_CrossArms;
    
    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_GuardPassage);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Guard);
    default GestureSets.Last().GestureSet = UGestureSet_Orc_Guard01;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_GuardPassage);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Posture_Standing_Guard);
    default GestureSets.Last().GestureSet = UGestureSet_Orc_Guard02;
    
    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_GuardWatch);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Guard);
    default GestureSets.Last().GestureSet = UGestureSet_Orc_Guard01;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_GuardWatch);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Posture_Standing_Guard);
    default GestureSets.Last().GestureSet = UGestureSet_Orc_Guard02;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_Drink);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Interact_Sit);
    default GestureSets.Last().GestureSet = UGestureSet_Orc_Drink;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_Eat_Bowl);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Interact_Sit);
    default GestureSets.Last().GestureSet = UGestureSet_Orc_Eat_Bowl;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_Eat);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Interact_Sit);
    default GestureSets.Last().GestureSet = UGestureSet_Orc_Eat_Meat;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_SowRice);
    default GestureSets.Last().GestureSet = UGestureSet_Orc_Feeding;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_Practice1HSword);
    default GestureSets.Last().GestureSet = UGestureSet_Orc_Training;

    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::Action_Ambient_Campfire);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::Action_Interact_Sit);
    default GestureSets.Last().GestureSet = UGestureSet_Orc_WarmHands;

    ///////////////////////////////////////////////UrNazkrog & ToChurnagg Specific Gestures///////////////////////////////////////////////////////////////////////////////////
        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_Outraged01);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Orc_ToChurnagg_OutragedPhrase01; 
        
        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_Outraged02);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Orc_ToChurnagg_OutragedPhrase02;  

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_Outraged03);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Orc_UrNazkrog_OutragedPhrase01; 
        
        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_Outraged04);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Orc_UrNazkrog_OutragedPhrase02;  
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    ///////////////////////////////////////////////Varrag Kasorg Specific Gestures///////////////////////////////////////////////////////////////////////////////////
        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_Possessed04);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Orc_VarragKasorg_PossessedPhrase04; 
        
        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_Possessed03);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Orc_VarragKasorg_PossessedPhrase03;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_Possessed02);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Orc_VarragKasorg_PossessedPhrase02;

        default GestureSets.Add(FGestureSetEntry());
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
        default GestureSets.Last().RequireAll.AddTag(GameplayTag::Posture_Standing_Forced_Possessed01);
        default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Combat);
        default GestureSets.Last().GestureSet = UGestureSet_Orc_VarragKasorg_PossessedPhrase01;        
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    default GestureSets.Add(FGestureSetEntry());
    default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
    default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Interact);
    default GestureSets.Last().GestureSet = UGestureSet_Orc_Conversation;
}
