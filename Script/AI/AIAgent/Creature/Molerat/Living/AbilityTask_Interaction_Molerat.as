UCLASS()
class UAbilityTask_Interaction_Molerat_Eat : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AMolerat::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/GeneralIdles/Eat/Molerat_Eat_Montage.Molerat_Eat_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Molerat_Sleep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AMolerat::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/GeneralIdles/Sleep/Molerat_Sleep_Montage.Molerat_Sleep_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Molerat_Drink : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AMolerat::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Drink);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Actions/Molerat_Drink_Montage.Molerat_Drink_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Molerat_Pee : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AMolerat::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Pee);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Actions/Molerat_Pee_Montage.Molerat_Pee_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Molerat_Dig : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AMolerat::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Dig);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Actions/DigGround/Molerat_DigGround_Montage.Molerat_DigGround_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Molerat_Lay : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AMolerat::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Lay);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;
    
    default AutoTransitionCheckSecondsMin = 2.0f;
    default AutoTransitionCheckSecondsMax = 4.0f;

    UPROPERTY() TSoftObjectPtr<UAnimMontage> LayMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/GeneralIdles/Lay/Molerat_Lay_Montage.Molerat_Lay_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> ScratchMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Actions/Molerat_ScratchEar_Montage.Molerat_ScratchEar_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> ShakingMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Actions/Molerat_Shake_Montage.Molerat_Shake_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> RoarMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Actions/Molerat_ScratchEar_Montage.Molerat_ScratchEar_Montage'";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        MainMontage = LayMontage;

        //End Lay
        Transitions.Add(TransitionToSection(LayMontage, n"Loop", n"Exit"));
        Transitions.Last().Probability = 0.1f;
        Transitions.Last().bSeamless = true;

        Transitions.Add(TransitionAfterMontageEnds(LayMontage,ScratchMontage));
        Transitions.Last().Weight = 0.3f;
        Transitions.Add(TransitionAfterMontageEnds(LayMontage,ShakingMontage));
        Transitions.Last().Weight = 0.2f;
        Transitions.Add(TransitionAfterMontageEnds(LayMontage,RoarMontage));
        Transitions.Last().Weight = 0.1f;

        //End Scratch
        Transitions.Add(TransitionAfterMontageEnds(ScratchMontage,LayMontage));
        Transitions.Add(TransitionAfterMontageEnds(ShakingMontage,LayMontage));
        Transitions.Add(TransitionAfterMontageEnds(RoarMontage,LayMontage));
    }
}

UCLASS()
class UAbilityTask_Interaction_Molerat_Smell : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AMolerat::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Smell);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Actions/Molerat_Smell_Montage.Molerat_Smell_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Molerat_LookAround : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AMolerat::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_LookAround);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Molerat/Actions/Molerat_LookAround_Montage.Molerat_LookAround_Montage'";
}