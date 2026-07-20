class UGestureSet_Human : UGestureSet
{

    default PoseMatchBones.Add(n"Hand_L");
    default PoseMatchBones.Add(n"Hand_R");
    // default PoseMatchBones.Add(n"Foot_L");
    // default PoseMatchBones.Add(n"Foot_R");
    // default PoseMatchBones.Add(n"Head");
}

class UGestureSet_Human_AmbientGestures_UpperBody : UGestureSet_Human
{
    default AnimSlotGestureAnimations = n"LivingUpperBody";

    default AllowedDurationMaxMultiplier = 20.0f;
    default AllowedDurationMinMultiplier = 0.01f;

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Reactions/Greeting/A_Man_Greeting_01.A_Man_Greeting_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Reactions/Greeting/A_Man_Greeting_02.A_Man_Greeting_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Reactions/Greeting/A_Man_Greeting_03.A_Man_Greeting_03'"));

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_CrossArms));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Address_Greeting);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Reactions/Greeting/A_Man_Greeting_01.A_Man_Greeting_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Reactions/Greeting/A_Man_Greeting_02.A_Man_Greeting_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Reactions/Greeting/A_Man_Greeting_03.A_Man_Greeting_03'"));

    // default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    // default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Address_Greeting);
    // default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Reactions/Greeting/A_Man_Greeting_01.A_Man_Greeting_01'"));
    // default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Reactions/Greeting/A_Man_Greeting_03.A_Man_Greeting_03'"));

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Blocking_MakeWay);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Blocking_InsistMakeWay);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Reactions/Blocking/A_Man_Blocking_01.A_Man_Blocking_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Reactions/Blocking/A_Man_Blocking_03.A_Man_Blocking_03'"));
}

class UGestureSet_Human_AmbientGestures : UGestureSet_Human
{
    default AllowedDurationMaxMultiplier = 20.0f;
    default AllowedDurationMinMultiplier = 0.01f;

    // --- Greeting Gestures
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Address_Greeting);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Reactions/Greeting/A_Man_Greeting_01.A_Man_Greeting_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Reactions/Greeting/A_Man_Greeting_02.A_Man_Greeting_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Reactions/Greeting/A_Man_Greeting_03.A_Man_Greeting_03'"));
    // --- BlockingWay Gestures
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Blocking_MakeWay);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Blocking_InsistMakeWay);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Reactions/Blocking/A_Man_Blocking_01.A_Man_Blocking_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Reactions/Blocking/A_Man_Blocking_02.A_Man_Blocking_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Reactions/Blocking/A_Man_Blocking_03.A_Man_Blocking_03'"));
    // --- Pickpoketing Gestures
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Crime_Pickpocketing_BehindYou);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Reactions/CrimePickpocketing/A_Man_CrimePickpocketing_03.A_Man_CrimePickpocketing_03'"));
}

class UGestureSet_Human_Ambient : UGestureSet_Human
{
    default AllowedDurationMaxMultiplier = 20.0f;
    default AllowedDurationMinMultiplier = 0.01f;

    // --- Warning gestures
    /// - No Weapon (No fists)
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Warnings/A_Man_Bow_N_Warning_01.A_Man_Bow_N_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Warnings/A_Man_Bow_N_Warning_04.A_Man_Bow_N_Warning_04'"));

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Warnings/A_Man_Bow_N_Warning_02.A_Man_Bow_N_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Warnings/A_Man_Bow_N_Warning_05.A_Man_Bow_N_Warning_05'"));

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    // --- Smalltalk gestures
    // default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    // default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Conversation_SmallTalk);
    // default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/IdlePose/Calm/A_Man_Dialog_Gestures_Calm_01.A_Man_Dialog_Gestures_Calm_01'"));
    // default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/CrossArms/Calm/Man_Dialog_CrossArms_Calm_01.Man_Dialog_CrossArms_Calm_01'"));

    // --- PickPocketing Gestures
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Crime_Pickpocketing_Failed);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Reactions/CrimePickpocketing/A_Man_CrimePickpocketing_01.A_Man_CrimePickpocketing_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Reactions/CrimePickpocketing/A_Man_CrimePickpocketing_02.A_Man_CrimePickpocketing_02'"));
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Crime_Pickpocketing_BehindYou);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Reactions/CrimePickpocketing/A_Man_CrimePickpocketing_03.A_Man_CrimePickpocketing_03'"));
}

class UGestureSet_Human_Ambient_Player : UGestureSet_Human
{
    // --- Player interaction gestures
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Player_Interaction_Object_DoesntWork);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Reactions/A_Man_BackRoutine_01.A_Man_BackRoutine_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Reactions/A_Man_BackRoutine_02.A_Man_BackRoutine_02'"));
}

class UGestureSet_Human_Torch_Conversation : UGestureSet_Human
{
    // --- Conversation gestures with Torch
    // NORMAL POSE
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Neutral);
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Happy);
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Cunning);
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Positive);
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Distracted);
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Boredom);
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/TorchPose/BaseIdle");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Neutral);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Happy);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Cunning);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Positive);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Distracted);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Boredom);
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/TorchPose/Calm");
}

class UGestureSet_Human_WatchFight : UGestureSet_Human
{
    default AnimSlotGestureAnimations = n"UpperBody";

    default AllowedDurationMaxMultiplier = 20.0f;
    default AllowedDurationMinMultiplier = 0.01f;

    // --- WatchFight gestures
    // Generic cheer
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_HeyHeyHey);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_CheerFight);
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/WatchFight/Pose01/DialogAnims/DialogGestures/Neutral");
    // Good cheer
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_Death_Good);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_CheerFriend);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_YeahWellDone);
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/WatchFight/Pose01/DialogAnims/DialogGestures/Positive");
    // Bad cheer
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_Ooh);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_WatchFight_Cheer_Death_Bad);
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/WatchFight/Pose01/DialogAnims/DialogGestures/Negative");

}

