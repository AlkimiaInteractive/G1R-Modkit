class UChangeWeatherCommand : UCheatCommandBase 
{
    default CommandName = "Change Weather";
    default CommandUsage = "ChangeWeather";

    default Category = ECheatModeCategory::StoryAndEnvironment;
    default PositionPriority = 2;

    UFUNCTION(BlueprintOverride)
    bool ExecuteCommand(TArray<FString> args)
    {
        // const auto playerController = Gameplay::GetPlayerController(0);
        // auto gothicPlayerController = Cast<AGothicPlayerControllerBase>(playerController);
        // if(gothicPlayerController == nullptr)
        //     return false;

        // gothicPlayerController.Cheat_ToggleDebugMovement();
        
        return true;
    }

    UFUNCTION(BlueprintOverride)
    void PrintUI()
    {
        //#if WITH_IMGUI
        // ImGui::Text("Fly makes the player completely free to move flying.");
        // if (ImGui::Checkbox("Is fly active", m_IsFlyActive))
        //     {
        //         TArray<FString> arguments;
        //         ExecuteCommand(arguments);
        //     }
        auto world = Gameplay::GetPlayerCharacter(0).GetWorld();
        ImGui::ImGuiDisplayGameWeather(world);
        
        //#endif
    }
}
