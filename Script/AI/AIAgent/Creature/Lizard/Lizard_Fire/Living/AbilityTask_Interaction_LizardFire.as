
UCLASS()
class UAbilityTask_Interaction_FireLizard_Eat : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ALizard_Fire::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/GeneralIdles/Eat/LizardFire_Montage_Eat.LizardFire_Montage_Eat'";
}

UCLASS()
class UAbilityTask_Interaction_FireLizard_Sleep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ALizard_Fire::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;
    
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/GeneralIdles/Sleep/LizardFire_Montage_Sleep.LizardFire_Montage_Sleep'";
}

UCLASS()
class UAbilityTask_Interaction_FireLizard_Lay : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ALizard_Fire::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Lay);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;
    
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/GeneralIdles/Lay/LizardFire_Montage_Lay.LizardFire_Montage_Lay'";
}

UCLASS()
class UAbilityTask_Interaction_FireLizard_Dig : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ALizard_Fire::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Dig);
    default bAllowInterruptLoopOnCancel = true;

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Actions/LizardFire_Montage_Dig.LizardFire_Montage_Dig'";
}

UCLASS()
class UAbilityTask_Interaction_FireLizard_Roar : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ALizard_Fire::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Roar);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Actions/LizardFire_Montage_Roar.LizardFire_Montage_Roar'";
}

UCLASS()
class UAbilityTask_Interaction_FireLizard_Drink : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ALizard::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Drink);
    default bAllowInterruptLoopOnCancel = true;

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Lizard_Fire/Actions/LizardFire_Montage_Drink.LizardFire_Montage_Drink'";
}
