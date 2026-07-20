UCLASS()
class UAbilityTask_Interaction_Golem_Fire_Sleep : UAbilityTask_InteractionSpot_Montage
{
    default DefaultForCharacterClass.Add(AGolemFire::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Sleep);

    default bPossibleAnywhere = true;
    
    default MainMontage = n"/Script/Engine.AnimMontage'/Game/AnimLibrary/Creatures/Fire_Golem/GeneralIdles/Sleep/A_FireGolem_Sleep_Montage.A_FireGolem_Sleep_Montage'";
}