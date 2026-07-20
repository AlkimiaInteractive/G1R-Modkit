class UFlyCommand : UCheatCommandBase 
{
    default CommandName = "Fly";
    default CommandUsage = "Fly (toggle)";

    default Category = ECheatModeCategory::Cheats;
    default PositionPriority = 2;

    bool m_IsFlyActive = false;

    UFUNCTION(BlueprintOverride)
    bool ExecuteCommand(TArray<FString> args)
    {
        const auto playerController = Gameplay::GetPlayerController(0);
        auto gothicPlayerController = Cast<AGothicPlayerControllerBase>(playerController);
        if(gothicPlayerController == nullptr)
            return false;

        gothicPlayerController.Cheat_ToggleDebugMovement();
        m_IsFlyActive = gothicPlayerController.IsCheatDebugMovementEnabled();
             
        return true;
    }

    UFUNCTION(BlueprintOverride)
    void PrintUI()
    {
        ImGui::Text("Fly makes the player completely free to move flying.");
        if (ImGui::Checkbox("Is fly active", m_IsFlyActive))
        {
            TArray<FString> arguments;
            ExecuteCommand(arguments);
        }
    }

    UFUNCTION(BlueprintOverride)
    void Reset()
    {
        m_IsFlyActive = false;
        const auto playerController = Gameplay::GetPlayerController(0);
        auto gothicPlayerController = Cast<AGothicPlayerControllerBase>(playerController);
        if(gothicPlayerController == nullptr)
            return;

        if(gothicPlayerController.IsCheatDebugMovementEnabled())
            gothicPlayerController.Cheat_ToggleDebugMovement();
    }
}
