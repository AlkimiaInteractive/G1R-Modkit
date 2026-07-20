UCLASS() // base class for all interactions that should be performed while flying
class UAbilityTask_Interaction_Harpy_Flying : UAbilityTask_InteractionSpot_Montage
{
    default RequiredOwnedTags.RemoveTag(GameplayTag::State_Grounded);
    default RequiredOwnedTags.AddTag(GameplayTag::State_Flying);
    default bKeepCharacterZLocationForAlignment = true;
    default bAllowInterruptLoopOnCancel = true;
}

UCLASS()  // base class for interaction that can be performed while flying or grounded
class UAbilityTask_Interaction_Harpy_AnyMovementType : UAbilityTask_InteractionSpot_Montage
{
    default RequiredOwnedTags.RemoveTag(GameplayTag::State_Grounded);
    default bKeepCharacterZLocationForAlignment = true;
    default bAllowInterruptLoopOnCancel = true;
}

class UAbilityTask_Interaction_Harpy_Eat : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AHarpy::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat);
    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/GeneralIdles/Eat/Harpy_Eat_Montage.Harpy_Eat_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Harpy_Lay_Down : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AHarpy::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_LayDown);
    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/GeneralIdles/Still/Harpy_Montage_Still_02.Harpy_Montage_Still_02'";
}

UCLASS()
class UAbilityTask_Interaction_Harpy_Lay : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AHarpy::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Lay);
    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Harpy/GeneralIdles/Still/Harpy_Montage_Still_01.Harpy_Montage_Still_01'";
}

UCLASS()
class UAbilityTask_Interaction_Harpy_Scream : UAbilityTask_Interaction_Harpy_Flying
{
    default DefaultForCharacterClass.Add(AHarpy::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Roar);
    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Harpy/Combat/Taunt/A_Harpy_Roar_Montage.A_Harpy_Roar_Montage'";
}