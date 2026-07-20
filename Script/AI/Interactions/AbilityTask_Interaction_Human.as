//MEN
UCLASS(Abstract)
class UAbilityTask_Interaction_Human : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AAIAgentCharacter_Human::StaticClass());
    default TaskEndingTags.AddTag(GameplayTag::Action_Conversation);
    default DisableAutoTransitionsForTags.AddTag(GameplayTag::State_Conversation);
}

/** Base of all tasks involving sitting and sleeping on InteractiveObjects */
UCLASS()
class UAbilityTask_Interaction_Human_SitAndSleep_IO : UAbilityTask_Interaction_Human
{
    default bShouldFocusInteractiveObject = false;  // dont look at InteractiveObject, because we are sitting/laying on it
    default bForceCrowdIdleBehaviourToIgnoreMe = true;  // this NPC is not avoided, has disabled collisions and wont create a DynamicNavObstacle
    default OwnedTagsWhileActive.AddTag(GameplayTag::Posture_Sitting_Neutral);

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UPROPERTY()
    FGameplayAbilitySpecHandle m_AbilitySkipTimeHandle;

    UFUNCTION(BlueprintOverride)
    void Activate()
    {
        m_AbilitySkipTimeHandle = GetAbilitySystemComponent().GiveAbility(UGA_Human_SkipTime_Sit::StaticClass());
    }

    UFUNCTION(BlueprintOverride)
    void OnDestroy(bool bInOwnerFinished)
    {
        GetAbilitySystemComponent().ClearAbility(m_AbilitySkipTimeHandle);
        m_AbilitySkipTimeHandle = FGameplayAbilitySpecHandle();
        FGameplayAbilitySpec outSpec;
        bool hasAbility = GetAbilitySystemComponent().FindAbilitySpecFromClass(UGA_Human_SkipTime_Sit, outSpec);
        if(hasAbility)
        {
            GetAbilitySystemComponent().ClearAbility(outSpec.Handle);
        }
    }
}
//WOMEN
UCLASS(Abstract)
class UAbilityTask_Interaction_Human_Women : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AAIAgentCharacter_Human_Woman::StaticClass());
    default TaskEndingTags.AddTag(GameplayTag::Action_Conversation);
    default DisableAutoTransitionsForTags.AddTag(GameplayTag::State_Conversation);
}

/** Base of all tasks involving sitting and sleeping on InteractiveObjects */
UCLASS()
class UAbilityTask_Interaction_Human_Women_SitAndSleep_IO : UAbilityTask_Interaction_Human_Women
{
    default bShouldFocusInteractiveObject = false;  // dont look at InteractiveObject, because we are sitting/laying on it
    default bForceCrowdIdleBehaviourToIgnoreMe = true;  // this NPC is not avoided, has disabled collisions and wont create a DynamicNavObstacle
    default OwnedTagsWhileActive.AddTag(GameplayTag::Posture_Sitting_Neutral);

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AGothicPlayerCharacter::StaticClass());
    default DefaultForCharacterClass.Add(AAIAgentCharacter_Human::StaticClass());
    default bPossibleAnywhere = true;
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_ReadScroll : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_ReadScroll);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Read/Scroll/Man_ReadScroll_Montage.Man_ReadScroll_Montage'";
    
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_ReadNote : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_ReadNote);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Read/Paper/Man_ReadPaper_Montage.Man_ReadPaper_Montage'";
    
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_ReadDrawing : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_ReadDrawing);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Read/Scroll/Man_ReadAbandonedMineScroll_Montage.Man_ReadAbandonedMineScroll_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_ReadBook : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_ReadBook);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/IdlePose/Actions/Triggers/Man_Dialog_Read_Book_Montage.Man_Dialog_Read_Book_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_Attack : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_Attack);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Conversation/Man_Attack_Montage.Man_Attack_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_Murdered : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_Murdered);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Women/Dialogs/Murder/Woman_Murder_Dead_Montage.Woman_Murder_Dead_Montage'";
    
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_Murder : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_Murder);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Women/Dialogs/Murder/Woman_Murder_Montage.Woman_Murder_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_Drink : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_Drink);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Drink/Man_Conversation_Drink_Montage.Man_Conversation_Drink_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_Pray : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_Pray);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Pray/Man_Conversation_Pray_Pose02_Montage.Man_Conversation_Pray_Pose02_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_LukorPray : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_LukorPray);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/IdlePose/Actions/Triggers/Man_Dialog_Pray_Montage.Man_Dialog_Pray_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_InspectSword : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_InspectSword);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/IdlePose/Actions/Triggers/Man_Dialog_Inspect_S1H_Montage.Man_Dialog_Inspect_S1H_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_Sit_InspectSword : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_InspectSwordSeated);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit/Dialog/IdlePose/Actions/Triggers/A_Man_Dialog_Sit_Inspect_S1H/Man_Conversation_Sit_Inspect_S1H_Montage.Man_Conversation_Sit_Inspect_S1H_Montage'";

    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_InspectFocusStone : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_InspectFocusStone);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/IdlePose/Actions/Triggers/Man_Dialog_Inspect_FocusStone_02_Montage.Man_Dialog_Inspect_FocusStone_02_Montage'";
}

// UCLASS()
// class UAbilityTask_Interaction_Human_Conversation_InspectFocusStone_Seated : UAbilityTask_Interaction_Human_Conversation
// {
//     default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_InspectFocusStoneSeated);
//     default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/IdlePose/Actions/Triggers/Man_Dialog_Inspect_FocusStone_Seated_Montage.Man_Dialog_Inspect_FocusStone_Seated_Montage'";
    
//     default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);
// }

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_ShowUriziel : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_ShowUriziel);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/IdlePose/Actions/Triggers/Man_Dialog_Show_Uriziel_Montage.Man_Dialog_Show_Uriziel_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_ShowGland : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_ShowGland);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/IdlePose/Actions/Triggers/Man_Dialog_ShowItem_02_Montage1.Man_Dialog_ShowItem_02_Montage1'";
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_ShowMeatbugRagout : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_ShowMeatbugRagout);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/IdlePose/Actions/Triggers/Man_Dialog_Show_MeatbugRagout_Montage.Man_Dialog_Show_MeatbugRagout_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_ShowApple : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_ShowApple);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/IdlePose/Actions/Triggers/Man_Dialog_Show_Apple_Montage.Man_Dialog_Show_Apple_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_ShowAmulet : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_ShowAmulet);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/IdlePose/Actions/Triggers/Man_Dialog_ShowItem_01_Montage.Man_Dialog_ShowItem_01_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_InspectEgg : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_InspectEgg);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Dialogs/SpecificAudio/A_Man_Dialog_TEXT_WIP_EETMBHG_20241011_145230/Man_Dialog_TEXT_WIP_EETMBHG_20241011_145230_Montage.Man_Dialog_TEXT_WIP_EETMBHG_20241011_145230_Montage'";
    
    
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_Ugh : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_Ugh);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Dialogs/Poses/IdlePose/Actions/A_Man_Dialog_Ugh_Montage.A_Man_Dialog_Ugh_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_Sit_ReadScroll : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_ReadScrollSeated);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit/Read/Man_Conversation_Sit_ReadScroll_Montage.Man_Conversation_Sit_ReadScroll_Montage'";
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_Sit_ReadDrawing : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_ReadDrawingSeated);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit/Read/ReadScrollAbandonedMine/Man_Conversation_Sit_ReadScrollAbandonedMine_Montage.Man_Conversation_Sit_ReadScrollAbandonedMine_Montage'";
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_Sit_ReadNote : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_ReadNoteSeated);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit/Read/ReadNote/A_Man_Sit_ReadNote_Montage.A_Man_Sit_ReadNote_Montage'";
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_Sit_ReadBook : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_ReadBookSeated);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit/Dialog/IdlePose/Actions/Triggers/A_Man_Dialog_Sit_Read_Book/Man_Conversation_Sit_Read_Book_Montage.Man_Conversation_Sit_Read_Book_Montage'";
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_Sit_Drink : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_DrinkSeated);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_Drink/Man_Conversation_Sit_Drink_Montage.Man_Conversation_Sit_Drink_Montage'";
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);
}

UCLASS()
class UAbilityTask_Interaction_Human_Ladder : UAbilityTask_Interact_Ladder
{
    default m_LoadAssetsPriority = 150;
    default DefaultForCharacterClass.Add(AAIAgentCharacter_Human::StaticClass());
    default DefaultForCharacterClass.Add(AGothicPlayerCharacter::StaticClass());
    
	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Ladder/Man_Ladder_Locomotion.Man_Ladder_Locomotion'";

    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ladder);
}

UCLASS()
class UAbilityTask_NavLink_Frontkick : UAbilityTask_InteractionSpot_Montage
{
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Open/PT_OpenDoorMontage.PT_OpenDoorMontage'";

    default DefaultForCharacterClass.Add(AAIAgentCharacter_Human::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_NavLink);
    default bPossibleAnywhere = true;
    default bIsPartOfNavigation = true;

}

UCLASS()
class UAbilityTask_Interaction_NavLink_Open : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AAIAgentCharacter_Human::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Open_NavLink);
	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Crafting/NH_Interact_Rostisserie.NH_Interact_Rostisserie'";
    default bIsPartOfNavigation = true;
	//default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Open/PT_Open_Door_Montage.PT_Open_Door_Montage'";
}

//TODO continue
UCLASS()
class UAbilityTask_Interaction_Door_Open : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AAIAgentCharacter_Human::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Open_Door);
	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Open/PT_Open_Door_Montage.PT_Open_Door_Montage'";
    default bIsPartOfNavigation = true;
	//default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Open/PT_Open_Door_Montage.PT_Open_Door_Montage'";

    default Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker01"));

}

UCLASS()
class UAbilityTask_Interaction_NavLink_Close : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AAIAgentCharacter_Human::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Close_NavLink);
    default bIsPartOfNavigation = true;

    // UFUNCTION(BlueprintOverride)
    // FName GetEntrySection()
    // {
    //     auto NavLink = UGothicNavLinkCustomComponent::Get(UsedActor);

    //     if (NavLink == nullptr)
    //         return EntrySection;

    //     if (NavLink.ena)
    //         return n"GoAndClose";
    //     }
    //     else
    //     {
    //         return n"OpenGoAndClose";
    //     }
    // }

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Crafting/NH_Interact_Rostisserie.NH_Interact_Rostisserie'";
}

UCLASS()
class UAbilityTask_Interaction_Human_Pick : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Pick);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Crafting/NH_Interact_Rostisserie.NH_Interact_Rostisserie'";
}

// UCLASS()
// class UAbilityTask_Interaction_Human_Forge : UAbilityTask_Interaction_Human
// {
//     default DefaultInteractionForActions.AddTag(GameplayTag::Action_Crafting_Forge);
//     default MainMontage = n"";
// }

UCLASS()
class UAbilityTask_Interaction_Human_Sleep : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Bed);
    
    UPROPERTY() TSoftObjectPtr<UAnimMontage> SleepMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sleep_Ground/Man_SleepGround_Montage.Man_SleepGround_Montage'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default MainMontage = SleepMontage;

    default MontageEntryBackSection = n"Entry";
    default MontageEntryFrontSection = n"Entry";
    default MontageEntryLeftSection = n"Entry";
    default MontageEntryRightSection = n"Entry";

    default MontageExitBackSection = n"Exit";
    default MontageExitFrontSection = n"Exit";
    default MontageExitLeftSection = n"Exit";
    default MontageExitRightSection = n"Exit";

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        MainMontage = SleepMontage;

        Transitions.Add(TransitionToSection(SleepMontage, n"Entry", n"Loop"));

        Transitions.Add(TransitionExit(SleepMontage, n"Loop", n"Exit", Weight = 0.50f));
        Transitions.Add(TransitionExit(SleepMontage, n"Loop", n"Exit_SitUp", Weight = 0.50f));

    }

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;
}

UCLASS()
class UAbilityTask_Interaction_Human_Sleep_Standing : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep_Standing);

    UPROPERTY() TSoftObjectPtr<UAnimMontage> SleepStanding01 (n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sleep_Standing/Man_SleepStanding_01_Montage.Man_SleepStanding_01_Montage'");
    UPROPERTY() TSoftObjectPtr<UAnimMontage> SleepStanding02 (n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sleep_Standing/Man_SleepStanding_02_Montage.Man_SleepStanding_02_Montage'");
    UPROPERTY() TSoftObjectPtr<UAnimMontage> SleepStanding03 (n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sleep_Standing/Man_SleepStanding_03_Montage.Man_SleepStanding_03_Montage'");

    default bStartWhileMoving=false;

    default QuickExitMode = EInteractionFastExitMode::PlayFastExitIfAvailableOtherwiseBlendOut;
    default bAllowInterruptLoopOnCancel = true;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        int randomNumber = Math::RandRange(0,2);
        if( randomNumber == 0)
        {
            MainMontage = SleepStanding01;
        }
        else if(randomNumber == 1)
        {
            MainMontage = SleepStanding02;
        }
        else if(randomNumber == 2)
        {
            MainMontage = SleepStanding03;
        }  

        Transitions.Add(TransitionToSection(SleepStanding01, n"Entry", n"Loop"));
        Transitions.Add(TransitionToSection(SleepStanding02, n"Entry", n"Loop"));
        Transitions.Add(TransitionToSection(SleepStanding03, n"Entry", n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Sleep_Seated : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep_Seated);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_Sleep/Sit_Sleep/Man_Sit_Sleep_Montage.Man_Sit_Sleep_Montage'";
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Sleep_Table : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep_Table);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_Sleep/Sit_SleepTable/Man_Sit_SleepTable_Montage.Man_Sit_SleepTable_Montage'";
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Drink : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Drink);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Drink/Man_Digger_Drink_Montage.Man_Digger_Drink_Montage'";

    // How often should we try to do a transition?
    default AutoTransitionCheckSecondsMin = 3.0f;
    default AutoTransitionCheckSecondsMax = 5.0f;

    default OwnedTagsWhileActive.AddTag(GameplayTag::Smalltalk_Blocked);
    default bStartWhileMoving=false;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        // Drink sometimes when in the main montage's Loop
        // (This is a seamless transition within the same montage, so we wait until Loop has fully finished)
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop", Weight = 0.333f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop2", Weight = 0.333f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop3", Weight = 0.333f));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Drink", Weight = 0.5f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Drink2", Weight = 0.5f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Scratch", Weight = 0.20f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"ChangePose", Weight = 0.20f));
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Reposition", Weight = 0.25f));
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Look&Drink", Weight = 0.35f));
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Loop2", Weight = 0.35f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Loop3", Weight = 0.35f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop", Weight = 0.05f));
        // LOOP2
        Transitions.Add(TransitionToSection(MainMontage, n"Loop2", n"Drink", Weight = 0.5f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop2", n"Drink2", Weight = 0.5f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop2", n"Scratch", Weight = 0.20f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop2", n"ChangePose", Weight = 0.20f));
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop2", n"Reposition", Weight = 0.25f));
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop2", n"Look&Drink", Weight = 0.35f));
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop2", Weight = 0.05f));
        // LOOP3
        Transitions.Add(TransitionToSection(MainMontage, n"Loop3", n"Drink", Weight = 0.5f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop3", n"Drink2", Weight = 0.5f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop3", n"Scratch", Weight = 0.20f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop3", n"ChangePose", Weight = 0.20f));
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop3", n"Reposition", Weight = 0.25f));
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop3", n"Look&Drink", Weight = 0.35f));
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop3", Weight = 0.05f));
        
        // Toast, if the player is nearby
        // This is also within the same montage, but we can go whenever we want!
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Toast"));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 60.0f;
        Transitions.Last().Condition.BindUFunction(this, n"CanToast");
        Transitions.Add(TransitionToSection(MainMontage, n"Loop2", n"Toast"));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 60.0f;
        Transitions.Last().Condition.BindUFunction(this, n"CanToast");
        Transitions.Add(TransitionToSection(MainMontage, n"Loop3", n"Toast"));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 60.0f;
        Transitions.Last().Condition.BindUFunction(this, n"CanToast");
    }

    UFUNCTION()
    bool CanToast()
    {
        auto Player = Gameplay::GetPlayerCharacter(0);

        if (Self.GetDistanceTo(Player) > 300.0f)
            return false;

        if (!Self.Controller.LineOfSightTo(Player))
            return false;

        // TODO: Check orientation

        return true;
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Drink_Seated : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Drink_Seated);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_Drink/Man_Digger_Sit_Drink_Montage.Man_Digger_Sit_Drink_Montage'";

    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    
    // How often should we try to do a transition?
    default AutoTransitionCheckSecondsMin = 5.0f;
    default AutoTransitionCheckSecondsMax = 10.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        // ENTRY
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop2", Weight = 0.5f));
        // LOOP
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker01", Weight = 0.75f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker02", Weight = 0.5f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Drink2", Weight = 0.5f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"ChangePose", Weight = 0.25f));
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"LookBottle", Weight = 0.3f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Reposition", Weight = 0.1f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Scratch", Weight = 0.35f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop", Weight = 0.05f));
        // LOOP2
        Transitions.Add(TransitionToSection(MainMontage, n"Loop2", n"Breaker01", Weight = 0.75f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop2", n"Breaker02", Weight = 0.5f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop2", n"Drink2", Weight = 0.5f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop2", n"ChangePose", Weight = 0.25f));
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop2", n"LookBottle", Weight = 0.3f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop2", n"Reposition", Weight = 0.1f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop2", n"Scratch", Weight = 0.35f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop2", Weight = 0.05f));
        // TRANSITIONS TO LOOP
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker01", n"Loop", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker01", n"Loop2", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker02", n"Loop", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker02", n"Loop2", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Drink2", n"Loop", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Drink2", n"Loop2", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"ChangePose", n"Loop", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"ChangePose", n"Loop2", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"LookBottle", n"Loop", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"LookBottle", n"Loop2", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reposition", n"Loop", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reposition", n"Loop2", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Scratch", n"Loop", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Scratch", n"Loop2", Weight = 0.5f));

    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Drink_Ground : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Drink_Ground);
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Ground);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/SitGround/Drink/Man_SitGround_Drink_Montage.Man_SitGround_Drink_Montage'";

    // How often should we try to do a transition?
    default AutoTransitionCheckSecondsMin = 5.0f;
    default AutoTransitionCheckSecondsMax = 10.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        // ENTRY
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop02", Weight = 0.5f));
        // LOOP
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker01", Weight = 0.75f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker02", Weight = 0.1f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker03", Weight = 0.5f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker04", Weight = 0.5f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker05", Weight = 0.35f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop", Weight = 0.05f));
        // LOOP02
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker01", Weight = 0.75f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker02", Weight = 0.1f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker03", Weight = 0.5f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker04", Weight = 0.5f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker05", Weight = 0.35f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop02", Weight = 0.05f));
        // TRANSITIONS TO LOOP
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker01", n"Loop", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker01", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker02", n"Loop", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker02", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker03", n"Loop", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker03", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker04", n"Loop", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker04", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker05", n"Loop", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker05", n"Loop02", Weight = 0.5f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Eat : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat);
    UPROPERTY() TSoftObjectPtr<UAnimMontage> EatBowlMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Eat/Man_Digger_Eat_Bowl_Montage.Man_Digger_Eat_Bowl_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> EatThighMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Eat/Thigh/Man_Eat_Thigh_Montage.Man_Eat_Thigh_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> EatItemMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Eat/Item/Man_Eat_Item_Montage.Man_Eat_Item_Montage'";

    // How often should we try to do a transition?
    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 5.0f;

    default OwnedTagsWhileActive.AddTag(GameplayTag::Smalltalk_Blocked);
    default bStartWhileMoving=false;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        int randomNumber = Math::RandRange(0,2);
        if( randomNumber == 0)
        {
            MainMontage = EatBowlMontage;
        }
        else if(randomNumber == 1)
        {
            MainMontage = EatThighMontage;
        }
        else if(randomNumber == 2)
        {
            MainMontage = EatItemMontage;
        }


        //EAT BOWL MONTAGE
        Transitions.Add(TransitionToSection(EatBowlMontage, FromSection = n"Entry", ToSection = n"Loop", Weight = 0.33f));
        Transitions.Add(TransitionToSection(EatBowlMontage, FromSection = n"Entry", ToSection = n"Loop02", Weight = 0.33f));
        Transitions.Add(TransitionToSection(EatBowlMontage, FromSection = n"Entry", ToSection = n"Loop03", Weight = 0.33f));

        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop", n"Breaker01", Weight = 0.5f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop02", n"Breaker01", Weight = 0.5f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop03", n"Breaker01", Weight = 0.5f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Breaker01", n"Loop", Weight = 0.333f));
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Breaker01", n"Loop02", Weight = 0.333f));
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Breaker01", n"Loop03", Weight = 0.333f));
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop", n"Breaker02", Weight = 0.15f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop02", n"Breaker02", Weight = 0.15f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop03", n"Breaker02", Weight = 0.15f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Breaker02", n"Loop", Weight = 0.333f));
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Breaker02", n"Loop02", Weight = 0.333f));
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Breaker02", n"Loop03", Weight = 0.333f));
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop", n"Breaker03", Weight = 0.5f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop02", n"Breaker03", Weight = 0.5f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop03", n"Breaker03", Weight = 0.5f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Breaker03", n"Loop", Weight = 0.333f));
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Breaker03", n"Loop02", Weight = 0.333f));
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Breaker03", n"Loop03", Weight = 0.333f));
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop", n"Breaker04", Weight = 0.25f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop02", n"Breaker04", Weight = 0.25f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop03", n"Breaker04", Weight = 0.25f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Breaker04", n"Loop", Weight = 0.333f));
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Breaker04", n"Loop02", Weight = 0.333f));
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Breaker04", n"Loop03", Weight = 0.333f));
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop", n"Breaker05", Weight = 0.2f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop02", n"Breaker05", Weight = 0.2f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop03", n"Breaker05", Weight = 0.2f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Breaker05", n"Loop", Weight = 0.333f));
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Breaker05", n"Loop02", Weight = 0.333f));
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Breaker05", n"Loop03", Weight = 0.333f));

        //EAT THIGH MONTAGE
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Entry", ToSection = n"Loop01", Weight = 0.33f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Entry", ToSection = n"Loop02", Weight = 0.33f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Entry", ToSection = n"Loop03", Weight = 0.33f));

        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop01", n"IdleBreaker01"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop02", n"IdleBreaker01"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop03", n"IdleBreaker01"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker01", n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker01", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker01", n"Loop03", Weight = 0.5f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop01", n"IdleBreaker02"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop02", n"IdleBreaker02"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop03", n"IdleBreaker02"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker02", n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker02", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker02", n"Loop03", Weight = 0.5f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop01", n"IdleBreaker03"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop02", n"IdleBreaker03"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop03", n"IdleBreaker03"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker03", n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker03", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker03", n"Loop03", Weight = 0.5f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop01", n"IdleBreaker04"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop02", n"IdleBreaker04"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop03", n"IdleBreaker04"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker04", n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker04", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker04", n"Loop03", Weight = 0.5f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop01", n"IdleBreaker05"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop02", n"IdleBreaker05"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop03", n"IdleBreaker05"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker05", n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker05", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker05", n"Loop03", Weight = 0.5f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop01", n"IdleBreaker06"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop02", n"IdleBreaker06"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop03", n"IdleBreaker06"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker06", n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker06", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker06", n"Loop03", Weight = 0.5f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop01", n"IdleBreaker07"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop02", n"IdleBreaker07"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop03", n"IdleBreaker07"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker07", n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker07", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker07", n"Loop03", Weight = 0.5f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop01", n"IdleBreaker08"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop02", n"IdleBreaker08"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop03", n"IdleBreaker08"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker08", n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker08", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker08", n"Loop03", Weight = 0.5f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop01", n"IdleBreaker09"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop02", n"IdleBreaker09"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop03", n"IdleBreaker09"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker09", n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker09", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker09", n"Loop03", Weight = 0.5f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop01", n"IdleBreaker10"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop02", n"IdleBreaker10"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"Loop03", n"IdleBreaker10"));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker10", n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker10", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(EatThighMontage, n"IdleBreaker10", n"Loop03", Weight = 0.5f));

        //EAT ITEM MONTAGE
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Entry", ToSection = n"Loop01", Weight = 0.33f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Entry", ToSection = n"Loop02", Weight = 0.33f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Entry", ToSection = n"Loop03", Weight = 0.33f));
        
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Loop01", ToSection = n"Eat01", Weight = 0.3f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Loop01", ToSection = n"Eat02", Weight = 0.3f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Loop01", ToSection = n"Scratching", Weight = 0.25f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Loop01", ToSection = n"Clean", Weight = 0.25f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Loop01", ToSection = n"Yawning", Weight = 0.3f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Loop01", ToSection = n"Talking01", Weight = 0.2f));
        Transitions.Last().bSeamless=false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Loop01", ToSection = n"Talking02", Weight = 0.2f));
        Transitions.Last().bSeamless=false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Loop01", ToSection = n"Listen", Weight = 0.2f));
        Transitions.Last().bSeamless=false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Loop01", ToSection = n"Throw", Weight = 0.25f));
        Transitions.Last().bSeamless=false;

        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Loop02", ToSection = n"Eat01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Loop02", ToSection = n"Eat02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Loop02", ToSection = n"Scratching", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Loop02", ToSection = n"Clean", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Loop02", ToSection = n"Yawning", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Loop02", ToSection = n"Throw", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Loop03", ToSection = n"Eat01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Loop03", ToSection = n"Eat02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Loop03", ToSection = n"Scratching", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Loop03", ToSection = n"Clean", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Loop03", ToSection = n"Yawning", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Loop03", ToSection = n"Throw", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Eat01", ToSection = n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Eat01", ToSection = n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Eat01", ToSection = n"Loop03", Weight = 0.2f));
        
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Eat02", ToSection = n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Eat02", ToSection = n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Eat02", ToSection = n"Loop03", Weight = 0.2f));
        
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Scratching", ToSection = n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Scratching", ToSection = n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Scratching", ToSection = n"Loop03", Weight = 0.2f));
        
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Clean", ToSection = n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Clean", ToSection = n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Clean", ToSection = n"Loop03", Weight = 0.2f));
        
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Yawning", ToSection = n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Yawning", ToSection = n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Yawning", ToSection = n"Loop03", Weight = 0.2f));
        
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Talking01", ToSection = n"Loop01"));
        Transitions.Last().BlockOtherTransitionsForSeconds=2.0f;

        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Talking02", ToSection = n"Loop01"));
        Transitions.Last().BlockOtherTransitionsForSeconds=2.0f;
        
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Listen", ToSection = n"Loop01"));
        Transitions.Last().BlockOtherTransitionsForSeconds=2.0f;
        
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Throw", ToSection = n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Throw", ToSection = n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(EatItemMontage, FromSection = n"Throw", ToSection = n"Loop03", Weight = 0.2f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Eat_Bowl : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat_Bowl);
    // default SubtaskOf.AddTag(GameplayTag::Action_Ambient_Eat);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Eat/Man_Digger_Eat_Bowl_Montage.Man_Digger_Eat_Bowl_Montage'";

    default bStartWhileMoving=false;

    // How often should we try to do a transition?
    default AutoTransitionCheckSecondsMin = 3.0f;
    default AutoTransitionCheckSecondsMax = 7.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        //EAT BOWL MONTAGE
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop", Weight = 0.33f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop02", Weight = 0.33f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop03", Weight = 0.33f));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker01", Weight = 0.5f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker01", Weight = 0.5f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Breaker01", Weight = 0.5f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker01", n"Loop", Weight = 0.3333f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker01", n"Loop02", Weight = 0.3333f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker01", n"Loop03", Weight = 0.3333f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker02", Weight = 0.15f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker02", Weight = 0.15f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Breaker02", Weight = 0.15f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker02", n"Loop", Weight = 0.3333f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker02", n"Loop02", Weight = 0.3333f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker02", n"Loop03", Weight = 0.3333f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker03", Weight = 0.5f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker03", Weight = 0.5f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Breaker03", Weight = 0.5f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker03", n"Loop", Weight = 0.3333f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker03", n"Loop02", Weight = 0.3333f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker03", n"Loop03", Weight = 0.3333f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker04", Weight = 0.25f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker04", Weight = 0.25f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Breaker04", Weight = 0.25f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker04", n"Loop", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker04", n"Loop02", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker04", n"Loop03", Weight = 0.3333f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker04", n"Breaker03", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker04", n"Breaker01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker02", n"Breaker01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker02", n"Breaker03", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker05", Weight = 0.2f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker05", Weight = 0.2f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Breaker05", Weight = 0.2f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker05", n"Loop", Weight = 0.3333f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker05", n"Loop02", Weight = 0.3333f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker05", n"Loop03", Weight = 0.3333f));

    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Eat_Thigh : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat_Thigh);
    // default SubtaskOf.AddTag(GameplayTag::Action_Ambient_Eat);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Eat/Thigh/Man_Eat_Thigh_Montage.Man_Eat_Thigh_Montage'";

    default bStartWhileMoving=false;

    // How often should we try to do a transition?
    default AutoTransitionCheckSecondsMin = 1.0f;
    default AutoTransitionCheckSecondsMax = 1.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        //EAT THIGH MONTAGE
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01", Weight = 0.33f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop02", Weight = 0.33f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop03", Weight = 0.33f));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"IdleBreaker01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"IdleBreaker01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"IdleBreaker01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker01", n"Loop01", Weight = 0.45f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker01", n"Loop02", Weight = 0.6f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker01", n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"IdleBreaker02", Weight = 0.55f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"IdleBreaker02", Weight = 0.55f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"IdleBreaker02", Weight = 0.55f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker02", n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker02", n"Loop02", Weight = 0.6f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker02", n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"IdleBreaker03", Weight = 0.45f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"IdleBreaker03", Weight = 0.45f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"IdleBreaker03", Weight = 0.45f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker03", n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker03", n"Loop02", Weight = 0.6f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker03", n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"IdleBreaker04", Weight = 0.55f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"IdleBreaker04", Weight = 0.55f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"IdleBreaker04", Weight = 0.55f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker04", n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker04", n"Loop02", Weight = 0.6f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker04", n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"IdleBreaker05", Weight = 0.6f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"IdleBreaker05", Weight = 0.6f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"IdleBreaker05", Weight = 0.6f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker05", n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker05", n"Loop02", Weight = 0.6f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker05", n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"IdleBreaker06", Weight = 0.6f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"IdleBreaker06", Weight = 0.6f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"IdleBreaker06", Weight = 0.6f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker06", n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker06", n"Loop02", Weight = 0.6f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker06", n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"IdleBreaker07", Weight = 0.6f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"IdleBreaker07", Weight = 0.6f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"IdleBreaker07", Weight = 0.6f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker07", n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker07", n"Loop02", Weight = 0.6f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker07", n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"IdleBreaker08", Weight = 0.6f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"IdleBreaker08", Weight = 0.6f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"IdleBreaker08", Weight = 0.6f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker08", n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker08", n"Loop02", Weight = 0.6f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker08", n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"IdleBreaker09", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"IdleBreaker09", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"IdleBreaker09", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker09", n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker09", n"Loop02", Weight = 0.6f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker09", n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"IdleBreaker10", Weight = 0.45f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"IdleBreaker10", Weight = 0.45f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"IdleBreaker10", Weight = 0.45f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker10", n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker10", n"Loop02", Weight = 0.6f));
        Transitions.Add(TransitionToSection(MainMontage, n"IdleBreaker10", n"Loop03", Weight = 0.3f));
    }
}

