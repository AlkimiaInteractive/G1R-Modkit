class USpawnCharacterCommand : UCheatCommandBase 
{
    default CommandName = "SpawnCharacter";
    default CommandUsage = "SpawnCharacter code";

    default Category = ECheatModeCategory::Cheats;
    default PositionPriority = 8;

    UPROPERTY()
    FString Filter;
    UPROPERTY()
    TSubclassOf<USpawnAIAgentDefinition> m_SelectedSpawnDefinition;
    UPROPERTY()
    FTransform m_SpawnTransform;
    
    UPROPERTY()
    float32 m_RotationAngle;
    UPROPERTY()
    float32 m_DistanceToSpawn = 2;

    UFUNCTION(BlueprintOverride)
    bool ExecuteCommand(TArray<FString> args)
    {
        if (args.Num() < 2)
		    return false;
	 
        if(m_SelectedSpawnDefinition == nullptr)
        {
            const auto spawnableCharacters = UCheatModeHelper::GetAllSpawnableCharacters(Filter);

            for (auto agentDefinition : spawnableCharacters)
            {
                if (agentDefinition.GetName() == args[0])
                {
                    m_SelectedSpawnDefinition = agentDefinition.GetClass();
                }
            }
        }

        if(m_SelectedSpawnDefinition == nullptr)
            return false;

        //@DE - logic to get location from args
        FVector location;
        bool success = false;
        ImGui::Conv_StringToVector(args[1], location, success);
        if(!success)
            return false;
                
        //if(location == FVector::ZeroVector)
        //    return false;
        
        UCheatModeHelper::SpawnNPC("MarvinMode", m_SelectedSpawnDefinition.Get(), UDailyRoutine_Empty::StaticClass(), FTransform(location));
        
        return true;
    }

    UFUNCTION(BlueprintOverride)
    void PrintUI()
    {
        //#if WITH_IMGUI
        auto spawnableCharacters = UCheatModeHelper::GetAllSpawnableCharacters(Filter);
        //ImGui::Text("Select the character definition");
        
        m_SelectedSpawnDefinition = ImGui::ImGuiCharacterSpawningDefinitionSelection("Select Character Definition", spawnableCharacters, m_SelectedSpawnDefinition, Filter);        
        m_SpawnTransform = ImGui::GetSpawnTransform(Gameplay::GetPlayerCharacter(0), m_RotationAngle, m_DistanceToSpawn);    
        if (ImGui::Button("Spawn"))
        {
            TArray<FString> m_Arguments;
            m_Arguments.Add(m_SelectedSpawnDefinition.GetDefaultObject().GetName().ToString());
            m_Arguments.Add(m_SpawnTransform.GetLocation().ToString());
            ExecuteCommand(m_Arguments);
        }
        //ImGui::EndTabBar();
        //#endif
    }
}