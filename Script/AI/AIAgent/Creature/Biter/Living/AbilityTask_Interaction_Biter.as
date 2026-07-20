
UCLASS()
class UAbilityTask_Interaction_Biter_Eat : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ABiter::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/GeneralIdles/Eat/Biter_Montage_Eat.Biter_Montage_Eat'";
}

UCLASS()
class UAbilityTask_Interaction_Biter_Sleep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ABiter::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;
    
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/GeneralIdles/Sleep/Biter_Montage_Sleep.Biter_Montage_Sleep'";
}

UCLASS()
class UAbilityTask_Interaction_Biter_Lay : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ABiter::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Lay);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;
    
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/GeneralIdles/Lay/Biter_Montage_Lay.Biter_Montage_Lay'";
}

UCLASS()
class UAbilityTask_Interaction_Biter_Dig : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ABiter::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Dig);

    default bAllowInterruptLoopOnCancel = true;

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Actions/Biter_Montage_Dig.Biter_Montage_Dig'";
}

UCLASS()
class UAbilityTask_Interaction_Biter_Roar : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ABiter::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Roar);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Actions/Biter_Montage_Roar.Biter_Montage_Roar'";
}

UCLASS()
class UAbilityTask_Interaction_Biter_Shake : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ABiter::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Shake);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Actions/Biter_Shake_Montage.Biter_Shake_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Biter_Smell : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ABiter::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Smell);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/Actions/Biter_Montage_Smell.Biter_Montage_Smell'";
}

UCLASS()
class UAbilityTask_Interaction_Biter_Stand : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ABiter::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_StandAround);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Biter/GeneralIdles/Biter_Montage_Idle.Biter_Montage_Idle'";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Sniffing"));
        Transitions.Last().Weight = 0.2f;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Shake"));
        Transitions.Last().Weight = 0.05f;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"LookingAround"));
        Transitions.Last().Weight = 0.2f;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"TailMov"));
        Transitions.Last().Weight = 0.2f;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"JawMov"));
        Transitions.Last().Weight = 0.2f;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Roar"));
        Transitions.Last().Weight = 0.2f;

        Transitions.Add(TransitionToSection(MainMontage, n"Sniffing", n"Loop"));
        Transitions.Add(TransitionToSection(MainMontage, n"Shake", n"Loop"));
        Transitions.Add(TransitionToSection(MainMontage, n"LookingAround", n"Loop"));
        Transitions.Add(TransitionToSection(MainMontage, n"TailMov", n"Loop"));
        Transitions.Add(TransitionToSection(MainMontage, n"JawMov", n"Loop"));
        Transitions.Add(TransitionToSection(MainMontage, n"Roar", n"Loop"));
    }

    default AutoTransitionCheckSecondsMin = 0.1f;
    default AutoTransitionCheckSecondsMax = 0.15f;

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;


}