class UGestureSet_Human_S1H : UGestureSet_Human
{
    // --- Warning gestures
    /// Untrained
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Warnings/Untrained/A_Man_S1H_Un_Warning_01.A_Man_S1H_Un_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Warnings/Untrained/A_Man_S1H_Un_Warning_04.A_Man_S1H_Un_Warning_04'"));
    default Gestures.Last().Layer = 2; // Ensures it will be played instead of the no weapon gesture

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Warnings/Untrained/A_Man_S1H_Un_Warning_02.A_Man_S1H_Un_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Warnings/Untrained/A_Man_S1H_Un_Warning_05.A_Man_S1H_Un_Warning_05'"));
    default Gestures.Last().Layer = 2; // Ensures it will be played instead of the no weapon gesture

    /// Trained
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Warnings/Trained/A_Man_S1H_Tr_Warning_01.A_Man_S1H_Tr_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Warnings/Trained/A_Man_S1H_Tr_Warning_04.A_Man_S1H_Tr_Warning_04'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Warnings/Trained/A_Man_S1H_Tr_Warning_02.A_Man_S1H_Tr_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Warnings/Trained/A_Man_S1H_Tr_Warning_05.A_Man_S1H_Tr_Warning_05'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    /// Master
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Warnings/Master/A_Man_S1H_Ma_Warning_01.A_Man_S1H_Ma_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Warnings/Master/A_Man_S1H_Ma_Warning_04.A_Man_S1H_Ma_Warning_04'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Master);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Warnings/Master/A_Man_S1H_Ma_Warning_02.A_Man_S1H_Ma_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword1H/Warnings/Master/A_Man_S1H_Ma_Warning_05.A_Man_S1H_Ma_Warning_05'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Master);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version
}

class UGestureSet_Human_S2H : UGestureSet_Human
{
    // --- Warning gestures
    /// Untrained
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Warnings/Untrained/A_Man_S2H_Un_Warning_01.A_Man_S2H_Un_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Warnings/Untrained/A_Man_S2H_Un_Warning_03.A_Man_S2H_Un_Warning_03'"));
    default Gestures.Last().Layer = 2; // Ensures it will be played instead of the no weapon gesture

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Warnings/Untrained/A_Man_S2H_Un_Warning_02.A_Man_S2H_Un_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Warnings/Untrained/A_Man_S2H_Un_Warning_04.A_Man_S2H_Un_Warning_04'"));
    default Gestures.Last().Layer = 2; // Ensures it will be played instead of the no weapon gesture

    /// Trained
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Warnings/Trained/A_Man_S2H_Tr_Warning_01.A_Man_S2H_Tr_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Warnings/Trained/A_Man_S2H_Tr_Warning_03.A_Man_S2H_Tr_Warning_03'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_TwoHanded_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Warnings/Trained/A_Man_S2H_Tr_Warning_02.A_Man_S2H_Tr_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Warnings/Trained/A_Man_S2H_Tr_Warning_04.A_Man_S2H_Tr_Warning_04'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_TwoHanded_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    /// Master
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Warnings/Master/A_Man_S2H_Ma_Warning_01.A_Man_S2H_Ma_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Warnings/Master/A_Man_S2H_Ma_Warning_03.A_Man_S2H_Ma_Warning_03'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_TwoHanded_Master);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Warnings/Master/A_Man_S2H_Ma_Warning_02.A_Man_S2H_Ma_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Sword2H/Warnings/Master/A_Man_S2H_Ma_Warning_04.A_Man_S2H_Ma_Warning_04'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_TwoHanded_Master);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version
}

class UGestureSet_Human_A1H : UGestureSet_Human
{
    // --- Warning gestures
    /// Untrained
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Warnings/Untrained/A_Man_A1H_Un_Warning_01.A_Man_A1H_Un_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Warnings/Untrained/A_Man_A1H_Un_Warning_04.A_Man_A1H_Un_Warning_04'"));
    default Gestures.Last().Layer = 2; // Ensures it will be played instead of the no weapon gesture

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Warnings/Untrained/A_Man_A1H_Un_Warning_02.A_Man_A1H_Un_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Warnings/Untrained/A_Man_A1H_Un_Warning_05.A_Man_A1H_Un_Warning_05'"));
    default Gestures.Last().Layer = 2; // Ensures it will be played instead of the no weapon gesture

    /// Trained
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Warnings/Trained/A_Man_A1H_Tr_Warning_01.A_Man_A1H_Tr_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Warnings/Trained/A_Man_A1H_Tr_Warning_04.A_Man_A1H_Tr_Warning_04'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Warnings/Trained/A_Man_A1H_Tr_Warning_02.A_Man_A1H_Tr_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Warnings/Trained/A_Man_A1H_Tr_Warning_05.A_Man_A1H_Tr_Warning_05'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    /// Master
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Warnings/Master/A_Man_A1H_Ma_Warning_01.A_Man_A1H_Ma_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Warnings/Master/A_Man_A1H_Ma_Warning_04.A_Man_A1H_Ma_Warning_04'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Master);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Warnings/Master/A_Man_A1H_Ma_Warning_02.A_Man_A1H_Ma_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Axe1H/Warnings/Master/A_Man_A1H_Ma_Warning_05.A_Man_A1H_Ma_Warning_05'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Master);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version
}

