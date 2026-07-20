UCLASS()
class UAbilityTask_Interaction_Wolf_Sleep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AWolf::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/GeneralIdles/Sleep/Wolf_Montage_Sleep.Wolf_Montage_Sleep'";
}

UCLASS()
class UAbilityTask_Interaction_Wolf_Eat : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AWolf::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/GeneralIdles/Eat/Wolf_Montage_Eat.Wolf_Montage_Eat'";
}
/*
UCLASS()
class UAbilityTask_Interaction_Wolf_Eat_Corpse : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AWolf::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Loot);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/GeneralIdles/Eat/Wolf_Montage_Scavenging.Wolf_Montage_Scavenging'";
}*/

UCLASS()
class UAbilityTask_Interaction_Wolf_Lay : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AWolf::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Lay);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/GeneralIdles/Lay/Wolf_Montage_Lay.Wolf_Montage_Lay'";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Stroke_N"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().ActionTags.AddTag(GameplayTag::Event_GetPetted_Standing);
        Transitions.Last().bSeamless = false;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Stroke_STL"));
        Transitions.Last().Weight = 0.2f;
        Transitions.Last().ActionTags.AddTag(GameplayTag::Event_GetPetted_Crouching);
        Transitions.Last().bSeamless = false;

        
        Transitions.Add(TransitionToSection(MainMontage, n"Stroke_N", n"Loop"));
        Transitions.Add(TransitionToSection(MainMontage, n"Stroke_STL", n"Loop"));
    }
}

UCLASS()
class UAbilityTask_Interaction_Wolf_Drink : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AWolf::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Drink);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Actions/Wolf_Montage_Drink.Wolf_Montage_Drink'";
}

UCLASS()
class UAbilityTask_Interaction_Wolf_Howl : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AWolf::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Howl);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Actions/Wolf_Montage_Howl.Wolf_Montage_Howl'";
}

UCLASS()
class UAbilityTask_Interaction_Wolf_Pee_Male : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AWolf::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Pee);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Actions/Wolf_Montage_PeeMale.Wolf_Montage_PeeMale'";
}


UCLASS()
class UAbilityTask_Interaction_Wolf_ScratchEar: UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AWolf::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_ScratchEar);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Actions/Wolf_Montage_ScratchEar.Wolf_Montage_ScratchEar'";
}

UCLASS()
class UAbilityTask_Interaction_Wolf_Shake : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AWolf::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Shake);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Actions/Wolf_Shake_Montage.Wolf_Shake_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Wolf_Dig : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AWolf::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Dig);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Actions/DigGround/Wolf_DigGround_Montage.Wolf_DigGround_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Wolf_Smell : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AWolf::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Smell);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Actions/Wolf_Montage_Sniff.Wolf_Montage_Sniff'";
}

UCLASS()
class UAbilityTask_Interaction_Wolf_LookAround : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AWolf::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_LookAround);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Actions/Wolf_Montage_Sniff.Wolf_Montage_Sniff'";
}

// UCLASS()
// class UAbilityTask_Interaction_Wolf_Pee_Female : UAbilityTask_InteractionSpot_Montage
// {
//     default DefaultForCharacterClass.Add(AWolf::StaticClass());
//     default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);

//     default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/Actions/Wolf_Montage_PeeMale.Wolf_Montage_PeeMale'";
// }

UCLASS()
class UAbilityTask_Interaction_Wolf_Stand : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AWolf::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_StandAround);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Wolf/GeneralIdles/Wolf_Montage_Idle.Wolf_Montage_Idle'";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Sniffing"));
        Transitions.Last().Weight = 0.2f;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"SniffingHimself"));
        Transitions.Last().Weight = 0.1f;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"Stretching"));
        Transitions.Last().Weight = 0.05f;

        Transitions.Add(TransitionToSection(MainMontage, n"Loop", n"LookingAround"));
        Transitions.Last().Weight = 0.2f;

        Transitions.Add(TransitionToSection(MainMontage, n"Sniffing", n"Loop"));
        Transitions.Add(TransitionToSection(MainMontage, n"SniffingHimself", n"Loop"));
        Transitions.Add(TransitionToSection(MainMontage, n"LookingAround", n"Loop"));
    }

    default AutoTransitionCheckSecondsMin = 0.1f;
    default AutoTransitionCheckSecondsMax = 0.15f;

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

}