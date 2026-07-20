
UCLASS()
class UAbilityTask_Interaction_Meatbug_Lay : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AMeatbug::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_StandAround);

    default bPossibleAnywhere = true;

	default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Meatbug/GeneralIdles/Meatbug_Montage_Idle.Meatbug_Montage_Idle'";
}

UCLASS()
class UAbilityTask_Interaction_Meatbug_Eat : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AMeatbug::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat);

    default bPossibleAnywhere = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Meatbug/Actions/Meatbug_Montage_Eat.Meatbug_Montage_Eat'";
}