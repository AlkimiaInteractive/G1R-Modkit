class UAIDailyRoutinesCommand : UCheatCommandBase 
{
    default CommandName = "AIDailyRountines";
    default CommandUsage = "AIDailyRountines";

    default Category = ECheatModeCategory::Characters;
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

        m_SelectedCharacter = ImGui::ImGuiCharacterSelection("Select Character", ImGui::GetAllAvailableCharactersExcluding(World, m_Filter, Gameplay::GetPlayerCharacter(0).PlayerState), m_SelectedCharacter, m_Filter);
      
        auto selectedNPCState = Cast<AGothicNPCState>(m_SelectedCharacter);

        if(selectedNPCState == nullptr)
            return;
        
        ImGui::ImGuiDisplayDailyRoutinesFor(world, selectedNPCState);
    }
}