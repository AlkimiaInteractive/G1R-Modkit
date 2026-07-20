UCLASS()
class AStatuesPreset : AInteractiveObjectActor
{
    /** This will be visible and editable in Unreal as a dropdown list. */
    UPROPERTY(Category=PresetParameters)
    TSubclassOf<UInventoryPreset> InventoryPresetClass;

    /** This will be visible and editable in Unreal as a dropdown list. */
    UPROPERTY(Category=PresetParameters)
    TSubclassOf<UPlayerPreset> PlayerPresetClass;

    AGothicCharacterState SavedCharacterState;

    bool bIsWaitingForPreset = false;

    UFUNCTION(BlueprintOverride)
    void PlayAction(AGothicCharacterState CharacterState)
    {
        if (bIsWaitingForPreset)
            return;

        if (!IsValid(CharacterState) || !IsValid(CharacterState.Character))
            return;

        if (!CharacterState.IsPlayerCharacter())
            return;

        if (CharacterState.IsDead() || CharacterState.IsDefeated())
            return;

        bIsWaitingForPreset = true;
        SavedCharacterState = CharacterState;

        ApplyFX(SavedCharacterState.Character);
        System::SetTimerDelegate(FTimerDynamicDelegate(this, n"ApplyPreset"), 0.1f, false);        
    }

     UFUNCTION()
    void ApplyPreset()
    {
        if (IsValid(InventoryPresetClass))
        {
            InventoryPresetClass.DefaultObject.ApplyPreset(SavedCharacterState.Character);
        }

        if (IsValid(PlayerPresetClass))
        {
            auto GASC = Cast<UGothicAbilitySystemComponent>(SavedCharacterState.Character.GetAbilitySystemComponent());

            if (!IsValid(GASC))
                return;

            GASC.SetPlayerPreset(PlayerPresetClass.DefaultObject);
        }
        bIsWaitingForPreset = false;
    }

    UFUNCTION(BlueprintEvent)
    void ApplyFX(AActor Actor)
    {
        // This function can be overridden in a child BP to apply custom FX.
        // If not overridden, it will print a message to the log.
        //Print("ApplyFX called on AStatuesPreset. Override this in a child BP to apply custom effects.");
    }
}

UCLASS()
class UStone_Preset: UDefaultInteractive
{
	default m_UniqueName = n"Stone_Preset";
	default m_DefaultInteraction = GameplayTag::Action_CallInteractFunction;
};