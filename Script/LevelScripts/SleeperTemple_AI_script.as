class UST_Skeleton_SPAWN017_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass(),UDailyRoutine_Skeleton_SleeperTemple());
    }
};

class UST_SkeletonScout_SPAWN020_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SkeletonScout::StaticClass(),UDailyRoutine_Skeleton_SleeperTemple());
    }
};

class UST_SkeletonWarrior_SPAWN022_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SkeletonWarrior::StaticClass(), UDailyRoutine_Skeleton_SleeperTemple());
    }
};

class UST_Skeleton_SPAWN022_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass(), UDailyRoutine_Skeleton_SleeperTemple());
    }
};

class UST_Skeleton_SPAWN027_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass(), UDailyRoutine_Skeleton_SleeperTemple());
        SpawnAIAgent(USpawnAIAgentDefinition_SkeletonScout::StaticClass(), UDailyRoutine_Skeleton_SleeperTemple());
    }
};

class UST_Skeleton_SPAWN028_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass(), UDailyRoutine_Skeleton_SleeperTemple());
    }
};

class UST_SkeletonScout_SPAWN030_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SkeletonScout::StaticClass(), UDailyRoutine_Skeleton_SleeperTemple());
    }
};

class UST_SkeletonWarrior_SPAWN030_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SkeletonWarrior::StaticClass(), UDailyRoutine_Skeleton_SleeperTemple());
    }
};

class UST_SkeletonMage_SPAWN031_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SkeletonMage2::StaticClass(), UDailyRoutine_Skeleton_SleeperTemple());
    }
};

class UST_Skeleton_SPAWN034_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass(), UDailyRoutine_Skeleton_SleeperTemple());
    }
};

class UST_SkeletonWarrior_SPAWN035_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SkeletonWarrior::StaticClass(), UDailyRoutine_Skeleton_SleeperTemple());
    }
};

class UST_Skeleton_SPAWN045_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass(), UDailyRoutine_Skeleton_SleeperTemple());
        SpawnAIAgent(USpawnAIAgentDefinition_SkeletonScout::StaticClass(), UDailyRoutine_Skeleton_SleeperTemple());
        SpawnAIAgent(USpawnAIAgentDefinition_SkeletonWarrior::StaticClass(), UDailyRoutine_Skeleton_SleeperTemple());


    }
};

class UST_SkeletonMage_SPAWN046_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SkeletonMage3::StaticClass(), UDailyRoutine_Skeleton_SleeperTemple());
    }
};


class UST_Skeleton_SPAWN047_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass(), UDailyRoutine_Skeleton_SleeperTemple());
        SpawnAIAgent(USpawnAIAgentDefinition_SkeletonWarrior::StaticClass(), UDailyRoutine_Skeleton_SleeperTemple());
    }
};

class UST_Skeleton_SPAWN051_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass(), UDailyRoutine_Skeleton_SleeperTemple());
        SpawnAIAgent(USpawnAIAgentDefinition_SkeletonScout::StaticClass(), UDailyRoutine_Skeleton_SleeperTemple());
        SpawnAIAgent(USpawnAIAgentDefinition_SkeletonWarrior::StaticClass(), UDailyRoutine_Skeleton_SleeperTemple());
    }
};

class UST_Skeleton_SPAWN412_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SkeletonWarrior::StaticClass(), UDailyRoutine_Skeleton_SleeperTemple());
        SpawnAIAgent(USpawnAIAgentDefinition_Skeleton::StaticClass(), UDailyRoutine_Skeleton_SleeperTemple());
    }
};

class UST_UndeadOrcTemple_SPAWN02_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_UOW_UndeadOrcTempleGuard16_3015::StaticClass(), UDailyRoutine_Undead_Orc_SleeperTemple());
    }
};

class UWP_TST_SECONDSUBZONE_MEATBUG_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Meatbug::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Meatbug::StaticClass());
	}
};

class UWP_TST_THIRDSUBZONE_MEATBUG_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Meatbug::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Meatbug::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_Meatbug::StaticClass());
	}
};

class UST_SkeletonScout_SPAWN413_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SkeletonScout::StaticClass(), UDailyRoutine_Skeleton_SleeperTemple());
    }
};

class UST_SkeletonWarrior_SPAWN414_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SkeletonWarrior::StaticClass(), UDailyRoutine_Skeleton_SleeperTemple());
    }
};

class UST_MinecrawlerTemple_SPAWN066_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Temple::StaticClass(), UDailyRoutine_Minecrawler_SleeperTemple());
    }
};

class UST_MinecrawlerTemple_SPAWN069_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Temple::StaticClass(), UDailyRoutine_Minecrawler_SleeperTemple());
    }
};

