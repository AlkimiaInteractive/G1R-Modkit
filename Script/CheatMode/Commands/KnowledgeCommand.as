class UKnowledgeCommand : UCheatCommandBase 
{
    default CommandName = "Knowledge";
    default CommandUsage = "Knowledge";

    default Category = ECheatModeCategory::StoryAndEnvironment;
    default PositionPriority = 3;

    UPROPERTY()
    APlayerState m_SelectedCharacter;
    UPROPERTY()
    FString m_Filter;
    
    UFUNCTION(BlueprintOverride)
    bool ExecuteCommand(TArray<FString> args)
    {
        
        return true;
    }

    UFUNCTION(BlueprintOverride)
    void PrintUI()
    {
        auto world = Gameplay::GetPlayerCharacter(0).GetWorld();
        m_SelectedCharacter = ImGui::ImGuiCharacterSelection("Select Character:", UCheatModeHelper::GetAllCharactersStates(m_Filter), m_SelectedCharacter, m_Filter);
        const auto selectedCharacterState = Cast<AGothicCharacterState>(m_SelectedCharacter);
        if(!IsValid(selectedCharacterState))
            return;

        ImGui::ImGuiDisplayKnowledges(selectedCharacterState);
    }
}