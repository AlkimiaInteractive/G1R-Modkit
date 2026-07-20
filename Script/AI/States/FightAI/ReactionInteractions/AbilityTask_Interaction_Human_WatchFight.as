UCLASS()
class UAbilityTask_Interaction_Human_WatchFight : UAbilityTask_InteractionSpot_Montage
{
    default bPossibleAnywhere = true;

    default DefaultForCharacterClass.Add(AAIAgentCharacter_Human::StaticClass());
    default DefaultForCharacterClass.Add(AGothicPlayerCharacter::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_WatchFight);
    
    default OtherInteractionEndBehaviorOnSwitch = EInteractionEndBehavior::Quick;

    default MainMontage = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Living/Cheering/Interaction_WatchFight_Main_Montage.Interaction_WatchFight_Main_Montage'";
}