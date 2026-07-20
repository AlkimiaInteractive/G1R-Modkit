
UCLASS()
class UAbilityTask_Interaction_Zombie_Stand : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AZombie::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_StandAround);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Zombie/GeneralIdles/Zombie_Montage_Idle_01.Zombie_Montage_Idle_01'";
}

UCLASS()
class UAbilityTask_Interaction_Zombie_Sleep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AZombie::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Zombie/GeneralIdles/Sleep/Zombie_Montage_Sleep.Zombie_Montage_Sleep'";
}