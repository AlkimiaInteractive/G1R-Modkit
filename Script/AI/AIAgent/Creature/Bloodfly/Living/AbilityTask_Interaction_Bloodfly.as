
UCLASS()
class UAbilityTask_Interaction_BloodFly_Flying : UAbilityTask_InteractionSpot_Montage
{
    default RequiredOwnedTags.RemoveTag(GameplayTag::State_Grounded);
    default RequiredOwnedTags.AddTag(GameplayTag::State_Flying);
    default bKeepCharacterZLocationForAlignment = true;
    default bAllowInterruptLoopOnCancel = true;
}

UCLASS()
class UAbilityTask_Interaction_BloodFly_Sleep : UAbilityTask_Interaction_BloodFly_Flying
{
    default DefaultForCharacterClass.Add(ABloodfly::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);
    default bPossibleAnywhere = true;
    default bKeepCharacterZLocationForAlignment = false;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodfly/GeneralIdles/Sleep/Bloodfly_Montage_Sleep.Bloodfly_Montage_Sleep'";
}

UCLASS()
class UAbilityTask_Interaction_BloodFly_Lay : UAbilityTask_Interaction_BloodFly_Flying
{
    default DefaultForCharacterClass.Add(ABloodfly::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Lay);
    default bPossibleAnywhere = true;
    default bKeepCharacterZLocationForAlignment = false;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodfly/GeneralIdles/Lay/Bloodfly_Montage_Lay.Bloodfly_Montage_Lay'";
}

UCLASS()
class UAbilityTask_Interaction_BloodFly_Eat : UAbilityTask_Interaction_BloodFly_Flying
{
    default DefaultForCharacterClass.Add(ABloodfly::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodfly/GeneralIdles/Bloodfly_Montage_Eat.Bloodfly_Montage_Eat'";
}

UCLASS()
class UAbilityTask_Interaction_BloodFly_Roar : UAbilityTask_Interaction_BloodFly_Flying
{
    default DefaultForCharacterClass.Add(ABloodfly::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Roar);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodfly/Actions/Bloodfly_Montage_Roar.Bloodfly_Montage_Roar'";
} 

UCLASS()
class UAbilityTask_Interaction_BloodFly_Clean : UAbilityTask_Interaction_BloodFly_Flying
{
    default DefaultForCharacterClass.Add(ABloodfly::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Clean);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodfly/Actions/Bloodfly_Montage_Clean.Bloodfly_Montage_Clean'";
}

UCLASS()
class UAbilityTask_Interaction_BloodFly_Shake : UAbilityTask_Interaction_BloodFly_Flying
{
    default DefaultForCharacterClass.Add(ABloodfly::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Shake);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodfly/Actions/Bloodfly_Shake_Montage.Bloodfly_Shake_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_BloodFly_Hunt : UAbilityTask_Interaction_BloodFly_Flying
{
    default DefaultForCharacterClass.Add(ABloodfly::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Hunt);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Bloodfly/Actions/Bloodfly_Montage_HuntingFlies.Bloodfly_Montage_HuntingFlies'";
}