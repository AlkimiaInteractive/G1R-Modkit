UCLASS()
class UAbilityTask_Interaction_Human_GetJumpscared : UAbilityTask_InteractionSpot_Montage
{
    default bPossibleAnywhere = true;

    default DefaultForCharacterClass.Add(AAIAgentCharacter_Human::StaticClass());
    default DefaultForCharacterClass.Add(AGothicPlayerCharacter::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_GetJumpscared);

    default OtherInteractionEndBehaviorOnSwitch = EInteractionEndBehavior::Instant;

    UPROPERTY()
    TArray<TSoftObjectPtr<UAnimMontage>> Montages;

    default Montages.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Reactions/A_Man_EnterFlee_01_Montage.A_Man_EnterFlee_01_Montage'"));
    default Montages.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Reactions/A_Man_EnterFlee_02_Montage.A_Man_EnterFlee_02_Montage'"));

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        if (Montages.IsEmpty())
            return;
        
        int Index = Math::RandRange(0, Montages.Num() - 1);
        MainMontage = Montages[Index];
    }
}