class UAbilityTask_Interaction_Human_Eat_Inventory : UAbilityTask_Interaction_Human
{
    //It's necessary to put the item on the animatitons
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat_Inventory);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Eat/Item/Man_Eat_Item_Montage.Man_Eat_Item_Montage'";

    default bStartWhileMoving=false;

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01", Weight = 0.33f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop02", Weight = 0.33f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop03", Weight = 0.33f));
        
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Eat01", Weight = 0.3f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Eat02", Weight = 0.3f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Scratching", Weight = 0.25f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Clean", Weight = 0.25f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Yawning", Weight = 0.3f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Talking01", Weight = 0.2f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Talking02", Weight = 0.2f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Listen", Weight = 0.2f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Throw", Weight = 0.25f));
        Transitions.Last().bSeamless=false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Eat01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Eat02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Scratching", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Clean", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Yawning", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Throw", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Eat01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Eat02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Scratching", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Clean", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Yawning", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Throw", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Eat01", ToSection = n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Eat01", ToSection = n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Eat01", ToSection = n"Loop03", Weight = 0.2f));
        
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Eat02", ToSection = n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Eat02", ToSection = n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Eat02", ToSection = n"Loop03", Weight = 0.2f));
        
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Scratching", ToSection = n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Scratching", ToSection = n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Scratching", ToSection = n"Loop03", Weight = 0.2f));
        
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Clean", ToSection = n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Clean", ToSection = n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Clean", ToSection = n"Loop03", Weight = 0.2f));
        
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Yawning", ToSection = n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Yawning", ToSection = n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Yawning", ToSection = n"Loop03", Weight = 0.2f));
        
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Talking01", ToSection = n"Loop01"));
        Transitions.Last().BlockOtherTransitionsForSeconds=2.0f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Talking02", ToSection = n"Loop01"));
        Transitions.Last().BlockOtherTransitionsForSeconds=2.0f;
        
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Listen", ToSection = n"Loop01"));
        Transitions.Last().BlockOtherTransitionsForSeconds=2.0f;
        
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Throw", ToSection = n"Loop01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Throw", ToSection = n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Throw", ToSection = n"Loop03", Weight = 0.2f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Eat_Seated : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat_Seated);
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);

    UPROPERTY() TSoftObjectPtr<UAnimMontage> EatThighMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_Eat/Thigh/Man_Sit_Eat_Thigh_Montage.Man_Sit_Eat_Thigh_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> EatBowlMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_Eat/Man_Digger_Sit_Eat_Bowl_Montage.Man_Digger_Sit_Eat_Bowl_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> EatItemMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_Eat/Item/A_Man_Sit_Eat_Item_Montage.A_Man_Sit_Eat_Item_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default OwnedTagsWhileActive.AddTag(GameplayTag::Smalltalk_Blocked);

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {

        int randomNumber = Math::RandRange(0,2);
        if( randomNumber == 0)
        {
            MainMontage = EatBowlMontage;
        }
        else if(randomNumber == 1)
        {
            MainMontage = EatThighMontage;
        }
        else if(randomNumber == 2)
        {
            MainMontage = EatItemMontage;
        }

        //EAT BOWL SECTION
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Entry", n"Loop", Weight = 0.3333f));
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Entry", n"Loop2", Weight = 0.3333f));
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Entry", n"Loop3", Weight = 0.3333f));

        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop", n"Loop2", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop", n"Loop3", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop", n"Breaker01", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop", n"Breaker02", Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop", n"Breaker03", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop", n"Breaker04", Weight = 0.05f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop", n"Breaker05", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop", n"Breaker06", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(EatBowlMontage, n"Loop", Weight = 0.10f));

        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop2", n"Loop", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop2", n"Loop3", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop2", n"Breaker01", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop2", n"Breaker02", Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop2", n"Breaker03", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop2", n"Breaker04", Weight = 0.05f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop2", n"Breaker05", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop2", n"Breaker06", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(EatBowlMontage, n"Loop2", Weight = 0.10f));

        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop3", n"Loop2", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop3", n"Loop3", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop3", n"Breaker01", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop3", n"Breaker02", Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop3", n"Breaker03", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop3", n"Breaker04", Weight = 0.05f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop3", n"Breaker05", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatBowlMontage, n"Loop3", n"Breaker06", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(EatBowlMontage, n"Loop3", Weight = 0.10f));

        Transitions.Add(TransitionToSection(EatBowlMontage, FromSection = n"Breaker01", ToSection = n"Loop", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatBowlMontage, FromSection = n"Breaker01", ToSection = n"Loop2", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatBowlMontage, FromSection = n"Breaker01", ToSection = n"Loop3", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatBowlMontage, FromSection = n"Breaker02", ToSection = n"Loop", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatBowlMontage, FromSection = n"Breaker02", ToSection = n"Loop2", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatBowlMontage, FromSection = n"Breaker02", ToSection = n"Loop3", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatBowlMontage, FromSection = n"Breaker03", ToSection = n"Loop", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatBowlMontage, FromSection = n"Breaker03", ToSection = n"Loop2", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatBowlMontage, FromSection = n"Breaker03", ToSection = n"Loop3", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatBowlMontage, FromSection = n"Breaker04", ToSection = n"Loop", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatBowlMontage, FromSection = n"Breaker04", ToSection = n"Loop2", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatBowlMontage, FromSection = n"Breaker04", ToSection = n"Loop3", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatBowlMontage, FromSection = n"Breaker05", ToSection = n"Loop", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatBowlMontage, FromSection = n"Breaker05", ToSection = n"Loop2", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatBowlMontage, FromSection = n"Breaker05", ToSection = n"Loop3", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatBowlMontage, FromSection = n"Breaker06", ToSection = n"Loop", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatBowlMontage, FromSection = n"Breaker06", ToSection = n"Loop2", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatBowlMontage, FromSection = n"Breaker06", ToSection = n"Loop3", Weight = 0.3f));

        //EAT THIGH SECTION
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Entry", ToSection = n"Loop01"));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Entry", ToSection = n"Loop02"));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Entry", ToSection = n"Loop03"));

        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop01", ToSection = n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop01", ToSection = n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop01", ToSection = n"Eat01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop01", ToSection = n"Eat02", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop01", ToSection = n"Scratch", Weight = 0.2f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop01", ToSection = n"Yawn", Weight = 0.2f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop01", ToSection = n"Talk01", Weight = 0.2f));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Speak);
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop01", ToSection = n"Talk02", Weight = 0.2f));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Speak);
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop01", ToSection = n"Listen", Weight = 0.2f));
        Transitions.Add(TransitionStay(EatThighMontage, n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop02", ToSection = n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop02", ToSection = n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop02", ToSection = n"Eat01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop02", ToSection = n"Eat02", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop02", ToSection = n"Scratch", Weight = 0.2f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop02", ToSection = n"Yawn", Weight = 0.2f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop02", ToSection = n"Talk01", Weight = 0.2f));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Speak);
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop02", ToSection = n"Talk02", Weight = 0.2f));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Speak);
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop02", ToSection = n"Listen", Weight = 0.2f));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionStay(EatThighMontage, n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop03", ToSection = n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop03", ToSection = n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop03", ToSection = n"Eat01", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop03", ToSection = n"Eat02", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop03", ToSection = n"Scratch", Weight = 0.2f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop03", ToSection = n"Yawn", Weight = 0.2f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop03", ToSection = n"Talk01", Weight = 0.2f));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Speak);
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop03", ToSection = n"Talk02", Weight = 0.2f));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Speak);
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Loop03", ToSection = n"Listen", Weight = 0.2f));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionStay(EatThighMontage, n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Eat01", ToSection = n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Eat01", ToSection = n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Eat01", ToSection = n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Eat02", ToSection = n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Eat02", ToSection = n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Eat02", ToSection = n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Scratch", ToSection = n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Scratch", ToSection = n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Scratch", ToSection = n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Yawn", ToSection = n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Yawn", ToSection = n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Yawn", ToSection = n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Talk01", ToSection = n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Talk01", ToSection = n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Talk01", ToSection = n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Talk02", ToSection = n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Talk02", ToSection = n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Talk02", ToSection = n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Listen", ToSection = n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Listen", ToSection = n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(EatThighMontage, FromSection = n"Listen", ToSection = n"Loop03", Weight = 0.3f));
        

        //EAT ITEM SECTION
        Transitions.Add(TransitionToSection(EatItemMontage, n"Entry", n"Loop01", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Entry", n"Loop02", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Entry", n"Loop03", Weight = 0.20f));

        Transitions.Add(TransitionToSection(EatItemMontage, n"Loop01", n"Eat01", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Loop01", n"Eat02", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Loop01", n"Scratch", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Loop01", n"Clean", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Loop01", n"Yawn", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Loop01", n"Talk01", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Loop01", n"Talk02", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Loop01", n"Listen", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Loop02", n"Eat01", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Loop02", n"Eat02", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Loop02", n"Scratch", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Loop02", n"Clean", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Loop02", n"Yawn", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Loop02", n"Talk01", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Loop02", n"Talk02", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Loop02", n"Listen", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Loop03", n"Eat01", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Loop03", n"Eat02", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Loop03", n"Scratch", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Loop03", n"Clean", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Loop03", n"Yawn", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Loop03", n"Talk01", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Loop03", n"Talk02", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Loop03", n"Listen", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Eat01", n"Loop01", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Eat01", n"Loop02", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Eat01", n"Loop03", Weight = 0.20f));
        
        Transitions.Add(TransitionToSection(EatItemMontage, n"Eat02", n"Loop01", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Eat02", n"Loop02", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Eat02", n"Loop03", Weight = 0.20f));
        
        Transitions.Add(TransitionToSection(EatItemMontage, n"Scratch", n"Loop01", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Scratch", n"Loop02", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Scratch", n"Loop03", Weight = 0.20f));
        
        Transitions.Add(TransitionToSection(EatItemMontage, n"Clean", n"Loop01", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Clean", n"Loop02", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Clean", n"Loop03", Weight = 0.20f));
        
        Transitions.Add(TransitionToSection(EatItemMontage, n"Yawn", n"Loop01", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Yawn", n"Loop02", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Yawn", n"Loop03", Weight = 0.20f));
        
        Transitions.Add(TransitionToSection(EatItemMontage, n"Talk01", n"Loop01", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Talk01", n"Loop02", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Talk01", n"Loop03", Weight = 0.20f));
        
        Transitions.Add(TransitionToSection(EatItemMontage, n"Talk02", n"Loop01", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Talk02", n"Loop02", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Talk02", n"Loop03", Weight = 0.20f));
        
        Transitions.Add(TransitionToSection(EatItemMontage, n"Listen", n"Loop01", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Listen", n"Loop02", Weight = 0.20f));
        Transitions.Add(TransitionToSection(EatItemMontage, n"Listen", n"Loop03", Weight = 0.20f));
        
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Eat_Seated_Thigh : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat_Seated_Thigh);
    // default SubtaskOf.AddTag(GameplayTag::Action_Ambient_Eat_Seated);
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_Eat/Thigh/Man_Sit_Eat_Thigh_Montage.Man_Sit_Eat_Thigh_Montage'";
    

    default AutoTransitionCheckSecondsMin = 4.0f;
    default AutoTransitionCheckSecondsMax = 5.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        //EAT THIGH SECTION
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01"));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop02"));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop03"));

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop02", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop03", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Eat01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Eat02", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Scratch", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Yawn", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Talk01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Speak);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Talk02", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Speak);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Listen", Weight = 0.9f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.1f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop01", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop03", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Eat01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Eat02", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Scratch", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Yawn", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Talk01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Speak);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Talk02", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Speak);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Listen", Weight = 0.9f));
        //Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop02", Weight = 0.1f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop01", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop02", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Eat01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Eat02", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Scratch", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Yawn", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Talk01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Speak);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Talk02", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Speak);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Listen", Weight = 0.9f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop03", Weight = 0.1f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Eat01", ToSection = n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Eat01", ToSection = n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Eat01", ToSection = n"Loop03", Weight = 0.3f));
        
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Eat02", ToSection = n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Eat02", ToSection = n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Eat02", ToSection = n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Scratch", ToSection = n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Scratch", ToSection = n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Scratch", ToSection = n"Loop03", Weight = 0.3f));
        
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Yawn", ToSection = n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Yawn", ToSection = n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Yawn", ToSection = n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Talk01", ToSection = n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Talk01", ToSection = n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Talk01", ToSection = n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Talk02", ToSection = n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Talk02", ToSection = n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Talk02", ToSection = n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Listen", ToSection = n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Listen", ToSection = n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Listen", ToSection = n"Loop03", Weight = 0.3f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Eat_Seated_Bowl : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat_Seated_Bowl);
    // default SubtaskOf.AddTag(GameplayTag::Action_Ambient_Eat_Seated);
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_Eat/Man_Digger_Sit_Eat_Bowl_Montage.Man_Digger_Sit_Eat_Bowl_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 7.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        //EAT BOWL SECTION
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop", Weight = 0.3333f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop2", Weight = 0.3333f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop3", Weight = 0.3333f));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Loop2", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Loop3", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker01", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker02", Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker03", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker04", Weight = 0.05f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker05", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker06", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop", Weight = 0.10f));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop2", n"Loop", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop2", n"Loop3", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop2", n"Breaker01", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop2", n"Breaker02", Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop2", n"Breaker03", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop2", n"Breaker04", Weight = 0.05f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop2", n"Breaker05", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop2", n"Breaker06", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop2", Weight = 0.10f));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop3", n"Loop2", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop3", n"Loop3", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop3", n"Breaker01", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop3", n"Breaker02", Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop3", n"Breaker03", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop3", n"Breaker04", Weight = 0.05f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop3", n"Breaker05", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop3", n"Breaker06", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop3", Weight = 0.10f));

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker01", ToSection = n"Loop", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker01", ToSection = n"Loop2", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker01", ToSection = n"Loop3", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker02", ToSection = n"Loop", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker02", ToSection = n"Loop2", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker02", ToSection = n"Loop3", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker03", ToSection = n"Loop", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker03", ToSection = n"Loop2", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker03", ToSection = n"Loop3", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker04", ToSection = n"Loop", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker04", ToSection = n"Loop2", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker04", ToSection = n"Loop3", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker05", ToSection = n"Loop", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker05", ToSection = n"Loop2", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker05", ToSection = n"Loop3", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker06", ToSection = n"Loop", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker06", ToSection = n"Loop2", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker06", ToSection = n"Loop3", Weight = 0.3f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Women_Eat_Seated_Bowl : UAbilityTask_Interaction_Human_Women_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat_Seated_Bowl);
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Women/Living/Sit/Eat/Woman_Sit_Eat_Montage.Woman_Sit_Eat_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 7.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker01", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 18.0f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker02", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 20.0f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker03", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 15.0f;
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Eat_Seated_Item : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat_Seated_Item);
    //default SubtaskOf.AddTag(GameplayTag::Action_Ambient_Eat_Seated);
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_Eat/Item/A_Man_Sit_Eat_Item_Montage.A_Man_Sit_Eat_Item_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 6.0f;

    bool bLoop01Seamless=false;
    bool bLoop02Seamless=false;
    bool bLoop03Seamless=false;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        //EAT ITEM SECTION
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop01", Weight = 0.20f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop02", Weight = 0.20f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop03", Weight = 0.20f));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Eat01", Weight = 0.50f));
        Transitions.Last().bSeamless=bLoop01Seamless;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Eat02", Weight = 0.50f));
        Transitions.Last().bSeamless=bLoop01Seamless;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Scratch", Weight = 0.40f));
        Transitions.Last().bSeamless=bLoop01Seamless;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Clean", Weight = 0.3f));
        Transitions.Last().bSeamless=bLoop01Seamless;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Yawn", Weight = 0.40f));
        Transitions.Last().bSeamless=bLoop01Seamless;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Talk01", Weight = 0.20f));
        Transitions.Last().bSeamless=bLoop01Seamless;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Talk02", Weight = 0.20f));
        Transitions.Last().bSeamless=bLoop01Seamless;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Listen", Weight = 0.20f));
        Transitions.Last().bSeamless=bLoop01Seamless;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Eat01", Weight = 0.50f));
        Transitions.Last().bSeamless=bLoop02Seamless;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Eat02", Weight = 0.50f));
        Transitions.Last().bSeamless=bLoop02Seamless;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Scratch", Weight = 0.40f));
        Transitions.Last().bSeamless=bLoop02Seamless;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Clean", Weight = 0.3f));
        Transitions.Last().bSeamless=bLoop02Seamless;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Yawn", Weight = 0.40f));
        Transitions.Last().bSeamless=bLoop02Seamless;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Talk01", Weight = 0.20f));
        Transitions.Last().bSeamless=bLoop02Seamless;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Talk02", Weight = 0.20f));
        Transitions.Last().bSeamless=bLoop02Seamless;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Listen", Weight = 0.20f));
        Transitions.Last().bSeamless=bLoop02Seamless;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Eat01", Weight = 0.50f));
        Transitions.Last().bSeamless=bLoop03Seamless;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Eat02", Weight = 0.50f));
        Transitions.Last().bSeamless=bLoop03Seamless;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Scratch", Weight = 0.40f));
        Transitions.Last().bSeamless=bLoop03Seamless;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Clean", Weight = 0.3f));
        Transitions.Last().bSeamless=bLoop03Seamless;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Yawn", Weight = 0.40f));
        Transitions.Last().bSeamless=bLoop03Seamless;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Talk01", Weight = 0.20f));
        Transitions.Last().bSeamless=bLoop03Seamless;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Talk02", Weight = 0.20f));
        Transitions.Last().bSeamless=bLoop03Seamless;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Listen", Weight = 0.20f));
        Transitions.Last().bSeamless=bLoop03Seamless;

        Transitions.Add(TransitionToSection(MainMontage, n"Eat01", n"Loop01", Weight = 0.10f));
        Transitions.Add(TransitionToSection(MainMontage, n"Eat02", n"Loop01", Weight = 0.10f));
        Transitions.Add(TransitionToSection(MainMontage, n"Scratch", n"Loop01", Weight = 0.10f));
        Transitions.Add(TransitionToSection(MainMontage, n"Clean", n"Loop01", Weight = 0.10f));
        Transitions.Add(TransitionToSection(MainMontage, n"Yawn", n"Loop01", Weight = 0.10f));
        Transitions.Add(TransitionToSection(MainMontage, n"Talk01", n"Loop01", Weight = 0.10f));
        Transitions.Add(TransitionToSection(MainMontage, n"Talk02", n"Loop01", Weight = 0.10f));
        Transitions.Add(TransitionToSection(MainMontage, n"Listen", n"Loop01", Weight = 0.10f));
        
        Transitions.Add(TransitionToSection(MainMontage, n"Eat01", n"Loop02", Weight = 0.30f));
        Transitions.Add(TransitionToSection(MainMontage, n"Eat02", n"Loop02", Weight = 0.30f));
        Transitions.Add(TransitionToSection(MainMontage, n"Scratch", n"Loop02", Weight = 0.30f));
        Transitions.Add(TransitionToSection(MainMontage, n"Clean", n"Loop02", Weight = 0.30f));
        Transitions.Add(TransitionToSection(MainMontage, n"Yawn", n"Loop02", Weight = 0.30f));
        Transitions.Add(TransitionToSection(MainMontage, n"Talk01", n"Loop02", Weight = 0.30f));
        Transitions.Add(TransitionToSection(MainMontage, n"Talk02", n"Loop02", Weight = 0.30f));
        Transitions.Add(TransitionToSection(MainMontage, n"Listen", n"Loop02", Weight = 0.30f));
        
        Transitions.Add(TransitionToSection(MainMontage, n"Eat01", n"Loop03", Weight = 0.10f));
        Transitions.Add(TransitionToSection(MainMontage, n"Eat02", n"Loop03", Weight = 0.10f));
        Transitions.Add(TransitionToSection(MainMontage, n"Scratch", n"Loop03", Weight = 0.10f));
        Transitions.Add(TransitionToSection(MainMontage, n"Clean", n"Loop03", Weight = 0.10f));
        Transitions.Add(TransitionToSection(MainMontage, n"Yawn", n"Loop03", Weight = 0.10f));
        Transitions.Add(TransitionToSection(MainMontage, n"Talk01", n"Loop03", Weight = 0.10f));
        Transitions.Add(TransitionToSection(MainMontage, n"Talk02", n"Loop03", Weight = 0.10f));
        Transitions.Add(TransitionToSection(MainMontage, n"Listen", n"Loop03", Weight = 0.10f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Eat_Ground : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat_Ground);
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Ground);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/SitGround/Eat_Thigh/Man_SitGround_Eat_Thigh_Montage.Man_SitGround_Eat_Thigh_Montage'";

    // How often should we try to do a transition?
    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 5.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        // ENTRY
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop02", Weight = 0.5f));
        // LOOP
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker01", Weight = 0.65f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker02", Weight = 0.05f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker03", Weight = 0.35f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker04", Weight = 0.4f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker05", Weight = 0.45f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop", Weight = 0.15f));
        // LOOP02
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker01", Weight = 0.65f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker02", Weight = 0.05f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker03", Weight = 0.35f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker04", Weight = 0.4f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker05", Weight = 0.45f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop02", Weight = 0.15f));
        // TRANSITIONS TO LOOP
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker01", n"Loop", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker01", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker02", n"Loop", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker02", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker03", n"Loop", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker03", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker04", n"Loop", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker04", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker05", n"Loop", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker05", n"Loop02", Weight = 0.5f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Disturb : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Disturb);
    
    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 6.0f;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Drunk/Angry/Man_Angry_Drunk_Montage.Man_Angry_Drunk_Montage'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        //STAND MONTAGE
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker01", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 8.0f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker02", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 8.0f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker03", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 8.0f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker04", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 7.0f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker05", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 10.0f;
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_SmokeWeed : UAbilityTask_Interaction_Human
{
    UPROPERTY() TSoftObjectPtr<UAnimMontage> SmokeMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Smoke/Man_Digger_Smoke_Montage.Man_Digger_Smoke_Montage'";

    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_SmokeWeed);
    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 5.0f;

    default bStartWhileMoving=false;

    float Low=0.3f;
    float Mid=0.35f;
    float High=0.4f;
    float Super=0.6f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;
    default bAllowInterruptAtAnyTime = true;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        MainMontage = SmokeMontage;

        Transitions.Add(TransitionToSection(SmokeMontage, n"Entry", n"Loop", Weight = 0.143f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Entry", n"Idle01", Weight = 0.143f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Entry", n"Idle02", Weight = 0.143f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Entry", n"Idle03", Weight = 0.143f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Entry", n"Idle04", Weight = 0.143f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Entry", n"Idle05", Weight = 0.143f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Entry", n"Idle06", Weight = 0.143f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker01", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker02", Weight = Low));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker03", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker04", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker05", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker06", Weight = Low));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker07", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker08", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker09", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker10", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker11", Weight = Low));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker12", Weight = Low));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker13", Weight = Super));
        Transitions.Last().bSeamless=false;

        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle01", n"Breaker01", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle01", n"Breaker02", Weight = Low));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle01", n"Breaker03", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle01", n"Breaker04", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle01", n"Breaker05", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle01", n"Breaker06", Weight = Low));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle01", n"Breaker07", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle01", n"Breaker08", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle01", n"Breaker09", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle01", n"Breaker10", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle01", n"Breaker11", Weight = Low));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle01", n"Breaker12", Weight = Low));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle01", n"Breaker13", Weight = Super));
        Transitions.Last().bSeamless=false;

        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle02", n"Breaker01", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle02", n"Breaker02", Weight = Low));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle02", n"Breaker03", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle02", n"Breaker04", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle02", n"Breaker05", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle02", n"Breaker06", Weight = Low));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle02", n"Breaker07", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle02", n"Breaker08", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle02", n"Breaker09", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle02", n"Breaker10", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle02", n"Breaker11", Weight = Low));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle02", n"Breaker12", Weight = Low));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle02", n"Breaker13", Weight = Super));
        Transitions.Last().bSeamless=false;

        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle03", n"Breaker01", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle03", n"Breaker02", Weight = Low));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle03", n"Breaker03", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle03", n"Breaker04", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle03", n"Breaker05", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle03", n"Breaker06", Weight = Low));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle03", n"Breaker07", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle03", n"Breaker08", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle03", n"Breaker09", Weight = High));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle03", n"Breaker10", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle03", n"Breaker11", Weight = Low));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle03", n"Breaker12", Weight = Low));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle03", n"Breaker13", Weight = Super));
        Transitions.Last().bSeamless=false;

        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle04", n"Breaker01", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle04", n"Breaker02", Weight = Low));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle04", n"Breaker03", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle04", n"Breaker04", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle04", n"Breaker05", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle04", n"Breaker06", Weight = Low));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle04", n"Breaker07", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle04", n"Breaker08", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle04", n"Breaker09", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle04", n"Breaker10", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle04", n"Breaker11", Weight = Low));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle04", n"Breaker12", Weight = Low));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle04", n"Breaker13", Weight = Super));
        Transitions.Last().bSeamless=false;

        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle05", n"Breaker01", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle05", n"Breaker02", Weight = Low));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle05", n"Breaker03", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle05", n"Breaker04", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle05", n"Breaker05", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle05", n"Breaker06", Weight = Low));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle05", n"Breaker07", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle05", n"Breaker08", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle05", n"Breaker09", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle05", n"Breaker10", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle05", n"Breaker11", Weight = Low));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle05", n"Breaker12", Weight = Low));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle05", n"Breaker13", Weight = Super));
        Transitions.Last().bSeamless=false;

        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle06", n"Breaker01", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle06", n"Breaker02", Weight = Low));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle06", n"Breaker03", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle06", n"Breaker04", Weight = 0.4f));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle06", n"Breaker05", Weight = Mid));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle06", n"Breaker06", Weight = Low));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle06", n"Breaker07", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle06", n"Breaker08", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle06", n"Breaker09", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle06", n"Breaker10", Weight = Super));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle06", n"Breaker11", Weight = Low));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle06", n"Breaker12", Weight = Low));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle06", n"Breaker13", Weight = Super));
        Transitions.Last().bSeamless=false;

        float Less = 0.1f;
        float Little =.15f;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker01", n"Loop", Weight = Less));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker01", n"Idle01", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker01", n"Idle02", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker01", n"Idle03", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker01", n"Idle04", Weight = Little));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker01", n"Idle05", Weight = Little));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker01", n"Idle06", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker02", n"Loop", Weight = Less));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker02", n"Idle01", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker02", n"Idle02", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker01", n"Idle03", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker02", n"Idle04", Weight = Little));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker02", n"Idle05", Weight = Little));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker02", n"Idle06", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker03", n"Loop", Weight = Less));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker03", n"Idle01", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker03", n"Idle02", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker03", n"Idle03", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker03", n"Idle04", Weight = Little));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker03", n"Idle05", Weight = Little));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker03", n"Idle06", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker04", n"Loop", Weight = Less));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker04", n"Idle01", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker04", n"Idle02", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker04", n"Idle03", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker04", n"Idle04", Weight = Little));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker04", n"Idle05", Weight = Little));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker04", n"Idle06", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker05", n"Loop", Weight = Less));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker05", n"Idle01", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker05", n"Idle02", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker05", n"Idle03", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker05", n"Idle04", Weight = Little));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker05", n"Idle05", Weight = Little));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker05", n"Idle06", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker06", n"Loop", Weight = Less));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker06", n"Idle01", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker06", n"Idle02", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker06", n"Idle03", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker06", n"Idle04", Weight = Little));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker06", n"Idle05", Weight = Little));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker06", n"Idle06", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker07", n"Loop", Weight = Less));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker07", n"Idle01", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker07", n"Idle02", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker07", n"Idle03", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker07", n"Idle04", Weight = Little));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker07", n"Idle05", Weight = Little));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker07", n"Idle06", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker08", n"Loop", Weight = Less));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker08", n"Idle01", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker08", n"Idle02", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker08", n"Idle03", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker08", n"Idle04", Weight = Little));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker08", n"Idle05", Weight = Little));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker08", n"Idle06", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker09", n"Loop", Weight = Less));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker09", n"Idle01", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker09", n"Idle02", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker09", n"Idle03", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker09", n"Idle04", Weight = Little));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker09", n"Idle05", Weight = Little));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker09", n"Idle06", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker10", n"Loop", Weight = Less));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker10", n"Idle01", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker10", n"Idle02", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker10", n"Idle03", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker10", n"Idle04", Weight = Little));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker10", n"Idle05", Weight = Little));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker10", n"Idle06", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker11", n"Loop", Weight = Less));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker11", n"Idle01", Weight = Low));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker11", n"Idle02", Weight = Low));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker11", n"Idle03", Weight = Low));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker11", n"Idle04", Weight = Little));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker11", n"Idle05", Weight = Little));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker11", n"Idle06", Weight = Low));
        Transitions.Last().bSeamless=false;

        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker12", n"Loop", Weight = Less));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker12", n"Idle01", Weight = Low));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker12", n"Idle02", Weight = Low));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker12", n"Idle03", Weight = Low));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker12", n"Idle04", Weight = Little));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker12", n"Idle05", Weight = Little));
        Transitions.Last().bSeamless=false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker12", n"Idle06", Weight = Low));
        Transitions.Last().bSeamless=false;

        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker13", n"Loop", Weight = Less));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker13", n"Idle01", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker13", n"Idle02", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker13", n"Idle03", Weight = Low));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker13", n"Idle04", Weight = Little));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker13", n"Idle05", Weight = Little));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker13", n"Idle06", Weight = Low));
        
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Smoke_Seated : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_SmokeWeed_Seated);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_Smoke/Man_Digger_Sit_Smoke_Montage.Man_Digger_Sit_Smoke_Montage'";
    default Stance = EStance::Sitting;

     // How often should we try to do a transition?
    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 5.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        //ENTRY
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
        //LOOPS
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker01", Weight = 0.30f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker02", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker03", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker04", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker05", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker06", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker07", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Smalltalk);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker08", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Smalltalk);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker09", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker10", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker11", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker12", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Smalltalk);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker13", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionStay(MainMontage, n"Loop", Weight = 0.2f));
    }

    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);

}

UCLASS()
class UAbilityTask_Interaction_Human_Smoke_Ground : UAbilityTask_Interaction_Human
{
    default DefaultForCharacterClass.Add(AGothicPlayerCharacter::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_SmokeWeed_Ground);
    default bSetUsedActorAsViewTargetForPlayers = true;

    default Stance = EStance::Sitting;

    UPROPERTY() TSoftObjectPtr<UAnimMontage> HumanSmokePose01 = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/WaterPipe/A_Man_WaterPipe_Pose01_Montage.A_Man_WaterPipe_Pose01_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> HumanSmokePose02 = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/WaterPipe/A_Man_WaterPipe_Pose02_Montage.A_Man_WaterPipe_Pose02_Montage'";
    
    UPROPERTY() TSoftObjectPtr<UAnimMontage> ObjectPose01 = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/WaterPipe/A_WaterPipe_Pose01_Montage.A_WaterPipe_Pose01_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> ObjectPose02 = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/WaterPipe/A_WaterPipe_Pose02_Montage.A_WaterPipe_Pose02_Montage'";

    default AutoTransitionCheckSecondsMin = 5.0f;
    default AutoTransitionCheckSecondsMax = 10.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        if(Math::RandBool())
        {
            MainMontage = HumanSmokePose01;
            ObjectMontage = ObjectPose01;
        }
        else
        {
            MainMontage = HumanSmokePose02;
            ObjectMontage = ObjectPose02;
        }
        //ENTRY
        Transitions.Add(TransitionToSection(HumanSmokePose01, FromSection = n"Entry", ToSection = n"Loop01"));
        Transitions.Add(TransitionToSection(HumanSmokePose02, FromSection = n"Entry", ToSection = n"Loop01"));

