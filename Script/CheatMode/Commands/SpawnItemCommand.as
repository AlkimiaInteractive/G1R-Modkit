class USpawnItemCommand : UCheatCommandBase 
{
    default CommandName = "SpawnItem";
    default CommandUsage = "SpawnItem code";

    default Category = ECheatModeCategory::Cheats;
    default PositionPriority = 9;

    UPROPERTY()
    TSubclassOf<UItemDefinition> m_SelectedItem;
    UPROPERTY()
    FString Filter;

    int m_NumSpawns = 1;
    
    TArray<FString> m_Arguments;

    UFUNCTION(BlueprintOverride)
    bool ExecuteCommand(TArray<FString> args)
    {
        if (args.Num() < 2 || args.Num() > 3)
		    return false;

        if(m_SelectedItem == nullptr)
        {
            const auto spawnableItems = UCheatModeHelper::GetAllSpawnableItems();

            for (auto item : spawnableItems)
            {
                if (args[0] == item.GetNameAsString())
                {
                    m_SelectedItem = item.GetClass();
                }
            }
        }
        
        if(m_SelectedItem == nullptr)
            return false;

        int numSpawns = UCheatModeHelper::ConvertStringToInteger(args[1]);

        if(args.Num() == 2)
        {
            const auto location = UCheatModeHelper::GetPlayerFrontLocationAtDistance(100);
            const auto itemClass = FAssetPreload::BlockingLoad(m_SelectedItem.GetDefaultObject().m_ItemVisualWorld);
            if(itemClass == nullptr)
                return false;
            
            for(int i=0; i < numSpawns; ++i)
                UCheatModeHelper::SpawnActor(itemClass, location,FRotator::ZeroRotator, Gameplay::GetPlayerCharacter(0));
        }
        else
        {
            auto world = Gameplay::GetPlayerCharacter(0).GetWorld();
            UCheatModeHelper::AddItemsToInventory(world, m_SelectedItem, numSpawns);
        }

        return true;
    }

    UFUNCTION(BlueprintOverride)
    void PrintUI()
    {
        //#if WITH_IMGUI
    
        const auto items = UCheatModeHelper::GetAllSpawnableItems(Filter);

        //ImGui::Text("Select the item definition");
        
        m_SelectedItem = ImGui::ImGuiItemDefinitionSelection("Select item Definition", items, m_SelectedItem, Filter);        
       
        ImGui::SliderInt("Spawn Count", m_NumSpawns, 1, 100);

        if (ImGui::Button("Spawn"))
        {
            m_Arguments.Reset();
            m_Arguments.Add(m_SelectedItem.GetDefaultObject().GetName().ToString());
            m_Arguments.Add(UCheatModeHelper::ConvertIntToString(m_NumSpawns));
            ExecuteCommand(m_Arguments);
        }
        if (ImGui::Button("Add to the inventory"))
        {
            m_Arguments.Reset();
            m_Arguments.Add(m_SelectedItem.GetDefaultObject().GetName().ToString());
            m_Arguments.Add(UCheatModeHelper::ConvertIntToString(m_NumSpawns));
            m_Arguments.Add("AddToTheInventoryParam");
            ExecuteCommand(m_Arguments);
        }
        //#endif
    }
}