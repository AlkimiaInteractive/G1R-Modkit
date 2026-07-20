UCLASS()
class UAbilityTask_Interaction_Human_SearchAround : UAbilityTask_InteractionSpot_Montage
{
    default bPossibleAnywhere = true;
    default bPutAwayItemInHandsBeforeInteraction = false;

    default DefaultForCharacterClass.Add(AAIAgentCharacter_Human::StaticClass());
    default DefaultForCharacterClass.Add(AGothicPlayerCharacter::StaticClass());
    default DefaultInteractionForActions.AddTag(GameplayTag::Action_Ambient_SearchAround);

    UPROPERTY()
    TArray<TSoftObjectPtr<UAnimMontage>> Montages_NoItem;

    UPROPERTY()
    TArray<TSoftObjectPtr<UAnimMontage>> Montages_WithItem;

    default Montages_NoItem.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Reactions/A_Man_SearchAround_01_Montage.A_Man_SearchAround_01_Montage'"));
    default Montages_NoItem.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Reactions/A_Man_SearchAround_02_Montage.A_Man_SearchAround_02_Montage'"));

    default Montages_WithItem.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Reactions/A_Man_SearchAround_WithItem_01_Montage.A_Man_SearchAround_WithItem_01_Montage'"));
    default Montages_WithItem.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Reactions/A_Man_SearchAround_WithItem_02_Montage.A_Man_SearchAround_WithItem_02_Montage'"));

    UPROPERTY()
    TArray<TSoftObjectPtr<UAnimMontage>> Montages_WithItem_TwoHanded;

    //S2H
    default Montages_WithItem_TwoHanded.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Reactions/A_Man_S2H_Ma_SearchAround_Montage.A_Man_S2H_Ma_SearchAround_Montage'"));
    //A2H UNTRAINED
    default Montages_WithItem_TwoHanded.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Reactions/A_Man_A2H_Un_SearchAround_Montage.A_Man_A2H_Un_SearchAround_Montage'"));
    //A2H MASTER
    default Montages_WithItem_TwoHanded.Add(TSoftObjectPtr<UAnimMontage>(n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Reactions/A_Man_A2H_Ma_SearchAround_Montage.A_Man_A2H_Ma_SearchAround_Montage'"));

    UPROPERTY() TSoftObjectPtr<UAnimMontage> Montages_WithItem_OneHanded = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Reactions/A_Man_S1H_Tr_SearchAround01_Montage.A_Man_S1H_Tr_SearchAround01_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> Montages_WithItem_Staff = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Reactions/A_Man_Sff2H_Tr_SearchAround_Montage.A_Man_Sff2H_Tr_SearchAround_Montage'";
    UPROPERTY() TSoftObjectPtr<UAnimMontage> Montages_WithItem_Crossbow = n"AnimMontage'/Game/AnimLibrary/Humanoid/Man/Reactions/A_Man_Crossbow_N_SearchAround_Montage.A_Man_Crossbow_N_SearchAround_Montage'";

    UFUNCTION(BlueprintOverride)
    void SetupTransitions()
    {
        if (Montages_NoItem.IsEmpty())
        {
            int Index = Math::RandRange(0, Montages_NoItem.Num() - 1);
            MainMontage = Montages_NoItem[Index];
            return;
        }
            
        
        if (Self.HasDrawnBow() || Self.HasDrawnRune() || Self.HasDrawnScroll())
        {
            int Index = Math::RandRange(0, Montages_WithItem.Num() - 1);
            MainMontage = Montages_WithItem[Index];
            return;
        }

        if (Self.HasDrawnFists() || (Self.HasDrawnWeapon1H() && (Self.IsMeleeOneHandedTrained() || Self.IsMeleeOneHandedMaster())))
        {
            MainMontage = Montages_WithItem_OneHanded;
        }

        if ((Self.HasDrawnWeapon1H() && !(Self.IsMeleeOneHandedTrained() || Self.IsMeleeOneHandedMaster())) || (Self.HasDrawnSword2H() && (Self.IsMeleeTwoHandedTrained() || Self.IsMeleeTwoHandedMaster())))
        {
            MainMontage = Montages_WithItem_TwoHanded[0];
        }

        if ((Self.HasDrawnAxe2H() && !Self.IsMeleeTwoHandedMaster()) || (Self.HasDrawnSword2H() && !(Self.IsMeleeTwoHandedTrained() || Self.IsMeleeTwoHandedMaster())))
        {
            MainMontage = Montages_WithItem_TwoHanded[1];
        }

        if (Self.HasDrawnAxe2H() && Self.IsMeleeTwoHandedMaster())
        {
            MainMontage = Montages_WithItem_TwoHanded[2];
        }

        if (Self.HasDrawnStaff())
        {
            MainMontage = Montages_WithItem_Staff;
        }

        if (Self.HasDrawnCrossbow())
        {
            MainMontage = Montages_WithItem_Crossbow;
        }
    }
}