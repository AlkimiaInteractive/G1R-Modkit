class UQuestCommand : UCheatCommandBase 
{
    default CommandName = "Quest";
    default CommandUsage = "Quest";

    default Category = ECheatModeCategory::StoryAndEnvironment;
    default PositionPriority = 4;
    
    UFUNCTION(BlueprintOverride)
    bool ExecuteCommand(TArray<FString> args)
    {
        return true;
    }

    UFUNCTION(BlueprintOverride)
    void PrintUI()
    {
        auto world = Gameplay::GetPlayerCharacter(0).GetWorld();   
        ImGui::ImGuiDisplayQuests(world);
    }
}