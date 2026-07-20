class UGestureSet_Orc : UGestureSet
{
    default PoseMatchBones.Add(n"Hand_L");
    default PoseMatchBones.Add(n"Hand_R");
    // default PoseMatchBones.Add(n"Foot_L");
    // default PoseMatchBones.Add(n"Foot_R");
    // default PoseMatchBones.Add(n"Head");
}

class UGestureSet_Orc_Ambient : UGestureSet_Orc
{
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    // --- Smalltalk gestures
    // default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    // default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Conversation_SmallTalk);
    // default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/IdlePose/Calm/A_Man_Dialog_Gestures_Calm.A_Man_Dialog_Gestures_Calm'"));
    // default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/CrossArms/Calm/Man_Dialog_CrossArms_Calm.Man_Dialog_CrossArms_Calm'"));
}

class UGestureSet_Orc_Warning : UGestureSet_Orc
{
    // --- Warning gestures

    /// - Orc Melee weapon
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Taunts/A_OrcM_S1H_Taunt_02_Montage.A_OrcM_S1H_Taunt_02_Montage'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Taunts/A_OrcM_S1H_Taunt_04_Montage.A_OrcM_S1H_Taunt_04_Montage'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::State_Combat_Melee);
    default Gestures.Last().Layer = 2; // Ensures it will be played instead of the no weapon gesture

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Taunts/A_OrcM_S1H_Taunt_01_Montage.A_OrcM_S1H_Taunt_01_Montage'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Sword/Taunts/A_OrcM_S1H_Taunt_03_Montage.A_OrcM_S1H_Taunt_03_Montage'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::State_Combat_Melee);
    default Gestures.Last().Layer = 2; // Ensures it will be played instead of the no weapon gesture

    /// - Staff
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Taunts/A_OrcM_Sff1H_Taunt_02_Montage.A_OrcM_Sff1H_Taunt_02_Montage'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::State_Combat_Melee_Staff);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Taunts/A_OrcM_Sff1H_Taunt_01_Montage.A_OrcM_Sff1H_Taunt_01_Montage'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Taunts/A_OrcM_Sff1H_Taunt_03_Montage.A_OrcM_Sff1H_Taunt_03_Montage'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::State_Combat_Melee_Staff);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Taunts/A_OrcM_S_Sff1H_Taunt_02_Montage.A_OrcM_S_Sff1H_Taunt_02_Montage'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::State_Combat_Melee_Staff);
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Guild_Orc_Shaman);
    default Gestures.Last().Layer = 4; // Ensures it will be played instead of the no weapon gesture

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Taunts/A_OrcM_S_Sff1H_Taunt_01_Montage.A_OrcM_S_Sff1H_Taunt_01_Montage'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Staff/Taunts/A_OrcM_S_Sff1H_Taunt_03_Montage.A_OrcM_S_Sff1H_Taunt_03_Montage'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::State_Combat_Melee_Staff);
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Guild_Orc_Shaman);
    default Gestures.Last().Layer = 4; // Ensures it will be played instead of the no weapon gesture

    /// - Fists
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Fists/Taunts/A_OrcM_Fists_Taunt_02_Montage.A_OrcM_Fists_Taunt_02_Montage'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::State_Combat_Melee_Fist);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Fists/Taunts/A_OrcM_Fists_Taunt_01_Montage.A_OrcM_Fists_Taunt_01_Montage'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Fists/Taunts/A_OrcM_Fists_Taunt_03_Montage.A_OrcM_Fists_Taunt_03_Montage'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::State_Combat_Melee_Fist);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Fists/Taunts/A_OrcM_S_Fists_Taunt_02_Montage.A_OrcM_S_Fists_Taunt_02_Montage'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::State_Combat_Melee_Fist);
    default Gestures.Last().Layer = 4; // Ensures it will be played instead of the no weapon gesture

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Fists/Taunts/A_OrcM_S_Fists_Taunt_01_Montage.A_OrcM_S_Fists_Taunt_01_Montage'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Combat/Fists/Taunts/A_OrcM_S_Fists_Taunt_03_Montage.A_OrcM_S_Fists_Taunt_03_Montage'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::State_Combat_Melee_Fist);
    default Gestures.Last().Layer = 4; // Ensures it will be played instead of the no weapon gesture
}

class UGestureSet_Orc_WatchFight : UGestureSet_Orc
{
    default AnimSlotGestureAnimations = n"UpperBody";

    default AllowedDurationMaxMultiplier = 20.0f;
    default AllowedDurationMinMultiplier = 0.01f;
    
