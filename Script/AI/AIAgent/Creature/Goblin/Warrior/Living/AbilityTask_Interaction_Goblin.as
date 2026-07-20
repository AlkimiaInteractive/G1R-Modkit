UCLASS()
class UAbilityTask_Interaction_Goblin_Shout : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AGoblin::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Howl);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Actions/GreenGoblin_Shout_Montage.GreenGoblin_Shout_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Goblin_Scratch : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AGoblin::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_ScratchEar);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Actions/GreenGoblin_Scratch_Montage.GreenGoblin_Scratch_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Goblin_Drink : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AGoblin::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Drink);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Actions/GreenGoblin_Drink_Montage.GreenGoblin_Drink_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Goblin_Pee_Male : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AGoblin::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Pee);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Actions/GreenGoblin_PeeMale_Montage.GreenGoblin_PeeMale_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Goblin_Eat : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AGoblin::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/GeneralIdles/Eat/GreenGoblin_Montage_Eat.GreenGoblin_Montage_Eat'";
}

UCLASS()
class UAbilityTask_Interaction_Goblin_Sit : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AGoblin::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Interact_Sit_Chair);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/GeneralIdles/Sit/GreenGoblin_Montage_Sit.GreenGoblin_Montage_Sit'";
}

// UCLASS()
// class UAbilityTask_Interaction_Goblin_Pee_Female : UAbilityTask_InteractionSpot_Montage
// {
//     default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Actions/GreenGoblin_PeeFemale_Montage.GreenGoblin_PeeFemale_Montage'";
// }

UCLASS()
class UAbilityTask_Interaction_Goblin_Smell : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AGoblin::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Smell);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Actions/GreenGoblin_Smell_Montage.GreenGoblin_Smell_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Goblin_LookAround : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AGoblin::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_LookAround);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/Actions/GreenGoblin_LookAround_Montage.GreenGoblin_LookAround_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Goblin_Sleep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AGoblin::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Green_Goblin/GeneralIdles/Sleep/GreenGoblin_Montage_Sleep.GreenGoblin_Montage_Sleep'";
}