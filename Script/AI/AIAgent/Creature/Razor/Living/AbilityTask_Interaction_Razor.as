
UCLASS()
class UAbilityTask_Interaction_Razor_Eat : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ARazor::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/GeneralIdles/Eat/Razor_Montage_Eat.Razor_Montage_Eat'";
}

UCLASS()
class UAbilityTask_Interaction_Razor_Sleep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ARazor::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;
    
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/GeneralIdles/Sleep/Razor_Montage_Sleep.Razor_Montage_Sleep'";
}

UCLASS()
class UAbilityTask_Interaction_Razor_Lay : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ARazor::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Lay);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;
    
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/GeneralIdles/Lay/Razor_Montage_Lay.Razor_Montage_Lay'";
}

UCLASS()
class UAbilityTask_Interaction_Razor_Dig : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ARazor::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Dig);

    default bAllowInterruptLoopOnCancel = true;

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Actions/Razor_Montage_Dig.Razor_Montage_Dig'";
}

UCLASS()
class UAbilityTask_Interaction_Razor_Roar : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ARazor::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Roar);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Actions/Razor_Montage_Roar.Razor_Montage_Roar'";
}

UCLASS()
class UAbilityTask_Interaction_Razor_Shake : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ARazor::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Shake);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Actions/Razor_Shake_Montage.Razor_Shake_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Razor_Smell : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ARazor::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Smell);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Razor/Actions/Razor_Montage_Smell.Razor_Montage_Smell'";
}
