
UCLASS()
class UAbilityTask_Interaction_Scavenger_Medium_Eat : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AScavenger_Medium::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/GeneralIdle/Eat/Scavenger_Med_Eat_Montage.Scavenger_Med_Eat_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Scavenger_Medium_Sleep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AScavenger_Medium::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/GeneralIdle/Sleep/Scavenger_Med_Sleep_Montage.Scavenger_Med_Sleep_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Scavenger_Medium_Eat_Corpse : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AScavenger_Medium::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Loot);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/GeneralIdle/Eat/Scavenger_Med_Eat_Montage.Scavenger_Med_Eat_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Scavenger_Medium_Dig : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AScavenger_Medium::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Dig);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Actions/Scavenger_Med_DigGround_Montage.Scavenger_Med_DigGround_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Scavenger_Medium_Drink : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AScavenger_Medium::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Drink);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Actions/Scavenger_Med_Drink_Montage.Scavenger_Med_Drink_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Scavenger_Medium_Roar : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AScavenger_Medium::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Roar);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Actions/Scavenger_Med_Roar_01_Montage.Scavenger_Med_Roar_01_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Scavenger_Medium_ScratchEar : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AScavenger_Medium::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_ScratchEar);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Actions/Scavenger_Med_Scratch_Montage.Scavenger_Med_Scratch_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Scavenger_Medium_Shake : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AScavenger_Medium::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Shake);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Scavenger/Med/Actions/Scavenger_Med_Shake_Montage.Scavenger_Med_Shake_Montage'";
}