    // --- WatchFight gestures
    // Generic cheer
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_HeyHeyHey);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_CheerFight);
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Combat/WatchFight/Movement/Breakers/Neutral");
    // Good cheer
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_Death_Good);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_CheerFriend);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_YeahWellDone);
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Combat/WatchFight/Movement/Breakers/Positive");
    // Bad cheer
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_Ooh);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_Death_Bad);
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Combat/WatchFight/Movement/Breakers/Negative");
}

class UGestureSet_Orc_Guard01 : UGestureSet_Orc
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Guard));
    default Idles.Last().Posture = GameplayTag::Posture_Standing_Guard;
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Idles/GuardIdle/DialogAnims/DialogIdles");
    
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Guard));
    default Gestures.Last().Posture = GameplayTag::Posture_Standing_Guard;
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Idles/GuardIdle/DialogAnims/DialogGestures");
}

class UGestureSet_Orc_Guard02 : UGestureSet_Orc
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().Posture = GameplayTag::Posture_Standing_Neutral;
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Idles/GuardIdle_Pose02/DialogAnims/DialogIdles");
    
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().Posture = GameplayTag::Posture_Standing_Neutral;
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Idles/GuardIdle_Pose02/DialogAnims/DialogGestures");
}

class UGestureSet_Orc_Drink: UGestureSet_Orc
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().Posture = GameplayTag::Posture_Standing_Neutral;
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Drink/DialogAnims/DialogIdles");
    
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().Posture = GameplayTag::Posture_Standing_Neutral;
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Drink/DialogAnims/DialogGestures");
}

class UGestureSet_Orc_Eat_Meat: UGestureSet_Orc
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().Posture = GameplayTag::Posture_Standing_Neutral;
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Eat/EatMeat/DialogAnims/DialogIdles");
    
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().Posture = GameplayTag::Posture_Standing_Neutral;
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Eat/EatMeat/DialogAnims/DialogGestures");
}

class UGestureSet_Orc_Eat_Bowl: UGestureSet_Orc
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().Posture = GameplayTag::Posture_Standing_Neutral;
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Eat/EatBowl/DialogAnims/DialogIdles");
    
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().Posture = GameplayTag::Posture_Standing_Neutral;
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Eat/EatBowl/DialogAnims/DialogGestures");
}

class UGestureSet_Orc_Feeding: UGestureSet_Orc
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().Posture = GameplayTag::Posture_Standing_Neutral;
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Feeding/DialogAnims/DialogIdles");
    
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().Posture = GameplayTag::Posture_Standing_Neutral;
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Feeding/DialogAnims/DialogGestures");
}

class UGestureSet_Orc_Training: UGestureSet_Orc
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().Posture = GameplayTag::Posture_Standing_Neutral;
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Training/DialogAnims/DialogIdles");
    
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().Posture = GameplayTag::Posture_Standing_Neutral;
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Training/DialogAnims/DialogGestures");
}

class UGestureSet_Orc_WarmHands: UGestureSet_Orc
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().Posture = GameplayTag::Posture_Standing_Neutral;
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Living/WarmHandes/DialogAnims/DialogIdles");
    
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().Posture = GameplayTag::Posture_Standing_Neutral;
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Living/WarmHandes/DialogAnims/DialogGestures");
}

class UGestureSet_Orc_CrossArms: UGestureSet_Orc
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_CrossArms));
    default Idles.Last().Posture = GameplayTag::Posture_Standing_CrossArms;
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Idles/CrossArms/DialogAnims/DialogIdles");
    
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_CrossArms));
    default Gestures.Last().Posture = GameplayTag::Posture_Standing_CrossArms;
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Idles/CrossArms/DialogAnims/DialogGestures");
}