class UST_MinecrawlerTemple_SPAWN076_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Temple::StaticClass(), UDailyRoutine_Minecrawler_SleeperTemple());
    }
};

class UST_MinecrawlerTemple_SPAWN0106_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Temple::StaticClass(), UDailyRoutine_Minecrawler_SleeperTemple());
        SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Temple::StaticClass(), UDailyRoutine_Minecrawler_SleeperTemple());
    }
};

class UST_MinecrawlerTemple_SPAWN229_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Temple::StaticClass(), UDailyRoutine_Minecrawler_SleeperTemple());
    }
};

class UST_MinecrawlerTemple_SPAWN235_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Temple::StaticClass(), UDailyRoutine_Minecrawler_SleeperTemple());
    }
};

class UST_MinecrawlerTemple_SPAWN405_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Temple::StaticClass(), UDailyRoutine_Minecrawler_SleeperTemple());
        SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Temple::StaticClass(), UDailyRoutine_Minecrawler_SleeperTemple());
    }
};

class UST_UndeadOrcTempleGuard_SPAWN044_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_UOW_UndeadOrcTempleGuard15_3014::StaticClass(), UDailyRoutine_Undead_Orc_SleeperTemple());
    }
};

class UST_UndeadOrcTempleGuard_SPAWN090_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_UOW_UndeadOrcTempleGuard01_3000::StaticClass(), UDailyRoutine_Undead_Orc_SleeperTemple());
    }
};

class UST_UndeadOrcTempleGuard_SPAWN01_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_UOW_UndeadOrcTempleGuard17_3033::StaticClass(), UDailyRoutine_Undead_Orc_SleeperTemple());
    }
};

class UST_UndeadOrcTempleGuard_SPAWN092_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_UOW_UndeadOrcTempleGuard02_3001::StaticClass(), UDailyRoutine_Undead_Orc_SleeperTemple());
    }
};

class UST_UndeadOrcTempleGuard_SPAWN114_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_UOW_UndeadOrcTempleGuard03_3002::StaticClass(), UDailyRoutine_Undead_Orc_SleeperTemple());
    }
};

class UST_UndeadOrcTempleGuard_SPAWN117_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_UOW_UndeadOrcTempleGuard04_3003::StaticClass(), UDailyRoutine_Undead_Orc_SleeperTemple());
    }
};

class UST_UndeadOrcTempleGuard_SPAWN121_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_UOW_UndeadOrcTempleGuard05_3004::StaticClass(), UDailyRoutine_Undead_Orc_SleeperTemple());
    }
};

class UST_UndeadOrcTempleGuard_SPAWN132_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_UOW_UndeadOrcTempleGuard06_3005::StaticClass(), UDailyRoutine_Undead_Orc_SleeperTemple());
    }
};

class UST_UndeadOrcTempleGuard_SPAWN140_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_UOW_UndeadOrcTempleGuard07_3006::StaticClass(), UDailyRoutine_Undead_Orc_SleeperTemple());
    }
};

class UST_UndeadOrcTempleGuard_SPAWN145_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_UOW_UndeadOrcTempleGuard08_3007::StaticClass(), UDailyRoutine_Undead_Orc_SleeperTemple());
    }
};

class UST_UndeadOrcTempleGuard_SPAWN148_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_UOW_UndeadOrcTempleGuard09_3008::StaticClass(), UDailyRoutine_Undead_Orc_SleeperTemple());
    }
};

class UST_UndeadOrcTempleGuard_SPAWN151_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_UOW_UndeadOrcTempleGuard10_3009::StaticClass(), UDailyRoutine_Undead_Orc_SleeperTemple());
    }
};

class UST_UndeadOrcTempleGuard_SPAWN161_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_UOW_UndeadOrcTempleGuard11_3010::StaticClass(), UDailyRoutine_Undead_Orc_SleeperTemple());
    }
};

class UST_UndeadOrcTempleGuard_SPAWN258_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_UOW_UndeadOrcTempleGuard12_3011::StaticClass(), UDailyRoutine_Undead_Orc_SleeperTemple());
    }
};

class UST_UndeadOrcTempleGuard_SPAWN263_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_UOW_UndeadOrcTempleGuard13_3012::StaticClass(), UDailyRoutine_Undead_Orc_SleeperTemple());
    }
};

class UST_UndeadOrcTempleGuard_SPAWN294_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_UOW_UndeadOrcTempleGuard14_3013::StaticClass(), UDailyRoutine_Undead_Orc_SleeperTemple());
    }
};