class UGestureSet_Human_A2H : UGestureSet_Human
{
    // --- Warning gestures
    /// Untrained
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Warnings/Untrained/A_Man_A2H_Un_Warning_01.A_Man_A2H_Un_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Warnings/Untrained/A_Man_A2H_Un_Warning_04.A_Man_A2H_Un_Warning_04'"));
    default Gestures.Last().Layer = 2; // Ensures it will be played instead of the no weapon gesture

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Warnings/Untrained/A_Man_A2H_Un_Warning_02.A_Man_A2H_Un_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Warnings/Untrained/A_Man_A2H_Un_Warning_05.A_Man_A2H_Un_Warning_05'"));
    default Gestures.Last().Layer = 2; // Ensures it will be played instead of the no weapon gesture

    /// Trained
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Warnings/Trained/A_Man_A2H_Tr_Warning_01.A_Man_A2H_Tr_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Warnings/Trained/A_Man_A2H_Tr_Warning_04.A_Man_A2H_Tr_Warning_04'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_TwoHanded_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Warnings/Trained/A_Man_A2H_Tr_Warning_02.A_Man_A2H_Tr_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Warnings/Trained/A_Man_A2H_Tr_Warning_05.A_Man_A2H_Tr_Warning_05'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_TwoHanded_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    /// Master
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Warnings/Master/A_Man_A2H_Ma_Warning_01.A_Man_A2H_Ma_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Warnings/Master/A_Man_A2H_Ma_Warning_04.A_Man_A2H_Ma_Warning_04'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_TwoHanded_Master);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Warnings/Master/A_Man_A2H_Ma_Warning_02.A_Man_A2H_Ma_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Axe2H/Warnings/Master/A_Man_A2H_Ma_Warning_05.A_Man_A2H_Ma_Warning_05'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_TwoHanded_Master);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version
}

class UGestureSet_Human_M1H : UGestureSet_Human
{
    // --- Warning gestures
    /// Untrained
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Warnings/Untrained/A_Man_M1H_Un_Warning_01.A_Man_M1H_Un_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Warnings/Untrained/A_Man_M1H_Un_Warning_04.A_Man_M1H_Un_Warning_04'"));
    default Gestures.Last().Layer = 2; // Ensures it will be played instead of the no weapon gesture

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Warnings/Untrained/A_Man_M1H_Un_Warning_02.A_Man_M1H_Un_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Warnings/Untrained/A_Man_M1H_Un_Warning_05.A_Man_M1H_Un_Warning_05'"));
    default Gestures.Last().Layer = 2; // Ensures it will be played instead of the no weapon gesture

    /// Trained
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Warnings/Trained/A_Man_M1H_Tr_Warning_01.A_Man_M1H_Tr_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Warnings/Trained/A_Man_M1H_Tr_Warning_04.A_Man_M1H_Tr_Warning_04'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Warnings/Trained/A_Man_M1H_Tr_Warning_02.A_Man_M1H_Tr_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Warnings/Trained/A_Man_M1H_Tr_Warning_05.A_Man_M1H_Tr_Warning_05'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    /// Master
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Warnings/Master/A_Man_M1H_Ma_Warning_01.A_Man_M1H_Ma_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Warnings/Master/A_Man_M1H_Ma_Warning_04.A_Man_M1H_Ma_Warning_04'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Master);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Warnings/Master/A_Man_M1H_Ma_Warning_02.A_Man_M1H_Ma_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Mace1H/Warnings/Master/A_Man_M1H_Ma_Warning_05.A_Man_M1H_Ma_Warning_05'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Master);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version
}

class UGestureSet_Human_M2H : UGestureSet_Human
{
    // --- Warning gestures
    /// Untrained
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Warnings/Untrained/A_Man_M2H_Un_Warning_01.A_Man_M2H_Un_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Warnings/Untrained/A_Man_M2H_Un_Warning_04.A_Man_M2H_Un_Warning_04'"));
    default Gestures.Last().Layer = 2; // Ensures it will be played instead of the no weapon gesture

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Warnings/Untrained/A_Man_M2H_Un_Warning_02.A_Man_M2H_Un_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Warnings/Untrained/A_Man_M2H_Un_Warning_05.A_Man_M2H_Un_Warning_05'"));
    default Gestures.Last().Layer = 2; // Ensures it will be played instead of the no weapon gesture

    /// Trained
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Warnings/Trained/A_Man_M2H_Tr_Warning_01.A_Man_M2H_Tr_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Warnings/Trained/A_Man_M2H_Tr_Warning_04.A_Man_M2H_Tr_Warning_04'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_TwoHanded_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Warnings/Trained/A_Man_M2H_Tr_Warning_02.A_Man_M2H_Tr_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Warnings/Trained/A_Man_M2H_Tr_Warning_05.A_Man_M2H_Tr_Warning_05'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_TwoHanded_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    /// Master
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Warnings/Master/A_Man_M2H_Ma_Warning_01.A_Man_M2H_Ma_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Warnings/Master/A_Man_M2H_Ma_Warning_04.A_Man_M2H_Ma_Warning_04'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_TwoHanded_Master);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Warnings/Master/A_Man_M2H_Ma_Warning_02.A_Man_M2H_Ma_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Mace2H/Warnings/Master/A_Man_M2H_Ma_Warning_05.A_Man_M2H_Ma_Warning_05'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_TwoHanded_Master);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version
}

class UGestureSet_Human_Sff2H : UGestureSet_Human
{
    // --- Warning gestures
    /// Untrained
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Warnings/Untrained/A_Man_Sff2H_Un_Warning_01.A_Man_Sff2H_Un_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Warnings/Untrained/A_Man_Sff2H_Un_Warning_04.A_Man_Sff2H_Un_Warning_04'"));
    default Gestures.Last().Layer = 2; // Ensures it will be played instead of the no weapon gesture

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Warnings/Untrained/A_Man_Sff2H_Un_Warning_02.A_Man_Sff2H_Un_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Warnings/Untrained/A_Man_Sff2H_Un_Warning_05.A_Man_Sff2H_Un_Warning_05'"));
    default Gestures.Last().Layer = 2; // Ensures it will be played instead of the no weapon gesture