        Transitions.Add(TransitionToSection(HumanSmokePose01, FromSection = n"Loop01", ToSection = n"Smoking01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(HumanSmokePose01, FromSection = n"Loop01", ToSection = n"Smoking02", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(HumanSmokePose01, FromSection = n"Loop01", ToSection = n"Cough", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(HumanSmokePose01, FromSection = n"Loop01", ToSection = n"LookAround", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(HumanSmokePose01, FromSection = n"Loop01", ToSection = n"SmallPuff", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(HumanSmokePose01, n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(HumanSmokePose02, FromSection = n"Loop01", ToSection = n"Smoking01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(HumanSmokePose02, FromSection = n"Loop01", ToSection = n"Smoking02", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(HumanSmokePose02, FromSection = n"Loop01", ToSection = n"Cough", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(HumanSmokePose02, FromSection = n"Loop01", ToSection = n"Scratch", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(HumanSmokePose02, FromSection = n"Loop01", ToSection = n"ScratchFace", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(HumanSmokePose02, n"Loop01", Weight = 0.3f));

    }
}

UCLASS()
class UAbilityTask_Interaction_Human_LeanBar : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_LeanBar);

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    UPROPERTY() TSoftObjectPtr<UAnimMontage> LeanBarMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/HerbShop/Pose_02/Man_Guard_HerbShop_02_Montage.Man_Guard_HerbShop_02_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> LeanBarAltMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/HerbShop/Pose_01/Man_Guard_HerbShop_Montage.Man_Guard_HerbShop_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> LeanBarAlt02Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/HerbShop/Pose_03/Man_HerbShop_03_Montage.Man_HerbShop_03_Montage'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        MainMontage = LeanBarMontage;

        //Lean
        Transitions.Add(TransitionToSection(LeanBarMontage, n"Entry", n"Loop"));

        Transitions.Add(TransitionToSection(LeanBarMontage, n"Loop", n"Scratch", Weight = 0.3f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 10.0f;

        Transitions.Add(TransitionToSection(LeanBarMontage, n"Scratch", n"Loop", Weight = 0.4f));

        //LeanAlt
        Transitions.Add(TransitionStay(LeanBarAltMontage, n"Loop", Weight = 0.3f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 10.0f;

        //LeanAlt02
        Transitions.Add(TransitionToSection(LeanBarAlt02Montage, n"Loop", n"Breaker01", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 10.0f;
        Transitions.Add(TransitionToSection(LeanBarAlt02Montage, n"Loop", n"Breaker02", Weight = 0.2f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 10.0f;

        Transitions.Add(TransitionToSection(LeanBarAlt02Montage, n"Breaker01", n"Loop", Weight = 0.4f));
        Transitions.Add(TransitionToSection(LeanBarAlt02Montage, n"Breaker02", n"Loop", Weight = 0.4f));

        //End Lean
        Transitions.Add(TransitionToMontage(LeanBarMontage, n"Loop", LeanBarMontage, n"Exit", Weight = 0.1f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionAfterMontageEnds(LeanBarMontage,LeanBarAltMontage,n"Entry", 0.5f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionAfterMontageEnds(LeanBarMontage,LeanBarAlt02Montage,n"Entry",0.5f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);

        //End Lean Alt
        Transitions.Add(TransitionToMontage(LeanBarAltMontage, n"Loop", LeanBarAltMontage, n"Exit", Weight = 0.1f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionAfterMontageEnds(LeanBarAltMontage,LeanBarMontage,n"Entry"));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);

        Transitions.Add(TransitionToMontage(LeanBarAlt02Montage, n"Loop", LeanBarAlt02Montage, n"Exit", Weight = 0.1f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionAfterMontageEnds(LeanBarAlt02Montage,LeanBarMontage,n"Entry"));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_LeanWall : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_LeanWall);

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;
   
    /*UPROPERTY() TSoftObjectPtr<UAnimMontage> LeanWallBackMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/LeaningWall/Man_Digger_LeaningWall_Montage.Man_Digger_LeaningWall_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> LeanWallFootMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/LeaningWall/Man_Digger_LeaningWall_02_Montage.Man_Digger_LeaningWall_02_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> LeanWallSideMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/LeaningWall/Man_LeaningWall_03_Montage.Man_LeaningWall_03_Montage'";*/

    TArray<FName> Montages;

    //default Montages.Add(n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/LeaningWall/Man_Digger_LeaningWall_Montage.Man_Digger_LeaningWall_Montage'");
    //default Montages.Add(n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/LeaningWall/Man_Digger_LeaningWall_02_Montage.Man_Digger_LeaningWall_02_Montage'");
    //default Montages.Add(n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/LeaningWall/Man_LeaningWall_03_Montage.Man_LeaningWall_03_Montage'");

    UPROPERTY() TSoftObjectPtr<UAnimMontage> LeanWallBackMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/LeaningWall/Man_Digger_LeaningWall_Montage.Man_Digger_LeaningWall_Montage'";

    default SimulationLoopAnimation = n"AnimSequence'/Game/AnimLibrary/Humanoid/Man/Living/LeaningWall/Pose01/A_Man_Digger_LeaningWall_Idle.A_Man_Digger_LeaningWall_Idle'";
    default bAllowInterruptAtAnyTime = true;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        // int IndexMontage = Math::RandRange(0,Montages.Num()-1);
        // MainMontage = Montages[IndexMontage];  

        MainMontage = LeanWallBackMontage;

        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Scratch", n"Loop01", Weight = 0.05f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);

        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Scratch", Weight = 0.3f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 30.0f;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);

        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.7f));
    }

    /*UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        if(Math::RandBool())
        {
            MainMontage = LeanWallBackMontage;
        }
        else
        {
            MainMontage = LeanWallFootMontage;
        }

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Scratch", Weight = 0.5f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 30.0f;
    }*/
   
}

UCLASS()
class UAbilityTask_Interaction_Human_LeanWall_Side : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_LeanWall_Side);

    default QuickExitMode = EInteractionFastExitMode::PlayFastExitIfAvailableOtherwiseBlendOut;

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;
   
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/LeaningWall/Man_LeaningWall_03_Montage.Man_LeaningWall_03_Montage'";
    default bAllowInterruptAtAnyTime = true;
    
    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01", Weight = 0.333f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop02", Weight = 0.333f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop03", Weight = 0.333f));

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Scratch", Weight = 0.2f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Scratch", Weight = 0.2f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Scratch", Weight = 0.2f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop03", Weight = 0.3f));
    }
   
}

UCLASS()
class UAbilityTask_Interaction_Human_Push : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Push);

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;
   
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/OLD/Human_Push_Montage.Human_Push_Montage'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Push", Weight = 0.3f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop", Weight = 0.3f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_LookAround : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_LookAround);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/OLD/Human_LookAround_Montage.Human_LookAround_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_Leatherworking : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Leatherworking);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Tanning/Man_Tanning_Montage.Man_Tanning_Montage'";

    default QuickExitMode = EInteractionFastExitMode::PlayFastExitIfAvailableOtherwiseBlendOut;

    default AutoTransitionCheckSecondsMin = 1.0f;
    default AutoTransitionCheckSecondsMax = 2.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
       
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker02", Weight = 0.3f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker03", Weight = 0.3f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker04", Weight = 0.1f));
        Transitions.Last().bSeamless = false;

    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Pee : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Pee);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Pee_Long/Human_Pee_Montage.Human_Pee_Montage'";

    default QuickExitMode = EInteractionFastExitMode::PlayFastExitIfAvailableOtherwiseBlendOut;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Inspect : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Inspect);

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Searching/Human_Searching_Montage.Human_Searching_Montage'";

    default AutoTransitionCheckSecondsMin = 4.0f;
    default AutoTransitionCheckSecondsMax = 6.0f;

    default MontageExitFrontSection = NAME_None;
    default MontageExitLeftSection = NAME_None;
    default MontageExitRightSection = NAME_None;
    default MontageExitBackSection = NAME_None;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop01", Weight = 0.3333f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop02", Weight = 0.3333f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop03", Weight = 0.3333f));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop03", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop03", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop01", Weight = 0.1f));

    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Inspect_Front : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Inspect_Front);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Inspect/Man_Inspect_Front_Montage.Man_Inspect_Front_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_Inspect_Up : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Inspect_Up);

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Inspect/Man_Inspect_Front_Montage.Man_Inspect_Front_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_Inspect_Down : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Inspect_Down);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Inspect/Man_Inspect_Down_Montage.Man_Inspect_Down_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_CheckBody : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_CheckBody);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/CheckBody/Man_CheckBody_Montage.Man_CheckBody_Montage'";
    default AutoTransitionCheckSecondsMin = 4.0f;
    default AutoTransitionCheckSecondsMax = 6.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop01"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Wounded : UAbilityTask_Interaction_Human //ANIM PLACEHOLDER
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Wounded);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Dialogs/Injured/Man_Injured_Montage.Man_Injured_Montage'";
    default AutoTransitionCheckSecondsMin = 4.0f;
    default AutoTransitionCheckSecondsMax = 6.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Exhausted : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Exhausted);

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Exhausted/Man_Exhausted_Pose01_Montage.Man_Exhausted_Pose01_Montage'";
    default AutoTransitionCheckSecondsMin = 4.0f;
    default AutoTransitionCheckSecondsMax = 6.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
    }
    
}

UCLASS()
class UAbilityTask_Interaction_Player_Cook_Cauldron : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Crafting_Cook_Cauldron);

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    UPROPERTY() TSoftObjectPtr<UAnimMontage> CookCauldronMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Cook/Man_Interact_Cauldron_Montage.Man_Interact_Cauldron_Montage'";

    default MainMontage = CookCauldronMontage;
    default MontageLoopSectionPattern = "Loop*";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(CookCauldronMontage, n"Entry", n"Loop"));

        Transitions.Add(TransitionToSection(CookCauldronMontage, n"Loop", n"Breaker_01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, n"Loop", n"Breaker_02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, n"Loop", n"Breaker_03", Weight = 0.15f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, n"Loop", n"Breaker_04", Weight = 0.1f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, n"Loop", n"Breaker_05", Weight = 0.3f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, n"Loop", n"Breaker_06", Weight = 0.15f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, n"Loop", n"Breaker_07", Weight = 0.2f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, n"Loop", n"Breaker_08", Weight = 0.2f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, n"Loop", n"Breaker_09", Weight = 0.2f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, n"Loop", n"Breaker_10", Weight = 0.2f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Player_CutWood_Tree : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_CutWood_Tree);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/CuttingTree/Human_CutWood_Montage.Human_CutWood_Montage'";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop01", Weight = 0.3333f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop02", Weight = 0.3333f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop03", Weight = 0.3333f));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop03", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop03", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop02", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop03", Weight = 0.1f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Cook_Pan : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Crafting_Cook_Pan);
    
    UPROPERTY() TSoftObjectPtr<UAnimMontage> CookPanMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Cook/Man_Digger_Cook_Pan_Montage.Man_Digger_Cook_Pan_Montage'";
    default ObjectMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Cook/Object_Interact_Pan_Montage_AI.Object_Interact_Pan_Montage_AI'";

    default MainMontage = CookPanMontage;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(CookPanMontage, FromSection = n"Entry", ToSection = n"Loop"));

        Transitions.Add(TransitionToSection(CookPanMontage, FromSection = n"Loop", ToSection = n"select1", Weight = 0.15f));
        Transitions.Add(TransitionToSection(CookPanMontage, FromSection = n"Loop", ToSection = n"select2", Weight = 0.25f));
        Transitions.Add(TransitionToSection(CookPanMontage, FromSection = n"Loop", ToSection = n"select3", Weight = 0.15f));
        Transitions.Add(TransitionToSection(CookPanMontage, FromSection = n"Loop", ToSection = n"select4", Weight = 0.3f));
        Transitions.Add(TransitionToSection(CookPanMontage, FromSection = n"Loop", ToSection = n"select5", Weight = 0.25f));
        Transitions.Add(TransitionToSection(CookPanMontage, FromSection = n"Loop", ToSection = n"craftingItem", Weight = 0.05f));
    }

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;
}

UCLASS()
class UAbilityTask_Interaction_Woman_Cook_Pan : UAbilityTask_Interaction_Human_Women
{
    default DefaultForCharacterClass.Add(AAIAgentCharacter_Human_Woman::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Crafting_Cook_Pan);
    
    UPROPERTY() TSoftObjectPtr<UAnimMontage> CookPanMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Women/Crafting/Coocking/Campfire/Woman_Campfire_Montage.Woman_Campfire_Montage'";
    default ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Cook/Object_Interact_Pan_Montage_AI.Object_Interact_Pan_Montage_AI'";

    default MainMontage = CookPanMontage;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(CookPanMontage, FromSection = n"Entry", ToSection = n"Loop"));

        Transitions.Add(TransitionToSection(CookPanMontage, FromSection = n"Loop", ToSection = n"select1", Weight = 0.15f));
        Transitions.Add(TransitionToSection(CookPanMontage, FromSection = n"Loop", ToSection = n"select2", Weight = 0.25f));
        Transitions.Add(TransitionToSection(CookPanMontage, FromSection = n"Loop", ToSection = n"select3", Weight = 0.15f));
        Transitions.Add(TransitionToSection(CookPanMontage, FromSection = n"Loop", ToSection = n"select4", Weight = 0.3f));
        Transitions.Add(TransitionToSection(CookPanMontage, FromSection = n"Loop", ToSection = n"select5", Weight = 0.25f));
        Transitions.Add(TransitionToSection(CookPanMontage, FromSection = n"Loop", ToSection = n"craftingItem", Weight = 0.05f));
    }

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;
}

UCLASS()
class UAbilityTask_Interaction_Human_Cook_Cauldron : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Cook_Cauldron);

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;
    
    UPROPERTY() TSoftObjectPtr<UAnimMontage> CookCauldronMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Cook/Man_Interact_Cauldron_Montage.Man_Interact_Cauldron_Montage'";
    
    default MainMontage = CookCauldronMontage;
    default MontageLoopSectionPattern = "Loop*";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;
    
    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Entry", ToSection = n"Loop"));

        //LOOP
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Loop", ToSection = n"Breaker_01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Loop", ToSection = n"Breaker_02", Weight = 0.35f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Loop", ToSection = n"Breaker_03", Weight = 0.45f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Loop", ToSection = n"Breaker_04", Weight = 0.15f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Loop", ToSection = n"Breaker_05", Weight = 0.25f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Loop", ToSection = n"Breaker_06", Weight = 0.15f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Loop", ToSection = n"Breaker_07", Weight = 0.15f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Loop", ToSection = n"Breaker_08", Weight = 0.15f));

        //BREAKER01
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_01", ToSection = n"Loop", Weight = 0.7f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_01", ToSection = n"Breaker_02", Weight = 0.6f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_01", ToSection = n"Breaker_03", Weight = 0.6f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_01", ToSection = n"Breaker_04", Weight = 0.45f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_01", ToSection = n"Breaker_05", Weight = 0.25f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_01", ToSection = n"Breaker_06", Weight = 0.35f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_01", ToSection = n"Breaker_07", Weight = 0.45f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_01", ToSection = n"Breaker_08", Weight = 0.25f));


        //BREAKER02
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_02", ToSection = n"Loop", Weight = 0.7f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_02", ToSection = n"Breaker_01", Weight = 0.45f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_02", ToSection = n"Breaker_03", Weight = 0.6f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_02", ToSection = n"Breaker_04", Weight = 0.25f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_02", ToSection = n"Breaker_05", Weight = 0.3f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_02", ToSection = n"Breaker_06", Weight = 0.15f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_02", ToSection = n"Breaker_07", Weight = 0.45f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_02", ToSection = n"Breaker_08", Weight = 0.15f));


        //BREAKER03
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_03", ToSection = n"Loop", Weight = 0.7f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_03", ToSection = n"Breaker_02", Weight = 0.45f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_03", ToSection = n"Breaker_01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_03", ToSection = n"Breaker_04", Weight = 0.35f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_03", ToSection = n"Breaker_05", Weight = 0.25f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_03", ToSection = n"Breaker_06", Weight = 0.15f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_03", ToSection = n"Breaker_07", Weight = 0.45f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_03", ToSection = n"Breaker_08", Weight = 0.15f));


        //BREAKER04
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_04", ToSection = n"Loop", Weight = 0.7f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_04", ToSection = n"Breaker_02", Weight = 0.35f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_04", ToSection = n"Breaker_03", Weight = 0.35f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_04", ToSection = n"Breaker_01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_04", ToSection = n"Breaker_05", Weight = 0.25f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_04", ToSection = n"Breaker_06", Weight = 0.15f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_04", ToSection = n"Breaker_07", Weight = 0.45f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_04", ToSection = n"Breaker_08", Weight = 0.15f));


        //BREAKER05
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_05", ToSection = n"Loop", Weight = 0.7f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_05", ToSection = n"Breaker_02", Weight = 0.35f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_05", ToSection = n"Breaker_03", Weight = 0.35f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_05", ToSection = n"Breaker_04", Weight = 0.25f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_05", ToSection = n"Breaker_01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_05", ToSection = n"Breaker_06", Weight = 0.15f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_05", ToSection = n"Breaker_07", Weight = 0.45f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_05", ToSection = n"Breaker_08", Weight = 0.15f));


        //BREAKER06
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_06", ToSection = n"Loop", Weight = 0.7f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_06", ToSection = n"Breaker_02", Weight = 0.35f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_06", ToSection = n"Breaker_03", Weight = 0.35f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_06", ToSection = n"Breaker_04", Weight = 0.25f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_06", ToSection = n"Breaker_05", Weight = 0.15f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_06", ToSection = n"Breaker_01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_06", ToSection = n"Breaker_07", Weight = 0.45f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_06", ToSection = n"Breaker_08", Weight = 0.15f));


        //BREAKER07
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_07", ToSection = n"Loop", Weight = 0.7f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_07", ToSection = n"Breaker_02", Weight = 0.35f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_07", ToSection = n"Breaker_03", Weight = 0.35f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_07", ToSection = n"Breaker_04", Weight = 0.25f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_07", ToSection = n"Breaker_05", Weight = 0.15f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_07", ToSection = n"Breaker_06", Weight = 0.25f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_07", ToSection = n"Breaker_01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_07", ToSection = n"Breaker_08", Weight = 0.15f));


        //BREAKER08
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_08", ToSection = n"Loop", Weight = 0.7f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_08", ToSection = n"Breaker_01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_08", ToSection = n"Breaker_02", Weight = 0.35f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_08", ToSection = n"Breaker_03", Weight = 0.35f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_08", ToSection = n"Breaker_04", Weight = 0.15f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_08", ToSection = n"Breaker_05", Weight = 0.25f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_08", ToSection = n"Breaker_06", Weight = 0.15f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_08", ToSection = n"Breaker_07", Weight = 0.45f));


        //EXIT
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Loop", ToSection = n"Exit", Weight = 0.05f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_01", ToSection = n"Exit", Weight = 0.05f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_02", ToSection = n"Exit", Weight = 0.05f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_03", ToSection = n"Exit", Weight = 0.05f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_04", ToSection = n"Exit", Weight = 0.05f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_05", ToSection = n"Exit", Weight = 0.05f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_06", ToSection = n"Exit", Weight = 0.05f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_07", ToSection = n"Exit", Weight = 0.05f));
        Transitions.Add(TransitionToSection(CookCauldronMontage, FromSection = n"Breaker_08", ToSection = n"Exit", Weight = 0.05f));

    }

}

UCLASS()
class UAbilityTask_Interaction_Human_SharpWeapon : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_SharpWeapon);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/SwordSharpening/Man_Sit_SwordSharpening_Montage.Man_Sit_SwordSharpening_Montage'";

    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);

    default TakeOutItemWithItemTypeFromInventory = GameplayTag::Item_Weapon_Sword;

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01"));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop02"));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop03"));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop04"));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop04", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Look", Weight = 0.3f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Rest", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"SharpenUp"));
        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop04", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Look", Weight = 0.3f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Rest", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"SharpenUp"));
        Transitions.Add(TransitionStay(MainMontage, n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop04", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Look", Weight = 0.3f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Rest", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"SharpenUp"));
        Transitions.Add(TransitionStay(MainMontage, n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop04", ToSection = n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop04", ToSection = n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop04", ToSection = n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop04", ToSection = n"Look", Weight = 0.3f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop04", ToSection = n"Rest", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop04", ToSection = n"SharpenUp"));
        Transitions.Add(TransitionStay(MainMontage, n"Loop04", Weight = 0.3f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_CarveWood : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_CarveWood);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_Carve_Figure/Man_Sit_Carve_Montage.Man_Sit_Carve_Montage'";

    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01"));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop02"));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop03"));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Rest", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Look", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Strech", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Sweep", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Listen01", Weight = 0.3f));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Listen02", Weight = 0.3f));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        //Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"SharpenUp"));
        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Rest", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Look", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Strech", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Sweep", Weight = 0.3f));
        //Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"SharpenUp"));
        Transitions.Add(TransitionStay(MainMontage, n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Rest", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Look", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Strech", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Sweep", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Listen01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Listen02", Weight = 0.3f));
        //Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"SharpenUp"));
        Transitions.Add(TransitionStay(MainMontage, n"Loop03", Weight = 0.3f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Sit : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultForCharacterClass.Add(AGothicPlayerCharacter::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default Stance = EStance::Sitting;

    default bPutAwayItemInHandsBeforeInteraction = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit/Man_Digger_Sit_Montage.Man_Digger_Sit_Montage'";

    // Allow to stay seated when starting a conversation
    default TaskEndingTags.RemoveTag(GameplayTag::Action_Conversation);

    // How often should we try to do a transition?
    default AutoTransitionCheckSecondsMin = 5.0f;
    default AutoTransitionCheckSecondsMax = 10.0f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        //ENTRY SECTION
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop01"));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop02"));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop03"));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop04"));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop05"));
        Transitions.Add(TransitionToSection(MainMontage, n"EntryBack", n"Loop01"));
        Transitions.Add(TransitionToSection(MainMontage, n"EntryBack", n"Loop02"));
        Transitions.Add(TransitionToSection(MainMontage, n"EntryBack", n"Loop03"));
        Transitions.Add(TransitionToSection(MainMontage, n"EntryBack", n"Loop04"));
        Transitions.Add(TransitionToSection(MainMontage, n"EntryBack", n"Loop05"));
        Transitions.Add(TransitionToSection(MainMontage, n"EntryLeft", n"Loop01"));
        Transitions.Add(TransitionToSection(MainMontage, n"EntryLeft", n"Loop02"));
        Transitions.Add(TransitionToSection(MainMontage, n"EntryLeft", n"Loop03"));
        Transitions.Add(TransitionToSection(MainMontage, n"EntryLeft", n"Loop04"));
        Transitions.Add(TransitionToSection(MainMontage, n"EntryLeft", n"Loop05"));
        Transitions.Add(TransitionToSection(MainMontage, n"EntryRight", n"Loop01"));
        Transitions.Add(TransitionToSection(MainMontage, n"EntryRight", n"Loop02"));
        Transitions.Add(TransitionToSection(MainMontage, n"EntryRight", n"Loop03"));
        Transitions.Add(TransitionToSection(MainMontage, n"EntryRight", n"Loop04"));
        Transitions.Add(TransitionToSection(MainMontage, n"EntryRight", n"Loop05"));

        //LOOP01 SECTION
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop02", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop03", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop04", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop05", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Spitting", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Scratch", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Look", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Cough", Weight = 0.45f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"ScratchChest", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"ScratchFace", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Relocate", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Fly", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Shoulder", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Stretch", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"HandLeg", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"SoftCough", Weight = 0.45f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Nails", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"BodyForward", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"MoveBack", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Yawn", Weight = 0.35f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"MoveLeg", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"ScratchNose", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"LookLeft", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"LookRight", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"LookUp", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"LookDown", Weight = 0.4f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.35f));

        //LOOP02 SECTION
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop03", Weight = 0.65f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop04", Weight = 0.65f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop05", Weight = 0.65f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Spitting", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Scratch", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Look", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Cough", Weight = 0.45f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"ScratchChest", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"ScratchFace", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Relocate", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Fly", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Shoulder", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Stretch", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"HandLeg", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"SoftCough", Weight = 0.45f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Nails", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"BodyForward", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"MoveBack", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Yawn", Weight = 0.35f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"MoveLeg", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"ScratchNose", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"LookLeft", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"LookRight", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"LookUp", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"LookDown", Weight = 0.4f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop02", Weight = 0.35f));

        //LOOP03 SECTION
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop02", Weight = 0.65f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop04", Weight = 0.65f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop05", Weight = 0.65f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Spitting", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Scratch", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Look", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Cough", Weight = 0.45f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"ScratchChest", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"ScratchFace", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Relocate", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Fly", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Shoulder", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Stretch", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"HandLeg", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"SoftCough", Weight = 0.45f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Nails", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"BodyForward", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"MoveBack", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Yawn", Weight = 0.35f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"MoveLeg", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"ScratchNose", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"LookLeft", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"LookRight", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"LookUp", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"LookDown", Weight = 0.4f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop03", Weight = 0.35f));

        //LOOP04 SECTION
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Loop02", Weight = 0.65f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Loop03", Weight = 0.65f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Loop01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Loop05", Weight = 0.65f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Spitting", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Scratch", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Look", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Cough", Weight = 0.45f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"ScratchChest", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"ScratchFace", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Relocate", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Fly", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Shoulder", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Stretch", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"HandLeg", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"SoftCough", Weight = 0.45f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Nails", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"BodyForward", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"MoveBack", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Yawn", Weight = 0.35f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"MoveLeg", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"ScratchNose", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"LookLeft", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"LookRight", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"LookUp", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"LookDown", Weight = 0.4f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop04", Weight = 0.35f));

        //LOOP05 SECTION
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"Loop02", Weight = 0.65f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"Loop03", Weight = 0.65f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"Loop04", Weight = 0.65f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"Loop01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"Spitting", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"Scratch", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"Look", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"Cough", Weight = 0.45f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"ScratchChest", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"ScratchFace", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"Relocate", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"Fly", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"Shoulder", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"Stretch", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"HandLeg", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"SoftCough", Weight = 0.45f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"Nails", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"BodyForward", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"MoveBack", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"Yawn", Weight = 0.35f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"MoveLeg", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"ScratchNose", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"LookLeft", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"LookRight", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"LookUp", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"LookDown", Weight = 0.4f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop05", Weight = 0.35f));
    }

}

UCLASS()
class UAbilityTask_Interaction_Human_GomezSitThrone : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultForCharacterClass.Add(AGothicPlayerCharacter::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Interact_Sit_Throne);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit/Throne/Man_SitThrone_Montage.Man_SitThrone_Montage'";

    // Allow to stay seated when starting a conversation
    default TaskEndingTags.RemoveTag(GameplayTag::Action_Conversation);

    default OwnedTagsWhileActive.AddTag(GameplayTag::Smalltalk_Blocked);

    // How often should we try to do a transition?
    default AutoTransitionCheckSecondsMin = 5.0f;
    default AutoTransitionCheckSecondsMax = 10.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        //ENTRY SECTION
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));

        //LOOP01 SECTION

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker01", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker02", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker03", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker07", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::Action_Ambient_WatchDance);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker08", Weight = 0.35f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::Action_Ambient_WatchDance);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker09", Weight = 0.35f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::Action_Ambient_WatchDance);
        Transitions.Add(TransitionStay(MainMontage, n"Loop", Weight = 0.35f));

    }

}


// UCLASS()
// class UAbilityTask_Interaction_Human_GomezSitThrone_EnjoyPerformance : UAbilityTask_Interaction_Human_SitAndSleep_IO
// {
//     default DefaultForCharacterClass.Add(AGothicPlayerCharacter::StaticClass());
//     default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_EnjoyPerformance);
//     default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Throne);

//     default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit/Throne/Man_SitThrone_Performance_Montage.Man_SitThrone_Performance_Montage'";

//     // Allow to stay seated when starting a conversation
//     default TaskEndingTags.RemoveTag(GameplayTag::Action_Conversation);

//     // How often should we try to do a transition?
//     default AutoTransitionCheckSecondsMin = 0.0f;
//     default AutoTransitionCheckSecondsMax = 6.0f;

//     default bAllowInterruptLoopOnCancel = true;
//     default QuickExitAnimationRate = 1.5f;

//     UFUNCTION(BlueprintOverride)
//     void SetupTransitions()
//     {
//         //ENTRY SECTION
//         Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
//         //LOOP01 SECTION
//         Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker01", Weight = 0.4f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker02", Weight = 0.4f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker03", Weight = 0.2f));
//         Transitions.Last().bSeamless = false;
//     }

// }

//DEMO ONLY!!
UCLASS()
class UAbilityTask_Interaction_Human_Sit_Demo : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultForCharacterClass.Add(AGothicPlayerCharacter::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Interact_Sit_Chair_Demo);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit/Man_Digger_Sit_Montage.Man_Digger_Sit_Montage'";

    default bPutAwayItemInHandsBeforeInteraction = true;
    
    // Allow to stay seated when starting a conversation
    default TaskEndingTags.RemoveTag(GameplayTag::Action_Conversation);

    // How often should we try to do a transition?
    default AutoTransitionCheckSecondsMin = 5.0f;
    default AutoTransitionCheckSecondsMax = 10.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        //ENTRY SECTION
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop01", Weight = 0.1f));
        Transitions.Last().bAutoTransitionForPlayer = true;
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop06", Weight = 0.9f));
        Transitions.Last().bAutoTransitionForPlayer = true;

        Transitions.Add(TransitionToSection(MainMontage, n"EntryBack", n"Loop01"));
        Transitions.Add(TransitionToSection(MainMontage, n"EntryBack", n"Loop06"));
        Transitions.Add(TransitionToSection(MainMontage, n"EntryLeft", n"Loop01"));
        Transitions.Add(TransitionToSection(MainMontage, n"EntryLeft", n"Loop06"));
        Transitions.Add(TransitionToSection(MainMontage, n"EntryRight", n"Loop01"));
        Transitions.Add(TransitionToSection(MainMontage, n"EntryRight", n"Loop06"));

        //LOOP01 SECTION
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop06", Weight = 0.75f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().bAutoTransitionForPlayer = true;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"ScratchChest", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().bAutoTransitionForPlayer = true;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"ScratchFace", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().bAutoTransitionForPlayer = true;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Relocate", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().bAutoTransitionForPlayer = true;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"WarmHands", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().bAutoTransitionForPlayer = true;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"BodyForward", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().bAutoTransitionForPlayer = true;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        // Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Listen", Weight = // 0.55f));
        // Transitions.Last().bSeamless = false;
        // Transitions.Last().bAutoTransitionForPlayer = true;
        // Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"MoveLeg", Weight = // 0.3f));
        // Transitions.Last().bSeamless = false;
        // Transitions.Last().bAutoTransitionForPlayer = true;


        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.15f));
        Transitions.Last().bAutoTransitionForPlayer = true;

        //LOOP06 SECTION
        Transitions.Add(TransitionToSection(MainMontage, n"Loop06", n"Loop01", Weight = 0.35f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().bAutoTransitionForPlayer = true;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop06", n"ScratchChest", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().bAutoTransitionForPlayer = true;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop06", n"ScratchFace", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().bAutoTransitionForPlayer = true;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop06", n"Relocate", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().bAutoTransitionForPlayer = true;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop06", n"WarmHands", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().bAutoTransitionForPlayer = true;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop06", n"BodyForward", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().bAutoTransitionForPlayer = true;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        // Transitions.Add(TransitionToSection(MainMontage, n"Loop06", n"Listen", Weight = // 0.55f));
        // Transitions.Last().bSeamless = false;
        // Transitions.Last().bAutoTransitionForPlayer = true;
        // Transitions.Add(TransitionToSection(MainMontage, n"Loop06", n"MoveLeg", Weight = // 0.3f));
        // Transitions.Last().bSeamless = false;
        // Transitions.Last().bAutoTransitionForPlayer = true;


        Transitions.Add(TransitionStay(MainMontage, n"Loop06", Weight = 0.15f));
        Transitions.Last().bAutoTransitionForPlayer = true;

    
        Transitions.Add(TransitionToSection(MainMontage, n"ScratchChest", n"Loop01", Weight = 0.05f));
        Transitions.Last().bAutoTransitionForPlayer = true;
        Transitions.Add(TransitionToSection(MainMontage, n"ScratchChest", n"Loop06", Weight = 0.95f));
        Transitions.Last().bAutoTransitionForPlayer = true;


        Transitions.Add(TransitionToSection(MainMontage, n"ScratchFace", n"Loop01", Weight = 0.05f));
        Transitions.Last().bAutoTransitionForPlayer = true;
        Transitions.Add(TransitionToSection(MainMontage, n"ScratchFace", n"Loop06", Weight = 0.95f));
        Transitions.Last().bAutoTransitionForPlayer = true;


        Transitions.Add(TransitionToSection(MainMontage, n"Relocate", n"Loop01", Weight = 0.05f));
        Transitions.Last().bAutoTransitionForPlayer = true;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Relocate", n"Loop06", Weight = 0.95f));
        Transitions.Last().bAutoTransitionForPlayer = true;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);


        Transitions.Add(TransitionToSection(MainMontage, n"WarmHands", n"Loop01", Weight = 0.05f));
        Transitions.Last().bAutoTransitionForPlayer = true;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"WarmHands", n"Loop06", Weight = 0.95f));
        Transitions.Last().bAutoTransitionForPlayer = true;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);


        Transitions.Add(TransitionToSection(MainMontage, n"BodyForward", n"Loop01", Weight = 0.05f));
        Transitions.Last().bAutoTransitionForPlayer = true;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"BodyForward", n"Loop06", Weight = 0.95f));
        Transitions.Last().bAutoTransitionForPlayer = true;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
    }

}

