
UCLASS()
class UAbilityTask_InteractionSpot_ShadowBeast_Lay : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AShadowBeast::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Lay);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/GeneralIdles/Lay/Shadow_Beast_Montage_Lay.Shadow_Beast_Montage_Lay'";
}

UCLASS()
class UAbilityTask_InteractionSpot_ShadowBeast_Sleep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AShadowBeast::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/GeneralIdles/Sleep/Shadow_Beast_Montage_Sleep.Shadow_Beast_Montage_Sleep'";
}

UCLASS()
class UAbilityTask_InteractionSpot_ShadowBeast_Eat : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AShadowBeast::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/GeneralIdles/Eat/Shadow_Beast_Montage_Eat.Shadow_Beast_Montage_Eat'";
}

UCLASS()
class UAbilityTask_InteractionSpot_ShadowBeast_Roar : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AShadowBeast::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Roar);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Actions/Shadow_Beast_Roar_01_Montage.Shadow_Beast_Roar_01_Montage'";
}

UCLASS()
class UAbilityTask_InteractionSpot_ShadowBeast_Drink : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AShadowBeast::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Drink);
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Actions/Shadow_Beast_Drink_Montage.Shadow_Beast_Drink_Montage'";
}

UCLASS()
class UAbilityTask_InteractionSpot_ShadowBeast_Pee : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AShadowBeast::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Pee);
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Actions/Shadow_Beast_Pee_Montage.Shadow_Beast_Pee_Montage'";
}

UCLASS()
class UAbilityTask_InteractionSpot_ShadowBeast_Shake : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AShadowBeast::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Shake);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Actions/Shadow_Beast_Shake_Montage.Shadow_Beast_Shake_Montage'";
}

UCLASS()
class UAbilityTask_InteractionSpot_ShadowBeast_Sharp : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AShadowBeast::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_SharpWeapon);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Actions/Shadow_Beast_Sharpen_Montage.Shadow_Beast_Sharpen_Montage'";
}

UCLASS()
class UAbilityTask_InteractionSpot_ShadowBeast_Smell : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AShadowBeast::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Smell);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Actions/Shadow_Beast_Smell_Montage.Shadow_Beast_Smell_Montage'";
}

UCLASS()
class UAbilityTask_InteractionSpot_ShadowBeast_LookAround : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AShadowBeast::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_LookAround);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Shadow_Beast/Actions/Shadow_Beast_LookAround_Montage.Shadow_Beast_LookAround_Montage'";
}

