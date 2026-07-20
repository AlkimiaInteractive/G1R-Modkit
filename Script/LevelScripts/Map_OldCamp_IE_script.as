class UOC_IE_VanLange_1400_WP : UWorldPointScript
{
    UPROPERTY()
    FName m_SaveValue = n"OC_IE_VanLange_1400_WP";

    UFUNCTION()
    void OnIE_VanLangeSpawn()
    {
        float32 value = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveValue, value);
        if(bLoaded)
        {
            if(value > 0.9f)
                return;
        }
        SpawnAIAgent(USpawnAIAgentDefinition_OC_IE_VanLange_1400::StaticClass(), dailyRoutine = UDailyRoutine_OC_IE_VanLange_1400_Start());
        AG1RGameState::SaveWorldFloatData(World, m_SaveValue, 1.f);
    }
};

class UOC_IE_Unicorn_WP : UWorldPointScript
{
    UPROPERTY()
    FName m_SaveValue = n"OC_IE_Unicorn_WP";

    UFUNCTION()
    void OnIE_UnicornSpawn()
    {
        float32 value = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveValue, value);
        if(bLoaded)
        {
            if(value > 0.9f)
                return;
        }
        SpawnAIAgent(USpawnAIAgentDefinition_OC_IE_Unicorn::StaticClass(), dailyRoutine = UDailyRoutine_OC_IE_Unicorn_Start());
        AG1RGameState::SaveWorldFloatData(World, m_SaveValue, 1.f);
    }
};


class UOC_IE_Steve_WP : UWorldPointScript
{
    UPROPERTY()
    FName m_SaveValue = n"OC_IE_Steve_WP";

    UFUNCTION()
    void OnIE_SteveSpawn()
    {
        float32 value = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveValue, value);
        if(bLoaded)
        {
            if(value > 0.9f)
                return;
        }
        SpawnAIAgent(USpawnAIAgentDefinition_OC_IE_Steve::StaticClass(), dailyRoutine = UDailyRoutine_OC_IE_Steve_Start());
        AG1RGameState::SaveWorldFloatData(World, m_SaveValue, 1.f);
    }
};


class UOC_IE_Specki_1401_WP : UWorldPointScript
{
    UPROPERTY()
    FName m_SaveValue = n"OC_IE_Specki_1401_WP";

    UFUNCTION()
    void OnIE_SpeckiSpawn()
    {
        float32 value = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveValue, value);
        if(bLoaded)
        {
            if(value > 0.9f)
                return;
        }
        SpawnAIAgent(USpawnAIAgentDefinition_OC_IE_Specki_1401::StaticClass(), dailyRoutine = UDailyRoutine_OC_IE_Specki_1401_Start());
        AG1RGameState::SaveWorldFloatData(World, m_SaveValue, 1.f);
    }
};



class UOC_IE_Lutter_WP : UWorldPointScript
{
    UPROPERTY()
    FName m_SaveValue = n"OC_IE_Lutter_WP";

    UFUNCTION()
    void OnIE_LutterSpawn()
    {
        float32 value = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveValue, value);
        if(bLoaded)
        {
            if(value > 0.9f)
                return;
        }
        SpawnAIAgent(USpawnAIAgentDefinition_OC_IE_Lutter::StaticClass(), dailyRoutine = UDailyRoutine_OC_IE_Lutter_Start());
        AG1RGameState::SaveWorldFloatData(World, m_SaveValue, 1.f);
    }
};

class UOC_IE_Flex_WP : UWorldPointScript
{
    UPROPERTY()
    FName m_SaveValue = n"OC_IE_Flex_WP";

    UFUNCTION()
    void OnIE_FlexSpawn()
    {
        float32 value = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveValue, value);
        if(bLoaded)
        {
            if(value > 0.9f)
                return;
        }
        SpawnAIAgent(USpawnAIAgentDefinition_OC_IE_Flex::StaticClass(), dailyRoutine = UDailyRoutine_OC_IE_Flex_Start());
        AG1RGameState::SaveWorldFloatData(World, m_SaveValue, 1.f);
    }
};


class UOC_IE_DrPymonte_WP : UWorldPointScript
{
    UPROPERTY()
    FName m_SaveValue = n"OC_IE_DrPymonte_WP";

    UFUNCTION()
    void OnIE_DRPymonteSpawn()
    {
        float32 value = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveValue, value);
        if(bLoaded)
        {
            if(value > 0.9f)
                return;
        }
        SpawnAIAgent(USpawnAIAgentDefinition_OC_IE_DrPymonte::StaticClass(), dailyRoutine = UDailyRoutine_OC_IE_DrPymonte_Start());
        AG1RGameState::SaveWorldFloatData(World, m_SaveValue, 1.f);
    }
};