class UST_Skeleton_Winch_Chamber : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SH_Skeleton::StaticClass(), UDailyRoutine_Skeleton_SleeperTemple());
    }
};

class UST_Templar_SPAWN110_WP : UWorldPointScript
{
	UFUNCTION()
    void OnSleeperTempleTaken()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_TPL_GorBoba_1455::StaticClass(), UDailyRoutine_ST_TPL_GorBoba_1455_Start());
    }
};

class UST_Templar_SPAWN139_WP : UWorldPointScript
{
	UFUNCTION()
    void OnSleeperTempleTaken()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_TPL_Templar01_1447::StaticClass(), UDailyRoutine_OG_TPL_Templar01_1443_Start());
    }
};

class UST_Templar_SPAWN152_WP : UWorldPointScript
{
	UFUNCTION()
    void OnSleeperTempleTaken()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_TPL_Templar02_1448::StaticClass(), UDailyRoutine_OG_TPL_Templar02_1444_Start());
    }
};

class UST_Templar_SPAWN310_WP : UWorldPointScript
{
	UFUNCTION()
    void OnSleeperTempleTaken()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_TPL_Templar03_1449::StaticClass(), UDailyRoutine_SC_TPL_Templar03_1406_Confrontation());
    }
};

class UST_Templar_SPAWN348_WP : UWorldPointScript
{
	UFUNCTION()
    void OnSleeperTempleTaken()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_TPL_Templar04_1450::StaticClass(), UDailyRoutine_ST_TPL_Templar04_1450_Start());
    }
};

class UST_Templar_SPAWN382_WP : UWorldPointScript
{
	UFUNCTION()
    void OnSleeperTempleTaken()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_TPL_Templar05_1451::StaticClass(), UDailyRoutine_ST_TPL_Templar05_1451_Start());
    }
};

class UST_Templar_SPAWN379_WP : UWorldPointScript
{
	UFUNCTION()
    void OnSleeperTempleTaken()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_TPL_Templar06_1452::StaticClass(), UDailyRoutine_ST_TPL_Templar06_1452_Start());
    }
};

class UST_Templar_SPAWN355_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
    }
};

class UST_MadCorKalom_Spawn_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_GUR_MadCorKalom_1212::StaticClass());
    }
};

class UST_MadCorKalom_Into_Trance_Spawn_WP : UWorldPointScript
{
    UPROPERTY()
    FName m_SaveValue = n"ST_MadCorKalom_Into_Trance_Spawn_WP";
    UPROPERTY()
    FName m_SaveValueCompleted = n"ST_MadCorKalom_Into_Trance_Spawn_WP_Completed";
    UPROPERTY()
    FName m_UniqueName = n"ST_GUR_MadCorKalom_1212_Into_Trance";

    UFUNCTION()
    void OnMadCarKalomIntoTranceSpawn()
    {
        float32 value = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveValue, value);
        if(bLoaded)
        {
            if(value > 0.9f)
            {
                bool bLoadedCompleted = AG1RGameState::GetWorldFloatData(World, m_SaveValueCompleted, value);
                if(bLoadedCompleted)
                {
                    if(value > 0.9f)
                    {
                        return;
                    }
                }
                else
                {
                    //@DE - Check if creature exists.
                    if(AGothicCharacterState::FindByUniqueName(m_UniqueName) != nullptr)
                        return;
                }
            }
        }
        SpawnAIAgent(USpawnAIAgentDefinition_ST_GUR_MadCorKalom_1212_Into_Trance::StaticClass(), UDailyRoutine_Empty());
        AG1RGameState::SaveWorldFloatData(World, m_SaveValue, 1.f);
    }

    UFUNCTION()
    void OnMadCarKalomIntoTranceSpawnCompleted()
    {
        auto npcState = AGothicCharacterState::FindByUniqueName(m_UniqueName);
        if(npcState != nullptr)
        {
            npcState.NPCState.RemoveFromWorld();
        }
        AG1RGameState::SaveWorldFloatData(World, m_SaveValueCompleted, 1.f);
    }

};


class UST_MadCorKalom_Trance_Spawn_WP : UWorldPointScript
{
    UPROPERTY()
    FName m_SaveValue = n"ST_MadCorKalom_Trance_Spawn_WP";
    UPROPERTY()
    FName m_SaveValueCompleted = n"ST_MadCorKalom_Trance_Spawn_WP_Completed";
    UPROPERTY()
    FName m_UniqueName = n"ST_GUR_MadCorKalom_1212_Trance";