    /// Trained
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Warnings/Trained/A_Man_Sff2H_Tr_Warning_01.A_Man_Sff2H_Tr_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Warnings/Trained/A_Man_Sff2H_Tr_Warning_04.A_Man_Sff2H_Tr_Warning_04'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_TwoHanded_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Warnings/Trained/A_Man_Sff2H_Tr_Warning_02.A_Man_Sff2H_Tr_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Warnings/Trained/A_Man_Sff2H_Tr_Warning_05.A_Man_Sff2H_Tr_Warning_05'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_TwoHanded_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    /// Master
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Warnings/Master/A_Man_Sff2H_Ma_Warning_01.A_Man_Sff2H_Ma_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Warnings/Master/A_Man_Sff2H_Ma_Warning_04.A_Man_Sff2H_Ma_Warning_04'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_TwoHanded_Master);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Warnings/Master/A_Man_Sff2H_Ma_Warning_02.A_Man_Sff2H_Ma_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Staff2H/Warnings/Master/A_Man_Sff2H_Ma_Warning_05.A_Man_Sff2H_Ma_Warning_05'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_TwoHanded_Master);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version
}

class UGestureSet_Human_Magic : UGestureSet_Human
{
    // --- Warning gestures
    /// - Rune
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Warnings/A_Man_ScrollRune_Warning_01.A_Man_ScrollRune_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Warnings/A_Man_ScrollRune_Warning_03.A_Man_ScrollRune_Warning_03'"));
    default Gestures.Last().Layer = 2; // Ensures it will be played instead of the no weapon gesture

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Warnings/A_Man_ScrollRune_Warning_02.A_Man_ScrollRune_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Warnings/A_Man_ScrollRune_Warning_04.A_Man_ScrollRune_Warning_04'"));
    default Gestures.Last().Layer = 2; // Ensures it will be played instead of the no weapon gesture
}

class UGestureSet_Human_Fists : UGestureSet_Human
{
    // --- Warning gestures
    /// Untrained
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Warnings/Untrained/A_Man_Fists_Un_Warning_01.A_Man_Fists_Un_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Warnings/Untrained/A_Man_Fists_Un_Warning_03.A_Man_Fists_Un_Warning_03'"));
    default Gestures.Last().Layer = 2; // Ensures it will be played instead of the no weapon gesture

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Warnings/Untrained/A_Man_Fists_Un_Warning_02.A_Man_Fists_Un_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Warnings/Untrained/A_Man_Fists_Un_Warning_04.A_Man_Fists_Un_Warning_04'"));
    default Gestures.Last().Layer = 2; // Ensures it will be played instead of the no weapon gesture

    /// Trained
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Warnings/Trained/A_Man_Fists_Tr_Warning_01.A_Man_Fists_Tr_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Warnings/Trained/A_Man_Fists_Tr_Warning_03.A_Man_Fists_Tr_Warning_03'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Warnings/Trained/A_Man_Fists_Tr_Warning_02.A_Man_Fists_Tr_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Warnings/Trained/A_Man_Fists_Tr_Warning_04.A_Man_Fists_Tr_Warning_04'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    /// Master
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Warnings/Master/A_Man_Fists_Ma_Warning_01.A_Man_Fists_Ma_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Warnings/Master/A_Man_Fists_Ma_Warning_03.A_Man_Fists_Ma_Warning_03'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::State_Combat_Melee_Fist);
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Master);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Warnings/Master/A_Man_Fists_Ma_Warning_02.A_Man_Fists_Ma_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Fist/Warnings/Master/A_Man_Fists_Ma_Warning_04.A_Man_Fists_Ma_Warning_04'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::State_Combat_Melee_Fist);
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Master);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version
}

class UGestureSet_Human_T1H : UGestureSet_Human
{
    // --- Warning gestures
    /// Untrained
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Warnings/A_Man_T1H_Warning_01.A_Man_T1H_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Warnings/A_Man_T1H_Warning_04.A_Man_T1H_Warning_04'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Warnings/A_Man_T1H_Warning_02.A_Man_T1H_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Warnings/A_Man_T1H_Warning_05.A_Man_T1H_Warning_05'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    /// Trained
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Warnings/A_Man_T1H_Warning_01.A_Man_T1H_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Warnings/A_Man_T1H_Warning_04.A_Man_T1H_Warning_04'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Warnings/A_Man_T1H_Warning_02.A_Man_T1H_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Warnings/A_Man_T1H_Warning_05.A_Man_T1H_Warning_05'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    /// Master
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Warnings/A_Man_T1H_Warning_01.A_Man_T1H_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Warnings/A_Man_T1H_Warning_04.A_Man_T1H_Warning_04'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Warnings/A_Man_T1H_Warning_02.A_Man_T1H_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Torch1H/Warnings/A_Man_T1H_Warning_05.A_Man_T1H_Warning_05'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Melee_OneHanded_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version
}

class UGestureSet_Human_Bow : UGestureSet_Human
{
    // --- Warning gestures
    /// Untrained
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Warnings/A_Man_Bow_N_Warning_01.A_Man_Bow_N_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Warnings/A_Man_Bow_N_Warning_04.A_Man_Bow_N_Warning_04'"));
    default Gestures.Last().Layer = 2; // Ensures it will be played instead of the no weapon gesture

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Warnings/A_Man_Bow_N_Warning_02.A_Man_Bow_N_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Warnings/A_Man_Bow_N_Warning_05.A_Man_Bow_N_Warning_05'"));
    default Gestures.Last().Layer = 2; // Ensures it will be played instead of the no weapon gesture

