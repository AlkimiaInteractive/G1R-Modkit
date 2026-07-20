
UCLASS()
class UAbilityTask_Interaction_Orcdog_Lay : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrcDog::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Lay);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/GeneralIdles/Lay/OrcDog_Montage_Lay.OrcDog_Montage_Lay'";
}

UCLASS()
class UAbilityTask_Interaction_Orcdog_Sleep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrcDog::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Orcdog/GeneralIdles/Sleep/Orcdog_Montage_Sleep.Orcdog_Montage_Sleep'";
}

UCLASS()
class UAbilityTask_Interaction_Orcdog_Eat : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrcDog::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Orcdog/GeneralIdles/Eat/Orcdog_Montage_Eat.Orcdog_Montage_Eat'";
}


UCLASS()
class UAbilityTask_Interaction_Orcdog_Dig : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrcDog::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Dig);

    default bAllowInterruptLoopOnCancel = true;

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Orcdog/Actions/Orcdog_Montage_Dig.Orcdog_Montage_Dig'";
}

UCLASS()
class UAbilityTask_Interaction_Orcdog_Drink : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrcDog::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Drink);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Orcdog/Actions/Orcdog_Montage_Drink.Orcdog_Montage_Drink'";
}

UCLASS()
class UAbilityTask_Interaction_Orcdog_Howl : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrcDog::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Roar);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Orcdog/Actions/Orcdog_Montage_Howl.Orcdog_Montage_Howl'";
}

UCLASS()
class UAbilityTask_Interaction_Orcdog_Scratch : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrcDog::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_ScratchEar);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Orcdog/Actions/Orcdog_Montage_ScratchEar.Orcdog_Montage_ScratchEar'";
}

UCLASS()
class UAbilityTask_Interaction_Orcdog_Shake : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrcDog::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Shake);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Orcdog/Actions/OrcDog_Shake_Montage.OrcDog_Shake_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Orcdog_Pee : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrcDog::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Pee);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Actions/OrcDog_Montage_Pee.OrcDog_Montage_Pee'";
}

UCLASS()
class UAbilityTask_Interaction_Orcdog_Smell : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrcDog::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Smell);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Actions/OrcDog_Montage_Smell.OrcDog_Montage_Smell'";
}

UCLASS()
class UAbilityTask_Interaction_Orcdog_LookAround : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AOrcDog::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_LookAround);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/OrcDog/Actions/OrcDog_Montage_LookAround.OrcDog_Montage_LookAround'";
}