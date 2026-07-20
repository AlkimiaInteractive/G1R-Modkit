UCLASS()
class UAbilityTask_Interaction_Troll_Eat : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ATroll::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/GeneralIdles/Eat/A_AdultTroll_Montage_Eat.A_AdultTroll_Montage_Eat'";
}

UCLASS()
class UAbilityTask_Interaction_Toll_Sleep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ATroll::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/AdultTroll/GeneralIdles/Sleep/A_AdultTroll_montage_Sleep_01.A_AdultTroll_montage_Sleep_01'";
}

UCLASS()
class UAbilityTask_Interaction_JuvenilleTroll_Eat : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AJuvenileTroll::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/JuvenileTroll/GeneralIdles/Eat/A_JuvenileTroll_Montage_Eat.A_JuvenileTroll_Montage_Eat'";
}

UCLASS()
class UAbilityTask_Interaction_JuvenilleTroll_Sleep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AJuvenileTroll::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/JuvenileTroll/GeneralIdles/Sleep/A_JuvenileTroll_montage_Sleep_01.A_JuvenileTroll_montage_Sleep_01'";
}