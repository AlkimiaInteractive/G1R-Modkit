
UCLASS()
class UAbilityTask_Interaction_Scavenger_Young_Eat : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AScavenger_Young::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/GeneralIdle/Eat/Scavenger_Young_Eat_Montage.Scavenger_Young_Eat_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Scavenger_Young_Dig : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AScavenger_Young::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Dig);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Actions/Scavenger_Young_Dig_Montage.Scavenger_Young_Dig_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Scavenger_Young_Drink : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AScavenger_Young::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Drink);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Actions/Scavenger_Young_Drink_Montage.Scavenger_Young_Drink_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Scavenger_Young_Roar : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AScavenger_Young::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Roar);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Actions/Scavenger_Young_Roar_Montage.Scavenger_Young_Roar_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Scavenger_Young_ScracthEar : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AScavenger_Young::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_ScratchEar);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Actions/Scavenger_Young_Scratch_Montage.Scavenger_Young_Scratch_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Scavenger_Young_Shake : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AScavenger_Young::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Shake);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/Actions/Scavenger_Young_Shake_Montage.Scavenger_Young_Shake_Montage'";
}


UCLASS()
class UAbilityTask_Interaction_Scavenger_Young_Sleep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AScavenger_Young::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Young/GeneralIdle/Sleep/Scavenger_Young_Sleep_Montage.Scavenger_Young_Sleep_Montage'";
}