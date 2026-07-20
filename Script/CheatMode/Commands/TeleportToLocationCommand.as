class UTeleportToLocationCommand : UCheatCommandWithPartitionStreamingProvider 
{
    default CommandName = "TeleportToLocation";
    default CommandUsage = "TeleportToL X Y Z";

    default Category = ECheatModeCategory::Cheats;
    default PositionPriority = 12;

    float32 X = 0.0f, Y = 0.0f, Z = 0.0f;

    UFUNCTION(BlueprintOverride)
    bool ExecuteCommand(TArray<FString> args)
    {
        if (args.Num() < 3)
		    return false;
	
        FOnStreamingCompleteDelegate delegate;
        delegate.BindUFunction(this, n"OnMapLoaded");
        
        auto location = UCheatModeHelper::ConvertStringToVector(args);
        
        LoadStreamingMap(delegate, location);

        return true;
    }

    UFUNCTION()
    void OnMapLoaded(FVector location)
    {
        UCheatModeHelper::TeleportTo(location);
    }

    UFUNCTION(BlueprintOverride)
    void PrintUI()
    {
        ImGui::Separator();
        ImGui::Text("Enter coordinates to teleport to:");

        ImGui::InputFloat("X:", X);
        ImGui::InputFloat("Y:", Y);
        ImGui::InputFloat("Z:", Z);

        if(!UCheatModeHelper::CanPlayerTeleport())
        {
            return;
        }

        if (ImGui::Button("Teleport"))
        {
            TArray<FString> m_Arguments;
            m_Arguments.Add(FString(f"{X}"));
            m_Arguments.Add(FString(f"{Y}"));
            m_Arguments.Add(FString(f"{Z}"));
            ExecuteCommand(m_Arguments);
        }

        const auto player = Gameplay::GetPlayerCharacter(0);
        if(player == nullptr)
            return;

        ImGui::Text("Player world coordinates: ");
        ImGui::SameLine();
        ImGui::Text(player.GetActorLocation().ToString());

        if(ImGui::Button("Copy coordinates to clipboard"))
        {
            ImGui::CopyVectorToClipboard(player.GetActorLocation());
        }
    }
}