// UCLASS()
// class UAbilityTask_Interaction_Human_Campfire_Seated : UAbilityTask_Interaction_Human_SitAndSleep_IO
// {
//     default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Campfire_Seated);

//     default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);

//     default SubtaskEntrySection = NAME_None;
//     default SubtaskExitSection = NAME_None;

//     // Allow to stay seated when starting a conversation
//     default TaskEndingTags.RemoveTag(GameplayTag::Action_Conversation);

//     // How often should we try to do a transition?
//     default AutoTransitionCheckSecondsMin = 2.0f;
//     default AutoTransitionCheckSecondsMax = 5.0f;

//     UPROPERTY() TSoftObjectPtr<UAnimMontage> SitMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit/Man_Digger_Sit_Montage.Man_Digger_Sit_Montage'";
//     UPROPERTY() TSoftObjectPtr<UAnimMontage> EatMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_Eat/Man_Digger_Sit_Eat_Bowl_Montage.Man_Digger_Sit_Eat_Bowl_Montage'";
//     UPROPERTY() TSoftObjectPtr<UAnimMontage> DrinkMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_Drink/Man_Digger_Sit_Drink_Montage.Man_Digger_Sit_Drink_Montage'";
//     UPROPERTY() TSoftObjectPtr<UAnimMontage> SmokeMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_Smoke/Man_Digger_Sit_Smoke_Montage.Man_Digger_Sit_Smoke_Montage'";

//     default MainMontage = SitMontage;

//     default bAllowInterruptLoopOnCancel = true;
//     default QuickExitAnimationRate = 1.5f;

//     default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

//     UFUNCTION(BlueprintOverride)
//     void SetupTransitions()
//     {

//         //SIT SECTION
//         Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop01", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop02", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop03", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop04", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop05", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop06", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(MainMontage, n"EntryBack", n"Loop01", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(MainMontage, n"EntryBack", n"Loop02", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(MainMontage, n"EntryBack", n"Loop03", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(MainMontage, n"EntryBack", n"Loop04", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(MainMontage, n"EntryBack", n"Loop05", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(MainMontage, n"EntryBack", n"Loop06", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(MainMontage, n"EntryRight", n"Loop01", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(MainMontage, n"EntryRight", n"Loop02", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(MainMontage, n"EntryRight", n"Loop03", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(MainMontage, n"EntryRight", n"Loop04", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(MainMontage, n"EntryRight", n"Loop05", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(MainMontage, n"EntryRight", n"Loop06", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(MainMontage, n"EntryLeft", n"Loop01", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(MainMontage, n"EntryLeft", n"Loop02", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(MainMontage, n"EntryLeft", n"Loop03", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(MainMontage, n"EntryLeft", n"Loop04", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(MainMontage, n"EntryLeft", n"Loop05", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(MainMontage, n"EntryLeft", n"Loop06", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Spitting", Weight = 0.05f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Scratch", Weight = 0.2f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Look", Weight = 0.1f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Cough", Weight = 0.05f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"WarmHands", Weight = 0.15f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.20f));
//         Transitions.Last().bSeamless = false;

//         Transitions.Add(TransitionToMontage(MainMontage, n"Loop01", EatMontage, Weight = 0.25f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToMontage(MainMontage, n"Loop01", DrinkMontage, Weight = 0.3f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToMontage(MainMontage, n"Loop01", SmokeMontage, Weight = 0.25f));
//         Transitions.Last().bSeamless = false;

//         Transitions.Add(TransitionToMontage(MainMontage, n"Loop02", EatMontage, Weight = 0.25f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToMontage(MainMontage, n"Loop02", DrinkMontage, Weight = 0.3f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToMontage(MainMontage, n"Loop02", SmokeMontage, Weight = 0.25f));
//         Transitions.Last().bSeamless = false;

//         Transitions.Add(TransitionToMontage(MainMontage, n"Loop03", EatMontage, Weight = 0.25f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToMontage(MainMontage, n"Loop03", DrinkMontage, Weight = 0.3f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToMontage(MainMontage, n"Loop03", SmokeMontage, Weight = 0.25f));
//         Transitions.Last().bSeamless = false;

//         Transitions.Add(TransitionToMontage(MainMontage, n"Loop04", EatMontage, Weight = 0.25f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToMontage(MainMontage, n"Loop04", DrinkMontage, Weight = 0.3f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToMontage(MainMontage, n"Loop04", SmokeMontage, Weight = 0.25f));
//         Transitions.Last().bSeamless = false;

//         Transitions.Add(TransitionToMontage(MainMontage, n"Loop05", EatMontage, Weight = 0.25f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToMontage(MainMontage, n"Loop05", DrinkMontage, Weight = 0.3f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToMontage(MainMontage, n"Loop05", SmokeMontage, Weight = 0.25f));
//         Transitions.Last().bSeamless = false;

//         /*Transitions.Add(TransitionToSection(MainMontage, n"Spitting", n"Loop01"));
//         Transitions.Add(TransitionToSection(MainMontage, n"Scratch", n"Loop01"));
//         Transitions.Add(TransitionToSection(MainMontage, n"Look", n"Loop01"));
//         Transitions.Add(TransitionToSection(MainMontage, n"Cough", n"Loop01"));
//         Transitions.Add(TransitionToSection(MainMontage, n"WarmHands", n"Loop01"));   */

//         //EAT SECTION
//         Transitions.Add(TransitionToSection(EatMontage, n"Entry", n"Loop", Weight = 0.3333f));
//         Transitions.Add(TransitionToSection(EatMontage, n"Entry", n"Loop2", Weight = 0.3333f));
//         Transitions.Add(TransitionToSection(EatMontage, n"Entry", n"Loop3", Weight = 0.3333f));

//         Transitions.Add(TransitionToSection(EatMontage, n"Loop", n"Loop2", Weight = 0.1f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, n"Loop", n"Loop3", Weight = 0.1f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, n"Loop", n"Breaker01", Weight = 0.65f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, n"Loop", n"Breaker02", Weight = 0.45f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, n"Loop", n"Breaker03", Weight = 0.5f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, n"Loop", n"Breaker04", Weight = 0.05f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, n"Loop", n"Breaker05", Weight = 0.1f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, n"Loop", n"Breaker06", Weight = 0.25f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionStay(EatMontage, n"Loop", Weight = 0.10f));

//         Transitions.Add(TransitionToSection(EatMontage, n"Loop2", n"Loop", Weight = 0.1f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, n"Loop2", n"Loop3", Weight = 0.1f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, n"Loop2", n"Breaker01", Weight = 0.65f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, n"Loop2", n"Breaker02", Weight = 0.45f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, n"Loop2", n"Breaker03", Weight = 0.5f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, n"Loop2", n"Breaker04", Weight = 0.05f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, n"Loop2", n"Breaker05", Weight = 0.1f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, n"Loop2", n"Breaker06", Weight = 0.25f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionStay(EatMontage, n"Loop2", Weight = 0.10f));

//         Transitions.Add(TransitionToSection(EatMontage, n"Loop3", n"Loop2", Weight = 0.1f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, n"Loop3", n"Loop3", Weight = 0.1f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, n"Loop3", n"Breaker01", Weight = 0.65f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, n"Loop3", n"Breaker02", Weight = 0.45f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, n"Loop3", n"Breaker03", Weight = 0.5f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, n"Loop3", n"Breaker04", Weight = 0.05f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, n"Loop3", n"Breaker05", Weight = 0.1f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, n"Loop3", n"Breaker06", Weight = 0.25f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionStay(EatMontage, n"Loop3", Weight = 0.10f));

//         Transitions.Add(TransitionToSection(EatMontage, FromSection = n"Breaker01", ToSection = n"Loop", Weight = 0.3f));
//         Transitions.Add(TransitionToSection(EatMontage, FromSection = n"Breaker01", ToSection = n"Loop2", Weight = 0.3f));
//         Transitions.Add(TransitionToSection(EatMontage, FromSection = n"Breaker01", ToSection = n"Loop3", Weight = 0.3f));
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, FromSection = n"Breaker02", ToSection = n"Loop", Weight = 0.3f));
//         Transitions.Add(TransitionToSection(EatMontage, FromSection = n"Breaker02", ToSection = n"Loop2", Weight = 0.3f));
//         Transitions.Add(TransitionToSection(EatMontage, FromSection = n"Breaker02", ToSection = n"Loop3", Weight = 0.3f));
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, FromSection = n"Breaker03", ToSection = n"Loop", Weight = 0.3f));
//         Transitions.Add(TransitionToSection(EatMontage, FromSection = n"Breaker03", ToSection = n"Loop2", Weight = 0.3f));
//         Transitions.Add(TransitionToSection(EatMontage, FromSection = n"Breaker03", ToSection = n"Loop3", Weight = 0.3f));
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, FromSection = n"Breaker04", ToSection = n"Loop", Weight = 0.3f));
//         Transitions.Add(TransitionToSection(EatMontage, FromSection = n"Breaker04", ToSection = n"Loop2", Weight = 0.3f));
//         Transitions.Add(TransitionToSection(EatMontage, FromSection = n"Breaker04", ToSection = n"Loop3", Weight = 0.3f));
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, FromSection = n"Breaker05", ToSection = n"Loop", Weight = 0.3f));
//         Transitions.Add(TransitionToSection(EatMontage, FromSection = n"Breaker05", ToSection = n"Loop2", Weight = 0.3f));
//         Transitions.Add(TransitionToSection(EatMontage, FromSection = n"Breaker05", ToSection = n"Loop3", Weight = 0.3f));
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(EatMontage, FromSection = n"Breaker06", ToSection = n"Loop", Weight = 0.3f));
//         Transitions.Add(TransitionToSection(EatMontage, FromSection = n"Breaker06", ToSection = n"Loop2", Weight = 0.3f));
//         Transitions.Add(TransitionToSection(EatMontage, FromSection = n"Breaker06", ToSection = n"Loop3", Weight = 0.3f));
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);


//         //DRINK SECTION
//         // ENTRY
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Entry", n"Loop", Weight = 0.5f));
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Entry", n"Loop2", Weight = 0.5f));
//         // LOOP
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Loop", n"Breaker01", Weight = 0.75f));
//         Transitions.Last().CooldownSeconds = 15.0f;
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Loop", n"Breaker02", Weight = 0.5f));
//         Transitions.Last().CooldownSeconds = 15.0f;
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Loop", n"Drink2", Weight = 0.5f));
//         Transitions.Last().CooldownSeconds = 15.0f;
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Loop", n"ChangePose", Weight = 0.25f));
//         Transitions.Last().CooldownSeconds = 25.0f;
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Loop", n"LookBottle", Weight = 0.3f));
//         Transitions.Last().CooldownSeconds = 15.0f;
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Loop", n"Reposition", Weight = 0.1f));
//         Transitions.Last().CooldownSeconds = 15.0f;
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Loop", n"Scratch", Weight = 0.35f));
//         Transitions.Last().CooldownSeconds = 15.0f;
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionStay(DrinkMontage, n"Loop", Weight = 0.05f));
//         // LOOP2
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Loop2", n"Breaker01", Weight = 0.75f));
//         Transitions.Last().CooldownSeconds = 15.0f;
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Loop2", n"Breaker02", Weight = 0.5f));
//         Transitions.Last().CooldownSeconds = 15.0f;
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Loop2", n"Drink2", Weight = 0.5f));
//         Transitions.Last().CooldownSeconds = 15.0f;
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Loop2", n"ChangePose", Weight = 0.25f));
//         Transitions.Last().CooldownSeconds = 25.0f;
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Loop2", n"LookBottle", Weight = 0.3f));
//         Transitions.Last().CooldownSeconds = 15.0f;
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Loop2", n"Reposition", Weight = 0.1f));
//         Transitions.Last().CooldownSeconds = 15.0f;
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Loop2", n"Scratch", Weight = 0.35f));
//         Transitions.Last().CooldownSeconds = 15.0f;
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionStay(DrinkMontage, n"Loop2", Weight = 0.05f));
//         // TRANSITIONS TO LOOP
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Breaker01", n"Loop", Weight = 0.4f));
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Breaker01", n"Loop2", Weight = 0.4f));
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Breaker01", n"Exit", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Breaker02", n"Loop", Weight = 0.4f));
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Breaker02", n"Loop2", Weight = 0.4f));
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Breaker02", n"Exit", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Drink2", n"Loop", Weight = 0.4f));
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Drink2", n"Loop2", Weight = 0.4f));
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Drink2", n"Exit", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(DrinkMontage, n"ChangePose", n"Loop", Weight = 0.4f));
//         Transitions.Add(TransitionToSection(DrinkMontage, n"ChangePose", n"Loop2", Weight = 0.4f));
//         Transitions.Add(TransitionToSection(DrinkMontage, n"ChangePose", n"Exit", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(DrinkMontage, n"LookBottle", n"Loop", Weight = 0.4f));
//         Transitions.Add(TransitionToSection(DrinkMontage, n"LookBottle", n"Loop2", Weight = 0.4f));
//         Transitions.Add(TransitionToSection(DrinkMontage, n"LookBottle", n"Exit", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Reposition", n"Loop", Weight = 0.4f));
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Reposition", n"Loop2", Weight = 0.4f));
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Reposition", n"Exit", Weight = 0.2f));
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Scratch", n"Loop", Weight = 0.4f));
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Scratch", n"Loop2", Weight = 0.4f));
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Scratch", n"Exit", Weight = 0.2f));
//         Transitions.Add(TransitionAfterMontageEnds(DrinkMontage,MainMontage,n"Loop01"));

//         //SMOKE SECTION
//         Transitions.Add(TransitionToSection(SmokeMontage, n"Entry", n"Loop"));

//         Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker01", Weight = 0.3f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker02", Weight = 0.3f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker03", Weight = 0.2f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionStay(SmokeMontage, n"Loop", Weight = 0.2f));
//         Transitions.Add(TransitionAfterMontageEnds(SmokeMontage,MainMontage,n"Loop01"));
//         Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker01", n"Loop", Weight = 0.60f));
//         Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker02", n"Loop", Weight = 0.60f));
//         Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker03", n"Loop", Weight = 0.60f));
//         Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker01", n"Exit", Weight = 0.40f));
//         Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker02", n"Exit", Weight = 0.40f));
//         Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker03", n"Exit", Weight = 0.40f));

//     }
// }

UCLASS()
class UAbilityTask_Interaction_Human_Sit_Ground : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Interact_Sit_Ground);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/SitGround/Man_Digger_SitGround_Montage.Man_Digger_SitGround_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Cough", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Look", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Spitting", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Scratch", Weight = 0.2f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop", Weight = 0.2f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_RepairBuilding : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_RepairBuilding);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/BuildingHouse/Man_BuildingHouse_Montage.Man_BuildingHouse_Montage'";

    default QuickExitMode = EInteractionFastExitMode::PlayFastExitIfAvailableOtherwiseBlendOut;

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop04", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Loop03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Loop04", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Reset", Weight = 0.2f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop04", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Reset", Weight = 0.2f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop04", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Reset", Weight = 0.2f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Loop", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Loop03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Reset", Weight = 0.2f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop04", Weight = 0.2f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_RepairFloor : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_RepairFloor);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Repair/A_Man_BuildingGround_Montage.A_Man_BuildingGround_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {

        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Rest", Weight = 0.2f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Rest", Weight = 0.2f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop02", Weight = 0.2f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_GetFood : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_GetFood);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/OLD/Human_TakeObjectToCarry_Montage.Human_TakeObjectToCarry_Montage'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;
}

UCLASS()
class UAbilityTask_Interaction_Human_Sweep : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sweep);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sweep/Man_Sweep_Montage.Man_Sweep_Montage'";
    default ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sweep/Broom_Sweep_Montage.Broom_Sweep_Montage'";

    default AutoTransitionCheckSecondsMin = 8.0f;
    default AutoTransitionCheckSecondsMax = 10.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        
        //ENTRY
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop03", Weight = 0.5f));
        
        //LOOP01    
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop02", Weight = 0.35f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop03", Weight = 0.35f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker03", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.25f));

        //LOOP02    
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop01", Weight = 0.35f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop03", Weight = 0.35f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker03", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop02", Weight = 0.25f));

        //LOOP03    
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop01", Weight = 0.35f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop02", Weight = 0.35f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Breaker01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Breaker02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Breaker03", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop03", Weight = 0.25f));

    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Lurk : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Lurk);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/HunterStalking/Human_Stalking_Montage.Human_Stalking_Montage'";
    default SimulationLoopAnimation = n"/Script/Engine.AnimSequence'/Game/AnimLibrary/Humanoid/Man/Living/HunterStalking/A_Man_HunterStalking.A_Man_HunterStalking'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 2.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_SmallTalk : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Smalltalk);

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    UPROPERTY() TSoftObjectPtr<UAnimMontage> TalkMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/SmallTalk/Man_SmallTalk_Montage.Man_SmallTalk_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> StandMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Digger/Man_Digger_IdleActions_Montage.Man_Digger_IdleActions_Montage'";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        MainMontage = StandMontage;

         //STAND SECTION
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Cough", Weight = 0.05f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Scratch", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Stretch", Weight = 0.05f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop", Weight = 0.05f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToMontage(MainMontage, n"Loop", TalkMontage, Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Cough", n"Loop"));
        Transitions.Add(TransitionToSection(MainMontage, n"Scratch", n"Loop"));
        Transitions.Add(TransitionToSection(MainMontage, n"Stretch", n"Loop"));

        //TALK SECTION
        Transitions.Add(TransitionToSection(TalkMontage, n"Loop", n"Affirmative", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Smalltalk);
        Transitions.Add(TransitionToSection(TalkMontage, n"Loop", n"Negative", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Smalltalk);
        Transitions.Add(TransitionToSection(TalkMontage, n"Loop", n"Talk01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Smalltalk);
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(TalkMontage, n"Loop", n"Talk02", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Smalltalk);
        Transitions.Add(TransitionToMontage(TalkMontage, n"Loop", MainMontage, Weight = 0.1f));
        Transitions.Last().bSeamless = false;
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_SmallTalk_Seated : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Smalltalk_Seated);

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    UPROPERTY() TSoftObjectPtr<UAnimMontage> TalkMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_Smalltalk/Man_Digger_Sit_Smalltalk_Montage.Man_Digger_Sit_Smalltalk_Montage'";

    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair); 

    default MainMontage = TalkMontage;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        //TALK SECTION
        Transitions.Add(TransitionToSection(TalkMontage, n"Entry", n"Talk", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Smalltalk);
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_ArenaSpectator : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_ArenaSpectator);

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 6.0f;

    //default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Cheering/Man_Digger_Cheer.Man_Digger_Cheer'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> StandMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Idle/Man_IdleActions_Montage.Man_IdleActions_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> CheerMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Cheering/Man_Digger_Cheer.Man_Digger_Cheer'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> DrinkMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Drink/Man_Digger_Drink_Montage.Man_Digger_Drink_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> DrinkCheerMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Drink/Cheering/Man_Digger_Drink_Cheering_Montage.Man_Digger_Drink_Cheering_Montage'";

    default MainMontage = StandMontage;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {

        //STAND MONTAGE
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"DryingSweat", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Cough", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToMontage(MainMontage, n"Loop", CheerMontage, Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToMontage(MainMontage, n"Loop", DrinkMontage, Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop", Weight = 0.15f));

        //CHEER MONTAGE
        Transitions.Add(TransitionToSection(CheerMontage, n"Loop", n"Breaker01", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CheerMontage, n"Loop", n"Breaker02", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(CheerMontage, n"Loop", Weight = 0.15f));
        Transitions.Add(TransitionToMontage(CheerMontage, n"Loop",MainMontage, Weight = 0.1f));

        //DRINK MONTAGE
        Transitions.Add(TransitionToSection(DrinkMontage, n"Loop", n"Drink", Weight = 0.2f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToMontage(DrinkMontage, n"Loop", DrinkCheerMontage, Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToMontage(DrinkMontage, n"Exit", MainMontage, Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(DrinkMontage, n"Loop", Weight = 0.15f));

        //DRINK CHEER MONTAGE
        Transitions.Add(TransitionToSection(DrinkCheerMontage, n"Entry", n"Loop01"));
        Transitions.Add(TransitionToSection(DrinkCheerMontage, n"Entry", n"Loop02"));
        Transitions.Add(TransitionToSection(DrinkCheerMontage, n"Entry", n"Loop03"));
        Transitions.Add(TransitionToSection(DrinkCheerMontage, n"Loop01", n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(DrinkCheerMontage, n"Loop01", n"Loop03", Weight = 0.2f));
        Transitions.Add(TransitionStay(DrinkCheerMontage, n"Loop01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(DrinkCheerMontage, n"Loop02", n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(DrinkCheerMontage, n"Loop02", n"Loop03", Weight = 0.2f));
        Transitions.Add(TransitionStay(DrinkCheerMontage, n"Loop02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(DrinkCheerMontage, n"Loop03", n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(DrinkCheerMontage, n"Loop03", n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionStay(DrinkCheerMontage, n"Loop03", Weight = 0.15f));
        Transitions.Add(TransitionToMontage(DrinkCheerMontage, n"Loop01",DrinkMontage, Weight = 0.1f));
        Transitions.Add(TransitionToMontage(DrinkCheerMontage, n"Loop02",DrinkMontage, Weight = 0.1f));
        Transitions.Add(TransitionToMontage(DrinkCheerMontage, n"Loop03",DrinkMontage, Weight = 0.1f));
    }

}

// UCLASS()
// class UAbilityTask_Interaction_Human_ArenaSpectator_Seated : UAbilityTask_Interaction_Human_SitAndSleep_IO
// {
//     default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_ArenaSpectator_Seated);

//     default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);

//     default AutoTransitionCheckSecondsMin = 4.0f;
//     default AutoTransitionCheckSecondsMax = 6.0f;

//     //default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit/Cheering/Man_Digger_Sit_Cheer.Man_Digger_Sit_Cheer'";
//     UPROPERTY() TSoftObjectPtr<UAnimMontage> SitMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit/Man_Digger_Sit_Montage.Man_Digger_Sit_Montage'";
//     UPROPERTY() TSoftObjectPtr<UAnimMontage> SitCheerMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit/Cheering/Man_Digger_Sit_Cheer.Man_Digger_Sit_Cheer'";
//     UPROPERTY() TSoftObjectPtr<UAnimMontage> DrinkMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_Drink/Man_Digger_Sit_Drink_Montage.Man_Digger_Sit_Drink_Montage'";
//     UPROPERTY() TSoftObjectPtr<UAnimMontage> DrinkCheerMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_Drink/Cheering/A_Man_Digger_Sit_Dink_Cheering_Montage.A_Man_Digger_Sit_Dink_Cheering_Montage'";

//     default MainMontage = SitMontage;

//     default bAllowInterruptLoopOnCancel = true;
//     default QuickExitAnimationRate = 1.5f;

//     default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

//     UFUNCTION(BlueprintOverride)
//     void SetupTransitions()
//     {

//         //SIT SECTION
//         // Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop01"));
//         // Transitions.Add(TransitionToSection(MainMontage, n"EntryBack", n"Loop01"));
//         // Transitions.Add(TransitionToSection(MainMontage, n"EntryLeft", n"Loop01"));
//         // Transitions.Add(TransitionToSection(MainMontage, n"EntryRight", n"Loop01"));

//         Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Fly", Weight = 0.05f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Scratch", Weight = 0.2f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Relocate", Weight = 0.1f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Cough", Weight = 0.05f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"ScratchNose", Weight = 0.15f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.1f));
//         Transitions.Last().bSeamless = false;

//         Transitions.Add(TransitionToMontage(MainMontage, n"Loop", SitCheerMontage, Weight = 1.0f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToMontage(MainMontage, n"Loop", DrinkMontage, Weight = 0.8f));
//         Transitions.Last().bSeamless = false;

//         Transitions.Add(TransitionToSection(MainMontage, n"Fly", n"Loop01"));
//         Transitions.Add(TransitionToSection(MainMontage, n"Scratch", n"Loop01"));
//         Transitions.Add(TransitionToSection(MainMontage, n"Relocate", n"Loop01"));
//         Transitions.Add(TransitionToSection(MainMontage, n"Cough", n"Loop01"));
//         Transitions.Add(TransitionToSection(MainMontage, n"ScratchNose", n"Loop01"));

//         //DRINK SIT SECTION
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Loop", n"Breaker01", Weight = 0.30f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Loop", n"Breaker02", Weight = 0.20f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
//         Transitions.Add(TransitionStay(DrinkMontage, n"Loop", Weight = 0.10f));
//         Transitions.Last().bSeamless = false;

//         Transitions.Add(TransitionAfterMontageEnds(DrinkMontage, MainMontage, n"Loop01"));
//         Transitions.Last().bSeamless = false;

//         Transitions.Add(TransitionToSection(DrinkMontage, n"Breaker01", n"Loop", Weight = 0.85f));
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Breaker02", n"Loop", Weight = 0.85f));
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Breaker01", n"Exit", Weight = 0.15f));
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Breaker02", n"Exit", Weight = 0.1f));
//         Transitions.Add(TransitionToSection(DrinkMontage, n"Loop", n"Exit", Weight = 0.30f));
//         Transitions.Last().bSeamless = false;

//         Transitions.Add(TransitionToMontage(DrinkMontage, n"Loop", DrinkCheerMontage, Weight = 0.8f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToMontage(DrinkMontage, n"Breaker01", DrinkCheerMontage, Weight = 0.9f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToMontage(DrinkMontage, n"Breaker02", DrinkCheerMontage, Weight = 1.0f));
//         Transitions.Last().bSeamless = false;

//         //CHEER SIT SECTION
//         Transitions.Add(TransitionToSection(SitCheerMontage, n"Loop", n"Breaker01", Weight = 0.5f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToSection(SitCheerMontage, n"Loop", n"Breaker02", Weight = 0.35f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionStay(SitCheerMontage, n"Loop", Weight = 0.25f));
//         Transitions.Add(TransitionAfterMontageEnds(SitCheerMontage, MainMontage, n"Loop01", Weight = 0.35f));
//         Transitions.Last().bSeamless = false;
        
//         Transitions.Add(TransitionAfterMontageEnds(SitCheerMontage, DrinkMontage, n"Entry", Weight = 0.4f));
//         Transitions.Last().bSeamless = false;
        

//         Transitions.Add(TransitionToSection(SitCheerMontage, n"Breaker01", n"Loop", Weight = 0.9f));
//         Transitions.Add(TransitionToSection(SitCheerMontage, n"Breaker02", n"Loop", Weight = 0.9f));
//         Transitions.Add(TransitionToSection(SitCheerMontage, n"Breaker01", n"Exit", Weight = 0.1f));
//         Transitions.Add(TransitionToSection(SitCheerMontage, n"Breaker02", n"Exit", Weight = 0.1f));
//         Transitions.Add(TransitionToSection(SitCheerMontage, n"Loop", n"Exit", Weight = 0.05f));
        

//         //CHEER DRINK SIT SECTION
//         Transitions.Add(TransitionToSection(DrinkCheerMontage, n"Entry", n"Loop01", Weight = 0.2f));
//         //Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToSection(DrinkCheerMontage, n"Entry", n"Loop02", Weight = 0.2f));
//         //Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToSection(DrinkCheerMontage, n"Entry", n"Loop03", Weight = 0.2f));
//         //Transitions.Last().bSeamless = false;

//         Transitions.Add(TransitionToSection(DrinkCheerMontage, n"Loop01", n"Loop02", Weight = 0.2f));
//         //Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToSection(DrinkCheerMontage, n"Loop01", n"Loop03", Weight = 0.2f));
//         //Transitions.Last().bSeamless = false;

//         Transitions.Add(TransitionToSection(DrinkCheerMontage, n"Loop02", n"Loop01", Weight = 0.2f));
//         //Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToSection(DrinkCheerMontage, n"Loop02", n"Loop03", Weight = 0.2f));
//         //Transitions.Last().bSeamless = false;

//         Transitions.Add(TransitionToSection(DrinkCheerMontage, n"Loop03", n"Loop02", Weight = 0.2f));
//         //Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToSection(DrinkCheerMontage, n"Loop03", n"Loop01", Weight = 0.2f));
//         //Transitions.Last().bSeamless = false;

//         Transitions.Add(TransitionStay(DrinkCheerMontage, n"Loop01", Weight = 0.15f));
//         Transitions.Add(TransitionStay(DrinkCheerMontage, n"Loop02", Weight = 0.15f));
//         Transitions.Add(TransitionStay(DrinkCheerMontage, n"Loop03", Weight = 0.15f));
//         Transitions.Add(TransitionAfterMontageEnds(DrinkCheerMontage, DrinkMontage, n"Loop"));
//         Transitions.Last().bSeamless = false;
    
//         Transitions.Add(TransitionToSection(DrinkCheerMontage, n"Loop01", n"Exit", Weight = 0.2f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToSection(DrinkCheerMontage, n"Loop02", n"Exit", Weight = 0.2f));
//         Transitions.Last().bSeamless = false;
//         Transitions.Add(TransitionToSection(DrinkCheerMontage, n"Loop03", n"Exit", Weight = 0.2f));
//         Transitions.Last().bSeamless = false;
//     }
// }

UCLASS()
class UAbilityTask_Interaction_Human_WashSelf : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_WashSelf);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/WashFace_Long/Human_WashSelf_Montage.Human_WashSelf_Montage'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_WashSelf_High : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_WashSelf_High);

    UPROPERTY() TSoftObjectPtr<UAnimMontage> Pose01Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/WashFace_DrinkingTrough/Man_WashFace_DrinkingTrough_01_Montage.Man_WashFace_DrinkingTrough_01_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> Pose02Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/WashFace_DrinkingTrough/Man_WashFace_DrinkingTrough_02_Montage.Man_WashFace_DrinkingTrough_02_Montage'";
    
    default MainMontage = Pose01Montage;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        if(Math::RandBool())
        {
            MainMontage = Pose01Montage;
        }
        else
        {
            MainMontage = Pose02Montage;
        }
    }

}

UCLASS()
class UAbilityTask_Interaction_Human_PlayTune : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_PlayTune);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/PlayLute/PlayLuteMontage.PlayLuteMontage'";

    default QuickExitMode = EInteractionFastExitMode::PlayFastExitIfAvailableOtherwiseBlendOut;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop_01", Weight = 0.16f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop_02", Weight = 0.16f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop_03", Weight = 0.16f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop_04", Weight = 0.16f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop_05", Weight = 0.16f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop_06", Weight = 0.16f));
    
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_01", n"Loop_02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_01", n"Loop_03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_01", n"Loop_04", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_01", n"Loop_05", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_01", n"Loop_06", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_01", n"Sweat", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_01", n"Rest_01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_01", n"Rest_02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_01", n"Reverence_01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_01", n"Reverence_02", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_01", n"Public_01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_01", n"Public_02", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop_01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_02", n"Loop_01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_02", n"Loop_03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_02", n"Loop_04", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_02", n"Loop_05", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_02", n"Loop_06", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_02", n"Sweat", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_02", n"Rest_01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_02", n"Rest_02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_02", n"Reverence_01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_02", n"Reverence_02", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_02", n"Public_01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_02", n"Public_02", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop_02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_03", n"Loop_01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_03", n"Loop_02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_03", n"Loop_04", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_03", n"Loop_05", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_03", n"Loop_06", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_03", n"Sweat", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_03", n"Rest_01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_03", n"Rest_02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_03", n"Reverence_01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_03", n"Reverence_02", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_03", n"Public_01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_03", n"Public_02", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop_03", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_04", n"Loop_01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_04", n"Loop_02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_04", n"Loop_03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_04", n"Loop_05", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_04", n"Loop_06", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_04", n"Sweat", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_04", n"Rest_01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_04", n"Rest_02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_04", n"Reverence_01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_04", n"Reverence_02", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_04", n"Public_01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_04", n"Public_02", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop_04", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_05", n"Loop_01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_05", n"Loop_02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_05", n"Loop_03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_05", n"Loop_04", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_05", n"Loop_06", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_05", n"Sweat", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_05", n"Rest_01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_05", n"Rest_02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_05", n"Reverence_01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_05", n"Reverence_02", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_05", n"Public_01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_05", n"Public_02", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop_05", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_06", n"Loop_01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_06", n"Loop_02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_06", n"Loop_03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_06", n"Loop_04", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_06", n"Loop_05", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_06", n"Sweat", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_06", n"Rest_01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_06", n"Rest_02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_06", n"Reverence_01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_06", n"Reverence_02", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_06", n"Public_01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop_06", n"Public_02", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop_06", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Sweat", n"Loop_01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Sweat", n"Loop_02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Sweat", n"Loop_03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Sweat", n"Loop_04", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Sweat", n"Loop_05", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Sweat", n"Loop_06", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Sweat", n"Rest_01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Sweat", n"Rest_02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Sweat", n"Reverence_01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Sweat", n"Reverence_02", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Sweat", n"Public_01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Sweat", n"Public_02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Rest_01", n"Loop_01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Rest_01", n"Loop_02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Rest_01", n"Loop_03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Rest_01", n"Loop_04", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Rest_01", n"Loop_05", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Rest_01", n"Loop_06", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Rest_01", n"Sweat", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Rest_01", n"Rest_02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Rest_01", n"Reverence_01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Rest_01", n"Reverence_02", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Rest_01", n"Public_01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Rest_01", n"Public_02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Rest_02", n"Loop_01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Rest_02", n"Loop_02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Rest_02", n"Loop_03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Rest_02", n"Loop_04", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Rest_02", n"Loop_05", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Rest_02", n"Loop_06", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Rest_02", n"Rest_01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Rest_02", n"Sweat", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Rest_02", n"Reverence_01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Rest_02", n"Reverence_02", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Rest_02", n"Public_01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Rest_02", n"Public_02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_01", n"Loop_01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_01", n"Loop_02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_01", n"Loop_03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_01", n"Loop_04", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_01", n"Loop_05", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_01", n"Loop_06", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_01", n"Rest_01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_01", n"Rest_02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_01", n"Sweat", Weight = 0.15));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_01", n"Reverence_02", Weight = 0.01f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_01", n"Public_01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_01", n"Public_02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_01", n"Exit", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_02", n"Loop_01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_02", n"Loop_02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_02", n"Loop_03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_02", n"Loop_04", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_02", n"Loop_05", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_02", n"Loop_06", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_02", n"Rest_01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_02", n"Rest_02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_02", n"Reverence_01", Weight = 0.01f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_02", n"Sweat", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_02", n"Public_01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_02", n"Public_02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Reverence_02", n"Exit", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Public_01", n"Loop_01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Public_01", n"Loop_02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Public_01", n"Loop_03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Public_01", n"Loop_04", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Public_01", n"Loop_05", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Public_01", n"Loop_06", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Public_01", n"Rest_01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Public_01", n"Rest_02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Public_01", n"Reverence_01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Public_01", n"Reverence_02", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Public_01", n"Sweat", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Public_01", n"Public_02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Public_02", n"Loop_01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Public_02", n"Loop_02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Public_02", n"Loop_03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Public_02", n"Loop_04", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Public_02", n"Loop_05", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Public_02", n"Loop_06", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Public_02", n"Rest_01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Public_02", n"Rest_02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Public_02", n"Reverence_01", Weight = 0.05));
        Transitions.Add(TransitionToSection(MainMontage, n"Public_02", n"Reverence_02", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, n"Public_02", n"Public_01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Public_02", n"Sweat", Weight = 0.1f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_PlayTune_Seated : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_PlayTune_Seated);
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_PlayLute/Man_Sit_PlayLute_Montage.Man_Sit_PlayLute_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop02", Weight = 0.45f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop03", Weight = 0.45f));
        

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop03", Weight = 0.5f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop03", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.85f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop02", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop03", Weight = 0.85f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_TuneInstrument : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_TuneInstrument);
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_PlayLute/Man_Sit_PlayLute_Montage.Man_Sit_PlayLute_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01", Weight = 0.3333f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop02", Weight = 0.3333f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop03", Weight = 0.3333f));
        

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop03", Weight = 0.5f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop01", Weight = 0.85f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop03", Weight = 0.15f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop01", Weight = 0.85f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop02", Weight = 0.15f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop03", Weight = 0.05f));
    }

}

