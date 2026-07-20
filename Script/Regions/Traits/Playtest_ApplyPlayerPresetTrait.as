UCLASS(meta=(DisplayName="Apply Player Preset"))
class URegionTrait_Playtest_ApplyPlayerPreset : UStoryActionRegionTrait
{
    /** This will be visible and editable in Unreal as a dropdown list. */
    UPROPERTY(Category=PresetParameters)
    TSubclassOf<UInventoryPreset> InventoryPresetClass;

    /** This will be visible and editable in Unreal as a dropdown list. */
    UPROPERTY(Category=PresetParameters)
    TSubclassOf<UPlayerPreset> PlayerPresetClass;

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if (!IsValid(CharacterState) || !IsValid(CharacterState.Character))
            return;

        if (!CharacterState.IsPlayerCharacter())
            return;

        if (CharacterState.IsDead() || CharacterState.IsDefeated())
            return;

        if (IsValid(InventoryPresetClass))
        {
            InventoryPresetClass.DefaultObject.ApplyPreset(CharacterState.Character);
        }

        if (IsValid(PlayerPresetClass))
        {
            auto GASC = Cast<UGothicAbilitySystemComponent>(CharacterState.Character.GetAbilitySystemComponent());

            if (!IsValid(GASC))
                return;

            GASC.SetPlayerPreset(PlayerPresetClass.DefaultObject);
        }
    }
}