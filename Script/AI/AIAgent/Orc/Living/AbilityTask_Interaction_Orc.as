/** Base of all tasks involving sitting and sleeping on InteractiveObjects */
UCLASS()
class UAbilityTask_Interaction_Orc_SitAndSleep_IO : UAbilityTask_InteractionSpot_Montage
{
    default bShouldFocusInteractiveObject = false;  // dont look at InteractiveObject, because we are sitting/laying on it
    default bForceCrowdIdleBehaviourToIgnoreMe = true;  // this NPC is not avoided, has disabled collisions and wont create a DynamicNavObstacle
    
    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;
}

UCLASS()
class UAbilityTask_Interaction_Orc_Sleep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);

    UPROPERTY() TSoftObjectPtr<UAnimMontage> SleepPose01Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Sleep/OrcM_Sleep_Ground_Pose01_Montage.OrcM_Sleep_Ground_Pose01_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> SleepPose02Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Sleep/OrcM_Sleep_Ground_Pose02_Montage.OrcM_Sleep_Ground_Pose02_Montage'";


    default AutoTransitionCheckSecondsMin = 4.0f;
    default AutoTransitionCheckSecondsMax = 12.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 2.0f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        if(Math::RandBool())
        {
            MainMontage = SleepPose01Montage;
        }
        else
        {
            MainMontage = SleepPose02Montage;
        }

        //SleepPose01Montage SECTION
        Transitions.Add(TransitionToSection(SleepPose01Montage, n"Entry", n"Loop"));
        Transitions.Add(TransitionExit(SleepPose01Montage, n"Loop", n"Exit"));
        //Transitions.Last().Weight = 0.50f;
        Transitions.Last().bSeamless = false;
        

        //SitPose02Montage SECTIONG
        Transitions.Add(TransitionToSection(SleepPose02Montage, n"Entry", n"Loop"));
        Transitions.Add(TransitionExit(SleepPose02Montage, n"Loop", n"Exit"));
        //Transitions.Last().Weight = 0.50f;
        Transitions.Last().bSeamless = false;

    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_GuardPassage : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_GuardPassage);

    default bPossibleAnywhere = true;

    UPROPERTY() TSoftObjectPtr<UAnimMontage> GuardMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Idles/GuardIdle/OrcM_Guard_Montage.OrcM_Guard_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> Guard02Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Idles/GuardIdle_Pose02/OrcM_Guard_Pose02_Montage.OrcM_Guard_Pose02_Montage'";

    default TakeOutItemWithItemTypeFromInventory = GameplayTag::Item_Weapon_Axe_TwoHand;

    default bPutAwayItemInHandsAfterInteraction = true;

    default AutoTransitionCheckSecondsMin = 4.0f;
    default AutoTransitionCheckSecondsMax = 8.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        if(Math::RandBool())
        {
            MainMontage = GuardMontage;
        }
        else
        {
            MainMontage = Guard02Montage;
        }

        //Guard
        Transitions.Add(TransitionToSection(GuardMontage, FromSection = n"Entry", ToSection = n"Loop"));

        Transitions.Add(TransitionToSection(GuardMontage, FromSection = n"Loop", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.7f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(GuardMontage, FromSection = n"Loop", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(GuardMontage, FromSection = n"Loop", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.6f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(GuardMontage, FromSection = n"Loop", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(GuardMontage, FromSection = n"Loop", ToSection = n"Breaker06"));
        Transitions.Last().Weight = 0.55f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(GuardMontage, FromSection = n"Loop", ToSection = n"Breaker07"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(GuardMontage, FromSection = n"Loop", ToSection = n"Breaker08"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(GuardMontage, FromSection = n"Loop", ToSection = n"Breaker09"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(GuardMontage, FromSection = n"Loop", ToSection = n"Breaker10"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(GuardMontage, FromSection = n"Loop", ToSection = n"Breaker11"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(GuardMontage, FromSection = n"Loop", ToSection = n"Breaker12"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(GuardMontage, FromSection = n"Loop", ToSection = n"Breaker13"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(GuardMontage, FromSection = n"Loop", ToSection = n"Breaker14"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(GuardMontage, FromSection = n"Loop", ToSection = n"Breaker15"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(GuardMontage, n"Loop"));
        Transitions.Last().Weight = 0.2f;

        //Guard02
        Transitions.Add(TransitionToSection(Guard02Montage, FromSection = n"Entry", ToSection = n"Loop"));

        Transitions.Add(TransitionToSection(Guard02Montage, FromSection = n"Loop", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(Guard02Montage, FromSection = n"Loop", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(Guard02Montage, FromSection = n"Loop", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(Guard02Montage, FromSection = n"Loop", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(Guard02Montage, n"Loop"));
        Transitions.Last().Weight = 0.1f;
    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_GuardWatch : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_GuardWatch);

    default bPossibleAnywhere = true;

    UPROPERTY() TSoftObjectPtr<UAnimMontage> GuardMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Idles/GuardIdle/OrcM_Guard_Montage.OrcM_Guard_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> Guard02Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Idles/GuardIdle_Pose02/OrcM_Guard_Pose02_Montage.OrcM_Guard_Pose02_Montage'";

    default TakeOutItemWithItemTypeFromInventory = GameplayTag::Item_Weapon_Axe_TwoHand;

    default bPutAwayItemInHandsAfterInteraction = true;

    default AutoTransitionCheckSecondsMin = 4.0f;
    default AutoTransitionCheckSecondsMax = 8.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        if(Math::RandBool())
        {
            MainMontage = GuardMontage;
        }
        else
        {
            MainMontage = Guard02Montage;
        }

        //Guard
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.7f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.6f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker06"));
        Transitions.Last().Weight = 0.6f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker07"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker08"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker09"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker10"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker11"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker12"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker13"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker14"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker15"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop"));
        Transitions.Last().Weight = 0.2f;
        
        //Guard02
        Transitions.Add(TransitionToSection(Guard02Montage, FromSection = n"Entry", ToSection = n"Loop"));

        Transitions.Add(TransitionToSection(Guard02Montage, FromSection = n"Loop", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(Guard02Montage, FromSection = n"Loop", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(Guard02Montage, FromSection = n"Loop", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(Guard02Montage, FromSection = n"Loop", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(Guard02Montage, n"Loop"));
        Transitions.Last().Weight = 0.1f;
    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_StandAround : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_StandAround);

    UPROPERTY() TSoftObjectPtr<UAnimMontage> IdleMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Idles/IdlePose/OrcM_Idle_Montage.OrcM_Idle_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> CrossArmsMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Idles/CrossArms/OrcM_CrossArms_Montage.OrcM_CrossArms_Montage'";

    default bPossibleAnywhere = true;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        if(Math::RandBool())
        {
            MainMontage = IdleMontage;
        }
        else
        {
            MainMontage = CrossArmsMontage;
        }
        //IDLE
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Entry", ToSection = n"Idle01"));
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Entry", ToSection = n"Idle02"));
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Entry", ToSection = n"Idle03"));

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"IdleBreaker01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"IdleBreaker02"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"IdleBreaker03"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"IdleBreaker04"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"IdleBreaker05"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"IdleBreaker06"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"IdleBreaker07"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"IdleBreaker08"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"IdleBreaker09"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"IdleBreaker10"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"IdleBreaker11"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionStay(IdleMontage, n"Idle01"));
        Transitions.Last().Weight = 0.2f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"IdleBreaker01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"IdleBreaker02"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"IdleBreaker03"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"IdleBreaker04"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"IdleBreaker05"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"IdleBreaker06"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"IdleBreaker07"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"IdleBreaker08"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"IdleBreaker09"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"IdleBreaker10"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"IdleBreaker11"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionStay(IdleMontage, n"Idle02"));
        Transitions.Last().Weight = 0.2f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"IdleBreaker01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"IdleBreaker02"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"IdleBreaker03"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"IdleBreaker04"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"IdleBreaker05"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"IdleBreaker06"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"IdleBreaker07"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"IdleBreaker08"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"IdleBreaker09"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"IdleBreaker10"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"IdleBreaker11"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionStay(IdleMontage, n"Idle03"));
        Transitions.Last().Weight = 0.2f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker01", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker01", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker01", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.35f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker02", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker02", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker02", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.35f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker03", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker03", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker03", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.35f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker04", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker04", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker04", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.35f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker05", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker05", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker05", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.35f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker06", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker06", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker06", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.35f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker07", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker07", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker07", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.35f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker08", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker08", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker08", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.35f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker09", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker09", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker09", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.35f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker10", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker10", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker10", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.35f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker11", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker11", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker11", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.35f;
        //CROSSARMS
        Transitions.Add(TransitionToSection(CrossArmsMontage, FromSection = n"Entry", ToSection = n"Loop"));

        Transitions.Add(TransitionToSection(CrossArmsMontage, FromSection = n"Loop", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(CrossArmsMontage, FromSection = n"Loop", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(CrossArmsMontage, FromSection = n"Loop", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionToSection(CrossArmsMontage, FromSection = n"Loop", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().RequireCharacterHasNoneOf.AddTag(GameplayTag::State_Conversation);
        Transitions.Add(TransitionStay(CrossArmsMontage, n"Loop"));
        Transitions.Last().Weight = 0.1f;
    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_StandAroundInDialogs : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_StandAround_Conversation);

    UPROPERTY() TSoftObjectPtr<UAnimMontage> IdleMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Idles/IdlePose/OrcM_Idle_Montage.OrcM_Idle_Montage'";

    default bPossibleAnywhere = true;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {

        MainMontage = IdleMontage;
        
        //IDLE
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Entry", ToSection = n"Idle01"));
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Entry", ToSection = n"Idle02"));
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Entry", ToSection = n"Idle03"));

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"IdleBreaker01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"IdleBreaker02"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"IdleBreaker03"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"IdleBreaker04"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"IdleBreaker05"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"IdleBreaker06"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"IdleBreaker07"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"IdleBreaker08"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"IdleBreaker09"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"IdleBreaker10"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle01", ToSection = n"IdleBreaker11"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionStay(IdleMontage, n"Idle01"));
        Transitions.Last().Weight = 0.2f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"IdleBreaker01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"IdleBreaker02"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"IdleBreaker03"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"IdleBreaker04"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"IdleBreaker05"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"IdleBreaker06"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"IdleBreaker07"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"IdleBreaker08"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"IdleBreaker09"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"IdleBreaker10"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle02", ToSection = n"IdleBreaker11"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionStay(IdleMontage, n"Idle02"));
        Transitions.Last().Weight = 0.2f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"IdleBreaker01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"IdleBreaker02"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"IdleBreaker03"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"IdleBreaker04"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"IdleBreaker05"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"IdleBreaker06"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"IdleBreaker07"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"IdleBreaker08"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"IdleBreaker09"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"IdleBreaker10"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"Idle03", ToSection = n"IdleBreaker11"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionStay(IdleMontage, n"Idle03"));
        Transitions.Last().Weight = 0.2f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker01", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker01", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker01", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.35f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker02", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker02", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker02", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.35f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker03", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker03", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker03", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.35f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker04", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker04", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker04", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.35f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker05", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker05", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker05", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.35f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker06", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker06", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker06", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.35f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker07", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker07", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker07", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.35f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker08", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker08", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker08", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.35f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker09", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker09", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker09", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.35f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker10", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker10", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker10", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.35f;

        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker11", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker11", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(IdleMontage, FromSection = n"IdleBreaker11", ToSection = n"Idle03"));
        Transitions.Last().Weight = 0.35f;
    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_Sit : UAbilityTask_Interaction_Orc_SitAndSleep_IO
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Interact_Sit_Chair);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/OrcWarrior/GeneralIdles/Sleep/OrcM_Sleep_Montage.OrcM_Sleep_Montage'";

}

UCLASS()
class UAbilityTask_Interaction_Orc_Sit_Ground : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Interact_Sit_Ground);

    UPROPERTY() TSoftObjectPtr<UAnimMontage> SitPose01Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Sit/OrcM_SitGround_Montage.OrcM_SitGround_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> SitPose02Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Sit/OrcM_SitGround_Pose02_Montage.OrcM_SitGround_Pose02_Montage'";


    default AutoTransitionCheckSecondsMin = 4.0f;
    default AutoTransitionCheckSecondsMax = 12.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        if(Math::RandBool())
        {
            MainMontage = SitPose01Montage;
        }
        else
        {
            MainMontage = SitPose02Montage;
        }

        //SitPose01Montage SECTION
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Entry", n"Loop01"));
        Transitions.Last().Weight = 0.33f;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Entry", n"Loop02"));
        Transitions.Last().Weight = 0.33f;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Entry", n"Loop03"));
        Transitions.Last().Weight = 0.33f;


        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop01", n"Loop02"));
        Transitions.Last().Weight = 0.05f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop01", n"Loop03"));
        Transitions.Last().Weight = 0.05f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop01", n"Breaker01"));
        Transitions.Last().Weight = 0.65f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop01", n"Breaker02"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop01", n"Breaker03"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop01", n"Breaker04"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop01", n"Breaker05"));
        Transitions.Last().Weight = 0.65f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop01", n"Breaker07"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop01", n"Breaker08"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop01", n"Breaker09"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop01", n"Breaker10"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().bSeamless = false;
        //Transitions.Last().CooldownSeconds = 20;
        //Transitions.Last().BlockOtherTransitionsForSeconds = 30.0f;
        Transitions.Add(TransitionStay(SitPose01Montage, n"Loop01"));
        Transitions.Last().Weight = 0.1f;

        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop02", n"Loop01"));
        Transitions.Last().Weight = 0.05f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop02", n"Loop03"));
        Transitions.Last().Weight = 0.05f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop02", n"Breaker01"));
        Transitions.Last().Weight = 0.65f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop02", n"Breaker02"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop02", n"Breaker03"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop02", n"Breaker04"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop02", n"Breaker05"));
        Transitions.Last().Weight = 0.65f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop02", n"Breaker07"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop02", n"Breaker08"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop02", n"Breaker09"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop02", n"Breaker10"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().bSeamless = false;
        //Transitions.Last().CooldownSeconds = 20;
        //Transitions.Last().BlockOtherTransitionsForSeconds = 30.0f;
        Transitions.Add(TransitionStay(SitPose01Montage, n"Loop02"));
        Transitions.Last().Weight = 0.1f;

        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop03", n"Loop02"));
        Transitions.Last().Weight = 0.05f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop03", n"Loop01"));
        Transitions.Last().Weight = 0.05f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop03", n"Breaker01"));
        Transitions.Last().Weight = 0.65f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop03", n"Breaker02"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop03", n"Breaker03"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop03", n"Breaker04"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop03", n"Breaker05"));
        Transitions.Last().Weight = 0.65f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop03", n"Breaker07"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop03", n"Breaker08"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop03", n"Breaker09"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Loop03", n"Breaker10"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().bSeamless = false;
        //Transitions.Last().CooldownSeconds = 20;
        //Transitions.Last().BlockOtherTransitionsForSeconds = 30.0f;
        Transitions.Add(TransitionStay(SitPose01Montage, n"Loop03"));
        Transitions.Last().Weight = 0.1f;

        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker01", n"Loop01"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker01", n"Loop02"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker01", n"Loop03"));
        Transitions.Last().Weight = 0.45f;

        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker02", n"Loop01"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker02", n"Loop02"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker02", n"Loop03"));
        Transitions.Last().Weight = 0.45f;

        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker03", n"Loop01"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker03", n"Loop02"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker03", n"Loop03"));
        Transitions.Last().Weight = 0.45f;

        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker04", n"Loop01"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker04", n"Loop02"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker04", n"Loop03"));
        Transitions.Last().Weight = 0.45f;

        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker05", n"Loop01"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker05", n"Loop02"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker05", n"Loop03"));
        Transitions.Last().Weight = 0.45f;

        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker07", n"Loop01"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker07", n"Loop02"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker07", n"Loop03"));
        Transitions.Last().Weight = 0.45f;

        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker08", n"Loop01"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker08", n"Loop02"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker08", n"Loop03"));
        Transitions.Last().Weight = 0.45f;

        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker09", n"Loop01"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker09", n"Loop02"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker09", n"Loop03"));
        Transitions.Last().Weight = 0.45f;

        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker10", n"Loop01"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker10", n"Loop02"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Add(TransitionToSection(SitPose01Montage, n"Breaker10", n"Loop03"));
        Transitions.Last().Weight = 0.45f;

        //SitPose02Montage SECTION
        Transitions.Add(TransitionToSection(SitPose02Montage, n"Entry", n"Loop01"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(SitPose02Montage, n"Entry", n"Loop02"));
        Transitions.Last().Weight = 0.5f;
        


        Transitions.Add(TransitionToSection(SitPose02Montage, n"Loop01", n"Loop02"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(SitPose02Montage, n"Loop01"));
        Transitions.Last().Weight = 0.3f;

        Transitions.Add(TransitionToSection(SitPose02Montage, n"Loop02", n"Loop01"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(SitPose02Montage, n"Loop02"));
        Transitions.Last().Weight = 0.3f;

    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_Sit_Eat : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat_Ground);
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Ground);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Sit/SitGround_EatMeat/OrcM_SitGround_Eat_Meat_Montage.OrcM_SitGround_Eat_Meat_Montage'";

    default AutoTransitionCheckSecondsMin = 4.0f;
    default AutoTransitionCheckSecondsMax = 12.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {

        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop01"));
        Transitions.Last().Weight = 0.33f;
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop02"));
        Transitions.Last().Weight = 0.33f;
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop03"));
        Transitions.Last().Weight = 0.33f;


        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop02"));
        Transitions.Last().Weight = 0.05f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop03"));
        Transitions.Last().Weight = 0.05f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker01"));
        Transitions.Last().Weight = 0.65f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker02"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker03"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker04"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker05"));
        Transitions.Last().Weight = 0.65f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker06"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker07"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop01"));
        Transitions.Last().Weight = 0.1f;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop01"));
        Transitions.Last().Weight = 0.05f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop03"));
        Transitions.Last().Weight = 0.05f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker01"));
        Transitions.Last().Weight = 0.65f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker02"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker03"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker04"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker05"));
        Transitions.Last().Weight = 0.65f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker06"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker07"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop02"));
        Transitions.Last().Weight = 0.1f;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop02"));
        Transitions.Last().Weight = 0.05f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop01"));
        Transitions.Last().Weight = 0.05f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Breaker01"));
        Transitions.Last().Weight = 0.65f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Breaker02"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Breaker03"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Breaker04"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Breaker05"));
        Transitions.Last().Weight = 0.65f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Breaker06"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Breaker07"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop03"));
        Transitions.Last().Weight = 0.1f;

        Transitions.Add(TransitionToSection(MainMontage, n"Breaker01", n"Loop01"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker01", n"Loop02"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker01", n"Loop03"));
        Transitions.Last().Weight = 0.45f;

        Transitions.Add(TransitionToSection(MainMontage, n"Breaker02", n"Loop01"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker02", n"Loop02"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker02", n"Loop03"));
        Transitions.Last().Weight = 0.45f;

        Transitions.Add(TransitionToSection(MainMontage, n"Breaker03", n"Loop01"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker03", n"Loop02"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker03", n"Loop03"));
        Transitions.Last().Weight = 0.45f;

        Transitions.Add(TransitionToSection(MainMontage, n"Breaker04", n"Loop01"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker04", n"Loop02"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker04", n"Loop03"));
        Transitions.Last().Weight = 0.45f;

        Transitions.Add(TransitionToSection(MainMontage, n"Breaker05", n"Loop01"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker05", n"Loop02"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker05", n"Loop03"));
        Transitions.Last().Weight = 0.45f;

        Transitions.Add(TransitionToSection(MainMontage, n"Breaker06", n"Loop01"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker06", n"Loop02"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker06", n"Loop03"));
        Transitions.Last().Weight = 0.45f;

        Transitions.Add(TransitionToSection(MainMontage, n"Breaker07", n"Loop01"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker07", n"Loop02"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker07", n"Loop03"));
        Transitions.Last().Weight = 0.45f;
    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_Sit_Drink : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Drink_Ground);
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Ground);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Sit/SitGround_Drink/OrcM_SitGround_Drink_Montage.OrcM_SitGround_Drink_Montage'";

    default AutoTransitionCheckSecondsMin = 4.0f;
    default AutoTransitionCheckSecondsMax = 12.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {

        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop01"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop02"));
        Transitions.Last().Weight = 0.5f;


        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop02"));
        Transitions.Last().Weight = 0.05f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker01"));
        Transitions.Last().Weight = 0.65f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker02"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker03"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker04"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker05"));
        Transitions.Last().Weight = 0.65f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker06"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker07"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker08"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop01"));
        Transitions.Last().Weight = 0.1f;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop01"));
        Transitions.Last().Weight = 0.05f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker01"));
        Transitions.Last().Weight = 0.65f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker02"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker03"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker04"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker05"));
        Transitions.Last().Weight = 0.65f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker06"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker07"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker08"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop02"));
        Transitions.Last().Weight = 0.1f;

        Transitions.Add(TransitionToSection(MainMontage, n"Breaker01", n"Loop01"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker01", n"Loop02"));
        Transitions.Last().Weight = 0.7f;

        Transitions.Add(TransitionToSection(MainMontage, n"Breaker02", n"Loop01"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker02", n"Loop02"));
        Transitions.Last().Weight = 0.7f;

        Transitions.Add(TransitionToSection(MainMontage, n"Breaker03", n"Loop01"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker03", n"Loop02"));
        Transitions.Last().Weight = 0.7f;

        Transitions.Add(TransitionToSection(MainMontage, n"Breaker04", n"Loop01"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker04", n"Loop02"));
        Transitions.Last().Weight = 0.7f;

        Transitions.Add(TransitionToSection(MainMontage, n"Breaker05", n"Loop01"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker05", n"Loop02"));
        Transitions.Last().Weight = 0.7f;

        Transitions.Add(TransitionToSection(MainMontage, n"Breaker06", n"Loop01"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker06", n"Loop02"));
        Transitions.Last().Weight = 0.7f;

        Transitions.Add(TransitionToSection(MainMontage, n"Breaker07", n"Loop01"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker07", n"Loop02"));
        Transitions.Last().Weight = 0.7f;

        Transitions.Add(TransitionToSection(MainMontage, n"Breaker08", n"Loop01"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker08", n"Loop02"));
        Transitions.Last().Weight = 0.7f;
    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_SmallTalk : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Smalltalk);

    default AutoTransitionCheckSecondsMin = 3.0f;
    default AutoTransitionCheckSecondsMax = 8.0f;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Dialog/Gestures/Idle/Orc_SmallTalk_Montage.Orc_SmallTalk_Montage'";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker01", Weight = 0.05f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker02", Weight = 0.05f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker03", Weight = 0.05f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker04", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker05", Weight = 0.1f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker06", Weight = 0.15f));
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker07", Weight = 0.3f));
        Transitions.Last().bSeamless = false;
    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_Pray : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Pray);

    default AutoTransitionCheckSecondsMin = 8.0f;
    default AutoTransitionCheckSecondsMax = 20.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;


    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Pray/OrcM_Pray_Montage.OrcM_Pray_Montage'";

     UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.5f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle01", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 10.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle01", ToSection = n"Rest01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle01", ToSection = n"Rest02"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionStay(MainMontage, n"Idle01"));
        Transitions.Last().Weight = 0.4f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle02", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 10.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle02", ToSection = n"Rest01"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle02", ToSection = n"Rest02"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Add(TransitionStay(MainMontage, n"Idle02"));
        Transitions.Last().Weight = 0.4f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Rest01", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 10.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Rest01", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.55f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 10.0f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Rest02", ToSection = n"Idle01"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 10.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Rest02", ToSection = n"Idle02"));
        Transitions.Last().Weight = 0.55f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 10.0f;
    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_Eat_Seated : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat_Seated);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/OrcWarrior/GeneralIdles/Sleep/OrcM_Sleep_Montage.OrcM_Sleep_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Orc_Eat : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Eat/EatMeat/OrcM_Eat_Meat_Montage.OrcM_Eat_Meat_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 5.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.3f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker06"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker07"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.23f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker06"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker07"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop02"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Breaker06"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Breaker07"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop03"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker01", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker01", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker01", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.4f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker02", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker02", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker02", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.4f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker03", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker03", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker03", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.4f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker04", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker04", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker04", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.4f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker05", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker05", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker05", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.4f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker06", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker06", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker06", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.4f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker07", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker07", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker07", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.4f;
    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_EatBowl : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat_Bowl);

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Eat/EatBowl/OrcM_Eat_Bowl_Montage.OrcM_Eat_Bowl_Montage'";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.3f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker06"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker07"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker08"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker09"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop01"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.23f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker06"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker07"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker08"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker09"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop02"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 25.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Breaker06"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Breaker07"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Breaker08"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Breaker09",));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop03"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker01", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker01", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker01", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.4f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker02", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker02", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker02", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.4f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker03", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker03", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker03", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.4f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker04", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker04", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker04", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.4f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker05", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker05", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker05", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.4f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker06", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker06", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker06", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.4f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker07", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker07", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker07", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.4f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker08", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker08", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker08", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.4f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker09", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker09", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker09", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.4f;
    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_Drink : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Drink);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Drink/OrcM_Drink_Montage.OrcM_Drink_Montage'";

    default AutoTransitionCheckSecondsMin = 3.0f;
    default AutoTransitionCheckSecondsMax = 5.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 8.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 8.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 8.0f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 10.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 10.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 10.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker06"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker07"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 10.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 10.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 10.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.23f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker06"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker07"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop02"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 10.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 10.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().CooldownSeconds = 10.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Breaker06"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop03", ToSection = n"Breaker07"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop03"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker01", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker01", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker01", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.4f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker02", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker02", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker02", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.4f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker03", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker03", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker03", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.4f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker04", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker04", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker04", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.4f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker05", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker05", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker05", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.4f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker06", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker06", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker06", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.4f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker07", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker07", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker07", ToSection = n"Loop03"));
        Transitions.Last().Weight = 0.4f;
    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_PlayDrum : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_PlayDrum);

    default AutoTransitionCheckSecondsMin = 8.0f;
    default AutoTransitionCheckSecondsMax = 20.0f;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Drum/OrcM_Drum_Montage.OrcM_Drum_Montage'";
    default ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Drum/Orc_Drum_Montage.Orc_Drum_Montage'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default QuickExitMode = EInteractionFastExitMode::PlayExitAnimation;


    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 15.0f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker06"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker06"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop02"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker01", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker01", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 15.0f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker02", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker02", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 15.0f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker03", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker03", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 15.0f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker04", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker04", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 15.0f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker05", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker05", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 15.0f;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker06", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 15.0f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Breaker06", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 15.0f;

        
    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_Dance : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Dance);

    UPROPERTY() TSoftObjectPtr<UAnimMontage> DancePose01Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Dance/Dance_01_AnimMontage.Dance_01_AnimMontage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> DnacePose02Montage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Dance/Dance_02_AnimMontage.Dance_02_AnimMontage'";


    default AutoTransitionCheckSecondsMin = 4.0f;
    default AutoTransitionCheckSecondsMax = 12.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        if(Math::RandBool())
        {
            MainMontage = DancePose01Montage;
        }
        else
        {
            MainMontage = DnacePose02Montage;
        }

        // Dance01
        Transitions.Add(TransitionToSection(DancePose01Montage, n"Entry", n"Loop"));

        Transitions.Add(TransitionExit(DancePose01Montage, n"Loop", n"Exit"));
        Transitions.Last().Weight = 0.50f;
        Transitions.Last().bSeamless = false;
        
        // Dance02
        Transitions.Add(TransitionToSection(DnacePose02Montage, n"Entry", n"Loop"));

        Transitions.Add(TransitionExit(DnacePose02Montage, n"Loop", n"Exit"));
        Transitions.Last().Weight = 0.50f;
        Transitions.Last().bSeamless = false;

    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_SmithSharp : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Crafting_OrcWhetstone);

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default MainMontage = SharpMontage;
    default ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Crafting/Forge/Whetstone/OrcWhetstone_Montage.OrcWhetstone_Montage'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;


    UPROPERTY() TSoftObjectPtr<UAnimMontage> SharpMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Crafting/Forge/Whetstone/OrcM_Whetstone_Montage.OrcM_Whetstone_Montage'";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        //Entry
        Transitions.Add(TransitionToSection(SharpMontage, FromSection = n"Entry", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(SharpMontage, FromSection = n"Entry", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.5f;

        //LOOP01
        Transitions.Add(TransitionToSection(SharpMontage, FromSection = n"Loop01", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.5f;

        Transitions.Add(TransitionToSection(SharpMontage, FromSection = n"Loop01", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.6f;

        Transitions.Add(TransitionToSection(SharpMontage, FromSection = n"Loop01", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.45f;

        Transitions.Add(TransitionToSection(SharpMontage, FromSection = n"Loop01", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.3f;

        Transitions.Add(TransitionToSection(SharpMontage, FromSection = n"Loop01", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.25f;

        Transitions.Add(TransitionStay(SharpMontage, n"Loop01"));
        Transitions.Last().Weight = 0.15f;

        //LOOP02
        Transitions.Add(TransitionToSection(SharpMontage, FromSection = n"Loop02", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.5f;

        Transitions.Add(TransitionToSection(SharpMontage, FromSection = n"Loop02", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.6f;

        Transitions.Add(TransitionToSection(SharpMontage, FromSection = n"Loop02", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.45f;

        Transitions.Add(TransitionToSection(SharpMontage, FromSection = n"Loop02", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.3f;

        Transitions.Add(TransitionToSection(SharpMontage, FromSection = n"Loop02", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.25f;

        Transitions.Add(TransitionStay(SharpMontage, n"Loop02"));
        Transitions.Last().Weight = 0.15f;
    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_SmithAnvil : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Crafting_Anvil);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Crafting/Forge/Anvil/OrcM_Anvil_Montage.OrcM_Anvil_Montage'";

    default AutoTransitionCheckSecondsMin = 4.0f;
    default AutoTransitionCheckSecondsMax = 8.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.6f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker06"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().bSeamless = false;
        
    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_SmithFire : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Crafting_OrcForge);

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default MainMontage = ForgeMontage;
    default ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Crafting/Forge/Forge/OrcForge_Montage.OrcForge_Montage'";

    UPROPERTY() TSoftObjectPtr<UAnimMontage> ForgeMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Crafting/Forge/Forge/OrcM_Forge_Montage.OrcM_Forge_Montage'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        //LOOP01
        Transitions.Add(TransitionToSection(ForgeMontage, FromSection = n"Entry", ToSection = n"Loop01"));

        Transitions.Add(TransitionToSection(ForgeMontage, FromSection = n"Loop01", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(ForgeMontage, FromSection = n"Loop01", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.6f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(ForgeMontage, FromSection = n"Loop01", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(ForgeMontage, FromSection = n"Loop01", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(ForgeMontage, FromSection = n"Loop01", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(ForgeMontage, FromSection = n"Loop01", ToSection = n"Breaker06"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionStay(ForgeMontage, n"Loop01"));
        Transitions.Last().Weight = 0.15f;

    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_SmithWater : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Crafting_Barrel);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/OrcWarrior/Living/OrcM_Forge_Montage.OrcM_Forge_Montage'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;
}

UCLASS()
class UAbilityTask_Interaction_Orc_SmithWorkBench : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Crafting_Workbench);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Crafting/Forge/Workbench/OrcM_CraftUlumulu_Montage.OrcM_CraftUlumulu_Montage'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        //LOOP
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_SmashFood : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_SmashFood);

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/FoodSmasher/FoodSmasherMontage.FoodSmasherMontage'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        //LOOP01
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01"));

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.6f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker06"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        
        Transitions.Add(TransitionStay(MainMontage, n"Loop01"));
        Transitions.Last().Weight = 0.15f;

    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_SmashFood_Standing : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_SmashFood_Standing);

    default AutoTransitionCheckSecondsMin = 10.0f;
    default AutoTransitionCheckSecondsMax = 30.0f;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/StandingSmasher/OrcM_StandingSmasher_Montage.OrcM_StandingSmasher_Montage'";
    default ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/StandingSmasher/OrcChurnBase_StandingSmasher_Montage.OrcChurnBase_StandingSmasher_Montage'";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        //LOOP01
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01"));

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.6f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker06"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker07"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);
        
        Transitions.Add(TransitionStay(MainMontage, n"Loop01"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 15.0f;

    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_Handicraft : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Handicraft);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/OrcWarrior/Living/OrcM_Handicraft_Montage.OrcM_Handicraft_Montage'";

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;
}

UCLASS()
class UAbilityTask_Interaction_Orc_LeatherWorking : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Leatherworking);

    default AutoTransitionCheckSecondsMin = 10.0f;
    default AutoTransitionCheckSecondsMax = 15.0f;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Tanning/OrcM_Tanning_Montage.OrcM_Tanning_Montage'";
    
    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        //LOOP01
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.6f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        
        Transitions.Add(TransitionStay(MainMontage, n"Loop"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 7.0f;

    }
    
}

UCLASS()
class UAbilityTask_Interaction_Orc_PotionAlchemy : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_PotionAlchemy);

    default AutoTransitionCheckSecondsMin = 10.0f;
    default AutoTransitionCheckSecondsMax = 15.0f;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Crafting/Alchemy/OrcM_Alchemy_Montage.OrcM_Alchemy_Montage'";
    default ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Crafting/Alchemy/A_Shaman_Alchemy_Montage.A_Shaman_Alchemy_Montage'";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.45f;

        //LOOP01
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.6f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker06"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker07"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);
        
        Transitions.Add(TransitionStay(MainMontage, n"Loop01"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 15.0f;

        //LOOP02
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.6f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker06"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker07"));
        Transitions.Last().Weight = 0.25f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);
        
        Transitions.Add(TransitionStay(MainMontage, n"Loop02"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 15.0f;

    }
    
}

UCLASS()
class UAbilityTask_Interaction_OrcF_PotionAlchemy : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_PotionAlchemyFemale);

    default AutoTransitionCheckSecondsMin = 10.0f;
    default AutoTransitionCheckSecondsMax = 15.0f;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Crafting/Alchemy/OrcM_Alchemy_Montage.OrcM_Alchemy_Montage'";
    default ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Crafting/Alchemy/A_Shaman_Alchemy_Montage.A_Shaman_Alchemy_Montage'";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop02"));
        Transitions.Last().Weight = 0.45f;

        //LOOP01
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.6f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker06"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f); 
        Transitions.Add(TransitionStay(MainMontage, n"Loop01"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 15.0f;

        //LOOP02
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.6f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop02", ToSection = n"Breaker06"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);
        Transitions.Add(TransitionStay(MainMontage, n"Loop02"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 15.0f;

    }
    
}

UCLASS()
class UAbilityTask_Interaction_Orc_Butcher : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Crafting_Cook);

    default AutoTransitionCheckSecondsMin = 10.0f;
    default AutoTransitionCheckSecondsMax = 15.0f;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Butcher/OrcM_Butcher_Montage.OrcM_Butcher_Montage'";
    default ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Butcher/OrcButcher_Montage.OrcButcher_Montage'";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01"));
        //LOOP01
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.6f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker06"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().bSeamless = false;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);
        
        Transitions.Add(TransitionStay(MainMontage, n"Loop01"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().BlockOtherTransitionsForSeconds = 15.0f;

    }
    
}

UCLASS()
class UAbilityTask_Interaction_Orc_PracticeAxe : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Practice1HSword);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Training/OrcM_Training_Montage.OrcM_Training_Montage'";

    default AutoTransitionCheckSecondsMin = 0.0f;
    default AutoTransitionCheckSecondsMax = 1.0f;

    default TakeOutItemWithItemTypeFromInventory = GameplayTag::Item_Weapon_Axe_TwoHand;

    default bPutAwayItemInHandsAfterInteraction = true;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop01"));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker01"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker02"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker03"));
        Transitions.Last().Weight = 0.1f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker04"));
        Transitions.Last().Weight = 0.35f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker05"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker06"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().bSeamless = false;
    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_Feeding : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_SowRice);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Feeding/OrcM_Feeding_Montage.OrcM_Feeding_Montage'";


    default AutoTransitionCheckSecondsMin = 8.0f;
    default AutoTransitionCheckSecondsMax = 16.0f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {

        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop01"));
        Transitions.Last().Weight = 0.33f;
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop02"));
        Transitions.Last().Weight = 0.33f;
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop03"));
        Transitions.Last().Weight = 0.33f;


        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop02"));
        Transitions.Last().Weight = 0.05f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Loop03"));
        Transitions.Last().Weight = 0.05f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker01"));
        Transitions.Last().Weight = 0.65f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker02"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker03"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker04"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker05"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker06"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker07"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        //Transitions.Last().CooldownSeconds = 20;
        //Transitions.Last().BlockOtherTransitionsForSeconds = 30.0f;
        Transitions.Add(TransitionStay(MainMontage, n"Loop01"));
        Transitions.Last().Weight = 0.1f;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop01"));
        Transitions.Last().Weight = 0.05f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Loop03"));
        Transitions.Last().Weight = 0.05f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker01"));
        Transitions.Last().Weight = 0.65f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker02"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker03"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker04"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker05"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker06"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop02", n"Breaker07"));
        Transitions.Last().Weight = 0.4f;
        //Transitions.Last().CooldownSeconds = 20;
        //Transitions.Last().BlockOtherTransitionsForSeconds = 30.0f;
        Transitions.Add(TransitionStay(MainMontage, n"Loop02"));
        Transitions.Last().Weight = 0.1f;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop02"));
        Transitions.Last().Weight = 0.05f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Loop01"));
        Transitions.Last().Weight = 0.05f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Breaker01"));
        Transitions.Last().Weight = 0.65f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Breaker02"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Breaker03"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Breaker04"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Breaker05"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Breaker06"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop03", n"Breaker07"));
        Transitions.Last().Weight = 0.4f;
        //Transitions.Last().CooldownSeconds = 20;
        //Transitions.Last().BlockOtherTransitionsForSeconds = 30.0f;
        Transitions.Add(TransitionStay(MainMontage, n"Loop03"));
        Transitions.Last().Weight = 0.1f;

        Transitions.Add(TransitionToSection(MainMontage, n"Breaker01", n"Loop01"));
        Transitions.Last().Weight = 0.33f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker01", n"Loop02"));
        Transitions.Last().Weight = 0.33f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker01", n"Loop03"));
        Transitions.Last().Weight = 0.33f;

        Transitions.Add(TransitionToSection(MainMontage, n"Breaker02", n"Loop01"));
        Transitions.Last().Weight = 0.33f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker02", n"Loop02"));
        Transitions.Last().Weight = 0.33f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker02", n"Loop03"));
        Transitions.Last().Weight = 0.33f;

        Transitions.Add(TransitionToSection(MainMontage, n"Breaker03", n"Loop01"));
        Transitions.Last().Weight = 0.33f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker03", n"Loop02"));
        Transitions.Last().Weight = 0.33f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker03", n"Loop03"));
        Transitions.Last().Weight = 0.33f;

        Transitions.Add(TransitionToSection(MainMontage, n"Breaker04", n"Loop01"));
        Transitions.Last().Weight = 0.33f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker04", n"Loop02"));
        Transitions.Last().Weight = 0.33f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker04", n"Loop03"));
        Transitions.Last().Weight = 0.33f;

        Transitions.Add(TransitionToSection(MainMontage, n"Breaker05", n"Loop01"));
        Transitions.Last().Weight = 0.33f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker05", n"Loop02"));
        Transitions.Last().Weight = 0.33f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker05", n"Loop03"));
        Transitions.Last().Weight = 0.33f;

        Transitions.Add(TransitionToSection(MainMontage, n"Breaker06", n"Loop01"));
        Transitions.Last().Weight = 0.33f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker06", n"Loop02"));
        Transitions.Last().Weight = 0.33f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker06", n"Loop03"));
        Transitions.Last().Weight = 0.33f;

        Transitions.Add(TransitionToSection(MainMontage, n"Breaker07", n"Loop01"));
        Transitions.Last().Weight = 0.33f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker07", n"Loop02"));
        Transitions.Last().Weight = 0.33f;
        Transitions.Add(TransitionToSection(MainMontage, n"Breaker07", n"Loop03"));
        Transitions.Last().Weight = 0.33f;
    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_Cheering : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_ArenaSpectator);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Cheering/OrcM_Cheering_Montage.OrcM_Cheering_Montage'";


    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 8.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Entry", n"Loop01"));

        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker01"));
        Transitions.Last().Weight = 0.65f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker02"));
        Transitions.Last().Weight = 0.3f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker03"));
        Transitions.Last().Weight = 0.45f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker04"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker05"));
        Transitions.Last().Weight = 0.15f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker06"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop01", n"Breaker07"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().bSeamless = false;
        //Transitions.Last().CooldownSeconds = 20;
        //Transitions.Last().BlockOtherTransitionsForSeconds = 30.0f;
        Transitions.Add(TransitionStay(MainMontage, n"Loop01"));
        Transitions.Last().Weight = 0.1f;
    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_WarmHands : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Campfire);

    default AutoTransitionCheckSecondsMin = 8.0f;
    default AutoTransitionCheckSecondsMax = 20.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/WarmHandes/OrcM_WarmHands_Montage.OrcM_WarmHands_Montage'";

     UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop01"));

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.8f;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.7f;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.6f;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop01", ToSection = n"Breaker06"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);
        
        Transitions.Add(TransitionStay(MainMontage, n"Loop01"));
        Transitions.Last().Weight = 0.25f;

    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_Sit_WarmHands : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Campfire_Ground);
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Ground);

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Sit/SitGround_WarmHands/OrcM_SitGround_WarmHands_Montage.OrcM_SitGround_WarmHands_Montage'";

    default AutoTransitionCheckSecondsMin = 4.0f;
    default AutoTransitionCheckSecondsMax = 12.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Idle01"));
        
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle01", ToSection = n"Breaker01"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle01", ToSection = n"Breaker02"));
        Transitions.Last().Weight = 0.8f;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle01", ToSection = n"Breaker03"));
        Transitions.Last().Weight = 0.7f;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle01", ToSection = n"Breaker04"));
        Transitions.Last().Weight = 0.6f;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle01", ToSection = n"Breaker05"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Idle01", ToSection = n"Breaker06"));
        Transitions.Last().Weight = 0.4f;
        Transitions.Last().BlockOtherTransitionsForSeconds = Math::RandRange(5.0f, 10.0f);
        
        Transitions.Add(TransitionStay(MainMontage, n"Idle01"));
        Transitions.Last().Weight = 0.25f;
    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_Trance : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Trance);

    UPROPERTY() TSoftObjectPtr<UAnimMontage> Trance01 (n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Trance/Pose01/OrcM_Trance_Pose01_Montage.OrcM_Trance_Pose01_Montage'");
    UPROPERTY() TSoftObjectPtr<UAnimMontage> Trance02 (n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Trance/Pose02/OrcM_Trance_Pose02_Montage.OrcM_Trance_Pose02_Montage'");
    UPROPERTY() TSoftObjectPtr<UAnimMontage> Trance03 (n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Trance/Pose03/OrcM_Trance_Pose03_Montage.OrcM_Trance_Pose03_Montage'");
    UPROPERTY() TSoftObjectPtr<UAnimMontage> Trance04 (n"AnimMontage'/Game/AnimLibrary/Humanoid/Orcs/Male/Living/Trance/Pose04/OrcM_Trance_Pose04_Montage.OrcM_Trance_Pose04_Montage'");

    default AutoTransitionCheckSecondsMin = 4.0f;
    default AutoTransitionCheckSecondsMax = 12.0f;

    default bAllowInterruptLoopOnCancel = true;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        int randomNumber = Math::RandRange(0,3);
        if( randomNumber == 0)
        {
            MainMontage = Trance01;
        }
        else if(randomNumber == 1)
        {
            MainMontage = Trance02;
        }
        else if(randomNumber == 2)
        {
            MainMontage = Trance03;
        }
        else if(randomNumber == 3)
        {
            MainMontage = Trance04;
        }     
        Transitions.Add(TransitionToSection(Trance01, FromSection = n"Entry", ToSection = n"Loop"));
        Transitions.Add(TransitionToSection(Trance02, FromSection = n"Entry", ToSection = n"Loop"));
        Transitions.Add(TransitionToSection(Trance03, FromSection = n"Entry", ToSection = n"Loop"));
        Transitions.Add(TransitionToSection(Trance04, FromSection = n"Entry", ToSection = n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_GrindingOre : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_GrindOre);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Machines/GrindingMill/A_Orc_GrindingMill/Orc_GrindingMIll_Montage.Orc_GrindingMIll_Montage'";
    default ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Machines/GrindingMill/A_Orc_GrindingMill/GrindingMill_Montage.GrindingMill_Montage'";

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 6.0f;

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop"));

        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Idlebreaker_01"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Loop", ToSection = n"Idlebreaker_02"));
        Transitions.Last().Weight = 0.5f;
        Transitions.Last().bSeamless = false;
        Transitions.Add(TransitionStay(MainMontage, n"Loop"));
        Transitions.Last().Weight = 0.05f;
    }
}

UCLASS()
class UAbilityTask_Interaction_Orc_GrindingMachine : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrc::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_TurnWheel);

    default bAllowInterruptLoopOnCancel = true;
    default QuickExitAnimationRate = 1.5f;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Machines/Grinding_Machine/Orc_TurnLever_Montage.Orc_TurnLever_Montage'";
    default ObjectMontage = n"AnimMontage'/Game/AnimLibrary/Machines/Grinding_Machine/Machine_GrindingMachine_TurnLever_Montage.Machine_GrindingMachine_TurnLever_Montage'";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, FromSection = n"Entry", ToSection = n"Loop"));
    }
}