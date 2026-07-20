UCLASS()
class UAbilityTask_Interaction_Human_Controlled : UAbilityTask_InteractionSpot_Montage
{
    default bPossibleAnywhere = true;

    default DefaultForCharacterClass.Add(AAIAgentCharacter_Human::StaticClass());
    default DefaultForCharacterClass.Add(AGothicPlayerCharacter::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Controlled);

    default OtherInteractionEndBehaviorOnSwitch = EInteractionEndBehavior::Instant;

    UPROPERTY()
    TArray<TSoftObjectPtr<UAnimMontage>> Montages;

    default Montages.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Items/RuneScrolls/Cast/Anims/Control/A_Man_Controlled_Montage.A_Man_Controlled_Montage'"));
    
    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        if (Montages.IsEmpty())
            return;
        
        int Index = Math::RandRange(0, Montages.Num() - 1);
        MainMontage = Montages[Index];
    }
}

UCLASS()
class UAbilityTask_Interaction_Human_Controlled_Seated : UAbilityTask_InteractionSpot_Montage
{
    default bPossibleAnywhere = true;
    default DefaultForCharacterClass.Add(AAIAgentCharacter_Human::StaticClass());
    default DefaultForCharacterClass.Add(AGothicPlayerCharacter::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_Controlled_Seated);
    default SubtaskOf.AddTag(GameplayTag::Action_Interact_Sit_Chair);

    default OtherInteractionEndBehaviorOnSwitch = EInteractionEndBehavior::Instant;

    UPROPERTY()
    TArray<TSoftObjectPtr<UAnimMontage>> Montages;

    default Montages.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Reactions/A_Man_Sit_EnterWatchHostile_01_Montage.A_Man_Sit_EnterWatchHostile_01_Montage'"));
    default Montages.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Reactions/A_Man_Sit_EnterWatchHostile_02_Montage.A_Man_Sit_EnterWatchHostile_02_Montage'"));

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        if (Montages.IsEmpty())
            return;
    
        int Index = Math::RandRange(0, Montages.Num() - 1);
        MainMontage = Montages[Index];
    }
}