    /// Trained
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Warnings/A_Man_Bow_N_Warning_01.A_Man_Bow_N_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Warnings/A_Man_Bow_N_Warning_04.A_Man_Bow_N_Warning_04'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Ranged_Bow_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Warnings/A_Man_Bow_N_Warning_02.A_Man_Bow_N_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Warnings/A_Man_Bow_N_Warning_05.A_Man_Bow_N_Warning_05'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Ranged_Bow_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    /// Master
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Warnings/A_Man_Bow_N_Warning_01.A_Man_Bow_N_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Warnings/A_Man_Bow_N_Warning_04.A_Man_Bow_N_Warning_04'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Ranged_Bow_Master);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Warnings/A_Man_Bow_N_Warning_02.A_Man_Bow_N_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Bow/Warnings/A_Man_Bow_N_Warning_05.A_Man_Bow_N_Warning_05'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Ranged_Bow_Master);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version
}

class UGestureSet_Human_Crossbow : UGestureSet_Human
{
    // --- Warning gestures
    /// Untrained
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Warnings/A_Man_Crossbow_N_Warning_01.A_Man_Crossbow_N_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Warnings/A_Man_Crossbow_N_Warning_04.A_Man_Crossbow_N_Warning_04'"));
    default Gestures.Last().Layer = 2; // Ensures it will be played instead of the no weapon gesture

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Warnings/A_Man_Crossbow_N_Warning_02.A_Man_Crossbow_N_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Warnings/A_Man_Crossbow_N_Warning_05.A_Man_Crossbow_N_Warning_05'"));
    default Gestures.Last().Layer = 2; // Ensures it will be played instead of the no weapon gesture

    /// Trained
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Warnings/A_Man_Crossbow_N_Warning_01.A_Man_Crossbow_N_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Warnings/A_Man_Crossbow_N_Warning_04.A_Man_Crossbow_N_Warning_04'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Ranged_Crossbow_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Warnings/A_Man_Crossbow_N_Warning_02.A_Man_Crossbow_N_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Warnings/A_Man_Crossbow_N_Warning_05.A_Man_Crossbow_N_Warning_05'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Ranged_Crossbow_Trained);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    /// Master
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_WeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Intruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_GiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Warnings/A_Man_Crossbow_N_Warning_01.A_Man_Crossbow_N_Warning_01'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Warnings/A_Man_Crossbow_N_Warning_04.A_Man_Crossbow_N_Warning_04'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Ranged_Crossbow_Master);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistWeaponDown);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_InsistIntruder);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Sound_Voice_Reaction_Warning_Thief_InsistGiveBack);
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Warnings/A_Man_Crossbow_N_Warning_02.A_Man_Crossbow_N_Warning_02'"));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Items/Crossbow/Warnings/A_Man_Crossbow_N_Warning_05.A_Man_Crossbow_N_Warning_05'"));
    default Gestures.Last().RequireAllOfCharacterTags.AddTag(GameplayTag::Skill_Ranged_Crossbow_Master);
    default Gestures.Last().Layer = 3; // Ensures it will be played instead of the no weapon gesture and the untrained version
}

class UGestureSet_Human_Forge : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Crafting/Forge/Forge/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Crafting/Forge/Forge/DialogAnims/DialogGestures");
}

class UGestureSet_Human_Anvil : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Crafting/Forge/Anvil/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Crafting/Forge/Anvil/DialogAnims/DialogGestures");
}

class UGestureSet_Human_Whetstone : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Crafting/Forge/Whetstone/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Crafting/Forge/Whetstone/DialogAnims/DialogGestures");
}

class UGestureSet_Human_LeanWall : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/LeaningWall/Pose01/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/LeaningWall/Pose01/DialogAnims/DialogGestures");
}

class UGestureSet_Human_GuardPassage_CrossArms : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_CrossArms));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Idle/Crossarms/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_CrossArms));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Idle/Crossarms/DialogAnims/DialogGestures");
}

class UGestureSet_Human_Thorus_GuardPassage_CrossArms : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_CrossArms));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Idle/Thorus_CrossArms/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_CrossArms));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Idle/Thorus_CrossArms/DialogAnims/DialogGestures");
}

class UGestureSet_Human_GuardPassage_JarsArms : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Idle/JarsArms/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Idle/JarsArms/DialogAnims/DialogGestures");
}

class UGestureSet_Human_Fanning : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Women/Living/Fanning/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Women/Living/Fanning/DialogAnims/DialogGestures");
}

class UGestureSet_Human_HoldTray : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Women/Living/HoldTray/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Women/Living/HoldTray/DialogAnims/DialogGestures");
}

class UGestureSet_Human_Sweep : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Sweep/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Sweep/DialogAnims/DialogGestures");
}

class UGestureSet_Human_Eat_Thigh : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Eat/Thigh/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Eat/Thigh/DialogAnims/DialogGestures");
}

class UGestureSet_Human_Eat_Bowl : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Eat/Bowl/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Eat/Bowl/DialogAnims/DialogGestures");
}

class UGestureSet_Human_Eat_item : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Eat/Item/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Eat/Item/DialogAnims/DialogGestures");
}

class UGestureSet_Human_Smoke : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Smoke/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Smoke/DialogAnims/DialogGestures");
}

class UGestureSet_Human_Drink : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Drink/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Drink/DialogAnims/DialogGestures");
}

class UGestureSet_Human_Disturb : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Drunk/Angry/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Drunk/Angry/DialogAnims/DialogGestures");

    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Drunk01));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Drunk/Angry/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Drunk01));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Dialogs/SpecificAudio/Rayk_Resolve_Trouble_Task/A_Rayk_TEXT_WIP_IIRELLM_20240207_121959/A_Rayk_TEXT_WIP_IIRELLM_20240207_121959.A_Rayk_TEXT_WIP_IIRELLM_20240207_121959'"));
}


