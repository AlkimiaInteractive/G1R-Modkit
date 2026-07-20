UCLASS()
class UAbilityTask_Interaction_Player_SitAndSleep : UAbilityTask_InteractionSpot_Montage_Sleep
{
    // DefaultForCharacterClass should be empty; this task is only used by the sleep ability.
    //default DefaultForCharacterClass.Add(AGothicPlayerCharacter::StaticClass());

    default MontageTransitionTagSleepEntryLeft = GameplayTag::Action_Sleep_Entry_Left;
    default MontageTransitionTagSleepEntryRight = GameplayTag::Action_Sleep_Entry_Right;
    default MontageTransitionTagSleepExitLeft = GameplayTag::Action_Sleep_Exit_Left;
    default MontageTransitionTagSleepExitRight = GameplayTag::Action_Sleep_Exit_Right;

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    UFUNCTION(BlueprintOverride)
    FName GetEntrySection()
    {
        return n"Entry"; // always use the basic Entry section regardless of the spot's orientation.
    }

    void AddIdleBreakerIfSectionExists(const FName& SectionName)
    {
        UAnimMontage LocalMontage = MainMontage.Get();
        if (LocalMontage == nullptr)
            return;
        if (LocalMontage.GetSectionIndex(n"Loop") < 0)
            return;
        if (LocalMontage.GetSectionIndex(SectionName) < 0)
            return;
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", SectionName));
        Transitions.Last().bAutoTransitionForPlayer = true;
        Transitions.Last().Weight = 0.50f;
    }

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        // Idle breakers: transitions from Loop section; no special event needed for player.
        AddIdleBreakerIfSectionExists(n"IdleBreaker_01");
        AddIdleBreakerIfSectionExists(n"IdleBreaker_02");
        AddIdleBreakerIfSectionExists(n"IdleBreaker_03");
        AddIdleBreakerIfSectionExists(n"IdleBreaker_04");
        AddIdleBreakerIfSectionExists(n"IdleBreaker_05");
        AddIdleBreakerIfSectionExists(n"IdleBreaker_06");
        AddIdleBreakerIfSectionExists(n"IdleBreaker_07");

        // Manual transition from Loop to Sleep
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"EntrySleepLeft"));
        Transitions.Last().ActionTags.AddTag(MontageTransitionTagSleepEntryLeft);
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"EntrySleepRight"));
        Transitions.Last().ActionTags.AddTag(MontageTransitionTagSleepEntryRight);

        // Manual transition from Loop to Exit
        Transitions.Add(TransitionExit(MainMontage, n"Loop", n"Exit"));
        Transitions.Last().ActionTags.AddTag(GameplayTag::End_Action_Bed);

        // Manual transition from Sleep to Sit
        Transitions.Add(TransitionExit(MainMontage, n"LoopSleepLeft", n"ExitSleepLeft"));
        Transitions.Last().ActionTags.AddTag(MontageTransitionTagSleepExitLeft);
        Transitions.Add(TransitionExit(MainMontage, n"LoopSleepRight", n"ExitSleepRight"));
        Transitions.Last().ActionTags.AddTag(MontageTransitionTagSleepExitRight);
    }
}
