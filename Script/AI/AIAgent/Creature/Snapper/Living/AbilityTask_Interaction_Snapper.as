
UCLASS()
class UAbilityTask_Interaction_Snapper_Eat : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ASnapper::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/GeneralIdles/Eat/Snapper_Montage_Eat.Snapper_Montage_Eat'";
}

UCLASS()
class UAbilityTask_Interaction_Snapper_Sleep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ASnapper::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/GeneralIdles/Sleep/A_Snapper_Montage_Sleep.A_Snapper_Montage_Sleep'";
}

UCLASS()
class UAbilityTask_Interaction_Snapper_Lay : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ASnapper::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Lay);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/GeneralIdles/Lay/Snapper_Montage_Lay.Snapper_Montage_Lay'";
}

UCLASS()
class UAbilityTask_Interaction_Snapper_Dig : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ASnapper::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Dig);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Actions/Snapper_Montage_Dig.Snapper_Montage_Dig'";
}

UCLASS()
class UAbilityTask_Interaction_Snapper_Roar : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ASnapper::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Roar);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Actions/Snapper_Montage_Roar.Snapper_Montage_Roar'";
}

UCLASS()
class UAbilityTask_Interaction_Snapper_Drink : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ASnapper::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Drink);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Actions/Snapper_Montage_Drink.Snapper_Montage_Drink'";
}

UCLASS()
class UAbilityTask_Interaction_Snapper_Shake : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ASnapper::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Shake);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Actions/Snapper_Shake_Montage.Snapper_Shake_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Snapper_Scratch : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ASnapper::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_ScratchEar);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Actions/Snapper_Montage_Scratch.Snapper_Montage_Scratch'";
}

UCLASS()
class UAbilityTask_Interaction_Snapper_Smell : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ASnapper::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Smell);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Actions/Snapper_Montage_Smell.Snapper_Montage_Smell'";
}

UCLASS()
class UAbilityTask_Interaction_Snapper_LookAround : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ASnapper::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_LookAround);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Snapper/Actions/Snapper_Montage_LookAround.Snapper_Montage_LookAround'";
}