
UCLASS()
class UAbilityTask_Interaction_Lizard_Eat : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ALizard::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/GeneralIdles/Eat/Lizard_Montage_Eat.Lizard_Montage_Eat'";
}

UCLASS()
class UAbilityTask_Interaction_Lizard_Sleep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ALizard::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;
    
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/GeneralIdles/Sleep/Lizard_Montage_Sleep.Lizard_Montage_Sleep'";
}

UCLASS()
class UAbilityTask_Interaction_Lizard_Lay : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ALizard::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Lay);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;
    
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/GeneralIdles/Lay/Lizard_Montage_Lay.Lizard_Montage_Lay'";
}

UCLASS()
class UAbilityTask_Interaction_Lizard_Dig : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ALizard::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Dig);

    default bAllowInterruptLoopOnCancel = true;

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Actions/Lizard_Montage_Dig.Lizard_Montage_Dig'";
}

UCLASS()
class UAbilityTask_Interaction_Lizard_Roar : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ALizard::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Roar);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Actions/Lizard_Montage_Roar.Lizard_Montage_Roar'";
}

UCLASS()
class UAbilityTask_Interaction_Lizard_Drink : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ALizard::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Drink);

    default bAllowInterruptLoopOnCancel = true;

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard/Actions/Lizard_Montage_Drink.Lizard_Montage_Drink'";
}