UCLASS()
class UAbilityTask_Interaction_Human_PlayDarts : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_PlayDarts);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/PlayDarts/Man_PlayDarts_Montage.Man_PlayDarts_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop02", Weight = 0.5f));
        
        //LOOP01
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker01", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker02", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker03", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker04", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker05", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker06", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 25.0f;
        //LOOP02
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker01", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker02", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker03", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker04", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker05", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker06", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 25.0f;
        //BREAKERS
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker01", ToSection = n"Loop", Weight = 0.35f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker01", ToSection = n"Loop02", Weight = 0.65f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker02", ToSection = n"Loop", Weight = 0.35f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker02", ToSection = n"Loop02", Weight = 0.65f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker03", ToSection = n"Loop", Weight = 0.35f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker03", ToSection = n"Loop02", Weight = 0.65f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker04", ToSection = n"Loop", Weight = 0.35f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker04", ToSection = n"Loop02", Weight = 0.65f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker05", ToSection = n"Loop", Weight = 0.35f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker05", ToSection = n"Loop02", Weight = 0.65f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker06", ToSection = n"Loop", Weight = 0.35f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker06", ToSection = n"Loop02", Weight = 0.65f));  
    }

}

UCLASS()
class UAbilityTask_Interaction_Human_PlayKnife : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_PlayKnife);
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_PlayKnife/Man_Sit_PlayKnife_Montage.Man_Sit_PlayKnife_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    { 
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker01", Weight = 0.3333f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker02", Weight = 0.3333f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker03", Weight = 0.3333f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 15.0f;
    }

}

UCLASS()
class UAbilityTask_Interaction_Human_PlayStone : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_PlayStone);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/PlayStone/Man_PlayStone_Montage.Man_PlayStone_Montage'";

    default AutoTransitionCheckSecondsMin = 5.0f;
    default AutoTransitionCheckSecondsMax = 10.0f;

    default bAllowInterruptLoopOnCancel = true;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    { 
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker01", Weight = 0.3333f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker02", Weight = 0.3333f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker03", Weight = 0.3333f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 15.0f;
    }

}

UCLASS()
class UAbilityTask_Interaction_Human_Sit_PlayStone : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_PlayStone_Seated);
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_PlayStone/Man_Sit_PlayStone_Montage.Man_Sit_PlayStone_Montage'";

    default AutoTransitionCheckSecondsMin = 5.0f;
    default AutoTransitionCheckSecondsMax = 10.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    { 
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker01", Weight = 0.3333f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker02", Weight = 0.3333f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker03", Weight = 0.3333f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker04", Weight = 0.3333f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Smalltalk);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker05", Weight = 0.3333f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Smalltalk);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker06", Weight = 0.3333f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Smalltalk);
    }

}

UCLASS()
class UAbilityTask_Interaction_Human_CountOre : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_CountOre);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/CountOre/Man_CountOre_Montage.Man_CountOre_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop"));

        //LOOP01
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker01", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker02", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker04", Weight = 0.1f));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Smalltalk);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker05", Weight = 0.15f));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Smalltalk);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker06", Weight = 0.15f));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Smalltalk);
    }

}

UCLASS()
class UAbilityTask_Interaction_Human_CountOre_Seated : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_CountOreSeated);
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/SitCountOre/Man_Sit_CountOre_Montage.Man_Sit_CountOre_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop"));
        //LOOP01
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker01", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker02", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker04", Weight = 0.1f));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Smalltalk);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker05", Weight = 0.15f));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Smalltalk);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker06", Weight = 0.15f));
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Smalltalk);
    }

}

UCLASS()
class UAbilityTask_Interaction_Human_CheckRain : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_CheckRain);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/CheckRain/Man_CheckRain_Montage.Man_CheckRain_Montage'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;
}

UCLASS()
class UAbilityTask_Interaction_Human_RainStart : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_RainStart);

    UPROPERTY()
    TArray<TSoftObjectPtr<UAnimMontage>> Montages;

    default Montages.Add(TSoftObjectPtr<UAnimMontage>(n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/CheckRain/Man_CheckRain_02_Montage.Man_CheckRain_02_Montage'"));
    default Montages.Add(TSoftObjectPtr<UAnimMontage>(n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/CheckRain/Man_CheckRain_03_Montage.Man_CheckRain_03_Montage'"));
    
    default bPossibleAnywhere = true;

    default AutoTransitionCheckSecondsMin = 0.0f;
    default AutoTransitionCheckSecondsMax = 1.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        int IndexMontage = Math::RandRange(0,Montages.Num()-1);
        MainMontage = Montages[IndexMontage]; 
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_LightFire : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_LightFire);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/FrontCampfire/Man_FrontCampfire_Montage.Man_FrontCampfire_Montage'";

    default AutoTransitionCheckSecondsMin = 4.0f;
    default AutoTransitionCheckSecondsMax = 5.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01"));
        
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop02"));
        
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop03"));
        

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop02", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop03", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Stoking", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Removedor01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Removedor02", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Blow", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Scratch", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Fan", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Yawn", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop01", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop02", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Stoking", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Removedor01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Removedor02", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Blow", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Scratch", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Fan", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Yawn", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionStay(MainMontage, n"Loop03", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop01", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop03", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Stoking", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Removedor01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Removedor02", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Blow", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Scratch", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Fan", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Yawn", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionStay(MainMontage, n"Loop02", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_LightTorch : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_LightTorch);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/OLD/Human_LookAround_Montage.Human_LookAround_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_WorkOnMaps : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_WorkOnMaps);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit/Man_Digger_Sit_Montage.Man_Digger_Sit_Montage'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;
    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop04", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop05", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop06", Weight = 0.2f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_GrindingMill_TossOre : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_TossOre);

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 6.0f;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Machines/Grinding_Machine/A_Man_GrindingMill_Bucket/A_Man_GrindingMill_Bucket_Montage.A_Man_GrindingMill_Bucket_Montage'";
    default ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Machines/Grinding_Machine/A_Man_GrindingMill_Bucket/A_GrindingMill_Bucket_Montage.A_GrindingMill_Bucket_Montage'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Idle", Weight = 0.9f));

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle", ToSection = n"Breaker01", Weight = 0.9f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Idle", Weight = 0.1f));

    }
}

UCLASS()
class UAbilityTask_Interaction_Human_WaitSmalltalk : UAbilityTask_Interaction_Human_StandAround
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_WaitSmalltalk);
}

