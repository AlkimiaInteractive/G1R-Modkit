UCLASS()
class UAbilityTask_Interaction_Minecrawler_Warrior_Eat : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AMinecrawler::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/GeneralIdles/Eat/MCrawler_Warrior_Montage_Eat.MCrawler_Warrior_Montage_Eat'";
}

UCLASS()
class UAbilityTask_Interaction_Minecrawler_Warrior_Sleep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AMinecrawler::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/GeneralIdles/Sleep/MCrawler_Warrior_Sleep_Montage.MCrawler_Warrior_Sleep_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Minecrawler_Warrior_DigGround : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AMinecrawler::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_DigGround);

    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Actions/DigGround/MCrawler_Warrior_DigGround_Montage.MCrawler_Warrior_DigGround_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Minecrawler_Warrior_Clean : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AMinecrawler::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Clean);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/Actions/Clean/MCrawler_Warrior_Clean_Montage.MCrawler_Warrior_Clean_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Minecrawler_Warrior_Lay : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AMinecrawler::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Lay);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Warrior/GeneralIdles/Lay/MCrawler_Warrior_Lay_Montage.MCrawler_Warrior_Lay_Montage'";
}