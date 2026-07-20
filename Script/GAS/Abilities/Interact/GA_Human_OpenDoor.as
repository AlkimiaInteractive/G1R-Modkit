class UGA_Human_OpenDoor : UGameplayAbilityDoor
{
    default m_LockpickingDoorKnobLeftMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Door/Lockpicking/A_Man_Lockpicking_DoorKnobLeft_Montage.A_Man_Lockpicking_DoorKnobLeft_Montage'";
    default m_LockpickingDoorKnobRightMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Actions/Door/Lockpicking/A_Man_Lockpicking_DoorKnobRight_Montage.A_Man_Lockpicking_DoorKnobRight_Montage'";

    default m_LockpickingInteractionTaskClass = UAbilityTask_Interaction_Player_LockpickDoor::StaticClass();
}

UCLASS()
class UAbilityTask_Interaction_Player_LockpickDoor : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AGothicPlayerCharacter::StaticClass());

    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    UFUNCTION(BlueprintOverride)
    FName GetEntrySection()
    {
        return n"Entry"; // always use the basic Entry section regardless of the spot's orientation.
    }

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        // Idle breakers: transitions from Idle/Loop section; no special event needed for player.
        Transitions.Add(TransitionToSection(MainMontage, n"Idle", n"Breaker01"));
        //Transitions.Last().Weight = 0.50f;
        Transitions.Last().TransitionKind = EInteractionInputKind::Interact;
        Transitions.Last().bAutoTransitionForPlayer = true;
        Transitions.Last().bSeamless = false;

        // Manual transition from Idle/Loop to Exit
        Transitions.Add(TransitionExit(MainMontage, n"Idle", n"Exit"));
        Transitions.Last().ActionTags.AddTag(GameplayTag::End_Action_Interact);
    }

    
}