class UCharacterInfoCommand : UCheatCommandBase 
{
    default CommandName = "CharacterInfo";
    default CommandUsage = "CharacterInfo";

    default Category = ECheatModeCategory::Characters;
    default PositionPriority = 5;

    int infoLevel = 0;

    UFUNCTION(BlueprintOverride)
    bool ExecuteCommand(TArray<FString> args)
    {
        
        return true;
    }

    UFUNCTION(BlueprintOverride)
    void PrintUI()
    {
        auto world = Gameplay::GetPlayerCharacter(0).GetWorld();

        ImGui::SliderInt("Info level", infoLevel, 0, 3);
        ImGui::ImGuiDisplayCharacterInfo(world, infoLevel);
    }
}