UCLASS()
class UAbilityTask_Interaction_Human_StandAround : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_StandAround);

    default AutoTransitionCheckSecondsMin = 5.0f;
    default AutoTransitionCheckSecondsMax = 10.0f;
    
    default bPossibleAnywhere = true;

    UPROPERTY() TSoftObjectPtr<UAnimMontage> StandMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Idle/IdlePose/A_Man_IdlePose_Montage.A_Man_IdlePose_Montage'";

    default MontageEntryFrontSection = NAME_None;
    default MontageEntryBackSection = NAME_None;
    default MontageEntryRightSection = NAME_None;
    default MontageEntryLeftSection = NAME_None;

    default MontageExitFrontSection = NAME_None;
    default MontageExitBackSection = NAME_None;
    default MontageExitRightSection = NAME_None;
    default MontageExitLeftSection = NAME_None;

    default MainMontage = StandMontage;

    UFUNCTION(BlueprintOverride) 
    void SetupTransitions()
    {

        //LOOP01 SECTION
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop02", Weight = 0.35f));
        Transitions.Last().bSeamless = false;
        /*Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop03", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop04", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop05", Weight = 0.5f));
        Transitions.Last().bSeamless = false;*/
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Scratch", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"HandFace", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Relocate", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Fly", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Shoulder", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Stretch", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"HandsHips", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Cough", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Nails", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"ScratchHead", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"MoveFeet", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"StepBug", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        /*Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"LookLeft", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"LookRight", Weight = 0.25f));
        Transitions.Last().bSeamless = false;*/
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"LookDown", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"LookUp", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.25f));

        //LOOP02 SECTION
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop01", Weight = 0.05f));
        Transitions.Last().bSeamless = false;
        /*Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop03", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop04", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop05", Weight = 0.15f));
        Transitions.Last().bSeamless = false;*/
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Scratch", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"HandFace", Weight = 0.35f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Relocate", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Fly", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Shoulder", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Stretch", Weight = 0.35f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"HandsHips", Weight = 0.35f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Cough", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Nails", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"ScratchHead", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"MoveFeet", Weight = 0.36f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"StepBug", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"LookLeft", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"LookRight", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"LookDown", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"LookUp", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop02", Weight = 0.25f));

        //LOOP03 SECTION
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop02", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop01", Weight = 0.05f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop04", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop05", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Scratch", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"HandFace", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Relocate", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Fly", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Shoulder", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Stretch", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"HandsHips", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Cough", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Nails", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"ScratchHead", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"MoveFeet", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"StepBug", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"LookLeft", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"LookRight", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"LookDown", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"LookUp", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop03", Weight = 0.25f));

        //LOOP04 SECTION
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Loop02", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Loop03", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Loop01", Weight = 0.05f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Loop05", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Scratch", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"HandFace", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Relocate", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Fly", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Shoulder", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Stretch", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"HandsHips", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Cough", Weight = 0.34f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Nails", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"ScratchHead", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"MoveFeet", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"StepBug", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"LookLeft", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"LookRight", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"LookDown", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"LookUp", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop04", Weight = 0.25f));

        //LOOP05 SECTION
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"Loop02", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"Loop03", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"Loop04", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"Loop01", Weight = 0.05f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"Scratch", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"HandFace", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"Relocate", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"Fly", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"Shoulder", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"Stretch", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"HandsHips", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"Cough", Weight = 0.35f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"Nails", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"ScratchHead", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"MoveFeet", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"StepBug", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"LookLeft", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"LookRight", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"LookDown", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop05", n"LookUp", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop05", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, n"Scratch", n"Loop01", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Scratch", n"Loop02", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Scratch", n"Loop03", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Scratch", n"Loop04", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Scratch", n"Loop05", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"HandFace", n"Loop01", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"HandFace", n"Loop02", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"HandFace", n"Loop03", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"HandFace", n"Loop04", Weight = 0.75f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"HandFace", n"Loop05", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Relocate", n"Loop01", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Relocate", n"Loop02", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Relocate", n"Loop03", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Relocate", n"Loop04", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Relocate", n"Loop05", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Fly", n"Loop01", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Fly", n"Loop02", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Fly", n"Loop03", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Fly", n"Loop04", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Fly", n"Loop05", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Shoulder", n"Loop01", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Shoulder", n"Loop02", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Shoulder", n"Loop03", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Shoulder", n"Loop04", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Shoulder", n"Loop05", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Stretch", n"Loop01", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Stretch", n"Loop02", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Stretch", n"Loop03", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Stretch", n"Loop04", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Stretch", n"Loop05", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"HandsHips", n"Loop01", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"HandsHips", n"Loop02", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"HandsHips", n"Loop03", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"HandsHips", n"Loop04", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"HandsHips", n"Loop05", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Cough", n"Loop01", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Cough", n"Loop02", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Cough", n"Loop03", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Cough", n"Loop04", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Cough", n"Loop05", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Nails", n"Loop01", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Nails", n"Loop02", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Nails", n"Loop03", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Nails", n"Loop04", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"Nails", n"Loop05", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"ScratchHead", n"Loop01", Weight = 0.5f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"ScratchHead", n"Loop02", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"ScratchHead", n"Loop03", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"ScratchHead", n"Loop04", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"ScratchHead", n"Loop05", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"MoveFeet", n"Loop01", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"MoveFeet", n"Loop02", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"MoveFeet", n"Loop03", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"MoveFeet", n"Loop04", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"MoveFeet", n"Loop05", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"StepBug", n"Loop01", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"StepBug", n"Loop02", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"StepBug", n"Loop03", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"StepBug", n"Loop04", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"StepBug", n"Loop05", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"LookLeft", n"Loop01", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"LookLeft", n"Loop02", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"LookLeft", n"Loop03", Weight = 0.75f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"LookLeft", n"Loop04", Weight = 0.75f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"LookLeft", n"Loop05", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"LookRight", n"Loop01", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"LookRight", n"Loop02", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"LookRight", n"Loop03", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"LookRight", n"Loop04", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"LookRight", n"Loop05", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"LookUp", n"Loop01", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"LookUp", n"Loop02", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"LookUp", n"Loop03", Weight = 0.75f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"LookUp", n"Loop04", Weight = 0.75f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"LookUp", n"Loop05", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"LookDown", n"Loop01", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"LookDown", n"Loop02", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"LookDown", n"Loop03", Weight = 0.75f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"LookDown", n"Loop04", Weight = 0.75f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
        Transitions.Add(TransitionToSection(MainMontage, n"LookDown", n"Loop05", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f,7.0f);
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Campfire : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Campfire);

    // How often should we try to do a transition?
    default AutoTransitionCheckSecondsMin = 3.0f;
    default AutoTransitionCheckSecondsMax = 5.0f;

    UPROPERTY() TSoftObjectPtr<UAnimMontage> StandMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Digger/Man_Digger_IdleActions_Montage.Man_Digger_IdleActions_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> EatMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Eat/Man_Digger_Eat_Bowl_Montage.Man_Digger_Eat_Bowl_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> DrinkMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Drink/Man_Digger_Drink_Montage.Man_Digger_Drink_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> SmokeMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Smoke/Man_Digger_Smoke_Montage.Man_Digger_Smoke_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> WarmHandsMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/WarmHands/Man_Digger_WarmHands_Montage.Man_Digger_WarmHands_Montage'";

    default MainMontage = StandMontage;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {

        //STAND SECTION
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Cough", Weight = 0.05f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"DryingSweat", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Scratch", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Stretch", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Spitting", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop", Weight = 0.05f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToMontage(MainMontage, n"Loop", EatMontage, Weight = 0.35f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToMontage(MainMontage, n"Loop", DrinkMontage, Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToMontage(MainMontage, n"Loop", SmokeMontage, Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToMontage(MainMontage, n"Loop", WarmHandsMontage, Weight = 0.3f));
        Transitions.Last().bSeamless = false;

        // Transitions.Add(TransitionToSection(MainMontage, n"Cough", n"Loop"));
        // Transitions.Add(TransitionToSection(MainMontage, n"DryingSweat", n"Loop"));
        // Transitions.Add(TransitionToSection(MainMontage, n"Scratch", n"Loop"));
        // Transitions.Add(TransitionToSection(MainMontage, n"Stretch", n"Loop"));
        // Transitions.Add(TransitionToSection(MainMontage, n"Spitting", n"Loop"));   

        //EAT SECTION
        Transitions.Add(TransitionToSection(EatMontage, FromSection = n"Entry", ToSection = n"Loop", Weight = 0.33f));
        Transitions.Add(TransitionToSection(EatMontage, FromSection = n"Entry", ToSection = n"Loop02", Weight = 0.33f));
        Transitions.Add(TransitionToSection(EatMontage, FromSection = n"Entry", ToSection = n"Loop03", Weight = 0.33f));

        Transitions.Add(TransitionToSection(EatMontage, n"Loop", n"Breaker01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatMontage, n"Loop", n"Breaker02", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatMontage, n"Loop", n"Breaker03", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatMontage, n"Loop", n"Breaker04", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatMontage, n"Loop", n"Breaker05", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(EatMontage, n"Loop", Weight = 0.1f));
        
        Transitions.Add(TransitionToSection(EatMontage, n"Loop02", n"Breaker01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatMontage, n"Loop02", n"Breaker02", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatMontage, n"Loop02", n"Breaker03", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatMontage, n"Loop02", n"Breaker04", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatMontage, n"Loop02", n"Breaker05", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(EatMontage, n"Loop02", Weight = 0.1f));
        Transitions.Add(TransitionAfterMontageEnds(EatMontage,MainMontage));

        Transitions.Add(TransitionToSection(EatMontage, n"Loop03", n"Breaker01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatMontage, n"Loop03", n"Breaker02", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatMontage, n"Loop03", n"Breaker03", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatMontage, n"Loop03", n"Breaker04", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(EatMontage, n"Loop03", n"Breaker05", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(EatMontage, n"Loop03", Weight = 0.1f));
        Transitions.Add(TransitionAfterMontageEnds(EatMontage,MainMontage));
        
        Transitions.Add(TransitionToSection(EatMontage, n"Breaker01", n"Loop", Weight = 0.2f));
        Transitions.Add(TransitionToSection(EatMontage, n"Breaker01", n"Loop02", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatMontage, n"Breaker01", n"Loop03", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatMontage, n"Breaker02", n"Loop", Weight = 0.2f));
        Transitions.Add(TransitionToSection(EatMontage, n"Breaker02", n"Loop02", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatMontage, n"Breaker02", n"Loop03", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatMontage, n"Breaker03", n"Loop", Weight = 0.2f));
        Transitions.Add(TransitionToSection(EatMontage, n"Breaker03", n"Loop02", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatMontage, n"Breaker03", n"Loop03", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatMontage, n"Breaker04", n"Loop", Weight = 0.2f));
        Transitions.Add(TransitionToSection(EatMontage, n"Breaker04", n"Loop02", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatMontage, n"Breaker04", n"Loop03", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatMontage, n"Breaker05", n"Loop", Weight = 0.2f));
        Transitions.Add(TransitionToSection(EatMontage, n"Breaker05", n"Loop02", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatMontage, n"Breaker05", n"Loop03", Weight = 0.4f));
        Transitions.Add(TransitionToSection(EatMontage, n"Breaker01", n"Exit", Weight = 0.1f));
        Transitions.Add(TransitionToSection(EatMontage, n"Breaker02", n"Exit", Weight = 0.1f));
        Transitions.Add(TransitionToSection(EatMontage, n"Breaker03", n"Exit", Weight = 0.1f));
        Transitions.Add(TransitionToSection(EatMontage, n"Breaker04", n"Exit", Weight = 0.1f));
        Transitions.Add(TransitionToSection(EatMontage, n"Breaker05", n"Exit", Weight = 0.1f));


        //DRINK SECTION
        Transitions.Add(TransitionToSection(DrinkMontage, n"Entry", n"Loop", Weight = 0.333f));
        Transitions.Add(TransitionToSection(DrinkMontage, n"Entry", n"Loop2", Weight = 0.333f));
        Transitions.Add(TransitionToSection(DrinkMontage, n"Entry", n"Loop3", Weight = 0.333f));
        // LOOP
        Transitions.Add(TransitionToSection(DrinkMontage, n"Loop", n"Drink", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(DrinkMontage, n"Loop", n"Toast", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(DrinkMontage, n"Loop", n"Drink2", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(DrinkMontage, n"Loop", n"Scratch", Weight = 0.20f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(DrinkMontage, n"Loop", n"ChangePose", Weight = 0.20f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(DrinkMontage, n"Loop", n"Reposition", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(DrinkMontage, n"Loop", n"Look&Drink", Weight = 0.35f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(DrinkMontage, n"Loop", Weight = 0.05f));
        Transitions.Add(TransitionAfterMontageEnds(DrinkMontage,MainMontage));
        // LOOP2
        Transitions.Add(TransitionToSection(DrinkMontage, n"Loop2", n"Drink", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(DrinkMontage, n"Loop2", n"Toast", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(DrinkMontage, n"Loop2", n"Drink2", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(DrinkMontage, n"Loop2", n"Scratch", Weight = 0.20f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(DrinkMontage, n"Loop2", n"ChangePose", Weight = 0.20f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(DrinkMontage, n"Loop2", n"Reposition", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(DrinkMontage, n"Loop2", n"Look&Drink", Weight = 0.35f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(DrinkMontage, n"Loop2", Weight = 0.05f));
        Transitions.Add(TransitionAfterMontageEnds(DrinkMontage,MainMontage));
        // LOOP3
        Transitions.Add(TransitionToSection(DrinkMontage, n"Loop3", n"Drink", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(DrinkMontage, n"Loop3", n"Toast", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(DrinkMontage, n"Loop3", n"Drink2", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(DrinkMontage, n"Loop3", n"Scratch", Weight = 0.20f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(DrinkMontage, n"Loop3", n"ChangePose", Weight = 0.20f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(DrinkMontage, n"Loop3", n"Reposition", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(DrinkMontage, n"Loop3", n"Look&Drink", Weight = 0.35f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(DrinkMontage, n"Loop3", Weight = 0.05f));
        Transitions.Add(TransitionAfterMontageEnds(DrinkMontage,MainMontage));
        // TRANSITIONS TO LOOPS
        Transitions.Add(TransitionToSection(DrinkMontage, n"Drink", n"Loop", Weight = 0.3333));
        Transitions.Add(TransitionToSection(DrinkMontage, n"Drink", n"Loop2", Weight = 0.3333));
        Transitions.Add(TransitionToSection(DrinkMontage, n"Drink", n"Loop3", Weight = 0.3333));
        Transitions.Add(TransitionToSection(DrinkMontage, n"Toast", n"Loop", Weight = 0.3333));
        Transitions.Add(TransitionToSection(DrinkMontage, n"Toast", n"Loop2", Weight = 0.3333));
        Transitions.Add(TransitionToSection(DrinkMontage, n"Toast", n"Loop3", Weight = 0.3333));
        Transitions.Add(TransitionToSection(DrinkMontage, n"Drink2", n"Loop", Weight = 0.3333));
        Transitions.Add(TransitionToSection(DrinkMontage, n"Drink2", n"Loop2", Weight = 0.3333));
        Transitions.Add(TransitionToSection(DrinkMontage, n"Drink2", n"Loop3", Weight = 0.3333));
        Transitions.Add(TransitionToSection(DrinkMontage, n"Scratch", n"Loop", Weight = 0.3333));
        Transitions.Add(TransitionToSection(DrinkMontage, n"Scratch", n"Loop2", Weight = 0.3333));
        Transitions.Add(TransitionToSection(DrinkMontage, n"Scratch", n"Loop3", Weight = 0.3333));
        Transitions.Add(TransitionToSection(DrinkMontage, n"ChangePose", n"Loop", Weight = 0.3333));
        Transitions.Add(TransitionToSection(DrinkMontage, n"ChangePose", n"Loop2", Weight = 0.3333));
        Transitions.Add(TransitionToSection(DrinkMontage, n"ChangePose", n"Loop3", Weight = 0.3333));
        Transitions.Add(TransitionToSection(DrinkMontage, n"Reposition", n"Loop", Weight = 0.3333));
        Transitions.Add(TransitionToSection(DrinkMontage, n"Reposition", n"Loop2", Weight = 0.3333));
        Transitions.Add(TransitionToSection(DrinkMontage, n"Reposition", n"Loop3", Weight = 0.3333));
        Transitions.Add(TransitionToSection(DrinkMontage, n"Look&Drink", n"Loop", Weight = 0.3333));
        Transitions.Add(TransitionToSection(DrinkMontage, n"Look&Drink", n"Loop2", Weight = 0.3333));
        Transitions.Add(TransitionToSection(DrinkMontage, n"Look&Drink", n"Loop3", Weight = 0.3333));
        Transitions.Add(TransitionToSection(DrinkMontage, n"Drink", n"Exit", Weight = 0.20f));
        Transitions.Add(TransitionToSection(DrinkMontage, n"Toast", n"Exit", Weight = 0.20f));
        Transitions.Add(TransitionToSection(DrinkMontage, n"Drink2", n"Exit", Weight = 0.20f));
        Transitions.Add(TransitionToSection(DrinkMontage, n"Scratch", n"Exit", Weight = 0.20f));
        Transitions.Add(TransitionToSection(DrinkMontage, n"ChangePose", n"Exit", Weight = 0.20f));
        Transitions.Add(TransitionToSection(DrinkMontage, n"Reposition", n"Exit", Weight = 0.20f));
        Transitions.Add(TransitionToSection(DrinkMontage, n"Look&Drink", n"Exit", Weight = 0.20f));


        //SMOKE SECTION
        Transitions.Add(TransitionToSection(SmokeMontage, FromSection = n"Entry", ToSection = n"Loop", Weight = 0.12f));
        Transitions.Add(TransitionToSection(SmokeMontage, FromSection = n"Entry", ToSection = n"Idle01", Weight = 0.12f));
        Transitions.Add(TransitionToSection(SmokeMontage, FromSection = n"Entry", ToSection = n"Idle02", Weight = 0.12f));
        Transitions.Add(TransitionToSection(SmokeMontage, FromSection = n"Entry", ToSection = n"Idle03", Weight = 0.12f));
        Transitions.Add(TransitionToSection(SmokeMontage, FromSection = n"Entry", ToSection = n"Idle04", Weight = 0.12f));
        Transitions.Add(TransitionToSection(SmokeMontage, FromSection = n"Entry", ToSection = n"Idle05", Weight = 0.12f));
        Transitions.Add(TransitionToSection(SmokeMontage, FromSection = n"Entry", ToSection = n"Idle06", Weight = 0.12f));

        Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker01", Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker02", Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker03", Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker04", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker05", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker06", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker07", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker08", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker09", Weight = 0.35f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker10", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker11", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Loop", n"Breaker12", Weight = 0.2f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle01", n"Breaker01", Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle01", n"Breaker02", Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle01", n"Breaker03", Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle01", n"Breaker04", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle01", n"Breaker05", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle01", n"Breaker06", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle01", n"Breaker07", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle01", n"Breaker08", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle01", n"Breaker09", Weight = 0.35f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle01", n"Breaker10", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle01", n"Breaker11", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle01", n"Breaker12", Weight = 0.2f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle02", n"Breaker01", Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle02", n"Breaker02", Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle02", n"Breaker03", Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle02", n"Breaker04", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle02", n"Breaker05", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle02", n"Breaker06", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle02", n"Breaker07", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle02", n"Breaker08", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle02", n"Breaker09", Weight = 0.35f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle02", n"Breaker10", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle02", n"Breaker11", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle02", n"Breaker12", Weight = 0.2f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle03", n"Breaker01", Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle03", n"Breaker02", Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle03", n"Breaker03", Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle03", n"Breaker04", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle03", n"Breaker05", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle03", n"Breaker06", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle03", n"Breaker07", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle03", n"Breaker08", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle03", n"Breaker09", Weight = 0.35f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle03", n"Breaker10", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle03", n"Breaker11", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle03", n"Breaker12", Weight = 0.2f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle04", n"Breaker01", Weight = 0.45f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle04", n"Breaker02", Weight = 0.45f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle04", n"Breaker03", Weight = 0.45f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle04", n"Breaker04", Weight = 0.4f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle04", n"Breaker05", Weight = 0.4f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle04", n"Breaker06", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle04", n"Breaker07", Weight = 0.25f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle04", n"Breaker08", Weight = 0.2f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle04", n"Breaker09", Weight = 0.35f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle04", n"Breaker10", Weight = 0.3f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle04", n"Breaker11", Weight = 0.2f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle04", n"Breaker12", Weight = 0.2f));
        

        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle05", n"Breaker01", Weight = 0.45f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle05", n"Breaker02", Weight = 0.45f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle05", n"Breaker03", Weight = 0.45f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle05", n"Breaker04", Weight = 0.4f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle05", n"Breaker05", Weight = 0.4f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle05", n"Breaker06", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle05", n"Breaker07", Weight = 0.25f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle05", n"Breaker08", Weight = 0.2f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle05", n"Breaker09", Weight = 0.35f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle05", n"Breaker10", Weight = 0.3f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle05", n"Breaker11", Weight = 0.2f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle05", n"Breaker12", Weight = 0.2f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle06", n"Breaker01", Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle06", n"Breaker02", Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle06", n"Breaker03", Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle06", n"Breaker04", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle06", n"Breaker05", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle06", n"Breaker06", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle06", n"Breaker07", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle06", n"Breaker08", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle06", n"Breaker09", Weight = 0.35f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle06", n"Breaker10", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle06", n"Breaker11", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SmokeMontage, n"Idle06", n"Breaker12", Weight = 0.2f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionAfterMontageEnds(SmokeMontage,MainMontage,n"Loop"));

        //BREAKER Transitions
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker01", n"Loop", Weight = 0.1f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker01", n"Idle01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker01", n"Idle02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker01", n"Idle03", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker01", n"Idle04", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker01", n"Idle05", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker01", n"Idle06", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker02", n"Loop", Weight = 0.1f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker02", n"Idle01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker02", n"Idle02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker02", n"Idle03", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker02", n"Idle04", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker02", n"Idle05", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker02", n"Idle06", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker03", n"Loop", Weight = 0.1f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker03", n"Idle01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker03", n"Idle02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker03", n"Idle03", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker03", n"Idle04", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker03", n"Idle05", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker03", n"Idle06", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker04", n"Loop", Weight = 0.1f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker04", n"Idle01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker04", n"Idle02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker04", n"Idle03", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker04", n"Idle04", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker04", n"Idle05", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker04", n"Idle06", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker05", n"Loop", Weight = 0.1f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker05", n"Idle01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker05", n"Idle02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker05", n"Idle03", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker05", n"Idle04", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker05", n"Idle05", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker05", n"Idle06", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker06", n"Loop", Weight = 0.1f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker06", n"Idle01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker06", n"Idle02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker06", n"Idle03", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker06", n"Idle04", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker06", n"Idle05", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker06", n"Idle06", Weight = 0.15f));


        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker07", n"Loop", Weight = 0.1f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker07", n"Idle01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker07", n"Idle02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker07", n"Idle03", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker07", n"Idle04", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker07", n"Idle05", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker07", n"Idle06", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker08", n"Loop", Weight = 0.1f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker08", n"Idle01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker08", n"Idle02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker08", n"Idle03", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker08", n"Idle04", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker08", n"Idle05", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker08", n"Idle06", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker09", n"Loop", Weight = 0.1f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker09", n"Idle01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker09", n"Idle02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker09", n"Idle03", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker09", n"Idle04", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker09", n"Idle05", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker09", n"Idle06", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker10", n"Loop", Weight = 0.1f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker10", n"Idle01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker10", n"Idle02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker10", n"Idle03", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker10", n"Idle04", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker10", n"Idle05", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker10", n"Idle06", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker11", n"Loop", Weight = 0.1f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker11", n"Idle01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker11", n"Idle02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker11", n"Idle03", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker11", n"Idle04", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker11", n"Idle05", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker11", n"Idle06", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker12", n"Loop", Weight = 0.1f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker12", n"Idle01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker12", n"Idle02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker12", n"Idle03", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker12", n"Idle04", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker12", n"Idle05", Weight = 0.15f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker12", n"Idle06", Weight = 0.15f));

        //EXIT
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker01", n"Exit", Weight = 0.1f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker02", n"Exit", Weight = 0.1f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker03", n"Exit", Weight = 0.1f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker04", n"Exit", Weight = 0.1f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker05", n"Exit", Weight = 0.1f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker06", n"Exit", Weight = 0.1f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker07", n"Exit", Weight = 0.1f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker08", n"Exit", Weight = 0.1f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker09", n"Exit", Weight = 0.1f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker10", n"Exit", Weight = 0.1f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker11", n"Exit", Weight = 0.1f));
        Transitions.Add(TransitionToSection(SmokeMontage, n"Breaker12", n"Exit", Weight = 0.1f));

        //WARM HANDS SECTION
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Loop", n"Breaker01", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Loop", n"Breaker02", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Loop", n"Breaker03", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Loop", n"Breaker04", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Loop", n"Breaker05", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Loop", n"Breaker06", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Loop", n"Breaker07", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Loop", n"Breaker08", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Loop", n"Breaker09", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(WarmHandsMontage, n"Loop", Weight = 0.25f));
        Transitions.Add(TransitionAfterMontageEnds(WarmHandsMontage,MainMontage,n"Loop"));
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Breaker01", n"Loop", Weight = 0.75f));
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Breaker02", n"Loop", Weight = 0.75f));
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Breaker03", n"Loop", Weight = 0.75f));
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Breaker04", n"Loop", Weight = 0.75f));
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Breaker05", n"Loop", Weight = 0.75f));
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Breaker06", n"Loop", Weight = 0.75f));
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Breaker07", n"Loop", Weight = 0.75f));
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Breaker08", n"Loop", Weight = 0.75f));
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Breaker09", n"Loop", Weight = 0.75f));
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Breaker01", n"Exit", Weight = 0.25f));
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Breaker02", n"Exit", Weight = 0.25f));
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Breaker03", n"Exit", Weight = 0.25f));
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Breaker04", n"Exit", Weight = 0.25f));
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Breaker05", n"Exit", Weight = 0.25f));
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Breaker06", n"Exit", Weight = 0.25f));
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Breaker07", n"Exit", Weight = 0.25f));
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Breaker08", n"Exit", Weight = 0.25f));
        Transitions.Add(TransitionToSection(WarmHandsMontage, n"Breaker09", n"Exit", Weight = 0.25f));

    }
}

UCLASS()
class UAbilityTask_Interaction_Human_RoastScavenger : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_RoastScavenger);
    default AutoTransitionCheckSecondsMin = 2.5f;
    default AutoTransitionCheckSecondsMax = 6.0f;

    default bAllowInterruptAtAnyTime = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = CookRotisserieMontage;
    default ObjectMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Rostisserie/Test_Scavenger_Rotisserie.Test_Scavenger_Rotisserie'";

    UPROPERTY() TSoftObjectPtr<UAnimMontage> CookRotisserieMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Cook/Man_Digger_Cook_Rotisserie_Montage.Man_Digger_Cook_Rotisserie_Montage'";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(CookRotisserieMontage, FromSection = n"Entry", ToSection = n"Loop"));

        Transitions.Add(TransitionToSection(CookRotisserieMontage, FromSection = n"Loop", ToSection = n"Kick", Weight = 0.10f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(CookRotisserieMontage, FromSection = n"Loop", ToSection = n"Smell", Weight = 0.35f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(CookRotisserieMontage, FromSection = n"Loop", ToSection = n"Specie", Weight = 0.2f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(CookRotisserieMontage, FromSection = n"Loop", ToSection = n"TurnRotisserie", Weight = 0.95f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(CookRotisserieMontage, FromSection = n"Loop", ToSection = n"ScratchFace", Weight = 0.3f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(CookRotisserieMontage, FromSection = n"Loop", ToSection = n"ScratchBack", Weight = 0.3f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(CookRotisserieMontage, FromSection = n"Loop", ToSection = n"Cough", Weight = 0.15f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(CookRotisserieMontage, FromSection = n"Loop", ToSection = n"DrySweat", Weight = 0.2f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionStay(CookRotisserieMontage, n"Loop", Weight = 0.1f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_CheckGoods : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_CheckGoods);

    UPROPERTY() TSoftObjectPtr<UAnimMontage> CheckGoods01Montage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/CheckGoods/Human_CheckGoods01_Montage.Human_CheckGoods01_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> CheckGoods02Montage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/CheckGoods/Human_CheckGoods02_Montage.Human_CheckGoods02_Montage'";

    default MainMontage = CheckGoods01Montage;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        int randomNumber = Math::RandRange(0,1);
        if( randomNumber == 0)
        {
            MainMontage = CheckGoods01Montage;
        }
        else if(randomNumber == 1)
        {
            MainMontage = CheckGoods02Montage;
        }

        Transitions.Add(TransitionToSection(CheckGoods01Montage, FromSection = n"Entry", ToSection = n"Loop"));
        Transitions.Add(TransitionToSection(CheckGoods02Montage, FromSection = n"Entry", ToSection = n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_TakeNotes : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_TakeNotes);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Anotate_Goods/Man_AnnotateGoods_Montage.Man_AnnotateGoods_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop02", Weight = 0.5f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_SmithSharp : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Crafting_WhetStone);

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default MainMontage = SharpMontage;
    default ObjectMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Smith/Object_Interact_Whetstone_Montage_AI.Object_Interact_Whetstone_Montage_AI'";

    UPROPERTY() TSoftObjectPtr<UAnimMontage> SharpMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Smith/Man_Digger_Montage_SmithSharp.Man_Digger_Montage_SmithSharp'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(SharpMontage, FromSection = n"Entry", ToSection = n"Loop"));

        Transitions.Add(TransitionToSection(SharpMontage, FromSection = n"Loop", ToSection = n"LookSword", Weight = 0.15f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(SharpMontage, FromSection = n"Loop", ToSection = n"LookSword02", Weight = 0.15f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(SharpMontage, FromSection = n"Loop", ToSection = n"LookSword03", Weight = 0.15f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(SharpMontage, FromSection = n"Loop", ToSection = n"Sweat", Weight = 0.3f));
        Transitions.Add(TransitionToSection(SharpMontage, FromSection = n"Loop", ToSection = n"Stretch", Weight = 0.15f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(SharpMontage, FromSection = n"Loop", ToSection = n"Stretch02", Weight = 0.15f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(SharpMontage, FromSection = n"Loop", ToSection = n"Stretch03", Weight = 0.15f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(SharpMontage, FromSection = n"Loop", ToSection = n"Move", Weight = 0.25f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_SmithAnvil : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Crafting_Anvil);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Smith/Man_Digger_Montage_Smith_Anvil.Man_Digger_Montage_Smith_Anvil'";

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Sweat", Weight = 0.5f));
    
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"LookBar", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Harder", Weight = 0.6f));
        
        // Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Sweat", ToSection = n"Loop"));
        // Transitions.Add(TransitionToSection(MainMontage, FromSection = n"LookBar", ToSection = n"Loop"));
        // Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Harder", ToSection = n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_SmithAnvil_Spawn : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Crafting_Anvil_Spawn);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Smith/Man_Digger_Montage_Smith_AnvilSpawn.Man_Digger_Montage_Smith_AnvilSpawn'";

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Sweat", Weight = 0.5f));
    
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"LookBar", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Harder", Weight = 0.6f));
        
        // Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Sweat", ToSection = n"Loop"));
        // Transitions.Add(TransitionToSection(MainMontage, FromSection = n"LookBar", ToSection = n"Loop"));
        // Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Harder", ToSection = n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_SmithWorkBench : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Crafting_Workbench);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Crafting/NH_Interact_Workbench_Montage.NH_Interact_Workbench_Montage'";

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    default AutoTransitionCheckSecondsMin = 8.0f;
    default AutoTransitionCheckSecondsMax = 14.0f;

    //default bAllowInterruptAtAnyTime = true;
    //default bAllowInterruptLoopOnCancel = true;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop02"));

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Loop02", Weight = 1.0f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker_01", Weight = 1.0f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker_02", Weight = 0.95f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker_03", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker_04", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker_05", Weight = 0.85f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker_06", Weight = 0.8f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker_07", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker_11", Weight = 0.2f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop", Weight = 5.0f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker_01", Weight = 1.0f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker_02", Weight = 0.95f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker_03", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker_04", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker_05", Weight = 0.85f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker_06", Weight = 0.8f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker_07", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker_11", Weight = 0.2f));
        Transitions.Last().bSeamless = false;

    }
}

UCLASS()
class UAbilityTask_Interaction_Human_SmithFire : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Crafting_Forge);

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Smith/Man_Interact_SmithFire_Montage.Man_Interact_SmithFire_Montage'";
    default ObjectMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Smith/Object_Interact_Forge_Montage_AI.Object_Interact_Forge_Montage_AI'";

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;
    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker_01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker_02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker_03", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker_04", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker_05", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker_06", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker_07", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker_08", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker_09", Weight = 0.3f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_SmithWater : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Crafting_Barrel);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Smith/Man_Digger_Montage_SmithWater.Man_Digger_Montage_SmithWater'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;
}

UCLASS()
class UAbilityTask_Interaction_Human_Drained : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Drained);

    UPROPERTY() TSoftObjectPtr<UAnimMontage> Pose01Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Exhausted/Man_Exhausted_Pose01_Montage.Man_Exhausted_Pose01_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> Pose02Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Exhausted/Man_Exhausted_Pose02_Montage.Man_Exhausted_Pose02_Montage'";

    default MainMontage = Pose01Montage;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        if(Math::RandBool())
        {
            MainMontage = Pose01Montage;
        }
        else
        {
            MainMontage = Pose02Montage;
        }

        //POSE01
        Transitions.Add(TransitionToSection(Pose01Montage, FromSection = n"Entry", ToSection = n"Loop"));
        //POSE02
        Transitions.Add(TransitionToSection(Pose02Montage, FromSection = n"Entry", ToSection = n"Loop_01"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Conversation_Drained : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Conversation_Drained);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Exhausted/Man_Exhausted_Pose01_Montage.Man_Exhausted_Pose01_Montage'";

    default bPossibleAnywhere = true;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_ReceiveFood : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_ReceiveFood);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/OLD/Human_GetObject_Montage.Human_GetObject_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_Teacher : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_TeachTrain);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Training/Teacher/Man_Teacher_Montage.Man_Teacher_Montage'";

    default QuickExitMode = EInteractionFastExitMode::PlayFastExitIfAvailableOtherwiseBlendOut;

    default AutoTransitionCheckSecondsMin = 5.0f;
    default AutoTransitionCheckSecondsMax = 10.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        //Entry Section
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop02", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop03", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop04", Weight = 0.25f));

        //Loop01 Section
        Transitions.Add(TransitionStay(MainMontage, InSection = n"Loop01", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop02", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop03", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop04", Weight = 0.25f));

        //Loop02 Section
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop01", Weight = 0.25f));
        Transitions.Add(TransitionStay(MainMontage, InSection = n"Loop02", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop03", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop04", Weight = 0.25f));

        //Loop03 Section
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop01", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop02", Weight = 0.25f));
        Transitions.Add(TransitionStay(MainMontage, InSection = n"Loop03", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop04", Weight = 0.25f));

        //Loop04 Section
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop04", ToSection = n"Loop01", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop04", ToSection = n"Loop02", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop04", ToSection = n"Loop03", Weight = 0.25f));
        Transitions.Add(TransitionStay(MainMontage, InSection = n"Loop04", Weight = 0.25f));

    }
}

UCLASS()
class UAbilityTask_Interaction_Human_PracticeSword : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Practice1HSword);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Training/Practice/Man_Training_Montage.Man_Training_Montage'";

    default AutoTransitionCheckSecondsMin = 0.0f;
    default AutoTransitionCheckSecondsMax = 1.0f;

    default TakeOutItemWithItemTypeFromInventory = GameplayTag::Item_Weapon_Sword_OneHand;

    default bPutAwayItemInHandsAfterInteraction = true;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default DisableAutoTransitionsForTags.AddTag(GameplayTag::AIState_Wait_BlockedPath);

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01"));
        //Loop01 Section
        Transitions.Add(TransitionStay(MainMontage, InSection = n"Loop01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker01", Weight = 0.2f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker02", Weight = 0.2f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker03", Weight = 0.2f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker04", Weight = 0.2f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker05", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Practice2HSword : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Practice2HSword);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Training/S2H/Man_Training_S2H_Montage.Man_Training_S2H_Montage'";

    default AutoTransitionCheckSecondsMin = 0.0f;
    default AutoTransitionCheckSecondsMax = 1.0f;

    default TakeOutItemWithItemTypeFromInventory = GameplayTag::Item_Weapon_Sword_TwoHand;

    default bPutAwayItemInHandsAfterInteraction = true;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default DisableAutoTransitionsForTags.AddTag(GameplayTag::AIState_Wait_BlockedPath);

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop"));
        //Loop01 Section
        Transitions.Add(TransitionStay(MainMontage, InSection = n"Loop", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker01", Weight = 0.4f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker02", Weight = 0.4f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker03", Weight = 0.4f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker04", Weight = 0.4f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker05", Weight = 0.15f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker06", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_PracticeMace : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Practice1HMace);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Training/MH1/Man_Training_M1H_Montage.Man_Training_M1H_Montage'";
    default ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Training/MH1/NewCamp_Dummy_Training_M1H_Montage.NewCamp_Dummy_Training_M1H_Montage'";

    default AutoTransitionCheckSecondsMin = 0.0f;
    default AutoTransitionCheckSecondsMax = 5.0f;

    default TakeOutItemWithItemTypeFromInventory = GameplayTag::Item_Weapon_Mace_OneHand;

    default bPutAwayItemInHandsAfterInteraction = true;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default DisableAutoTransitionsForTags.AddTag(GameplayTag::AIState_Wait_BlockedPath);

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01"));
        //Loop01 Section
        Transitions.Add(TransitionStay(MainMontage, InSection = n"Loop01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker02", Weight = 0.3f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker03", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_PracticeMace_WithOutDummy : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Practice1HMaceNoDummy);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Training/Practice/Man_Training_Montage.Man_Training_Montage'";

    default AutoTransitionCheckSecondsMin = 0.0f;
    default AutoTransitionCheckSecondsMax = 5.0f;

    default TakeOutItemWithItemTypeFromInventory = GameplayTag::Item_Weapon_Mace_OneHand;

    default bPutAwayItemInHandsAfterInteraction = true;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default DisableAutoTransitionsForTags.AddTag(GameplayTag::AIState_Wait_BlockedPath);

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01"));
        //Loop01 Section
        Transitions.Add(TransitionStay(MainMontage, InSection = n"Loop01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker01", Weight = 0.2f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker02", Weight = 0.2f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker05", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Recruit : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Recruit);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/OLD/Human_Listen_Montage.Human_Listen_Montage'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;
}

UCLASS()
class UAbilityTask_Interaction_Human_Listen : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Listen);
    
    UPROPERTY() TSoftObjectPtr<UAnimMontage> ListenPose01Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Listen/Man_Digger_Montage_Listen.Man_Digger_Montage_Listen'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> ListenPose02Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Listen/Man_Listen_Pose02_Montage.Man_Listen_Pose02_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> ListenPose03Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Listen/Man_Listen_Pose03_Montage.Man_Listen_Pose03_Montage'";

    default AutoTransitionCheckSecondsMin = 3.0f;
    default AutoTransitionCheckSecondsMax = 5.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        int randomNumber = Math::RandRange(0,2);
        if( randomNumber == 0)
        {
            MainMontage = ListenPose01Montage;
        }
        else if(randomNumber == 1)
        {
            MainMontage = ListenPose02Montage;
        }
        else if(randomNumber == 2)
        {
            MainMontage = ListenPose03Montage;
        }

        //POSE01
        Transitions.Add(TransitionToSection(ListenPose01Montage, n"Entry", n"Loop"));
        Transitions.Add(TransitionToSection(ListenPose01Montage, n"Loop", n"Break01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(ListenPose01Montage, n"Loop", n"Break02", Weight = 0.3f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(ListenPose01Montage, n"Loop", n"Break03", Weight = 0.3f));
        Transitions.Last().bSeamless = false;

        //POSE02
        Transitions.Add(TransitionToSection(ListenPose02Montage, n"Entry", n"Loop"));
        Transitions.Add(TransitionToSection(ListenPose02Montage, n"Loop", n"Breaker01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(ListenPose02Montage, n"Loop", n"Breaker02", Weight = 0.3f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(ListenPose02Montage, n"Loop", n"Breaker03", Weight = 0.3f));
        Transitions.Last().bSeamless = false;

        //POSE03
        Transitions.Add(TransitionToSection(ListenPose03Montage, n"Entry", n"Loop"));
        Transitions.Add(TransitionToSection(ListenPose03Montage, n"Loop", n"Breaker01", Weight = 0.5f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(ListenPose03Montage, n"Loop", n"Breaker02", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
    
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Preach : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Preach);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/SpeaksAudience/Man_SpeaksAudiencie_Montage.Man_SpeaksAudiencie_Montage'";

    default QuickExitMode = EInteractionFastExitMode::PlayFastExitIfAvailableOtherwiseBlendOut;
    default OwnedTagsWhileActive.AddTag(GameplayTag::Smalltalk_Blocked);

    default AutoTransitionCheckSecondsMin = 3.0f;
    default AutoTransitionCheckSecondsMax = 5.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop01", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop02", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop03", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop04", Weight = 0.25f));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop04", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop04", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop04", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Loop03", Weight = 0.3f));
    }
} 

UCLASS()
class UAbilityTask_Interaction_Human_Listen_Ground : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Listen_Ground);
    //default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_Listen/Sit_Listen_Pose02/Man_Sit_Listen_Pose02_Montage.Man_Sit_Listen_Pose02_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> Pose01Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_Listen/Sit_Listen_Pose01/Man_Sit_Listen_Pose01_Montage.Man_Sit_Listen_Pose01_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> Pose02Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_Listen/Sit_Listen_Pose02/Man_Sit_Listen_Pose02_Montage.Man_Sit_Listen_Pose02_Montage'";

    default OwnedTagsWhileActive.AddTag(GameplayTag::Smalltalk_Blocked);

    default MainMontage = Pose01Montage;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        if(Math::RandBool())
        {
            MainMontage = Pose01Montage;
        }
        else
        {
            MainMontage = Pose02Montage;
        }

        //POSE01
        Transitions.Add(TransitionToSection(Pose01Montage, n"Entry", n"Loop01"));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Entry", n"Loop02"));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Entry", n"Loop03"));

        //LOOP01
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"Loop03", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"LookLeft", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"LookRight", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"LookUp", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"LookDown", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"Scratch", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"Yawn", Weight = 0.35f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"Recolocate", Weight = 0.4f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"MoveArm", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"ChangePose", Weight = 0.4f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"ScratchNose", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"Stretch", Weight = 0.3f));
        Transitions.Add(TransitionStay(Pose01Montage, n"Loop01", Weight = 0.4f));

        //LOOP02
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"Loop01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"Loop03", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"LookLeft", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"LookRight", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"LookUp", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"LookDown", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"Scratch", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"Yawn", Weight = 0.35f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"Recolocate", Weight = 0.4f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"MoveArm", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"ChangePose", Weight = 0.4f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"ScratchNose", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"Stretch", Weight = 0.3f));
        Transitions.Add(TransitionStay(Pose01Montage, n"Loop02", Weight = 0.4f));

        //LOOP03
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"Loop01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"LookLeft", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"LookRight", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"LookUp", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"LookDown", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"Scratch", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"Yawn", Weight = 0.35f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"Recolocate", Weight = 0.4f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"MoveArm", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"ChangePose", Weight = 0.4f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"ScratchNose", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"Stretch", Weight = 0.3f));
        Transitions.Add(TransitionStay(Pose01Montage, n"Loop03", Weight = 0.4f));

        //POSE02
        Transitions.Add(TransitionToSection(Pose02Montage, n"Entry", n"Loop01"));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Entry", n"Loop02"));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Entry", n"Loop03"));

        //LOOP01
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"Loop03", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"LookLeft", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"LookRight", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"LookUp", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"LookDown", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"Scratch", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"Yawl", Weight = 0.35f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"Relocate", Weight = 0.4f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"MoveArm", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"ChangePosition", Weight = 0.4f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"Nose", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"Stretch", Weight = 0.3f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"Cough", Weight = 0.3f));
        Transitions.Add(TransitionStay(Pose02Montage, n"Loop01", Weight = 0.4f));

        //LOOP02
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"Loop01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"Loop03", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"LookLeft", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"LookRight", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"LookUp", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"LookDown", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"Scratch", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"Yawl", Weight = 0.35f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"Relocate", Weight = 0.4f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"MoveArm", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"ChangePosition", Weight = 0.4f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"Nose", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"Stretch", Weight = 0.3f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"Cough", Weight = 0.3f));
        Transitions.Add(TransitionStay(Pose02Montage, n"Loop02", Weight = 0.4f));

        //LOOP03
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"Loop01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"LookLeft", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"LookRight", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"LookUp", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"LookDown", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"Scratch", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"Yawl", Weight = 0.35f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"Relocate", Weight = 0.4f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"MoveArm", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"ChangePosition", Weight = 0.4f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"Nose", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"Stretch", Weight = 0.3f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"Cough", Weight = 0.3f));
        Transitions.Add(TransitionStay(Pose02Montage, n"Loop03", Weight = 0.4f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_GuardPassage : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_GuardPassage);

    default SimulationLoopAnimation = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Guard/A_Man_Guard_CrossArms.A_Man_Guard_CrossArms'";

    //default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Idle/Man_Idle_CrossArms_02_Montage.Man_Idle_CrossArms_02_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> CrossPoseMontage = n".AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Idle/Man_Idle_CrossArms_02_Montage.Man_Idle_CrossArms_02_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> JarPoseMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Idle/Man_Idle_JarsArms_02_Montage.Man_Idle_JarsArms_02_Montage'";

    default bStartWhileMoving=false;
    default bAllowInterruptAtAnyTime = true;
    default QuickExitMode = EInteractionFastExitMode::PlayFastExitIfAvailableOtherwiseBlendOut;

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 6.0f;

    default MainMontage = CrossPoseMontage;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        if(Math::RandBool())
        {
            MainMontage = CrossPoseMontage;
        }
        else
        {
            MainMontage = JarPoseMontage;
        }

        //CROSSARMS SECTION
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Entry", n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Entry", n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Entry", n"Loop03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Entry", n"Loop04", Weight = 0.2f));
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Entry", n"Loop05", Weight = 0.2f));

        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop01", n"Loop02", Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop01", n"Loop03", Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop01", n"Loop04", Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop01", n"Loop05", Weight = 0.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop01", n"IdleDialog", Weight = 1.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop01", n"Scratch", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop01", n"Cough", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop01", n"LookDistance", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop01", n"OpenArms", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop01", n"Re-position", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop01", n"ToJarArms", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
        //Transitions.Last().CooldownSeconds = 20;
        //Transitions.Last().BlockOtherTransitionsForSeconds = 30.0f;
        Transitions.Add(TransitionStay(CrossPoseMontage, n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToMontage(CrossPoseMontage, n"ToJarArms", JarPoseMontage, n"Entry", Weight = 1.0f));
        

        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop02", n"Loop01", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop02", n"Loop03", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop02", n"Loop04", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop02", n"Loop05", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop02", n"IdleDialog", Weight = 1.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop02", n"Scratch", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop02", n"Cough", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop02", n"LookDistance", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop02", n"OpenArms", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop02", n"Re-position", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop02", n"ToJarArms", Weight = 0.6f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(CrossPoseMontage, n"Loop02", Weight = 0.3f)); 

        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop03", n"Loop01", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop03", n"Loop02", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop03", n"Loop04", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop03", n"Loop05", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop03", n"IdleDialog", Weight = 1.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop03", n"Scratch", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop03", n"Cough", Weight = 0.6f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop03", n"LookDistance", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop03", n"OpenArms", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop03", n"Re-position", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop03", n"ToJarArms", Weight = 0.55f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(CrossPoseMontage, n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop04", n"Loop01", Weight = 0.255f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop04", n"Loop02", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop04", n"Loop03", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop04", n"Loop05", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop04", n"IdleDialog", Weight = 1.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop04", n"Scratch", Weight = 0.55f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop04", n"Cough", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop04", n"LookDistance", Weight = 0.6f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop04", n"OpenArms", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop04", n"Re-position", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop04", n"ToJarArms", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(CrossPoseMontage, n"Loop04", Weight = 0.3f));
        
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop05", n"Loop01", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop05", n"Loop02", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop05", n"Loop03", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop05", n"Loop04", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop05", n"IdleDialog", Weight = 1.45f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop05", n"Scratch", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop05", n"Cough", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop05", n"LookDistance", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop05", n"OpenArms", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop05", n"Re-position", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop05", n"ToJarArms", Weight = 0.6f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(CrossPoseMontage, n"Loop05", Weight = 0.3f));
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"IdleDialog", n"Loop01", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"IdleDialog", n"Loop02", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"IdleDialog", n"Loop03", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"IdleDialog", n"Loop04", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"IdleDialog", n"Scratch", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"IdleDialog", n"Cough", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"IdleDialog", n"LookDistance", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"IdleDialog", n"OpenArms", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"IdleDialog", n"Re-position", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"IdleDialog", n"Talk01", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"IdleDialog", n"Listen", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"IdleDialog", n"ToJarArms", Weight = 0.6f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(CrossPoseMontage, n"IdleDialog", Weight = 0.3f));
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Scratch", n"Loop01", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Scratch", n"Loop02", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Scratch", n"Loop03", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Scratch", n"Loop04", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Scratch", n"Loop05", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Scratch", n"IdleDialog", Weight = 1.0f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Cough", n"Loop01", Weight = 0.5f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Cough", n"Loop02", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Cough", n"Loop03", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Cough", n"Loop04", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Cough", n"Loop05", Weight = 0.55f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Cough", n"IdleDialog", Weight = 1.0f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"LookDistance", n"Loop01", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"LookDistance", n"Loop02", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"LookDistance", n"Loop03", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"LookDistance", n"Loop04", Weight = 0.65f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"LookDistance", n"Loop05", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"LookDistance", n"IdleDialog", Weight = 1.0f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"OpenArms", n"Loop01", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"OpenArms", n"Loop02", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"OpenArms", n"Loop03", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"OpenArms", n"Loop04", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"OpenArms", n"Loop05", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"OpenArms", n"IdleDialog", Weight = 1.0f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Re-position", n"Loop01", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Re-position", n"Loop02", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Re-position", n"Loop03", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Re-position", n"Loop04", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Re-position", n"Loop05", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Re-position", n"IdleDialog", Weight = 1.0f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Talk01", n"Loop01", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Talk01", n"Loop02", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Talk01", n"Loop03", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Talk01", n"Loop04", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Talk01", n"Loop05", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Talk01", n"IdleDialog", Weight = 1.0f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Listen", n"Loop01", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Listen", n"Loop02", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Listen", n"Loop03", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Listen", n"Loop04", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Listen", n"Loop05", Weight = 0.6f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Listen", n"IdleDialog", Weight = 1.0f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);


        //JARSARMS SECTION
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Entry", n"Loop01", Weight = 0.25f));
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Entry", n"Loop02", Weight = 0.25f));
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Entry", n"Loop03", Weight = 0.25f));
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Entry", n"Loop04", Weight = 0.25f));

        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"Loop02", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"Loop03", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"Loop04", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"IdleDialog", Weight = 1.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"Scratch", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"Cough", Weight = 0.8f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"Look02", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"RelaxArms", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"Yawn", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"NeckMov", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"Shoulder", Weight = 0.8f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"Look01", Weight = 0.02f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = 10.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"Listen", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"ToCrossArms", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = 10.0f;
        Transitions.Add(TransitionStay(JarPoseMontage, n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToMontage(JarPoseMontage, n"ToCrossArms", CrossPoseMontage, n"Entry", Weight = 1.0f));
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"Loop01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"Loop03", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"Loop04", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"IdleDialog", Weight = 1.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"Scratch", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"Cough", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"Look02", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"RelaxArms", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"Yawn", Weight = 0.75f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"NeckMov", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"Shoulder", Weight = 0.75f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"Look01", Weight = 0.02f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"Listen", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"ToCrossArms", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(JarPoseMontage, n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"Loop02", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"Loop01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"Loop04", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"IdleDialog", Weight = 1.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"Scratch", Weight = 0.55f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"Cough", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"Look02", Weight = 0.75f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"RelaxArms", Weight = 0.75f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"Yawn", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"NeckMov", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"Shoulder", Weight = 0.6f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"Look01", Weight = 0.02f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"Listen", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"ToCrossArms", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(JarPoseMontage, n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"Loop02", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"Loop03", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"Loop01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"IdleDialog", Weight = 1.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"Scratch", Weight = 0.8f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"Cough", Weight = 0.75f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"Look02", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"RelaxArms", Weight = 0.6f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"Yawn", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"NeckMov", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"Shoulder", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"Look01", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"Listen", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"ToCrossArms", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(JarPoseMontage, n"Loop04", Weight = 0.3f));
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Scratch", n"Loop01", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Scratch", n"Loop02", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Scratch", n"Loop03", Weight = 0.45f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Scratch", n"Loop04", Weight = 0.45f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Scratch", n"IdleDialog", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Cough", n"Loop01", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Cough", n"Loop02", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Cough", n"Loop03", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Cough", n"Loop04", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Cough", n"IdleDialog", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Look02", n"Loop01", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Look02", n"Loop02", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Look02", n"Loop03", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Look02", n"Loop04", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Look02", n"IdleDialog", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"RelaxArms", n"Loop01", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"RelaxArms", n"Loop02", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"RelaxArms", n"Loop03", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"RelaxArms", n"Loop04", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"RelaxArms", n"IdleDialog", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Yawn", n"Loop01", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Yawn", n"Loop02", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Yawn", n"Loop03", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Yawn", n"Loop04", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Yawn", n"IdleDialog", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"NeckMov", n"Loop01", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"NeckMov", n"Loop02", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"NeckMov", n"Loop03", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"NeckMov", n"Loop04", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"NeckMov", n"IdleDialog", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Shoulder", n"Loop01", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Shoulder", n"Loop02", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Shoulder", n"Loop03", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Shoulder", n"Loop04", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Shoulder", n"IdleDialog", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Look01", n"Loop01", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Look01", n"Loop02", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Look01", n"Loop03", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Look01", n"Loop04", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Look01", n"IdleDialog", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Listen", n"Loop01", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Listen", n"Loop02", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Listen", n"Loop03", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Listen", n"Loop04", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Listen", n"IdleDialog", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Thorus_GuardPassage : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_ThorusGuardPassage);

    default SimulationLoopAnimation = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Idle/Thorus_CrossArms/Thorus_CrossArms_Montage.Thorus_CrossArms_Montage'";

    UPROPERTY() TSoftObjectPtr<UAnimMontage> CrossPoseMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Idle/Thorus_CrossArms/Thorus_CrossArms_Montage.Thorus_CrossArms_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> JarPoseMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Idle/Man_Idle_JarsArms_02_Montage.Man_Idle_JarsArms_02_Montage'";

    default bStartWhileMoving=false;
    default bAllowInterruptAtAnyTime = true;
    default QuickExitMode = EInteractionFastExitMode::PlayFastExitIfAvailableOtherwiseBlendOut;

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 10.0f;

    default MainMontage = CrossPoseMontage;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        if(Math::RandBool())
        {
            MainMontage = CrossPoseMontage;
        }
        else
        {
            MainMontage = JarPoseMontage;
        }

        //CROSSARMS SECTION
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Entry", n"Loop", Weight = 0.3333f));
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Entry", n"Loop02", Weight = 0.3333f));
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Entry", n"Loop03", Weight = 0.3333f));

        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop", n"Loop02", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop", n"Loop03", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop", n"Breaker01", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop", n"Breaker02", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop", n"Breaker03", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop", n"Breaker04", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop02", n"Loop", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop02", n"Loop03", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop02", n"Breaker01", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop02", n"Breaker02", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop02", n"Breaker03", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop02", n"Breaker04", Weight = 0.15f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop03", n"Loop", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop03", n"Loop03", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop03", n"Breaker01", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop03", n"Breaker02", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop03", n"Breaker03", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Loop03", n"Breaker04", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Breaker01", n"Loop", Weight = 0.2f));
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Breaker01", n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Breaker01", n"Loop03", Weight = 0.3f));

        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Breaker02", n"Loop", Weight = 0.2f));
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Breaker02", n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Breaker02", n"Loop03", Weight = 0.3f));

        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Breaker03", n"Loop", Weight = 0.2f));
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Breaker03", n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Breaker03", n"Loop03", Weight = 0.3f));

        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Breaker04", n"Loop", Weight = 0.2f));
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Breaker04", n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(CrossPoseMontage, n"Breaker04", n"Loop03", Weight = 0.3f));

        //JARSARMS SECTION
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Entry", n"Loop01", Weight = 0.25f));
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Entry", n"Loop02", Weight = 0.25f));
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Entry", n"Loop03", Weight = 0.25f));
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Entry", n"Loop04", Weight = 0.25f));

        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"Loop02", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"Loop03", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"Loop04", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"IdleDialog", Weight = 1.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"Cough", Weight = 0.8f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"Look02", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"RelaxArms", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"Yawn", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"NeckMov", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"Shoulder", Weight = 0.8f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"Look01", Weight = 0.02f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = 10.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"Listen", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop01", n"ToCrossArms", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = 10.0f;
        Transitions.Add(TransitionStay(JarPoseMontage, n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToMontage(JarPoseMontage, n"ToCrossArms", CrossPoseMontage, n"Entry", Weight = 1.0f));
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"Loop01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"Loop03", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"Loop04", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"IdleDialog", Weight = 1.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"Cough", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"Look02", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"RelaxArms", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"Yawn", Weight = 0.75f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"NeckMov", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"Shoulder", Weight = 0.75f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"Look01", Weight = 0.02f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"Listen", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop02", n"ToCrossArms", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(JarPoseMontage, n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"Loop02", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"Loop01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"Loop04", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"IdleDialog", Weight = 1.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"Cough", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"Look02", Weight = 0.75f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"RelaxArms", Weight = 0.75f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"Yawn", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"NeckMov", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"Shoulder", Weight = 0.6f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"Look01", Weight = 0.02f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"Listen", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop03", n"ToCrossArms", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(JarPoseMontage, n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"Loop02", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"Loop03", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"Loop01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"IdleDialog", Weight = 1.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"Cough", Weight = 0.75f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"Look02", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"RelaxArms", Weight = 0.6f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"Yawn", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"NeckMov", Weight = 0.65f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"Shoulder", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"Look01", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"Listen", Weight = 0.7f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Loop04", n"ToCrossArms", Weight = 0.5f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(JarPoseMontage, n"Loop04", Weight = 0.3f));
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Cough", n"Loop01", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Cough", n"Loop02", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Cough", n"Loop03", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Cough", n"Loop04", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Cough", n"IdleDialog", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Look02", n"Loop01", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Look02", n"Loop02", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Look02", n"Loop03", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Look02", n"Loop04", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Look02", n"IdleDialog", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"RelaxArms", n"Loop01", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"RelaxArms", n"Loop02", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"RelaxArms", n"Loop03", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"RelaxArms", n"Loop04", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"RelaxArms", n"IdleDialog", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Yawn", n"Loop01", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Yawn", n"Loop02", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Yawn", n"Loop03", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Yawn", n"Loop04", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Yawn", n"IdleDialog", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"NeckMov", n"Loop01", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"NeckMov", n"Loop02", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"NeckMov", n"Loop03", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"NeckMov", n"Loop04", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"NeckMov", n"IdleDialog", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Shoulder", n"Loop01", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Shoulder", n"Loop02", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Shoulder", n"Loop03", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Shoulder", n"Loop04", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Shoulder", n"IdleDialog", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Look01", n"Loop01", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Look01", n"Loop02", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Look01", n"Loop03", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Look01", n"Loop04", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Look01", n"IdleDialog", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Listen", n"Loop01", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Listen", n"Loop02", Weight = 0.7f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Listen", n"Loop03", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Listen", n"Loop04", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Add(TransitionToSection(JarPoseMontage, n"Listen", n"IdleDialog", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 6.0f;
        Transitions.Last().RequireCharacterHasAnyOf.AddTag(GameplayTag::State_Conversation);
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_GuardWatch : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_GuardWatch);

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    UPROPERTY() TSoftObjectPtr<UAnimMontage> GuardMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Guard/Man_Guard_IdleActions_Montage.Man_Guard_IdleActions_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> GuardCrossArmsMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Guard/Man_Guard_CrossArms_Montage.Man_Guard_CrossArms_Montage'";

    default bStartWhileMoving=false;
    default bAllowInterruptAtAnyTime = true;
    default QuickExitMode = EInteractionFastExitMode::PlayFastExitIfAvailableOtherwiseBlendOut;

    default MainMontage = GuardMontage;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        if(Math::RandBool())
        {
            MainMontage = GuardMontage;
        }
        else
        {
            MainMontage = GuardCrossArmsMontage;
        }

        //Guard Alt
        Transitions.Add(TransitionToSection(GuardMontage, n"Entry", n"Loop"));

        Transitions.Add(TransitionToSection(GuardMontage, n"Loop", n"Spit", Weight = 0.25f));
        Transitions.Add(TransitionToSection(GuardMontage, n"Loop", n"Cough", Weight = 0.2f));
        Transitions.Add(TransitionToSection(GuardMontage, n"Loop", n"Scratch", Weight = 0.25f));
        Transitions.Add(TransitionToSection(GuardMontage, n"Loop", n"JarsArms01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(GuardMontage, n"Loop", n"JarsArms02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(GuardMontage, n"Loop", n"Watch", Weight = 0.15f));
        Transitions.Add(TransitionToSection(GuardMontage, n"Loop", n"Watch02", Weight = 0.15f));

        //Guard CrossArms
        Transitions.Add(TransitionToSection(GuardCrossArmsMontage, n"Entry", n"Loop", Weight = 0.33f));
        Transitions.Add(TransitionToSection(GuardCrossArmsMontage, n"Entry", n"Loop02", Weight = 0.33f));
        Transitions.Add(TransitionToSection(GuardCrossArmsMontage, n"Entry", n"Loop03", Weight = 0.33f));
        Transitions.Add(TransitionToSection(GuardCrossArmsMontage, n"Loop", n"Loop02", Weight = 0.2f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 20.0f;

        Transitions.Add(TransitionToSection(GuardCrossArmsMontage, n"Loop", n"Loop03", Weight = 0.3f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 20.0f;

        Transitions.Add(TransitionStay(GuardCrossArmsMontage, n"Loop", Weight = 0.1f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 20.0f;

        Transitions.Add(TransitionToSection(GuardCrossArmsMontage, n"Loop02", n"Loop", Weight = 0.2f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 20.0f;

        Transitions.Add(TransitionToSection(GuardCrossArmsMontage, n"Loop02", n"Loop03", Weight = 0.3f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 20.0f;

        Transitions.Add(TransitionStay(GuardCrossArmsMontage, n"Loop02", Weight = 0.1f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 20.0f;

        Transitions.Add(TransitionToSection(GuardCrossArmsMontage, n"Loop03", n"Loop02", Weight = 0.2f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 20.0f;

        Transitions.Add(TransitionToSection(GuardCrossArmsMontage, n"Loop03", n"Loop", Weight = 0.3f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 20.0f;

        Transitions.Add(TransitionStay(GuardCrossArmsMontage, n"Loop03", Weight = 0.1f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 20.0f;

    }
}

UCLASS()
class UAbilityTask_Interaction_Woman_Dance : UAbilityTask_Interaction_Human_Women
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_WomanDance);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Women/Living/Dance/Woman_Dance_Montage.Woman_Dance_Montage'";

    default bStartWhileMoving=false;

    default AutoTransitionCheckSecondsMin = 0.0f;
    default AutoTransitionCheckSecondsMax = 0.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop"));
        //Loop Section
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker01", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 20.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker02", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 20.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker03", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 20.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker04", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 20.0f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker05", Weight = 0.05f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 20.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker06", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 20.0f;
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Dance : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Dance);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Dancing/A_Man_Dancing_Montage.A_Man_Dancing_Montage'";
    default QuickExitMode = EInteractionFastExitMode::PlayFastExitIfAvailableOtherwiseBlendOut;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Idle01"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Dance_Seated : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Dance_Seated);
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Dancing/A_Man_Sit_Dancing_Montage.A_Man_Sit_Dancing_Montage'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Idle01"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Clap : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Clap);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Dancing/A_Man_Dancing_Clap_Montage.A_Man_Dancing_Clap_Montage'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default AutoTransitionCheckSecondsMin = 1.0f;
    default AutoTransitionCheckSecondsMax = 5.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01"));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker02", Weight = 0.2f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.15f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Clap_Seated : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Clap_Seated);
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Dancing/A_Man_Sit_Dancing_Montage.A_Man_Sit_Dancing_Montage'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Idle01"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Firespit : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Firespit);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Firespit/Man_Firespit_Montage.Man_Firespit_Montage'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {

        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop01"));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop02"));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop03"));


        //LOOP01
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Cheering01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Cheering02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Cheering03", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Cheering04", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Reverence", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"MoveTorch", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Rest", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.2f));

        //LOOP02
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Cheering01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Cheering02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Cheering03", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Cheering04", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Reverence", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"MoveTorch", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Rest", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop02", Weight = 0.2f));
        
        //LOOP03
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Cheering01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Cheering02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Cheering03", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Cheering04", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Reverence", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"MoveTorch", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Rest", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop03", Weight = 0.2f));
    }

}

UCLASS()
class UAbilityTask_Interaction_Human_TakeCauldron : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_TakeCauldron);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/OLD/Human_TakeObjectToCarry_Montage.Human_TakeObjectToCarry_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_FillCauldron : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_FillCauldron);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/OLD/Human_LeaveObjectAfterCarry_Montage.Human_LeaveObjectAfterCarry_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_RepairBow : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_RepairBow);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/OLD/Human_Work_Montage.Human_Work_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_PracticeBow : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_PracticeBow);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Training/Practice/Bow/A_Man_Training_Bow_Montage.A_Man_Training_Bow_Montage'";

    default AutoTransitionCheckSecondsMin = 0.0f;
    default AutoTransitionCheckSecondsMax = 5.0f;

    default TakeOutItemWithItemTypeFromInventory = GameplayTag::Item_Weapon_Bow;

    default bPutAwayItemInHandsAfterInteraction = true;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default DisableAutoTransitionsForTags.AddTag(GameplayTag::AIState_Wait_BlockedPath);

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01"));
        //Loop01 Section
        Transitions.Add(TransitionStay(MainMontage, InSection = n"Loop01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker02", Weight = 0.3f));
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker03", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
    }

}

UCLASS()
class UAbilityTask_Interaction_Human_ArenaGreetings : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_ArenaGreetings);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/PLACEHOLDER/Man_Digger_ArenaGreetings.Man_Digger_ArenaGreetings'";
}

UCLASS()
class UAbilityTask_Interaction_Human_ServeFood : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_ServeFood);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/PLACEHOLDER/Man_Digger_ServeFood.Man_Digger_ServeFood'";
}

UCLASS()
class UAbilityTask_Interaction_Human_WaitLine : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_WaitLine);
    
    default AutoTransitionCheckSecondsMin = 5.0f;
    default AutoTransitionCheckSecondsMax = 10.0f;
    
    UPROPERTY() TSoftObjectPtr<UAnimMontage> StandMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Idle/IdlePose/A_Man_IdlePose_Montage.A_Man_IdlePose_Montage'";

    default MontageEntryFrontSection = NAME_None;
    default MontageEntryBackSection = NAME_None;
    default MontageEntryRightSection = NAME_None;
    default MontageEntryLeftSection = NAME_None;

    default MontageExitFrontSection = NAME_None;
    default MontageExitBackSection = NAME_None;
    default MontageExitRightSection = NAME_None;
    default MontageExitLeftSection = NAME_None;

    default MainMontage = StandMontage;

    UFUNCTION(BlueprintOverride) 
    void SetupTransitions()
    {

        //LOOP01 SECTION
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop02", Weight = 0.35f));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Scratch", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"HandFace", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Relocate", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Fly", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Shoulder", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Stretch", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"HandsHips", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Cough", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Nails", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"ScratchHead", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"MoveFeet", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"LookDown", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"LookUp", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.25f));

        //LOOP02 SECTION
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop01", Weight = 0.05f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Scratch", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"HandFace", Weight = 0.35f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Relocate", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Fly", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Shoulder", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Stretch", Weight = 0.35f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"HandsHips", Weight = 0.35f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Cough", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Nails", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"ScratchHead", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"MoveFeet", Weight = 0.36f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"StepBug", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"LookLeft", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"LookRight", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"LookDown", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"LookUp", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionStay(MainMontage, n"Loop02", Weight = 0.25f));

        //LOOP03 SECTION
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop02", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop01", Weight = 0.05f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop04", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop05", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Scratch", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"HandFace", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Relocate", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Fly", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Shoulder", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Stretch", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"HandsHips", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Cough", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Nails", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"ScratchHead", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"MoveFeet", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"StepBug", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"LookLeft", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"LookRight", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"LookDown", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"LookUp", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionStay(MainMontage, n"Loop03", Weight = 0.25f));

        //LOOP04 SECTION
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Loop02", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Loop03", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Loop01", Weight = 0.05f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Loop05", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Scratch", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"HandFace", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Relocate", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Fly", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Shoulder", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Stretch", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"HandsHips", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Cough", Weight = 0.34f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"Nails", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"ScratchHead", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"MoveFeet", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"StepBug", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"LookLeft", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"LookRight", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"LookDown", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop04", n"LookUp", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionStay(MainMontage, n"Loop04", Weight = 0.25f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Fan : UAbilityTask_Interaction_Human_Women
{
    default DefaultForCharacterClass.Add(AAIAgentCharacter_Human_Woman::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Fan);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Women/Living/Fanning/Woman_Fanning_Montage.Woman_Fanning_Montage'";
    default ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Women/Living/Fanning/Wedel_Fanning_Montage.Wedel_Fanning_Montage'";

    default AutoTransitionCheckSecondsMin = 10.0f;
    default AutoTransitionCheckSecondsMax = 15.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {

        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop02"));

        //LOOP01
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker01", Weight = 0.05f));
        //Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker02", Weight = 0.1f));
        
        Transitions.Add(TransitionStay(MainMontage, n"Loop", Weight = 0.95f));

        //LOOP02
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker01", Weight = 0.05f));
        //Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker02", Weight = 0.1f));
    
        Transitions.Add(TransitionStay(MainMontage, n"Loop02", Weight = 0.95f));

        //BREAKERS
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker01", n"Loop", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker01", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker02", n"Loop", Weight = 0.5f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker02", n"Loop02", Weight = 0.5f));

    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Women_Sit : UAbilityTask_Interaction_Human_Women_SitAndSleep_IO
{
    default DefaultForCharacterClass.Add(AAIAgentCharacter_Human_Woman::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Interact_Sit_Chair);

    default bPutAwayItemInHandsBeforeInteraction = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Women/Living/Sit/Woman_Sit_Montage.Woman_Sit_Montage'";

    // Allow to stay seated when starting a conversation
    default TaskEndingTags.RemoveTag(GameplayTag::Action_Conversation);

    // How often should we try to do a transition?
    default AutoTransitionCheckSecondsMin = 5.0f;
    default AutoTransitionCheckSecondsMax = 10.0f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
         //ENTRY SECTION
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
        Transitions.Add(TransitionToSection(MainMontage, n"EntryLeft", n"Loop"));
        Transitions.Add(TransitionToSection(MainMontage, n"EntryRight", n"Loop"));
        Transitions.Add(TransitionToSection(MainMontage, n"EntryBack", n"Loop"));


        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker01", Weight = 0.2f));
        Transitions.Last().CooldownSeconds = 10.0f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker02", Weight = 0.2f));
        Transitions.Last().CooldownSeconds = 10.0f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker03", Weight = 0.2f));
        Transitions.Last().CooldownSeconds = 10.0f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker04", Weight = 0.2f));
        Transitions.Last().CooldownSeconds = 10.0f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker05", Weight = 0.2f));
        Transitions.Last().CooldownSeconds = 25.0f;
    }

}

UCLASS()
class UAbilityTask_Interaction_Human_Women_Sit_ReadBook : UAbilityTask_Interaction_Human_Women_SitAndSleep_IO
{
    default DefaultForCharacterClass.Add(AAIAgentCharacter_Human_Woman::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_ReadBook_Seated);
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Women/Living/Sit_Readbook/Woman_Sit_ReadBook_Montage.Woman_Sit_ReadBook_Montage'";
    default ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Women/Living/Sit_Readbook/W_Book_Sit_ReadBook_Montage.W_Book_Sit_ReadBook_Montage'";

    // How often should we try to do a transition?
    default AutoTransitionCheckSecondsMin = 5.0f;
    default AutoTransitionCheckSecondsMax = 10.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker01", Weight = 0.1f));
        Transitions.Last().CooldownSeconds = 10.0f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker02", Weight = 0.7f));
        Transitions.Last().CooldownSeconds = 20.0f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker03", Weight = 0.1f));
        Transitions.Last().CooldownSeconds = 10.0f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker04", Weight = 0.1f));
        Transitions.Last().CooldownSeconds = 15.0f;
    }

}

UCLASS()
class UAbilityTask_Interaction_Human_Sit_BrushHair : UAbilityTask_Interaction_Human_Women_SitAndSleep_IO
{
    default DefaultForCharacterClass.Add(AAIAgentCharacter_Human_Woman::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_BrushHair);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Women/Living/Sit/Sit_BrushHair/Woman_Sit_BrushHair_In_Montage.Woman_Sit_BrushHair_In_Montage'";

    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);

    default AutoTransitionCheckSecondsMin = 5.0f;
    default AutoTransitionCheckSecondsMax = 10.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {

        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop02"));

        //LOOP01
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker02", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker03", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker04", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = 15.0f;
        
        //LOOP02
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker01", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker02", Weight = 0.4f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 5.0f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker03", Weight = 0.1f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker04", Weight = 0.3f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 15.0f;

        //BREAKERS
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker01", n"Loop", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker01", n"Loop02", Weight = 0.75f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker02", n"Loop", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker02", n"Loop02", Weight = 0.75f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker03", n"Loop", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker03", n"Loop02", Weight = 0.75f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker04", n"Loop", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker04", n"Loop02", Weight = 0.75f));

    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Bath : UAbilityTask_Interaction_Human_Women
{
    default DefaultForCharacterClass.Add(AAIAgentCharacter_Human_Woman::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Bath);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Women/Living/Bath/Woman_Bath_Pose02_Montage.Woman_Bath_Pose02_Montage'";

    default AutoTransitionCheckSecondsMin = 5.0f;
    default AutoTransitionCheckSecondsMax = 10.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker03", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker04", Weight = 0.1f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_HoldTray : UAbilityTask_Interaction_Human_Women
{
    default DefaultForCharacterClass.Add(AAIAgentCharacter_Human_Woman::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_HoldTray);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Women/Living/HoldTray/Woman_HoldTray_Montage.Woman_HoldTray_Montage'";

    default AutoTransitionCheckSecondsMin = 5.0f;
    default AutoTransitionCheckSecondsMax = 10.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker01", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker02", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker03", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker04", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker05", Weight = 0.2f));
        Transitions.Last().bSeamless = false;
        
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Woman_SmokeWeed_Ground : UAbilityTask_Interaction_Human_Women
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_SmokeWeed_Ground);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Women/Living/WaterPipe/Woman_WaterPipe_Pose01_Montage.Woman_WaterPipe_Pose01_Montage'";
    default ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Women/Living/WaterPipe/W_WaterPipe_Montage.W_WaterPipe_Montage'";

    default AutoTransitionCheckSecondsMin = 5.0f;
    default AutoTransitionCheckSecondsMax = 8.0f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker01", Weight = 0.33333f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 5.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker02", Weight = 0.33333f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 10.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker03", Weight = 0.33333f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 20.0f;

    }
}

UCLASS()
class UAbilityTask_Interaction_Human_SitPool : UAbilityTask_Interaction_Human_Women
{
    default DefaultForCharacterClass.Add(AAIAgentCharacter_Human_Woman::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_SitPool);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Women/Living/Sit/Sit_SwampCamp_Pool/Women_Sit_SC_Pool_Montage.Women_Sit_SC_Pool_Montage'";

    default AutoTransitionCheckSecondsMin = 10.0f;
    default AutoTransitionCheckSecondsMax = 20.0f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker01", Weight = 0.333f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker02", Weight = 0.333f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker03", Weight = 0.333f));
        Transitions.Last().bSeamless = false; 
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_LightOnCandle : UAbilityTask_Interaction_Human_Women
{
    default DefaultForCharacterClass.Add(AAIAgentCharacter_Human_Woman::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_LightOnCandle);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Women/Living/Candles/Woman_Candles_LightOn_Montage.Woman_Candles_LightOn_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_LightOffCandle : UAbilityTask_Interaction_Human_Women
{
    default DefaultForCharacterClass.Add(AAIAgentCharacter_Human_Woman::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_LightOffCandle);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Women/Living/Candles/Woman_Candles_LightOff_Montage.Woman_Candles_LightOff_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_ReadBook : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_ReadBook);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Read_Book/Man_ReadBook_Inventory_Montage.Man_ReadBook_Inventory_Montage'";

    default AutoTransitionCheckSecondsMin = 5.0f;
    default AutoTransitionCheckSecondsMax = 10.0f;

    default bAllowInterruptLoopOnCancel = true;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        //Entry section
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01"));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop02"));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop03"));
        //Loop01
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop03", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Point_Finger", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Hand_Chin", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Page_Forward", Weight = 1.0f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Page_Back", Weight = 0.5f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Cough", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Thinking", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Look_Right", Weight = 0.15f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Look_Left", Weight = 0.15f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Scratch", Weight = 0.05f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.2f));
        //Loop02
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop03", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Point_Finger", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Hand_Chin", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Page_Forward", Weight = 1.0f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Page_Back", Weight = 0.5f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Cough", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Thinking", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Look_Right", Weight = 0.15f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Look_Left", Weight = 0.15f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Scratch", Weight = 0.05f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop02", Weight = 0.2f));
        //Loop03
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Point_Finger", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Hand_Chin", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Page_Forward", Weight = 1.0f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Page_Back", Weight = 0.5f));
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Cough", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Thinking", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Look_Right", Weight = 0.15f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Look_Left", Weight = 0.15f));
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Scratch", Weight = 0.05f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop03", Weight = 0.2f));
        //Breakers
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Point_Finger", ToSection = n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Point_Finger", ToSection = n"Loop02", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Point_Finger", ToSection = n"Loop03", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Hand_Chin", ToSection = n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Hand_Chin", ToSection = n"Loop02", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Hand_Chin", ToSection = n"Loop03", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Page_Forward", ToSection = n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Page_Forward", ToSection = n"Loop02", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Page_Forward", ToSection = n"Loop03", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Page_Back", ToSection = n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Page_Back", ToSection = n"Loop02", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Page_Back", ToSection = n"Loop03", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Cough", ToSection = n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Cough", ToSection = n"Loop02", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Cough", ToSection = n"Loop03", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Thinking", ToSection = n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Thinking", ToSection = n"Loop02", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Thinking", ToSection = n"Loop03", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Look_Right", ToSection = n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Look_Right", ToSection = n"Loop02", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Look_Right", ToSection = n"Loop03", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Look_Left", ToSection = n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Look_Left", ToSection = n"Loop02", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Look_Left", ToSection = n"Loop03", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Scratch", ToSection = n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Scratch", ToSection = n"Loop02", Weight = 0.4f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Scratch", ToSection = n"Loop03", Weight = 0.4f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_ReadBook_Lectern : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_ReadBook_Lectern);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/ReadBook_Lectern/Man_ReadLectern_Montage.Man_ReadLectern_Montage'";
    default ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/ReadBook_Lectern/Book_ReadLectern_Montage.Book_ReadLectern_Montage'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01"));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop02"));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop03"));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop03", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Finger", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Chin", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"PageForward", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"PageBack", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Cough", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Think", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"LookRight", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"LookLeft", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Scratch", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Recolocate", Weight = 0.05f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop03", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Finger", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Chin", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"PageForward", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"PageBack", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Cough", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Think", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"LookRight", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"LookLeft", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Scratch", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Recolocate", Weight = 0.05f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Finger", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Chin", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"PageForward", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"PageBack", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Cough", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Think", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"LookRight", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"LookLeft", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Scratch", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Recolocate", Weight = 0.05f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop03", Weight = 0.2f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_ReadBook_Shell : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_ReadBook_Shell);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Read_Book/Man_ReadBook_Montage.Man_ReadBook_Montage'";

    default ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Read_Book/Book_ReadBook_Montage.Book_ReadBook_Montage'";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01"));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop02"));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop03"));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop03", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Point_Finger", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Hand_Chin", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Page_Forward", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Page_Back", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Cough", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Thinking", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Look_Right", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Look_Left", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Scratch", Weight = 0.05f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop03", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Point_Finger", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Hand_Chin", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Page_Forward", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Page_Back", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Cough", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Thinking", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Look_Right", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Look_Left", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Scratch", Weight = 0.05f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Point_Finger", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Hand_Chin", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Page_Forward", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Page_Back", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Cough", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Thinking", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Look_Right", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Look_Left", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Scratch", Weight = 0.05f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop03", Weight = 0.2f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_ReadBook_Seated : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_ReadBook_Seated);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_Readbook/Man_Sit_ReadBook_Montage.Man_Sit_ReadBook_Montage'";
    default ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sit_Readbook/Book_Sit_ReadBook_Montage.Book_Sit_ReadBook_Montage'";
    
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair); 

    default bAllowInterruptLoopOnCancel = true;
    //default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayFastExitIfAvailableOtherwiseBlendOut;
    
    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01"));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop02"));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop03"));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop03", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Fingers", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Chin", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"PageForward", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"PageBackward", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Thought", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"LookRight", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"LookLeft", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Scratch", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Closer", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Assent", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Negate", Weight = 0.05f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop03", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Fingers", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Chin", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"PageForward", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"PageBackward", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Thought", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"LookRight", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"LookLeft", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Scratch", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Closer", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Assent", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Negate", Weight = 0.05f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Fingers", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Chin", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"PageForward", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"PageBackward", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Thought", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"LookRight", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"LookLeft", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Scratch", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Closer", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Assent", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Negate", Weight = 0.05f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop03", Weight = 0.2f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_PracticeMagic : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_PracticeMagic);
    default MainMontage =  n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Training/Magic/Man_Training_Magic_Montage.Man_Training_Magic_Montage'";

    default QuickExitMode = EInteractionFastExitMode::PlayFastExitIfAvailableOtherwiseBlendOut;

    default AutoTransitionCheckSecondsMin = 6.0f;
    default AutoTransitionCheckSecondsMax = 8.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
       
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker01", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker02", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker03", Weight = 0.25f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker04", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop", Weight = 0.05f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_HerbAlchemy : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_HerbAlchemy);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/SmashHerbs/Man_SmashHerbs_Montage.Man_SmashHerbs_Montage'";
    default ObjectMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/SmashHerbs/WeedMasher_SmashHerbs_Montage.WeedMasher_SmashHerbs_Montage'";
    default QuickExitMode = EInteractionFastExitMode::PlayFastExitIfAvailableOtherwiseBlendOut;

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;
    
    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop02"));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Loop02", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker_01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker_02", Weight = 0.2f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker_01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker_02", Weight = 0.2f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop02", Weight = 0.3f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_PotionAlchemy : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_PotionAlchemy);

    default QuickExitMode = EInteractionFastExitMode::PlayFastExitIfAvailableOtherwiseBlendOut;

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Alchemy/Man_Interact_AlchemyLab_Montage.Man_Interact_AlchemyLab_Montage'";
    default ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Alchemy/Object_Interact_AlchemyLab_Montage_AI.Object_Interact_AlchemyLab_Montage_AI'";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Idle"));

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle", ToSection = n"Breaker_01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle", ToSection = n"Breaker_02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle", ToSection = n"Breaker_03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle", ToSection = n"Breaker_05", Weight = 0.25f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle", ToSection = n"Breaker_06", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle", ToSection = n"Breaker_07", Weight = 0.15f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle", ToSection = n"Breaker_08", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle", ToSection = n"Breaker_09", Weight = 0.05f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Inscription : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Crafting_Inscription);

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Inscription/Man_Lactern_Montage.Man_Lactern_Montage'";
    default ObjectMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Inscription/Object_Interact_Inscription_Montage_AI.Object_Interact_Inscription_Montage_AI'";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Idle"));

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle", ToSection = n"Breaker_01", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle", ToSection = n"Breaker_01b", Weight = 0.3f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle", ToSection = n"Breaker_02", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle", ToSection = n"Breaker_03", Weight = 0.05f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle", ToSection = n"Breaker_07", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle", ToSection = n"Breaker_08", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle", ToSection = n"Breaker_12", Weight = 0.05f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_PickOre : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_PickOre);
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Mining);

    default AutoTransitionCheckSecondsMin = 8.0f;
    default AutoTransitionCheckSecondsMax = 15.0f;

    default QuickExitMode = EInteractionFastExitMode::PlayFastExitIfAvailableOtherwiseBlendOut;
    default TakeOutItemWithSpecFromInventory = GameplayTag::Item_Property_Mining;

    default bPutAwayItemInHandsAfterInteraction = true;

    UPROPERTY() TSoftObjectPtr<UAnimMontage> PickMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Pickaxe/Man_Pickaxe_Montage.Man_Pickaxe_Montage'";
    
    default MainMontage = PickMontage;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop01"));

        // LOOP01

        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker_01", Weight = 0.25f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 20.0f;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker_02", Weight = 0.2f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 20.0f;
    
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker_03", Weight = 0.35f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 20.0f;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker_04", Weight = 0.35f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 20.0f;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker_05", Weight = 0.15f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 20.0f;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker_06", Weight = 0.1f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 20.0f;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker_07", Weight = 0.1f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 20.0f;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker_08", Weight = 0.1f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 20.0f;

        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.4f));


    }
}

