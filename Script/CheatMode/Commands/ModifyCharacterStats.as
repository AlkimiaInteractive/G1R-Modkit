class UModifyCharacterStats : UCheatCommandBase 
{
    default CommandName = "Modify Character Stats";
    default CommandUsage = "ModifyCharacterStats";

    default Category = ECheatModeCategory::Characters;
    default PositionPriority = 1;

    TSubclassOf<UGameplayEffect> m_GameplayEffectDamage = UGameplayEffect_DebugKillCharacter::StaticClass();

    UPROPERTY()
    APlayerState m_SelectedCharacter;
    UPROPERTY()
    FString m_RecipeFilter;
    UPROPERTY()
    TSubclassOf<UItemRecipeDefinition> m_CurrentKnownRecipeClass;
    UPROPERTY()
    FString m_CurrentKnownRecipeName;
    UPROPERTY()
    TSubclassOf<UItemRecipeDefinition> m_CurrentUnknownRecipeClass;
    UPROPERTY()
    FString m_CurrentUnknownRecipeName;

    UPROPERTY()
    FString m_HeaderText = "Modify Character Stats";

    UFUNCTION(BlueprintOverride)
    void PrintUI()
    {
        //#if WITH_IMGUI
        //if (ImGui::BeginTabBar("##Tabs"/*, ImGuiTabBarFlags_None*/))
        {
            //ImGui::Text(m_HeaderText);
            auto world = Gameplay::GetPlayerCharacter(0).GetWorld();      
            m_SelectedCharacter = ImGui::ImGuiCharacterSelection("Select Character", ImGui::GetAllAvailableCharactersAlive(world, m_RecipeFilter), m_SelectedCharacter, m_RecipeFilter);
            ImGui::ImGuiDisplayCharacterLessons(m_SelectedCharacter);
            //CurrentKnownRecipeClass = m_ItemDef.Get();
            ImGui::ImGuiDrawKnownRecipes(m_SelectedCharacter, m_CurrentKnownRecipeClass, m_CurrentKnownRecipeName, m_CurrentUnknownRecipeClass, m_CurrentUnknownRecipeName, m_RecipeFilter);
            ImGui::ImGuiDisplayCharacterRestoreAttributes(m_SelectedCharacter);
            // if (ImGui::Button(m_ButtonText))
            // {
            //     ExecuteCommand(TArray<FString>());
            // }

        }
        //#endif
    }
}
