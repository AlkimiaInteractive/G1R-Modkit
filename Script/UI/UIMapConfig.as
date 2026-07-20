namespace G1R
{
    // ------------------------------------------------------- //
    // --------------------- World Map ----------------------- //
    // ------------------------------------------------------- //

    // ------------------- Item Versions --------------------- //
    class UUIMapConfigWorld : UUIMapConfigDefinition
    {
        default MapTag = GameplayTag::Area;
        default UICustomSize = FVector2D(1600, 900);
        default MapOffsetTexture = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/ManagementUI/Map/T_Map_Overworld_CorrectionTexture.T_Map_Overworld_CorrectionTexture");
    }

    class UUIMapConfigOldMine : UUIMapConfigWorld
    {
        default MapTexture = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/ManagementUI/Map/T_Map_Overworld_OldMine.T_Map_Overworld_OldMine");
        default MapVersion = 1;
        default NeededItemsClasses.Add(UItWr_Map_OldMine);
    }

    class UUIMapConfigCliff : UUIMapConfigWorld
    {
        default MapTexture = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/ManagementUI/Map/T_Map_Overworld_Cliff.T_Map_Overworld_Cliff");
        default MapVersion = 1;
        default NeededItemsClasses.Add(UItWr_Map_Cliff);
    }

    class UUIMapConfigOldMineSC : UUIMapConfigWorld
    {
        default MapTexture = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/ManagementUI/Map/T_Map_OldMineSC.T_Map_OldMineSC");
        default MapVersion = 1;
        default NeededItemsClasses.Add(UItWr_Map_OldMineSC);
    }
    
    class UUIMapConfigBoth : UUIMapConfigWorld
    {
        default MapTexture = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/ManagementUI/Map/T_Map_Overworld_Both.T_Map_Overworld_Both");
        default MapVersion = 2;
        default NeededItemsClasses.Add(UItWr_Map_Cliff);
        default NeededItemsClasses.Add(UItWr_Map_OldMine);
    }

    class UUIMapConfigBothSC : UUIMapConfigWorld
    {
        default MapTexture = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/ManagementUI/Map/T_Map_OldMineSC.T_Map_OldMineSC");
        default MapVersion = 2;
        default NeededItemsClasses.Add(UItWr_Map_Cliff);
        default NeededItemsClasses.Add(UItWr_Map_OldMineSC);
    }

    class UUIMapConfigBothOM : UUIMapConfigWorld
    {
        default MapTexture = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/ManagementUI/Map/T_Map_OldMineOCSC.T_Map_OldMineOCSC");
        default MapVersion = 2;
        default NeededItemsClasses.Add(UItWr_Map_OldMine);
        default NeededItemsClasses.Add(UItWr_Map_OldMineSC);
    }

    class UUIMapConfigAllPartial : UUIMapConfigWorld
    {
        default MapTexture = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/ManagementUI/Map/T_Map_OldMineOCSC.T_Map_OldMineOCSC");
        default MapVersion = 3;
        default NeededItemsClasses.Add(UItWr_Map_OldMine);
        default NeededItemsClasses.Add(UItWr_Map_OldMineSC);
        default NeededItemsClasses.Add(UItWr_Map_Cliff);
    }

    class UUIMapConfigLighthouse : UUIMapConfigWorld
    {
        default MapTexture = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/ManagementUI/Map/T_Map_Focus.T_Map_Focus");
        default MapVersion = 4;
        default NeededItemsClasses.Add(UItWr_Map_Lighthouse);
    }

    class UUIMapConfigFocus : UUIMapConfigWorld
    {
        default MapTexture = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/ManagementUI/Map/T_Map_Focus.T_Map_Focus");
        default MapVersion = 4;
        default NeededItemsClasses.Add(UItWr_Map_Focus);
    }

    class UUIMapConfigWorldHuman : UUIMapConfigWorld
    {
        default MapTexture = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/ManagementUI/Map/T_Map_Overworld.T_Map_Overworld");
        default MapVersion = 5;
        default NeededItemsClasses.Add(UItWr_Map_World);
    }

    class UUIMapConfigLighthouseComplete : UUIMapConfigWorld
    {
        default MapTexture = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/ManagementUI/Map/T_Map_FocusComplete.T_Map_FocusComplete");
        default MapVersion = 6;
        default NeededItemsClasses.Add(UItWr_Map_Lighthouse);
        default NeededItemsClasses.Add(UItWr_Map_WorldComplete);

    }

    class UUIMapConfigWorldComplete : UUIMapConfigWorld
    {
        default MapTexture = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/ManagementUI/Map/T_Map_Overworld_Complete.T_Map_Overworld_Complete");
        default MapVersion = 7;
        default NeededItemsClasses.Add(UItWr_Map_World);
        default NeededItemsClasses.Add(UItWr_Map_WorldComplete);
    }

#ifdef WITH_STORY_G1R
    // ------------------- Event Versions -------------------- //

namespace Quest
{
    class UUIMapLayerOldMineRoute : UUIMapLayerDefinition
    {
    #ifdef WITH_STORY_G1R
    // The name that will appear on the map to select the layer
    default m_Name = "MapLayer_OldMineRoute";

    // The tag associated with a map
    default m_MapTags.AddTag(GameplayTag::Area);

    // The quest that will show the layer.
    default m_ShowLayerQuestClass = UQuest_OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_MAP;

    // The states of the quest that will show the layer.
    default m_ShowLayerQuestStates.Add(EQuestState::Running);

    // The quest that will hide the layer.
    default m_HideLayerQuestClass = UQuest_OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_MAP;

    // The states of the quest that will hide the layer.
    default m_HideLayerQuestStates.Add(EQuestState::Succeeded);
    #endif   
    }

    class UUIMapLayerMandiblesOldMine : UUIMapLayerDefinition
    {
    #ifdef WITH_STORY_G1R
    // The name that will appear on the map to select the layer
    default m_Name = "MapLayer_MandiblesOldMine";

    // The tag associated with a map
    default m_MapTags.AddTag(GameplayTag::Area);

    // The quest that will show the layer.
    default m_ShowLayerQuestClass = UQuest_SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_MAP;

    // The states of the quest that will show the layer.
    default m_ShowLayerQuestStates.Add(EQuestState::Running);

    // The quest that will hide the layer.
    default m_HideLayerQuestClass = UQuest_SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_MAP;

    // The states of the quest that will hide the layer.
    default m_HideLayerQuestStates.Add(EQuestState::Succeeded);
    #endif
    }

    class UUIMapLayerFocusRoute : UUIMapLayerDefinition
    {
    #ifdef WITH_STORY_G1R
    // The name that will appear on the map to select the layer
    default m_Name = "MapLayer_FocusRoute";

    // The tag associated with a map
    default m_MapTags.AddTag(GameplayTag::Area);

    // The quest that will show the layer.
    default m_ShowLayerQuestClass = UQuest_SwampCamp_SCCHAPTER2_FOCUS_FOCUS_MAP;

    // The states of the quest that will show the layer.
    default m_ShowLayerQuestStates.Add(EQuestState::Running);

    // The quest that will hide the layer.
    default m_HideLayerQuestClass = UQuest_SwampCamp_SCCHAPTER2_FOCUS_FOCUS_MAP;

    // The states of the quest that will hide the layer.
    default m_HideLayerQuestStates.Add(EQuestState::Succeeded);
    #endif
    }

    class UUIMapLayerLighthouse : UUIMapLayerDefinition
    {
    #ifdef WITH_STORY_G1R
   	// The name that will appear on the map to select the layer
    default m_Name = "MapLayer_Lighthouse";

    // The tag associated with a map
    default m_MapTags.AddTag(GameplayTag::Area);

    // The quest that will show the layer.
    default m_ShowLayerQuestClass = UQuest_NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP_LIGHTHOUSE;

    // The states of the quest that will show the layer.
    default m_ShowLayerQuestStates.Add(EQuestState::Running);

    // The quest that will hide the layer.
    default m_HideLayerQuestClass = UQuest_NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP_LIGHTHOUSE;

    // The states of the quest that will hide the layer.
    default m_HideLayerQuestStates.Add(EQuestState::Succeeded);
    #endif
    }

    class UUIMapLayerFocusStones : UUIMapLayerDefinition
    {
    #ifdef WITH_STORY_G1R
    // The name that will appear on the map to select the layer
    default m_Name = "MapLayer_FocusStones";

    // The tag associated with a map
    default m_MapTags.AddTag(GameplayTag::Area);

    // The quest that will show the layer.
    default m_ShowLayerQuestClass = UQuest_NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP; // TODO: Re-enable after quest was actually created by dialog import
    
    // The states of the quest that will show the layer.
    default m_ShowLayerQuestStates.Add(EQuestState::Running);

    // The quest that will hide the layer.
    default m_HideLayerQuestClass = UQuest_NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP; // TODO: Re-enable after quest was actually created by dialog import

    // The states of the quest that will hide the layer.
    default m_HideLayerQuestStates.Add(EQuestState::Succeeded);
    #endif
    }
}
#endif

    // ------------------------------------------------------- //
    // --------------------- Area Maps ----------------------- //
    // ------------------------------------------------------- //

    class UUIMapConfigOldCamp : UUIMapConfigDefinition
    {
        default MapTag = GameplayTag::Area_OldCamp;
        default MapTexture = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/ManagementUI/Map/T_Map_OldCamp.T_Map_OldCamp");
        default MapOffsetTexture = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/ManagementUI/Map/T_Map_OldCamp_CorrectionTexture.T_Map_OldCamp_CorrectionTexture");
        default NeededItemsClasses.Add(UItWr_Map_OldCamp);
    }

    class UUIMapConfigNewCamp : UUIMapConfigDefinition
    {
        default MapTag = GameplayTag::Area_NewCamp;
        default MapTexture = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/ManagementUI/Map/T_Map_NewCamp.T_Map_NewCamp");
        default MapOffsetTexture = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/ManagementUI/Map/T_Map_NewCamp_CorrectionTexture.T_Map_NewCamp_CorrectionTexture");
        default NeededItemsClasses.Add(UItWr_Map_NewCamp);
    }

    class UUIMapConfigSwampCamp : UUIMapConfigDefinition
    {
        default MapTag = GameplayTag::Area_SwampCamp;
        default MapTexture = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/ManagementUI/Map/T_Map_SwampCamp.T_Map_SwampCamp");
        default MapOffsetTexture = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/ManagementUI/Map/T_Map_SwampCamp_CorrectionTexture.T_Map_SwampCamp_CorrectionTexture");
        default NeededItemsClasses.Add(UItWr_Map_SwampCamp);
    }

    class UUIMapConfigOrcCamp : UUIMapConfigDefinition
    {
        default MapTag = GameplayTag::Area_OrcEnclave;
        default MapTexture = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/ManagementUI/Map/T_Map_OrcCamp.T_Map_OrcCamp");
        default MapOffsetTexture = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/ManagementUI/Map/T_Map_OrcCamp_CorrectionTexture.T_Map_OrcCamp_CorrectionTexture");
        default NeededItemsClasses.Add(UItWr_Map_Orc);
    }

    class UUIMapConfigSleepersTemple : UUIMapConfigDefinition
    {
        default MapTag = GameplayTag::Area_SleeperTemple;
        default MapTexture = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/ManagementUI/Map/T_Map_SleepersTemple.T_Map_SleepersTemple");
        default MapOffsetTexture = TSoftObjectPtr<UTexture2D>(n"/Game/UI/Textures/ManagementUI/Map/T_Map_SleepersTemple_CorrectionTexture.T_Map_SleepersTemple_CorrectionTexture");
        default NeededItemsClasses.Add(UItWr_Map_Temple);
    }
}