UCLASS()
class UAbilityTask_Interaction_Human_PickOre_Ground : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_PickOre_Ground);
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Mining);

    default AutoTransitionCheckSecondsMin = 8.0f;
    default AutoTransitionCheckSecondsMax = 15.0f;

    UPROPERTY() TSoftObjectPtr<UAnimMontage> PickMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Pickaxe/Man_Pickaxe_Ground_Montage.Man_Pickaxe_Ground_Montage'";

    default TakeOutItemWithSpecFromInventory = GameplayTag::Item_Property_Mining;
    default bPutAwayItemInHandsAfterInteraction = true;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default MainMontage = PickMontage;
    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop01"));

        // LOOP01
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker_01", Weight = 0.25f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 20.0f;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker_02", Weight = 0.2f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 20.0f;
    
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker_04", Weight = 0.3f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 20.0f;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker_05", Weight = 0.15f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 20.0f;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker_06", Weight = 0.1f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 20.0f;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker_07", Weight = 0.1f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 20.0f;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker_08", Weight = 0.1f));
        Transitions.Last().BlockOtherTransitionsForSeconds = 20.0f;

        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.4f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Sit_Bed_Low_Right : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Interact_Sit_Bed_Low_Right);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sleep/Low/Man_Digger_SitBedLow_R_Montage.Man_Digger_SitBedLow_R_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default MontageEntryBackSection = n"Entry";
    default MontageEntryFrontSection = n"Entry";
    default MontageEntryLeftSection = n"Entry";
    default MontageEntryRightSection = n"Entry";

    default MontageExitBackSection = n"Exit";
    default MontageExitFrontSection = n"Exit";
    default MontageExitLeftSection = n"Exit";
    default MontageExitRightSection = n"Exit";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_01", Weight = 0.50f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_02", Weight = 0.50f));
    
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_03", Weight = 0.50f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_04", Weight = 0.50f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_05", Weight = 0.50f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_06", Weight = 0.50f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_07", Weight = 0.50f));
    }

}