class UGestureSet_Human_PlayDarts : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/PlayDarts/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/PlayDarts/DialogAnims/DialogGestures");
}

class UGestureSet_Human_CountOre : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/CountOre/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/CountOre/DialogAnims/DialogGestures");
}

class UGestureSet_Human_CountOre_Seated : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/SitCountOre/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/SitCountOre/DialogAnims/DialogGestures");
}

// class UGestureSet_Human_CutWood_OnTrunk : UGestureSet_Human
// {
//     default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
//     default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/CuttingTrunk/DialogAnims/DialogIdles");

//     default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
//     default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/CuttingTrunk/DialogAnims/DialogGestures");
// }

class UGestureSet_Human_Conversation_Sit : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Sit/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Sit/DialogAnims/DialegGestures");
}

class UGestureSet_Human_Conversation_Women_Sit : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Women/Living/Sit/SitPose/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Women/Living/Sit/SitPose/DialogAnims/DialogGestures");
}

class UGestureSet_Human_Conversation_BrushHair_Seated : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Women/Living/Sit/Sit_BrushHair/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Women/Living/Sit/Sit_BrushHair/DialogAnims/Dialog_Gestures");
}

class UGestureSet_Human_Conversation_SitThrone : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Sit/Throne/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Sit/Throne/DialogAnims/DialogGestures");
}

class UGestureSet_Human_Conversation_Sit_CarveWood : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Sit_Carve_Figure/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Sit_Carve_Figure/DialogAnims/DialogGestures");
}

class UGestureSet_Human_PlayKnife : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Sit_PlayKnife/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Sit_PlayKnife/DialogAnims/DialogGestures");
}

class UGestureSet_Human_PlayStone : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/PlayStone/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/PlayStone/DialogAnims/DialogGestures");
}

class UGestureSet_Human_Sit_PlayStone : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Sit_PlayStone/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Sit_PlayStone/DialogAnims/DialogGestures");
}

class UGestureSet_Human_Conversation_Sit_TuneInstrument : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Sit_PlayLute/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Sit_PlayLute/DialogAnims/DialogGestures");
}

class UGestureSet_Human_Sit_Eat_Thigh : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Sit_Eat/Thigh/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Sit_Eat/Thigh/DialogAnims/DialogGestures");
}

class UGestureSet_Human_Sit_Eat_Bowl : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Sit_Eat/Bowl/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Sit_Eat/Bowl/DialogAnims/DialogGestures");
}

class UGestureSet_Human_Woman_Sit_Eat_Bowl : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Women/Living/Sit/Eat/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Women/Living/Sit/Eat/DialogAnims/DialegGestures");
}

class UGestureSet_Human_Woman_Sit_ReadBook : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Women/Living/Sit_Readbook/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Women/Living/Sit_Readbook/DialogAnims/DialegGestures");
}

class UGestureSet_Human_Sit_Eat_Item : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Sit_Eat/Item/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Sit_Eat/Item/DialogAnims/DialogGestures");
}

class UGestureSet_Human_Sit_Smoke : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Sit_Smoke/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Sit_Smoke/DialogAnims/DialogGestures");
}

class UGestureSet_Human_Sit_Drink : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Sit_Drink/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Sitting_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Sit_Drink/DialogAnims/DialogGestures");
}

class UGestureSet_Human_Meditate_Pose01 : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Meditation/Pose01/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Meditation/Pose01/DialogAnims/DialogGestures");
}

class UGestureSet_Human_Meditate_Pose02 : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Meditation/Pose02/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/Meditation/Pose02/DialogAnims/DialogGestures");
}

class UGestureSet_Human_LeanBar_Pose01 : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/HerbShop/Pose_01/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/HerbShop/Pose_01/DialogAnims/DialogGestures");
}

class UGestureSet_Human_LeanBar_Pose02 : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/HerbShop/Pose_02/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/HerbShop/Pose_02/DialogAnims/DialogGestures");
}

class UGestureSet_Human_LeanBar_Pose03 : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/HerbShop/Pose_03/DialogAnims/DialogIdles");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Living/HerbShop/Pose_03/DialogAnims/DialogGestures");
}

class UGestureSet_Human_Dispute : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Dispute));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Women/Dialogs/Angry/DialogGestures/Idle");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Dispute));
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Women/Dialogs/Angry/DialogGestures/Gestures");
}

class UGestureSet_Human_Snaf_ReadRecipe : UGestureSet_Human
{
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/IdlePose/BaseIdle/Neutral");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_ReadRecipe));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Living/Read/ReadRecipe/A_Man_ReadRecipe.A_Man_ReadRecipe'"));
}

class UGestureSet_Human_Xardas_Wounded : UGestureSet_Human
{

    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Wounded01));
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Wounded);
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Neutral);
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Dialogs/Injured/IdleGestures/Idle");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Wounded01));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Wounded);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Neutral);
     default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Dialogs/SpecificAudio/Xardas_Wounded/A_Man_Dialog_TEXT_WIP_QIXCDZL_20240805_134808.A_Man_Dialog_TEXT_WIP_QIXCDZL_20240805_134808'"));

    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Wounded02));
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Wounded);
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Neutral);
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Dialogs/Injured/IdleGestures/Idle");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Wounded02));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Wounded);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Neutral);
     default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Dialogs/SpecificAudio/Xardas_Wounded/A_Man_Dialog_TEXT_WIP_KNHLFKC_20240830_092616.A_Man_Dialog_TEXT_WIP_KNHLFKC_20240830_092616'"));

    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Wounded03));
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Wounded);
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Neutral);
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Dialogs/Injured/IdleGestures/Idle");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Wounded03));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Wounded);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Neutral);
     default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Dialogs/SpecificAudio/Xardas_Wounded/A_Man_Dialog_TEXT_WIP_KNHLFKC_20240830_094423.A_Man_Dialog_TEXT_WIP_KNHLFKC_20240830_094423'"));
   
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Wounded));
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Wounded);
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Neutral);
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Dialogs/Injured/IdleGestures/Idle");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Wounded));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Wounded);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Neutral);
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Dialogs/Injured/IdleGestures/Gestures");
}

