
UCLASS()
class UAbilityTask_Interaction_Bloodhound_Lay : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ABloodhound::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Lay);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/GeneralIdles/Lay/A_Bloodhound_Montage_Lay.A_Bloodhound_Montage_Lay'";
}

UCLASS()
class UAbilityTask_Interaction_Bloodhound_Sleep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ABloodhound::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/GeneralIdles/Sleep/Bloodhound_Montage_Sleep.Bloodhound_Montage_Sleep'";
}

UCLASS()
class UAbilityTask_Interaction_Bloodhound_Eat : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ABloodhound::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/GeneralIdles/Eat/Bloodhound_Montage_Eat.Bloodhound_Montage_Eat'";
}


UCLASS()
class UAbilityTask_Interaction_Bloodhound_Dig : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ABloodhound::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Dig);

    default bAllowInterruptLoopOnCancel = true;

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Actions/Bloodhound_Montage_Dig.Bloodhound_Montage_Dig'";
}

UCLASS()
class UAbilityTask_Interaction_Bloodhound_Drink : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ABloodhound::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Drink);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Actions/Bloodhound_Montage_Drink.Bloodhound_Montage_Drink'";
}

UCLASS()
class UAbilityTask_Interaction_Bloodhound_Howl : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ABloodhound::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Roar);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Actions/Bloodhound_Montage_Howl.Bloodhound_Montage_Howl'";
}

UCLASS()
class UAbilityTask_Interaction_Bloodhound_Scratch : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ABloodhound::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_ScratchEar);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Actions/Bloodhound_Montage_ScratchEar.Bloodhound_Montage_ScratchEar'";
}

UCLASS()
class UAbilityTask_Interaction_Bloodhound_Shake : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ABloodhound::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Shake);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Actions/Bloodhound_Shake_Montage.Bloodhound_Shake_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Bloodhound_Smell : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ABloodhound::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Smell);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Actions/Bloodhound_Montage_Smell.Bloodhound_Montage_Smell'";
}

UCLASS()
class UAbilityTask_Interaction_Bloodhound_LookAround : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ABloodhound::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_LookAround);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodhound/Actions/Bloodhound_Montage_LookAround.Bloodhound_Montage_LookAround'";
}
