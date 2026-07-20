class UStoryVariablesCommand : UCheatCommandBase 
{
    default CommandName = "StoryVariables";
    default CommandUsage = "StoryVariables";

    default Category = ECheatModeCategory::StoryAndEnvironment;
    default PositionPriority = 5;
    
    UFUNCTION(BlueprintOverride)
    bool ExecuteCommand(TArray<FString> args)
    {
        return true;
    }

    UFUNCTION(BlueprintOverride)
    void PrintUI()
    {
        auto world = Gameplay::GetPlayerCharacter(0).GetWorld();
        ImGui::ImGuiDisplayStoryVariables(world);
    }
}