///////////////////////////////////////////////////////////////////////Xardas Charge Uriziel Task/////////////////////////////////////////////////////////////////////////////////////////
    class UGestureSet_Human_Xardas_ChargeUriziel01 : UGestureSet_Human
    {
        default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_ChargeUriziel01));
        default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Dialogs/SpecificAudio/Xardas_ChargeUrizielTask/A_Xardas_INFO_XARDAS_LOADSWORD_14_06.A_Xardas_INFO_XARDAS_LOADSWORD_14_06'"));
    }

    class UGestureSet_Human_Xardas_ChargeUriziel02 : UGestureSet_Human
    {
        default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_ChargeUriziel02));
        default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Dialogs/SpecificAudio/Xardas_ChargeUrizielTask/A_Xardas_INFO_XARDAS_ALTRUNE_14_03.A_Xardas_INFO_XARDAS_ALTRUNE_14_03'"));
    }

    class UGestureSet_Human_Xardas_ChargeUriziel03 : UGestureSet_Human
    {
        default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_ChargeUriziel03));
        default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Dialogs/SpecificAudio/Xardas_ChargeUrizielTask/A_Xardas_TEXT_WIP_WRDAKHC_20240812_215916.A_Xardas_TEXT_WIP_WRDAKHC_20240812_215916'"));
    }

    class UGestureSet_Human_Xardas_ChargeUriziel04 : UGestureSet_Human
    {
        default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_ChargeUriziel04));
        default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Dialogs/SpecificAudio/Xardas_ChargeUrizielTask/A_Xardas_TEXT_WIP_FGXCIAC_20240909_195558.A_Xardas_TEXT_WIP_FGXCIAC_20240909_195558'"));
    }

    class UGestureSet_Human_Xardas_ChargeUriziel05 : UGestureSet_Human
    {
        default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_ChargeUriziel05));
        default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Dialogs/SpecificAudio/Xardas_ChargeUrizielTask/A_Xardas_TEXT_WIP_FGXCIAC_20240909_195353.A_Xardas_TEXT_WIP_FGXCIAC_20240909_195353'"));
    }

    class UGestureSet_Human_Xardas_ChargeUriziel06 : UGestureSet_Human
    {
        default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_ChargeUriziel06));
        default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Dialogs/SpecificAudio/Xardas_ChargeUrizielTask/A_Xardas_TEXT_WIP_FGXCIAC_20240909_195410.A_Xardas_TEXT_WIP_FGXCIAC_20240909_195410'"));
    }

    class UGestureSet_Human_Xardas_ChargeUriziel07 : UGestureSet_Human
    {
        default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_ChargeUriziel07));
        default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Dialogs/SpecificAudio/Xardas_ChargeUrizielTask/A_Xardas_INFO_XARDAS_LOADSWORD02_14_06.A_Xardas_INFO_XARDAS_LOADSWORD02_14_06'"));
    }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////Cor Kalom Crisis of Faith/////////////////////////////////////////////////////////////////////////////////////////
    class UGestureSet_Human_CorKalom_FaithCrisis01 : UGestureSet_Human
    {
        default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_FaithCrisis01));
        default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Dialogs/SpecificAudio/A_Man_TEXT_Lies_All_Of_It/A_Man_TEXT_WIP_EETMBHG_20241011_151145.A_Man_TEXT_WIP_EETMBHG_20241011_151145'"));
    }

    class UGestureSet_Human_CorKalom_FaithCrisis02 : UGestureSet_Human
    {
        default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_FaithCrisis02));
        default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Dialogs/SpecificAudio/A_Man_TEXT_I_Dont_Care/TEXT_WIP_EETMBHG_20241011_151322.TEXT_WIP_EETMBHG_20241011_151322'"));
    }

    class UGestureSet_Human_CorKalom_FaithCrisis03 : UGestureSet_Human
    {
        default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_FaithCrisis03));
        default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Dialogs/SpecificAudio/A_Man_TEXT_I_Believe_Angar/A_Man_TEXT_WIP_EETMBHG_20241011_151535.A_Man_TEXT_WIP_EETMBHG_20241011_151535'"));
    }

    class UGestureSet_Human_CorKalom_FaithCrisis04 : UGestureSet_Human
    {
        default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_FaithCrisis04));
        default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Dialogs/SpecificAudio/A_Man_TEXT_I_Believe_Angar/A_Man_TEXT_WIP_EETMBHG_20241011_151601.A_Man_TEXT_WIP_EETMBHG_20241011_151601'"));
    }

    class UGestureSet_Human_CorAngar_FaithCrisis01 : UGestureSet_Human
    {
        default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_FaithCrisis05));
        default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Dialogs/SpecificAudio/Ch2_MQ09_OrcGraveyard_CorAngar_Report/A_Man_TEXT_WIP_OKRDULC_20240502_132937_2083/A_Man_TEXT_WIP_OKRDULC_20240502_132937_2083.A_Man_TEXT_WIP_OKRDULC_20240502_132937_2083'"));
    }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////GOMEZ INEXTREMO PRESENTATION/////////////////////////////////////////////////////////////////////////////////////////
    class UGestureSet_Human_Gomez_InExtremo_Presentation01 : UGestureSet_Human
    {
        default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Presentation01));
        default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/InExtremo/Gomez/A_Gomez_TEXT_WIP_QNKNJXI_20260207_181508_41.A_Gomez_TEXT_WIP_QNKNJXI_20260207_181508_41'"));
    }

    class UGestureSet_Human_Gomez_InExtremo_Presentation02 : UGestureSet_Human
    {
        default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Presentation02));
        default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/InExtremo/Gomez/A_Gomez_TEXT_WIP_QNKNJXI_20260207_181539.A_Gomez_TEXT_WIP_QNKNJXI_20260207_181539'"));
    }

    class UGestureSet_Human_Gomez_InExtremo_Presentation03 : UGestureSet_Human
    {
        default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Presentation03));
        default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/InExtremo/Gomez/A_Gomez_TEXT_WIP_QNKNJXI_20260207_181546.A_Gomez_TEXT_WIP_QNKNJXI_20260207_181546'"));
    }

    class UGestureSet_Human_Gomez_InExtremo_Presentation04 : UGestureSet_Human
    {
        default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Presentation04));
        default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/InExtremo/Gomez/A_Gomez_TEXT_WIP_QNKNJXI_20260207_181708.A_Gomez_TEXT_WIP_QNKNJXI_20260207_181708'"));
    }

    class UGestureSet_Human_Gomez_InExtremo_Presentation05 : UGestureSet_Human
    {
        default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Forced_Presentation05));
        default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/InExtremo/Gomez/A_Gomez_TEXT_WIP_QNKNJXI_20260207_181723.A_Gomez_TEXT_WIP_QNKNJXI_20260207_181723'"));
    }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class UGestureSet_Human_Conversation_Moving : UGestureSet_Human_Conversation
{
    default AnimSlotIdleAnimations = n"UpperBody";
    default AnimSlotGestureAnimations = n"UpperBody";
}

