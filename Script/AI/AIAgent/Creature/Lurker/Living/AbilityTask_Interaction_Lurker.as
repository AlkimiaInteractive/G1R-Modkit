
UCLASS()
class UAbilityTask_Interaction_Lurker_Eat : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ALurker::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/GeneralIdles/Eat/Lurker_Montage_Eat.Lurker_Montage_Eat'";
}

UCLASS()
class UAbilityTask_Interaction_Lurker_Sleep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ALurker::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;
    
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/GeneralIdles/Sleep_01/Lurker_Montage_Sleep.Lurker_Montage_Sleep'";
}

UCLASS()
class UAbilityTask_Interaction_Lurker_Drink : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ALurker::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Drink);

    default bAllowInterruptLoopOnCancel = true;

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Actions/Lurker_Montage_Drink.Lurker_Montage_Drink'";
}

UCLASS()
class UAbilityTask_Interaction_Lurker_Roar : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ALurker::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Roar);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Actions/Lurker_Montage_Roar.Lurker_Montage_Roar'";
}

UCLASS()
class UAbilityTask_Interaction_Lurker_Dig : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ALurker::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Dig);

    default bAllowInterruptLoopOnCancel = true;

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Actions/Lurker_Montage_DigGround.Lurker_Montage_DigGround'";
}

UCLASS()
class UAbilityTask_Interaction_Lurker_Scracht : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ALurker::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_ScratchEar);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Actions/Lurker_Montage_Scratch.Lurker_Montage_Scratch'";
}

UCLASS()
class UAbilityTask_Interaction_Lurker_Shaking: UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ALurker::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Shake);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/Actions/Lurker_Shake_Montage.Lurker_Shake_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Lurker_Lay: UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ALurker::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Lay);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lurker/GeneralIdles/Lay/Lurker_Montage_Lay.Lurker_Montage_Lay'";
}
