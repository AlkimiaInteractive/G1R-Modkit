UCLASS(meta=(DisplayName="Hide All Characters Of Species of a Territory"))
class URegionTrait_HideAllCharactersOfSpeciesBelongingToTerritory : URegionTrait
{
    UPROPERTY()
    TSubclassOf<UQuest> QuestClass;

    UPROPERTY(meta = (DisplayName = "Species To Hide"))
    FGameplayTagContainer SpeciesToHideContainer;

    UPROPERTY(meta = (DisplayName = "Species Allowed"))
    FGameplayTagContainer SpeciesAllowedContainer;

    UPROPERTY()
    TArray<TSubclassOf<UTerritoryConfig>> Territories;

    UFUNCTION()
    void HideAllCharactersOfSpeciesOfTerritory(const UObject Context)
    {
        auto Subsystem = UGothicCharacterSignificanceSubsystem::Get();
        if (!IsValid(Subsystem))
            return;

        for (auto Territory : Territories)
        {
            Log(f"[RegionTrait] - Trying to hide all characters in territory: {Territory}");
            Subsystem.HideAllCharactersOfSpeciesInTerritoryWithException(Context, Territory, SpeciesToHideContainer, SpeciesAllowedContainer);
        }
    }

    UFUNCTION()
    void UnhideAllCharactersOfTerritory(const UObject Context)
    {
        auto Subsystem = UGothicCharacterSignificanceSubsystem::Get();
        if (!IsValid(Subsystem))
            return;

        Log(f"[RegionTrait] - Clearing requests to hide all characters in territories");
        Subsystem.RemoveHideAllCharactersOfTerritoryRequest(Context);
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterEnteringRegion(AGothicCharacterState CharacterState)
    {
        if (!IsValid(QuestClass))
            return;

        auto Quest = UQuestSubsystem::Get().GetQuestByClass(QuestClass);
        if (!IsValid(Quest))
            return;

        if (!Quest.IsRunning())
        {
            UnhideAllCharactersOfTerritory(Quest);
            return;
        }

        HideAllCharactersOfSpeciesOfTerritory(Quest);
    }

    UFUNCTION(BlueprintOverride)
    void HandleCharacterLeavingRegion(AGothicCharacterState CharacterState)
    {
        if (!IsValid(QuestClass))
            return;

        auto Quest = UQuestSubsystem::Get().GetQuestByClass(QuestClass);
        if (!IsValid(Quest))
            return;

        if (Quest.IsRunning())
            return;

        UnhideAllCharactersOfTerritory(Quest);
    }
}