class UGestureSet_Human_Conversation : UGestureSet_Human
{
    // --- Conversation gestures
    // NORMAL POSE
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Neutral);
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Happy);
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Cunning);
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Positive);
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Distracted);
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Boredom);
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Angry);
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Negative);
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Disgust);
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/IdlePose/BaseIdle/Neutral");

    // VERY ANGRY POSE
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_VeryAngry);
    default Idles.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/VeryAngryPose/Idles");

    // VERY ANGRY GESTURES
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_VeryAngry);
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/VeryAngryPose/Gestures");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Neutral);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Happy);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Cunning);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Positive);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Distracted);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Boredom);
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/IdlePose/Calm/Used");

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Angry);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Negative);
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Disgust);
    default Gestures.Last().AnimSequencesInPath.Add(n"/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/IdlePose/Intense");
/*
    // CROSSED ARMS
    default Idles.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Idles.Last().ForExpression.AddTag(GameplayTag::Expression_Neutral);
    default Idles.Last().Posture = GameplayTag::Posture_Standing_CrossArms;
    // default Idles.Last().AnimMontages.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/CrossArms/BaseIdle/Man_IdleDialogs_CrossArms_Calm.Man_IdleDialogs_CrossArms_Calm'"));

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Neutral));
    default Gestures.Last().ForExpression.AddTag(GameplayTag::Expression_Neutral);
    default Gestures.Last().Posture = GameplayTag::Posture_Standing_CrossArms;
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/CrossArms/Calm/Man_Dialog_CrossArms_Calm.Man_Dialog_CrossArms_Calm'"));
    */
}

class UGestureSet_Human_AmbientConversation : UGestureSet_Human
{
    // VELAYA SERAPHIA AMBIENT GESTURES
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Accusation01));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"/Game/AnimLibrary/Humanoid/Women/Dialogs/SpecificAudio/A_Woman_TEXT_WIP_WKHQRQD_20250110_155201_1340.A_Woman_TEXT_WIP_WKHQRQD_20250110_155201_1340"));
    
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Accusation02));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"/Game/AnimLibrary/Humanoid/Women/Dialogs/SpecificAudio/A_Woman_TEXT_WIP_WKHQRQD_20250110_155227.A_Woman_TEXT_WIP_WKHQRQD_20250110_155227"));

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Accusation03));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"/Game/AnimLibrary/Humanoid/Women/Dialogs/SpecificAudio/A_Woman_TEXT_WIP_WKHQRQD_20250110_155242.A_Woman_TEXT_WIP_WKHQRQD_20250110_155242"));

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Accusation04));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"/Game/AnimLibrary/Humanoid/Women/Dialogs/SpecificAudio/A_Woman_TEXT_WIP_WKHQRQD_20250110_155252.A_Woman_TEXT_WIP_WKHQRQD_20250110_155252"));

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Accusation05));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"/Game/AnimLibrary/Humanoid/Women/Dialogs/SpecificAudio/A_Woman_TEXT_WIP_WKHQRQD_20250110_155256.A_Woman_TEXT_WIP_WKHQRQD_20250110_155256"));

    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Accusation06));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"/Game/AnimLibrary/Humanoid/Women/Dialogs/SpecificAudio/A_Woman_TEXT_WIP_WKHQRQD_20250110_155307.A_Woman_TEXT_WIP_WKHQRQD_20250110_155307"));
}

class UGestureSet_Human_AmbientConversation_Seraphia : UGestureSet_Human
{
    // SERAPHIA AMBIENT GESTURES
    default Gestures.Add(FExpressionMontageContainer(GameplayTag::Posture_Standing_Accusation05));
    default Gestures.Last().AnimSequences.Add(TSoftObjectPtr<UAnimSequence>(n"/Game/AnimLibrary/Humanoid/Women/Dialogs/SpecificAudio/A_Woman_TEXT_WIP_WKHQRQD_20250110_155256.A_Woman_TEXT_WIP_WKHQRQD_20250110_155256"));
}