///////////////////////////////////////////////UrNazkrog & ToChurnagg Specific Gestures///////////////////////////////////////////////////////////////////////////////////

    class UGestureSet_Orc_ToChurnagg_OutragedPhrase01 : UGestureSet_Orc
    {
        default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Outraged01));
        default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Dialog/Idle");

        default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Outraged01));
        default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Dialog/SpecificAudio/A_OrcM_Dialog_TEXT_WIP_QQMJVWL_20250211_163758.A_OrcM_Dialog_TEXT_WIP_QQMJVWL_20250211_163758'"));
    }

    class UGestureSet_Orc_ToChurnagg_OutragedPhrase02 : UGestureSet_Orc
    {
        default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Outraged02));
        default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Dialog/Idle");

        default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Outraged02));
        default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Dialog/SpecificAudio/A_OrcM_Dialog_TEXT_WIP_QQMJVWL_20250211_163843.A_OrcM_Dialog_TEXT_WIP_QQMJVWL_20250211_163843'"));
    }

    class UGestureSet_Orc_UrNazkrog_OutragedPhrase01 : UGestureSet_Orc
    {
        default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Outraged03));
        default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Dialog/Idle");

        default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Outraged03));
        default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Female/Dialog/SpecificAudio/A_OrcF_Dialog_TEXT_WIP_QQMJVWL_20250211_163904_2238.A_OrcF_Dialog_TEXT_WIP_QQMJVWL_20250211_163904_2238'"));
    }

    class UGestureSet_Orc_UrNazkrog_OutragedPhrase02 : UGestureSet_Orc
    {
        default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Outraged04));
        default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Dialog/Idle");

        default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Outraged04));
        default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Female/Dialog/SpecificAudio/A_OrcF_Dialog_TEXT_WIP_QQMJVWL_20250211_164141.A_OrcF_Dialog_TEXT_WIP_QQMJVWL_20250211_164141'"));
    }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////Varrag Kasorg Specific Gestures///////////////////////////////////////////////////////////////////////////////////

    class UGestureSet_Orc_VarragKasorg_PossessedPhrase01 : UGestureSet_Orc
    {
        default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Possessed01));
        default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Dialog/Idle");

        default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Possessed01));
        default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Dialog/SpecificAudio/Varrag_Kasorg/A_OrcM_Dialog_TEXT_WIP_VFXCIAC_20240903_154556_3902.A_OrcM_Dialog_TEXT_WIP_VFXCIAC_20240903_154556_3902'"));
    }

    class UGestureSet_Orc_VarragKasorg_PossessedPhrase02 : UGestureSet_Orc
    {
        default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Possessed02));
        default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Dialog/Idle");

        default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Possessed02));
        default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Dialog/SpecificAudio/Varrag_Kasorg/A_OrcM_Dialog_TEXT_WIP_VFXCIAC_20240903_154720.A_OrcM_Dialog_TEXT_WIP_VFXCIAC_20240903_154720'"));
    }

    class UGestureSet_Orc_VarragKasorg_PossessedPhrase03 : UGestureSet_Orc
    {
        default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Possessed03));
        default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Dialog/Idle");

        default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Possessed03));
        default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Dialog/SpecificAudio/Varrag_Kasorg/A_OrcM_Dialog_TEXT_WIP_VFXCIAC_20240903_154812.A_OrcM_Dialog_TEXT_WIP_VFXCIAC_20240903_154812'"));
    }

    class UGestureSet_Orc_VarragKasorg_PossessedPhrase04 : UGestureSet_Orc
    {
        default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Possessed04));
        default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Dialog/Idle");

        default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Possessed04));
        default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Orcs/Male/Dialog/SpecificAudio/Varrag_Kasorg/A_OrcM_Dialog_TEXT_WIP_VFXCIAC_20240903_154844.A_OrcM_Dialog_TEXT_WIP_VFXCIAC_20240903_154844'"));
    }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class UGestureSet_Orc_Conversation : UGestureSet_Orc
{
    // --- Conversation gestures
    // NORMAL POSE
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().Posture = GameplayTag::Posture_Standing_Neutral;
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Neutral);
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Happy);
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Cunning);
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Positive);
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Distracted);
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Boredom);
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Possessed);
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Dialog/Idle");
    
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().Posture = GameplayTag::Posture_Standing_Neutral;
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Neutral);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Happy);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Cunning);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Positive);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Distracted);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Boredom);
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Orcs/Male/Dialog/Gestures/DialogGestures");
/*
    // CROSSED ARMS 
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Neutral);
    default Idles.Last().Posture = GameplayTag::Posture_Standing_CrossArms;
    default Idles.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/CrossArms/BaseIdle/Man_IdleDialogs_CrossArms_Calm.Man_IdleDialogs_CrossArms_Calm'"));

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Neutral);
    default Gestures.Last().Posture = GameplayTag::Posture_Standing_CrossArms;
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/CrossArms/Calm/Man_Dialog_CrossArms_Calm.Man_Dialog_CrossArms_Calm'"));
    */
}


// class UGestureConfig_Orc : UGestureConfig
// {
//     default GestureSets.Add(FGestureConfigSetEntry());
//     default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Conversation);
//     default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Interact);
//     default GestureSets.Last().GestureSet = UGestureSet_Orc_Ambient;
    
//     default GestureSets.Add(FGestureConfigSetEntry());
//     default GestureSets.Last().RequireAll.AddTag(GameplayTag::State_Conversation);
//     default GestureSets.Last().RequireNone.AddTag(GameplayTag::State_Interact);
//     default GestureSets.Last().GestureSet = UGestureSet_Orc_Conversation;
// }