    UFUNCTION()
    void OnMadCarKalomTranceSpawn()
    {
        float32 value = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveValue, value);
        if(bLoaded)
        {
            if(value > 0.9f)
            {
                bool bLoadedCompleted = AG1RGameState::GetWorldFloatData(World, m_SaveValueCompleted, value);
                if(bLoadedCompleted)
                {
                    if(value > 0.9f)
                    {
                        return;
                    }
                }
                else
                {
                    //@DE - Check if creature exists.
                    if(AGothicCharacterState::FindByUniqueName(m_UniqueName) != nullptr)
                        return;
                }
            }
        }   
        SpawnAIAgent(USpawnAIAgentDefinition_ST_GUR_MadCorKalom_1212_Trance::StaticClass(), UDailyRoutine_Empty());
        AG1RGameState::SaveWorldFloatData(World, m_SaveValue, 1.f);
    }

    UFUNCTION()
    void OnMadCarKalomTranceSpawnCompleted()
    {
        auto npcState = AGothicCharacterState::FindByUniqueName(m_UniqueName);
        if(npcState != nullptr)
        {
            npcState.NPCState.RemoveFromWorld();
        }
        AG1RGameState::SaveWorldFloatData(World, m_SaveValueCompleted, 1.f);
    }   

};

class UST_MadCorKalom_Trance_End_Spawn_WP : UWorldPointScript
{
    UPROPERTY()
    FName m_SaveValue = n"ST_MadCorKalom_Trance_End_Spawn_WP";
    UPROPERTY()
    FName m_SaveValueCompleted = n"ST_MadCorKalom_Trance_End_Spawn_WP_Completed";

    UPROPERTY()
    FName m_UniqueName = n"ST_GUR_MadCorKalom_1212_Trance_End";

    UFUNCTION()
    void OnMadCarKalomTranceEndSpawn()
    {
        float32 value = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveValue, value);
        if(bLoaded)
        {
            if(value > 0.9f)
            {
                bool bLoadedCompleted = AG1RGameState::GetWorldFloatData(World, m_SaveValueCompleted, value);
                if(bLoadedCompleted)
                {
                    if(value > 0.9f)
                    {
                        return;
                    }
                }
                else
                {
                    //@DE - Check if creature exists.
                    if(AGothicCharacterState::FindByUniqueName(m_UniqueName) != nullptr)
                        return;
                }
            }
        }
        SpawnAIAgent(USpawnAIAgentDefinition_ST_GUR_MadCorKalom_1212_Trance_End::StaticClass(), UDailyRoutine_Empty());
        AG1RGameState::SaveWorldFloatData(World, m_SaveValue, 1.f);
    }

    UFUNCTION()
    void OnMadCarKalomTranceEndSpawnCompleted()
    {
        // auto npcState = AGothicCharacterState::FindByUniqueName(m_UniqueName);
        // if(npcState != nullptr)
        // {
        //     npcState.NPCState.RemoveFromWorld();
        // }
        //AG1RGameState::SaveWorldFloatData(World, m_SaveValueCompleted, 1.f);
    }
};

class UST_MadCorKalomDemon_Spawn_WP : UWorldPointScript
{
    UPROPERTY()
    FName m_SaveValue = n"ST_MadCorKalomDemon_Spawn_WP";

    UFUNCTION()
    void OnCarKalomDemonSpawn()
    {
        float32 value = 0.0f;
        bool bLoaded = AG1RGameState::GetWorldFloatData(World, m_SaveValue, value);
        if(bLoaded)
        {
            if(value > 0.9f)
                return;
        }
        SpawnAIAgent(USpawnAIAgentDefinition_CorKalomDemon::StaticClass());
        AG1RGameState::SaveWorldFloatData(World, m_SaveValue, 1.f);
        UWorldPointManager::Get().CallGlobalEvent(n"OnMadCarKalomTranceEndSpawnCompleted");
    }
};


class UST_Templar_SPAWN327_WP : UWorldPointScript
{
	UFUNCTION()
    void OnSleeperTempleTaken()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_TPL_Templar08_1454::StaticClass(), UDailyRoutine_ST_TPL_Templar08_1454_Start());
    }
};

class UST_Templar_SPAWN292_WP : UWorldPointScript
{
	UFUNCTION()
    void OnSleeperTempleTaken()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_TPL_Templar09_1456::StaticClass(), UDailyRoutine_ST_TPL_Templar09_1456_Start());
    }
};

class UST_Templar_SPAWN266_WP : UWorldPointScript
{
	UFUNCTION()
    void OnSleeperTempleTaken()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_TPL_Templar10_1457::StaticClass(), UDailyRoutine_ST_TPL_Templar10_1457_Start());
    }
};