UCLASS()
class UAbilityTask_Interaction_Human_Sit_Bed_Low_Left : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Interact_Sit_Bed_Low_Left);

    default bShouldFocusInteractiveObject = false;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sleep/Low/Man_Digger_SitBedLow_L_Montage.Man_Digger_SitBedLow_L_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default MontageEntryBackSection = n"Entry";
    default MontageEntryFrontSection = n"Entry";
    default MontageEntryLeftSection = n"Entry";
    default MontageEntryRightSection = n"Entry";

    default MontageExitBackSection = n"Exit";
    default MontageExitFrontSection = n"Exit";
    default MontageExitLeftSection = n"Exit";
    default MontageExitRightSection = n"Exit";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_01", Weight = 0.50f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_02", Weight = 0.50f));
    
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_03", Weight = 0.50f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_04", Weight = 0.50f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_05", Weight = 0.50f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_06", Weight = 0.50f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_07", Weight = 0.50f));
    }

}

UCLASS()
class UAbilityTask_Interaction_Human_Sit_Bed_High_Right : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Interact_Sit_Bed_High_Right);

    default MainMontage = n"/AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sleep/High/Man_Digger_SitBedHigh_R_Montage.Man_Digger_SitBedHigh_R_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default MontageEntryBackSection = n"Entry";
    default MontageEntryFrontSection = n"Entry";
    default MontageEntryLeftSection = n"Entry";
    default MontageEntryRightSection = n"Entry";

    default MontageExitBackSection = n"Exit";
    default MontageExitFrontSection = n"Exit";
    default MontageExitLeftSection = n"Exit";
    default MontageExitRightSection = n"Exit";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_01", Weight = 0.50f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_02", Weight = 0.50f));
    
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_03", Weight = 0.50f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_04", Weight = 0.50f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_05", Weight = 0.50f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_06", Weight = 0.50f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_07", Weight = 0.50f));
    }

}

UCLASS()
class UAbilityTask_Interaction_Human_Sit_Bed_High_Left : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Interact_Sit_Bed_High_Left);

    default MainMontage = n"/AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sleep/High/Man_Digger_SitBedHigh_L_Montage.Man_Digger_SitBedHigh_L_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default MontageEntryBackSection = n"Entry";
    default MontageEntryFrontSection = n"Entry";
    default MontageEntryLeftSection = n"Entry";
    default MontageEntryRightSection = n"Entry";

    default MontageExitBackSection = n"Exit";
    default MontageExitFrontSection = n"Exit";
    default MontageExitLeftSection = n"Exit";
    default MontageExitRightSection = n"Exit";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_01", Weight = 0.50f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_02", Weight = 0.50f));
    
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_03", Weight = 0.50f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_04", Weight = 0.50f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_05", Weight = 0.50f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_06", Weight = 0.50f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"IdleBreaker_07", Weight = 0.50f));
    }

}

UCLASS()
class UAbilityTask_Interaction_Human_Sleep_Low_Right : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep_Low_Right);

    UPROPERTY() TSoftObjectPtr<UAnimMontage> SleepMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sleep/Low/Man_Digger_SleepBedLow_R_Montage.Man_Digger_SleepBedLow_R_Montage'";

    default MontageEntryBackSection = n"Entry";
    default MontageEntryFrontSection = n"Entry";
    default MontageEntryLeftSection = n"Entry";
    default MontageEntryRightSection = n"Entry";

    default MontageExitBackSection = n"Exit";
    default MontageExitFrontSection = n"Exit";
    default MontageExitLeftSection = n"Exit";
    default MontageExitRightSection = n"Exit";

    default MainMontage = SleepMontage;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(SleepMontage, n"Entry", n"Loop"));

        Transitions.Add(TransitionExit(SleepMontage, n"Loop", n"Exit", Weight = 0.50f));
        Transitions.Add(TransitionExit(SleepMontage, n"Loop", n"Exit_Fast", Weight = 0.50f));
    
        Transitions.Add(TransitionExit(SleepMontage, n"Loop", n"Exit_SitUp", Weight = 0.50f));
        Transitions.Add(TransitionExit(SleepMontage, n"Loop", n"Exit_SitUp2", Weight = 0.50f));
        Transitions.Add(TransitionExit(SleepMontage, n"Loop", n"Exit_SitUp3", Weight = 0.50f));
    }

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;
}

UCLASS()
class UAbilityTask_Interaction_Human_Sleep_Low_Left : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep_Low_Left);

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default MontageEntryBackSection = n"Entry";
    default MontageEntryFrontSection = n"Entry";
    default MontageEntryLeftSection = n"Entry";
    default MontageEntryRightSection = n"Entry";

    default MontageExitBackSection = n"Exit";
    default MontageExitFrontSection = n"Exit";
    default MontageExitLeftSection = n"Exit";
    default MontageExitRightSection = n"Exit";

    UPROPERTY() TSoftObjectPtr<UAnimMontage> SleepMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sleep/Low/Man_Digger_SleepBedLow_L_Montage.Man_Digger_SleepBedLow_L_Montage'";

    default MainMontage = SleepMontage;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(SleepMontage, n"Entry", n"Loop"));

        Transitions.Add(TransitionExit(SleepMontage, n"Loop", n"Exit", Weight = 0.50f));
        Transitions.Add(TransitionExit(SleepMontage, n"Loop", n"Exit_Fast", Weight = 0.50f));
    
        Transitions.Add(TransitionExit(SleepMontage, n"Loop", n"Exit_SitUp", Weight = 0.50f));
        Transitions.Add(TransitionExit(SleepMontage, n"Loop", n"Exit_SitUp2", Weight = 0.50f));
        Transitions.Add(TransitionExit(SleepMontage, n"Loop", n"Exit_SitUp3", Weight = 0.50f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Sleep_High_Right : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep_High_Right);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sleep/High/Man_Digger_SleepBedHigh_R_Montage.Man_Digger_SleepBedHigh_R_Montage'";;

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default MontageEntryBackSection = n"Entry";
    default MontageEntryFrontSection = n"Entry";
    default MontageEntryLeftSection = n"Entry";
    default MontageEntryRightSection = n"Entry";

    default MontageExitBackSection = n"Exit";
    default MontageExitFrontSection = n"Exit";
    default MontageExitLeftSection = n"Exit";
    default MontageExitRightSection = n"Exit";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));

        Transitions.Add(TransitionExit(MainMontage, n"Loop", n"Exit", Weight = 0.50f));
        Transitions.Add(TransitionExit(MainMontage, n"Loop", n"Exit_Fast", Weight = 0.50f));
    
        Transitions.Add(TransitionExit(MainMontage, n"Loop", n"Exit_SitUp", Weight = 0.50f));
        Transitions.Add(TransitionExit(MainMontage, n"Loop", n"Exit_SitUp2", Weight = 0.50f));
        Transitions.Add(TransitionExit(MainMontage, n"Loop", n"Exit_SitUp3", Weight = 0.50f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Sleep_High_Left : UAbilityTask_Interaction_Human_SitAndSleep_IO
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep_High_Left);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sleep/High/Man_Digger_SleepBedHigh_L_Montage1.Man_Digger_SleepBedHigh_L_Montage1'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default MontageEntryBackSection = n"Entry";
    default MontageEntryFrontSection = n"Entry";
    default MontageEntryLeftSection = n"Entry";
    default MontageEntryRightSection = n"Entry";

    default MontageExitBackSection = n"Exit";
    default MontageExitFrontSection = n"Exit";
    default MontageExitLeftSection = n"Exit";
    default MontageExitRightSection = n"Exit";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));

        Transitions.Add(TransitionExit(MainMontage, n"Loop", n"Exit", Weight = 0.50f));
        Transitions.Add(TransitionExit(MainMontage, n"Loop", n"Exit_Fast", Weight = 0.50f));
    
        Transitions.Add(TransitionExit(MainMontage, n"Loop", n"Exit_SitUp", Weight = 0.50f));
        Transitions.Add(TransitionExit(MainMontage, n"Loop", n"Exit_SitUp2", Weight = 0.50f));
        Transitions.Add(TransitionExit(MainMontage, n"Loop", n"Exit_SitUp3", Weight = 0.50f));
    }

}

UCLASS()
class UAbilityTask_Interaction_Human_BlowFire : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_BlowFire);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Machines/Oven_BlowFire/Man_Digger_BlowFire_Montage.Man_Digger_BlowFire_Montage'";
    default ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Machines/Oven_BlowFire/Oven_BlowFire_Montage.Oven_BlowFire_Montage'";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_FillBucket : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_FillBucket);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/OLD/Human_TakeObjectToCarry_Montage.Human_TakeObjectToCarry_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_EmptyBucket : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_EmptyBucket);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/OLD/Human_LeaveObjectAfterCarry_Montage.Human_LeaveObjectAfterCarry_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_GetBucket : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_GetBucket);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/OLD/Human_TakeObjectToCarry_Montage.Human_TakeObjectToCarry_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_LeaveBucket : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_LeaveBucket);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/OLD/Human_LeaveObjectAfterCarry_Montage.Human_LeaveObjectAfterCarry_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_RecoverBucket : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_RecoverBucket);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/OLD/Human_TakeObjectToCarry_Montage.Human_TakeObjectToCarry_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_PlaceBucket : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_PlaceBucket);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/OLD/Human_LeaveObjectAfterCarry_Montage.Human_LeaveObjectAfterCarry_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Human_TurnWheel : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_TurnWheel);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Machines/Oven_BlowFire/Man_BucketCircuit_Montage.Man_BucketCircuit_Montage'";
    default ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Machines/Oven_BlowFire/Oven_BucketCircuit_Montage.Oven_BucketCircuit_Montage'";

    default AutoTransitionCheckSecondsMin = 5.0f;
    default AutoTransitionCheckSecondsMax = 10.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"TurnWheel", Weight = 0.9f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop", Weight = 0.1f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_PickRice : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_PickRice);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Pick_Rice/Human_PickRice_Montage.Human_PickRice_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default TakeOutItemWithSpecFromInventory = GameplayTag::Item_Property_Reaping;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop01"));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop02"));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop03"));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Look", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Rest01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Sweat", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Rest02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Cough", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"ArmStretch", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"BackRest", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Look", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Rest01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Sweat", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Rest02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Cough", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"ArmStretch", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"BackRest", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Look", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Rest01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Sweat", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Rest02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Cough", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"ArmStretch", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"BackRest", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop03", Weight = 0.2f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Shouting : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Shout);

    UPROPERTY() TSoftObjectPtr<UAnimMontage> Shouting1 = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Cinematics/Cutscenes/CS2_Prophecy/SH03/Man_Shouting_Upset01_Montage.Man_Shouting_Upset01_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> Shouting2 = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Cinematics/Cutscenes/CS2_Prophecy/SH03/Man_ShoutingUpset02_Montage.Man_ShoutingUpset02_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default MainMontage = Shouting1;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        if(Math::RandBool())
        {
            MainMontage = Shouting1;
        }
        else
        {
            MainMontage = Shouting2;
        }
        Transitions.Add(TransitionToSection(MainMontage, n"Idle01", n"Idle02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Idle01", n"Idle03", Weight = 0.2f));
        Transitions.Add(TransitionStay(MainMontage, n"Idle01", Weight = 0.2f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_CalmPeople : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_CalmPeople);

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Cinematics/Cutscenes/CS2_Prophecy/SH03/Man_CalmPeople_Montage.Man_CalmPeople_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Idle01", n"Idle02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Idle01", n"Idle03", Weight = 0.2f));
        Transitions.Add(TransitionStay(MainMontage, n"Idle01", Weight = 0.2f));
    }
}

UCLASS()
class UAbilityTask_Interaction_CleanFloor : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Clean);
    UPROPERTY() TSoftObjectPtr<UAnimMontage> Pose01Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Clean_Floor/Pose01/Man_CleanFloor_Montage.Man_CleanFloor_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> Pose02Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Clean_Floor/Pose02/Man_CleanFloor_Pose02_Montage.Man_CleanFloor_Pose02_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default MainMontage = Pose01Montage;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        if(Math::RandBool())
        {
            MainMontage = Pose01Montage;
        }
        else
        {
            MainMontage = Pose02Montage;
        }

        //POSE01
        Transitions.Add(TransitionToSection(Pose01Montage, n"Entry", n"Loop01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Entry", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Entry", n"Loop03", Weight = 0.5f));
        
        //LOOP01    
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"Loop02", Weight = 0.35f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"Loop03", Weight = 0.35f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"Clean01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"Clean02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"Rest01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"Rest02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"Look", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"Sweat", Weight = 0.1f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"CleaningBrush", Weight = 0.05f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"Stretch", Weight = 0.05f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"Yawn", Weight = 0.05f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"Check", Weight = 0.05f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"Finger", Weight = 0.05f));
        Transitions.Add(TransitionStay(Pose01Montage, n"Loop01", Weight = 0.25f));
        /*Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"Exit", Weight = 0.1f)); */

        //LOOP02    
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"Loop01", Weight = 0.35f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"Loop03", Weight = 0.35f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"Clean01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"Clean02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"Rest01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"Rest02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"Look", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"Sweat", Weight = 0.1f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"CleaningBrush", Weight = 0.05f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"Stretch", Weight = 0.05f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"Yawn", Weight = 0.05f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"Check", Weight = 0.05f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"Finger", Weight = 0.05f));
        Transitions.Add(TransitionStay(Pose01Montage, n"Loop02", Weight = 0.25f));
        /*Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"Exit", Weight = 0.1f)); */

        //LOOP03    
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"Loop01", Weight = 0.35f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"Loop02", Weight = 0.35f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"Clean01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"Clean02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"Rest01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"Rest02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"Look", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"Sweat", Weight = 0.1f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"CleaningBrush", Weight = 0.05f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"Stretch", Weight = 0.05f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"Yawn", Weight = 0.05f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"Check", Weight = 0.05f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"Finger", Weight = 0.05f));
        Transitions.Add(TransitionStay(Pose01Montage, n"Loop03", Weight = 0.25f));
        /*Transitions.Add(TransitionToSection(Pose01Montage, n"Loop03", n"Exit", Weight = 0.1f)); */

        //POSE02
        Transitions.Add(TransitionToSection(Pose02Montage, n"Entry", n"Loop01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Entry", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Entry", n"Loop03", Weight = 0.5f));
        
        //LOOP01    
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"Loop02", Weight = 0.35f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"Loop03", Weight = 0.35f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"Clean01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"Clean02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"Rest01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"Rest02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"CleanLHand", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"Sweat", Weight = 0.1f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"Brush01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"Streach", Weight = 0.05f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"Check01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"Check02", Weight = 0.05f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"Check03", Weight = 0.05f));
        Transitions.Add(TransitionStay(Pose02Montage, n"Loop01", Weight = 0.25f));
        /*Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"Exit", Weight = 0.1f)); */

        //LOOP02    
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"Loop01", Weight = 0.35f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"Loop03", Weight = 0.35f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"Clean01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"Clean02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"Rest01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"Rest02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"CleanLHand", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"Sweat", Weight = 0.1f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"Brush01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"Streach", Weight = 0.05f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"Check01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"Check02", Weight = 0.05f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"Check03", Weight = 0.05f));
        Transitions.Add(TransitionStay(Pose02Montage, n"Loop02", Weight = 0.25f));
        /*Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"Exit", Weight = 0.1f)); */

        //LOOP03    
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"Loop01", Weight = 0.35f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"Loop02", Weight = 0.35f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"Clean01", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"Clean02", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"Rest01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"Rest02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"CleanLHand", Weight = 0.15f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"Sweat", Weight = 0.1f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"Brush01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"Streach", Weight = 0.05f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"Check01", Weight = 0.05f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"Check02", Weight = 0.05f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"Check03", Weight = 0.05f));
        Transitions.Add(TransitionStay(Pose02Montage, n"Loop03", Weight = 0.25f));
        /*Transitions.Add(TransitionToSection(Pose02Montage, n"Loop03", n"Exit", Weight = 0.1f)); */

    }
}

UCLASS()
class UAbilityTask_Interaction_Human_RiceClean : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_RiceClean);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/RiceClean/Man_RiceClean_Montage.Man_RiceClean_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop01"));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop02"));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop03"));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Rest01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Rest02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Sweat01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Sweat02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Cough", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Scratch", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Back01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Back02", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Rest01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Rest02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Sweat01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Sweat02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Cough", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Scratch", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Back01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Back02", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Rest01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Rest02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Sweat01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Sweat02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Cough", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Scratch", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Back01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Back02", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop03", Weight = 0.2f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_SowRice : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_SowRice);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/RiceSeeding/Man_RiceSeeding_Montage.Man_RiceSeeding_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop01"));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop02"));
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop03"));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Rest01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Tired", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Scratch", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"DrySweat", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Cough", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Stretch", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Look01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Look02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Rest02", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop03", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Rest01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Tired", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Scratch", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"DrySweat", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Cough", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Stretch", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Look01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Look02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Rest02", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop02", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop01", Weight = 0.2f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Rest01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Tired", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Scratch", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"DrySweat", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Cough", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Stretch", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Look01", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Look02", Weight = 0.1f));
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Rest02", Weight = 0.1f));
        Transitions.Add(TransitionStay(MainMontage, n"Loop03", Weight = 0.2f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Xardas_CheckNotes : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_XardasCheckNotes);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/XardasTable/Man_XardasTable_Montage.Man_XardasTable_Montage'";

    default AutoTransitionCheckSecondsMin = 5.0f;
    default AutoTransitionCheckSecondsMax = 10.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
        // LOOP
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker01", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Breaker02", Weight = 0.4f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop", Weight = 0.2f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Meditate : UAbilityTask_Interaction_Human_Conversation
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Meditate);

    UPROPERTY() TSoftObjectPtr<UAnimMontage> Pose01Montage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Meditation/Man_Meditate_01_Montage.Man_Meditate_01_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> Pose02Montage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Meditation/Man_Meditate_Pose02_Montage.Man_Meditate_Pose02_Montage'";

    default OwnedTagsWhileActive.AddTag(GameplayTag::Smalltalk_Blocked);


    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    default MainMontage = Pose01Montage;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {

        if(Math::RandBool())
        {
            MainMontage = Pose01Montage;
        }
        else
        {
            MainMontage = Pose02Montage;
        }

        Transitions.Add(TransitionToSection(Pose01Montage, n"Entry", n"Loop01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Entry", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"Loop02", Weight = 0.65f));
        Transitions.Add(TransitionStay(Pose01Montage, n"Loop01", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"Loop01", Weight = 0.65f));
        Transitions.Add(TransitionStay(Pose01Montage, n"Loop02", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Entry", n"Loop01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Entry", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"Loop02", Weight = 0.65f));
        Transitions.Add(TransitionStay(Pose02Montage, n"Loop01", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"Loop01", Weight = 0.65f));
        Transitions.Add(TransitionStay(Pose02Montage, n"Loop02", Weight = 0.25f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Meditate_Yberion : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_MeditateYberion);

    UPROPERTY() TSoftObjectPtr<UAnimMontage> Pose01Montage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Meditation/Man_Meditate_01_Montage.Man_Meditate_01_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> Pose02Montage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Meditation/Man_Meditate_Pose02_Montage.Man_Meditate_Pose02_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default MainMontage = Pose01Montage;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {

        if(Math::RandBool())
        {
            MainMontage = Pose01Montage;
        }
        else
        {
            MainMontage = Pose02Montage;
        }

        Transitions.Add(TransitionToSection(Pose01Montage, n"Entry", n"Loop01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Entry", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"Loop02", Weight = 0.65f));
        Transitions.Add(TransitionStay(Pose01Montage, n"Loop01", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"Loop01", Weight = 0.65f));
        Transitions.Add(TransitionStay(Pose01Montage, n"Loop02", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Entry", n"Loop01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Entry", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"Loop02", Weight = 0.65f));
        Transitions.Add(TransitionStay(Pose02Montage, n"Loop01", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"Loop01", Weight = 0.65f));
        Transitions.Add(TransitionStay(Pose02Montage, n"Loop02", Weight = 0.25f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Pray : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Pray);

    UPROPERTY() TSoftObjectPtr<UAnimMontage> Pose01Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Pray/Man_Pray_Montage.Man_Pray_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> Pose02Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Pray/Man_Pray_Pose02_Montage.Man_Pray_Pose02_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default MainMontage = Pose01Montage;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        if(Math::RandBool())
        {
            MainMontage = Pose01Montage;
        }
        else
        {
            MainMontage = Pose02Montage;
        }

        Transitions.Add(TransitionToSection(Pose01Montage, n"Entry", n"Loop01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Entry", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop01", n"Loop02", Weight = 0.65f));
        Transitions.Add(TransitionStay(Pose01Montage, n"Loop01", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose01Montage, n"Loop02", n"Loop01", Weight = 0.65f));
        Transitions.Add(TransitionStay(Pose01Montage, n"Loop02", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Entry", n"Loop01", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Entry", n"Loop02", Weight = 0.5f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop01", n"Loop02", Weight = 0.65f));
        Transitions.Add(TransitionStay(Pose02Montage, n"Loop01", Weight = 0.25f));
        Transitions.Add(TransitionToSection(Pose02Montage, n"Loop02", n"Loop01", Weight = 0.65f));
        Transitions.Add(TransitionStay(Pose02Montage, n"Loop02", Weight = 0.25f));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Menace : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Menace);
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/OLD/Human_Menace_Montage.Human_Menace_Montage'";

    default TakeOutItemWithItemTypeFromInventory = GameplayTag::Item_Weapon_Sword;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_CutWood_Trunk : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_CutWood_OnTrunk);
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/CuttingTrunk/Man_CuttingTrunk_Montage.Man_CuttingTrunk_Montage'";

    default ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/CuttingTrunk/CuttingLog_Montage.CuttingLog_Montage'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;
    
    default AutoTransitionCheckSecondsMin = 0.0f;
    default AutoTransitionCheckSecondsMax = 3.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop01"));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Rest", Weight = 0.4f));
        //Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"CuttingLog01", Weight = 1.0f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"CuttingLog02", Weight = 1.0f));
        Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Drop", Weight = 0.2f));
        //Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Streach01", Weight = 0.35f));
        //Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Look", Weight = 0.2f));
        //Transitions.Last().bSeamless = false;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Streach02", Weight = 0.5f));
        //Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop01", Weight = 0.01f));

    }
}

UCLASS()
class UAbilityTask_Interaction_Human_CheckPouch : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_CheckPouch);
    default bPossibleAnywhere = true;

    UPROPERTY() TSoftObjectPtr<UAnimMontage> Pose01Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Reactions/SearchBag/Man_SearchBag_01_Montage.Man_SearchBag_01_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> Pose02Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Reactions/SearchBag/Man_SearchBag_02_Montage.Man_SearchBag_02_Montage'";

    default MainMontage = Pose01Montage;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        if(Math::RandBool())
        {
            MainMontage = Pose01Montage;
        }
        else
        {
            MainMontage = Pose02Montage;
        }
    }
}
///////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////IN EXTREMO CONCERT////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
UCLASS()
class UAbilityTask_Interaction_Human_InExtremo_RaiseFist : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_InExtremoConcert_RaiseFist);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/InExtremoConcert/Montages/Man_Concert_Fist_Montage.Man_Concert_Fist_Montage'";

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_InExtremo_FistPump : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_InExtremoConcert_FistPump);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/InExtremoConcert/Montages/Man_Concert_FistPump_Montage.Man_Concert_FistPump_Montage'";

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_InExtremo_Stomp : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_InExtremoConcert_Stomp);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/InExtremoConcert/Montages/Man_Concert_Stomp_Montage.Man_Concert_Stomp_Montage'";

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_InExtremo_Sway : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_InExtremoConcert_Sway);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/InExtremoConcert/Montages/Man_Concert_Sway_Montage.Man_Concert_Sway_Montage'";

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_InExtremo_HeadBang : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_InExtremoConcert_HeadBang);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/InExtremoConcert/Montages/Man_Concert_HeadBang_Montage.Man_Concert_HeadBang_Montage'";

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_InExtremo_HairWhip : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_InExtremoConcert_HairWhip);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/InExtremoConcert/Montages/Man_Concert_HairWhip_Montage.Man_Concert_HairWhip_Montage'";

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_InExtremo_Pogo : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_InExtremoConcert_Pogo);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/InExtremoConcert/Montages/Man_Concert_Pogo_Montage.Man_Concert_Pogo_Montage'";

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_InExtremo_AirGuitar02 : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_InExtremoConcert_AirGuitar02);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/InExtremoConcert/Montages/Man_Concert_AirGuitar02_Montage.Man_Concert_AirGuitar02_Montage'";

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_InExtremo_AirKick : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_InExtremoConcert_AirKick);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/InExtremoConcert/Montages/Man_Concert_AirKick_Montage.Man_Concert_AirKick_Montage'";

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_InExtremo_HeadBangIntense : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_InExtremoConcert_HeadBangIntense);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/InExtremoConcert/Montages/Man_Concert_HeadBangIntense_Montage.Man_Concert_HeadBangIntense_Montage'";

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_InExtremo_AirGuitar : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_InExtremoConcert_AirGuitar);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/InExtremoConcert/Montages/Man_Concert_AirGuitar01_Montage.Man_Concert_AirGuitar01_Montage'";

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_InExtremo_RapidHandRaise : UAbilityTask_Interaction_Human
{
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_InExtremoConcert_RapidHandRaise);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/InExtremoConcert/Montages/Man_Concert_RapidHandRaise_Montage.Man_Concert_RapidHandRaise_Montage'";

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop"));
    }
}