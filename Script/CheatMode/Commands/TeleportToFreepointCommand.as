class UTeleportToFreepointCommand : UCheatCommandWithPartitionStreamingProvider 
{
    default CommandName = "TeleportToFreepoint";
    default CommandUsage = "TeleportToF freepoint";

    default Category = ECheatModeCategory::Cheats;
    default PositionPriority = 11;

    FInteractionSpotHandle m_SelectedSpot;
    UPROPERTY()
    FString Filter;

    UFUNCTION(BlueprintOverride)
    bool ExecuteCommand(TArray<FString> args)
    {
        if (args.Num() < 1)
		    return false;
	    
        if(!m_SelectedSpot.IsSet())
        {
            auto interactionSpots = UCheatModeHelper::GetAllInteractionSpots();
            for(auto spot : interactionSpots)
            {
                if(spot.SpotName.IsEqual(FName(args[0])))
                    m_SelectedSpot = spot;
            }
        }

        if(!m_SelectedSpot.IsSet())
            return false;

        auto location = UCheatModeHelper::GetLocationAndLoadDatalayerGivenASpotHandle(m_SelectedSpot);
        
        if(location.IsZero())
            return false;

        FOnStreamingCompleteDelegate delegate;
        delegate.BindUFunction(this, n"OnMapLoaded");
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
        auto interactionSpots = UCheatModeHelper::GetAllInteractionSpots();

        m_SelectedSpot = ImGui::ImGuiFreepointDefinitionSelection("Available Teleport Spots", interactionSpots, m_SelectedSpot, Filter);
       
        if(!UCheatModeHelper::CanPlayerTeleport())
        {
            return;
        }

        if (ImGui::Button("Teleport"))
        {
            TArray<FString> arguments;
            arguments.Add(m_SelectedSpot.SpotName.ToString());
            ExecuteCommand(arguments);
        }
    }
}
