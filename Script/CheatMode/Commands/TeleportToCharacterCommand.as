class UTeleportToCharacterCommand : UCheatCommandWithPartitionStreamingProvider 
{
    default CommandName = "TeleportToCharacter";
    default CommandUsage = "TeleportToC characterCode";

    default Category = ECheatModeCategory::Cheats;
    default PositionPriority = 10;

    UPROPERTY()
    APlayerState m_SelectedCharacter = nullptr;
    UPROPERTY()
    FString Filter;

    FOnStreamingCompleteDelegate m_OnStreamingCompleteDelegate;
    
    UTeleportToCharacterCommand()
    {
        if(!m_OnStreamingCompleteDelegate.IsBound())
            m_OnStreamingCompleteDelegate.BindUFunction(this, n"OnMapLoaded");
    }

    UFUNCTION(BlueprintOverride)
    bool ExecuteCommand(TArray<FString> args)
    {
        if (args.Num() < 1)
		    return false;
	 
        if(m_SelectedCharacter == nullptr)
        {
            const auto characters = UCheatModeHelper::GetAllCharactersStates(Filter);

            for (AGothicCharacterState characterState : characters)
            {
                if (characterState.GetCharacterGlobalId() == args[0])
                {
                    m_SelectedCharacter = characterState;
                }
            }
        }

        if(m_SelectedCharacter != nullptr)
        {
            LoadStreamingMap(m_OnStreamingCompleteDelegate, m_SelectedCharacter.GetActorLocation());
            return true;
        }

        return false;
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
        
        //ImGui::Text("Select Character to teleport to:");         
        m_SelectedCharacter = ImGui::ImGuiCharacterSelection("Select Character to teleport to:", UCheatModeHelper::GetAllCharactersStates(Filter), m_SelectedCharacter, Filter);
        
        const auto selectedCharacter = Cast<AGothicCharacterState>(m_SelectedCharacter);

        if(!UCheatModeHelper::CanPlayerTeleport())
        {
            return;
        }

        if (ImGui::Button("Teleport"))
        {
            TArray<FString> arguments;
            arguments.Add(selectedCharacter.GetCharacterGlobalId().ToString());
            ExecuteCommand(arguments);
        }
    }
}