class UST_Templar_SPAWN263_WP : UWorldPointScript
{
	UFUNCTION()
    void OnSleeperTempleTaken()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_TPL_Templar11_1458::StaticClass(), UDailyRoutine_ST_TPL_Templar11_1458_Start());
    }
};

class UST_Templar_SPAWN259_WP : UWorldPointScript
{
	UFUNCTION()
    void OnSleeperTempleTaken()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_TPL_Templar12_1459::StaticClass(), UDailyRoutine_ST_TPL_Templar12_1459_Start());
    }
};

class UST_Templar_SPAWN256_WP : UWorldPointScript
{
	UFUNCTION()
    void OnSleeperTempleTaken()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_TPL_Templar13_1460::StaticClass(), UDailyRoutine_ST_TPL_Templar13_1460_Start());
    }
};

class UST_Novice_SPAWN387_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_NOV_Novice01_1359::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_ST_NOV_Novice02_1360::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_ST_NOV_Novice03_1361::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_ST_NOV_Novice04_1362::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_ST_NOV_Novice05_1363::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_ST_NOV_Novice06_1364::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_ST_NOV_Novice07_1365::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_ST_NOV_Novice08_1366::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_ST_NOV_Novice09_1367::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_ST_NOV_Novice10_1368::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_ST_NOV_Novice11_1369::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_ST_NOV_Novice12_1370::StaticClass());
    }
};

class UST_Sleeper_Spawn_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Sleeper::StaticClass());
    }
};

class UST_Sleeper_Spawn_Mid_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Sleeper::StaticClass());
    }
};

class UST_Sleeper_Spawn_End_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Sleeper::StaticClass());
    }
};

class UST_Sleeper_Spawn_Mine_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Sleeper::StaticClass());
    }
};

class UST_Sleeper_Spawn_Diego_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Sleeper::StaticClass());
    }
};

class UST_Sleeper_Spawn_Gorn_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Sleeper::StaticClass());
    }
};

class UST_Sleeper_Spawn_Milten_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Sleeper::StaticClass());
    }
};

class UST_Sleeper_Spawn_Lester_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Sleeper::StaticClass());
    }
};

class UST_Sleeper_Spawn_Xardas_WP : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_Sleeper::StaticClass());
    }
};

class UST_ST_UOS_VarragArushat_WP : UWorldPointScript 
{
	UFUNCTION()
    void OnSleeperVarragArushatChamber()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_UOS_VarragArushat::StaticClass());
    }
};

class UST_ST_UOS_VarragRuuushk_WP : UWorldPointScript 
{
	UFUNCTION()
    void OnSleeperVarragRuuushkChamber()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_UOS_VarragRuuushk::StaticClass());
    }
};


class UST_UOS_VarragKasorg_WP : UWorldPointScript
{
	UFUNCTION()
    void OnSleeperVarragKasorgChamber()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_UOS_VarragKasorg::StaticClass());
    }
};

class UST_UOS_VarragUnhilqt_WP : UWorldPointScript
{
	UFUNCTION()
    void OnSleeperVarragVarragUnhilqtChamber()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_UOS_VarragUnhilqt::StaticClass());
    }
};

class UST_UOS_VarragHashor_WP : UWorldPointScript
{
	UFUNCTION()
    void OnSleeperVarragHashorChamber()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ST_UOS_VarragHashor::StaticClass());
    }
};

class UWP_ST_FIRE_DEMON_WP : UWorldPointScript
{
	UFUNCTION()
	void OnSleeperBloodPuzzleCompleted()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_DemonFire_Sleeper::StaticClass(), UDailyRoutine_Demon_Fire());
	}
};

class UST_UOS_DEMON_RUUSHK_01_WP : UWorldPointScript
{
    UFUNCTION()
	void OnDemonFire_Sleeper_Ruushk_01_Activate()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_DemonFire_Sleeper_Ruushk_01::StaticClass(), UDailyRoutine_Demon_Fire());
	}
};

class UST_UOS_DEMON_RUUSHK_02_WP : UWorldPointScript
{
    UFUNCTION()
	void OnDemonFire_Sleeper_Ruushk_02_Activate()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_DemonFire_Sleeper_Ruushk_02::StaticClass(), UDailyRoutine_Demon_Fire());
	}
};

class UST_UOS_DEMON_RUUSHK_03_WP : UWorldPointScript
{
    UFUNCTION()
	void OnDemonFire_Sleeper_Ruushk_03_Activate()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_DemonFire_Sleeper_Ruushk_03::StaticClass(), UDailyRoutine_Demon_Fire());
	}
};



class UWP_Focus_Raven_SleeperTemple : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(URavenSleeperFocusAreaCornice_AmbientLife_Config::StaticClass(),1, 150.0f, 0.0f);
    }
};