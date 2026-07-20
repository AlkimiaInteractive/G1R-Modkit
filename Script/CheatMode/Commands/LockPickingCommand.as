class ULockPickingCommand : UCheatCommandBase 
{
    default CommandName = "LockPicking";
    default CommandUsage = "LockPicking";

    default Category = ECheatModeCategory::Cheats;
    default PositionPriority = 4;

    UFUNCTION(BlueprintOverride)
    bool ExecuteCommand(TArray<FString> args)
    {
        auto world = Gameplay::GetPlayerCharacter(0).GetWorld();   
        UCheatModeHelper::OpenLock(world);
        return true;
    }

    UFUNCTION(BlueprintOverride)
    void PrintUI()
    {
        ImGui::Text("Press this button while in the lockpicking minigame to automatically solve it.");
        if (ImGui::Button("Unlock"))
        {
            TArray<FString> arguments;
            ExecuteCommand(arguments);
        }
    }
}