
UCLASS()
class UAbilityTask_Interaction_Skeleton_Stand : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ASkeletonHuman::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_StandAround);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true; 

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Skeleton/GeneralIdles/Skeleton_idle_Montage.Skeleton_idle_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Skeleton_Sweep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ASkeletonHuman::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sweep);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Sweep/Man_Sweep_Montage.Man_Sweep_Montage'";
}