
UCLASS()
class UAbilityTask_Interaction_Scavenger_Adult_Eat : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AScavenger_Adult::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat);

    default bAllowInterruptLoopOnCancel = true;
    // default bPossibleAnywhere = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/GeneralIdles/Eat/Scavenger_Adult_Eat_Montage.Scavenger_Adult_Eat_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Scavenger_Adult_Dig : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AScavenger_Adult::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Dig);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Actions/Scavenger_Adult_DigGround_Montage.Scavenger_Adult_DigGround_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Scavenger_Adult_Drink : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AScavenger_Adult::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Drink);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Actions/Scavenger_Adult_Drink_Montage.Scavenger_Adult_Drink_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Scavenger_Adult_Roar : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AScavenger_Adult::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Roar);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Actions/Scavenger_Adult_Roar_Montage.Scavenger_Adult_Roar_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Scavenger_Adult_ScratchEar : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AScavenger_Adult::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_ScratchEar);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Actions/Scavenger_Adult_Scratch_Montage.Scavenger_Adult_Scratch_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Scavenger_Adult_Shake : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AScavenger_Adult::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Shake);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/Actions/Scavenger_Adult_Shake_Montage.Scavenger_Adult_Shake_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Scavenger_Adult_Sleep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AScavenger_Adult::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/GeneralIdles/Sleep/Scavenger_Adult_Sleep_Montage.Scavenger_Adult_Sleep_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Scavenger_Adult_Lay : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AScavenger_Adult::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Lay);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;
    
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Adult/GeneralIdles/Lay/Scavenger_Adult_Lay_Montage.Scavenger_Adult_Lay_Montage'";

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