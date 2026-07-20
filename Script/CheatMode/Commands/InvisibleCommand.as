class UInvisibleCommand : UCheatCommandBase 
{
    default CommandName = "Invisible";
    default CommandUsage = "Invisible 1|0";

    default Category = ECheatModeCategory::Cheats;
    default PositionPriority = 3;

    bool m_IsInvisible = false;


    UInvisibleCommand()
    {
        m_IsInvisible = UPerceptionSystem::DebugGetIgnorePlayerPerceptionsRef();
    }

    UFUNCTION(BlueprintOverride)
    bool ExecuteCommand(TArray<FString> args)
    {
        if (args.Num() < 1)
		    return false;
        //System::ExecuteConsoleCommand("Gothic.IgnorePlayerPerceptions " + args[0]);
        m_IsInvisible = args[0].ToBool();
        UPerceptionSystem::DebugGetIgnorePlayerPerceptionsRef() = m_IsInvisible;
        return true;
    }

    UFUNCTION(BlueprintOverride)
    void PrintUI()
    {
        //#if WITH_IMGUI
        ImGui::Text("Invisible makes the player completely invisible to npcs perception system.");
        if (ImGui::Checkbox("Is Invisible", m_IsInvisible))
            {
                auto argument ="1";
                if(!m_IsInvisible)
                    argument = "0";
                TArray<FString> arguments;
                arguments.Add(argument);
                ExecuteCommand(arguments);
            }
        
        //#endif
    }

    UFUNCTION(BlueprintOverride)
    void Reset()
    {
        TArray<FString> arguments;
        arguments.Add("0");
        ExecuteCommand(arguments);
    }
}
