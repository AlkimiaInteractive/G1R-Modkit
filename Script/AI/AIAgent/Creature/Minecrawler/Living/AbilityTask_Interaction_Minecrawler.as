UCLASS()
class UAbilityTask_Interaction_Minecrawler_Eat : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AMinecrawler::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/GeneralIdles/Eat/Minecrawler_Montage_Eat.Minecrawler_Montage_Eat'";
}

UCLASS()
class UAbilityTask_Interaction_Minecrawler_Sleep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AMinecrawler::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);

    default bPossibleAnywhere = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/GeneralIdles/Sleep/Minecrawler_Montage_Sleep.Minecrawler_Montage_Sleep'";
}

UCLASS()
class UAbilityTask_Interaction_Minecrawler_DigGround : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AMinecrawler::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_DigGround);

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Actions/DigGround/A_MCrawler_DigGround_Montage.A_MCrawler_DigGround_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Minecrawler_Clean : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AMinecrawler::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Clean);

    default bPossibleAnywhere = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/Actions/Clean/A_MCrawler_Clean_Montage.A_MCrawler_Clean_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Minecrawler_Lay : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AMinecrawler::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Lay);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler/GeneralIdles/Lay/A_MCrawler_Lay_Montage.A_MCrawler_Lay_Montage'";
}


UCLASS()
class UAbilityTask_Interaction_Minecrawler_Queen_Stand : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AMinecrawler_Queen::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_StandAround);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/MCrawler_Queen/Phase1/Combat/Movement/Idles/combatBreath/A_MCQueen_Ph1_Idle_Breath_Montage.A_MCQueen_Ph1_Idle_Breath_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Minecrawler_Queen_Ph2_Stand : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AMinecrawler_Queen_Ph2::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_StandAround);
    default bAllowInterruptLoopOnCancel = true;
}

