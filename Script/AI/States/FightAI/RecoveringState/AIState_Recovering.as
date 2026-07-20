/** State in which there are no enemies left but the AIAgent's health isn't full and they have consumables to fix that. */
UCLASS()
class UAIState_Recovering : UAIState_Conflict
{
    default OwnedGameplayTags.AddTag(GameplayTag::AIState_Conflict_Recover);
    default AIStateTag = GameplayTag::AIState_Conflict_Recover;

    UFUNCTION(BlueprintOverride)
    void DoTask() final
    {
        Super::DoTask();

        if (Self.GetHealthAttribute() >= Self.GetMaxHealthAttribute())
            return;

        int ItemsConsumed = 0;

        AI.SelectBestItemActionFromInventory(FGameplayTag::Empty, FGameplayTagContainer(), true);

        while (IsValid(SelectedItemAction) && ItemsConsumed < 2 && SelectedItemAction.ActionTag.MatchesTag(GameplayTag::Action_QuickConsume))
        {
            if (!IsValid(SelectedItem) || !Self.HasItem(SelectedItem.Class))
                break;

            if (!AI.UseItem(SelectedItem.Class).WasSuccessful())
                break;

            ItemsConsumed++;

            AI.SelectBestItemActionFromInventory(FGameplayTag::Empty, FGameplayTagContainer(), true);

            WaitOneTick();
        }
    }

    FString GetDisplayName() const override
    {
        return "Recover";
    }
}