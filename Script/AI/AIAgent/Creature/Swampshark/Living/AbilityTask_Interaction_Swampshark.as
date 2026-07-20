
UCLASS()
class UAbilityTask_Interaction_Swampshark_InWater : UAbilityTask_InteractionSpot_Montage
{
    default RequiredOwnedTags.AddTag(GameplayTag::State_InWater);

}

UCLASS()
class UAbilityTask_Interaction_Swampshark_Eat : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ASwampshark::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Eat);
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/GeneralIdles/Eat/A_Swampshark_Eat_Montage.A_Swampshark_Eat_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Swampshark_Eat_Corpse : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ASwampshark::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Loot);
    default bAllowInterruptLoopOnCancel = true;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/GeneralIdles/Eat/A_Swampshark_Eat_Montage.A_Swampshark_Eat_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Swampshark_Sleep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ASwampshark::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);
    default RequiredOwnedTags.RemoveTag(GameplayTag::State_InWater);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;
    
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/GeneralIdles/Sleep/A_Swampshark_Sleep_Montage.A_Swampshark_Sleep_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Swampshark_DigGround : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ASwampshark::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_DigGround);
    default RequiredOwnedTags.RemoveTag(GameplayTag::State_InWater);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;
    
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Actions/DigGround/A_Swampshark_DigGround_Montage.A_Swampshark_DigGround_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Swampshark_Shake : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ASwampshark::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Shake);
    default RequiredOwnedTags.RemoveTag(GameplayTag::State_InWater);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;
    
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Actions/Swampshark_Shake_Montage.Swampshark_Shake_Montage'";
}

UCLASS()
class UAbilityTask_Interaction_Swampshark_LookAround : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(ASwampshark::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_LookAround);
    default RequiredOwnedTags.RemoveTag(GameplayTag::State_InWater);

    default bPossibleAnywhere = true;
    default bAllowInterruptLoopOnCancel = true;
    
    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Creatures/Swampshark/Actions/A_Swampshark_Watch_Montage.A_Swampshark_Watch_Montage'";
}
