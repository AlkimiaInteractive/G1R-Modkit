class UAnimationCommand : UCheatCommandBase 
{
    default CommandName = "Animation";
    default CommandUsage = "Animation";

    default Category = ECheatModeCategory::Characters;
    default PositionPriority = 7;
    
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
        m_SelectedCharacter = ImGui::ImGuiCharacterSelection("Select Character:", UCheatModeHelper::GetAllCharactersStates(m_Filter), m_SelectedCharacter, m_Filter);
        const auto selectedCharacterState = Cast<AGothicCharacterState>(m_SelectedCharacter);
        if(!IsValid(selectedCharacterState))
            return;   
        ImGui::ImGuiDisplayAnimation(selectedCharacterState);
    }
}