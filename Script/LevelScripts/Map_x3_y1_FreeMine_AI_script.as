
//STONHENGE
class UWP_SH_SNAPPER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Snapper::StaticClass());
	}
};

class UWP_SH_BLOODHOUND_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodhound::StaticClass());
	}
};

class UWP_SH_BLOODHOUND_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodhound::StaticClass());
	}
};



//ILLEGAL WEED MIXERS
class UWP_IWM_LURKER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lurker::StaticClass());
	}
};

class UWP_IWM_LURKER_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lurker::StaticClass());
	}
};

class UWP_IWM_SCAVENGER_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};

class UWP_IWM_SCAVENGER_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerAdult::StaticClass());
	}
};


class UWP_IWM_MOLERAT_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass());
	}
};

class UWP_IWM_LIZARD_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
	}
};

class UWP_IWM_LIZARD_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lizard::StaticClass());
	}
};

//FREE MINE
class UWP_FM_MOLERAT_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), dailyRoutine = UDailyRoutine_Molerat_Base());
        SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), dailyRoutine = UDailyRoutine_Molerat_Base());
	}
};

class UWP_FM_MOLERAT_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base());
	}
};

class UWP_FM_MOLERAT_SPAWN_02_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base());
	}
};

class UWP_FM_MOLERAT_SPAWN_03 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Molerat::StaticClass(), UDailyRoutine_Molerat_Base());
	}
};

class UWP_FM_WOLF_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(), UDailyRoutine_Wolf_Base());
	}
};

class UWP_FM_RAZOR_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void GornMoveToFreeMineEvent()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Razor::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Razor::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Razor::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Razor::StaticClass());
	}
};

class UWP_FM_MINECRAWLER_SPAWN_01 : UWorldPointScript
{
    UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Warrior::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Warrior::StaticClass());
	}
};

class UWP_FM_MINECRAWLER_SPAWN_02 : UWorldPointScript
{
    UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Warrior::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Warrior::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Warrior::StaticClass());
	}
};

class UWP_FM_MINECRAWLER_SPAWN_03 : UWorldPointScript
{
    UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Warrior::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Warrior::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Warrior::StaticClass());
	}
};

class UWP_FM_MINECRAWLER_SPAWN_04 : UWorldPointScript
{
    UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Warrior::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Warrior::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Warrior::StaticClass());
	}
};

class UWP_FM_MEATBUG_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Meatbug::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Meatbug::StaticClass());
	}
};

class UWP_FM_MINECRAWLERNYMPH_SPAWN_01 : UWorldPointScript
{
    UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Nymph::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Nymph::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Nymph::StaticClass());
	}
};

class UWP_FM_MINECRAWLERNYMPH_SPAWN_02 : UWorldPointScript
{
    UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Nymph::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Nymph::StaticClass());
	}
};

class UWP_FM_MINECRAWLERNYMPH_SPAWN_03 : UWorldPointScript
{
    UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Nymph::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Nymph::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Nymph::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Nymph::StaticClass());
	}
};

class UWP_FM_MINECRAWLERNYMPH_SPAWN_04 : UWorldPointScript
{
    UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Nymph::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Nymph::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Nymph::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Nymph::StaticClass());
	}
};

class UWP_FM_MINECRAWLERKING_SPAWN_01 : UWorldPointScript
{
    UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Minecrawler_Warrior_King::StaticClass());
	}
};

//CHARACTERS
class UWorldPointActor_Scraper01_1030 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SFB_Scraper01_1030::StaticClass());
    }
};

class UWorldPointActor_Scraper10_1040 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SFB_Scraper10_1040::StaticClass());
    }
};

class UWorldPointActor_Scraper11_1041 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SFB_Scraper11_1041::StaticClass());
    }
};

class UWorldPointActor_Scraper12_1042 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SFB_Scraper12_1042::StaticClass());
    }
};

class UWorldPointActor_Scraper13_1043 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SFB_Scraper13_1043::StaticClass());
    }
};

class UWorldPointActor_Swiney_1037 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SFB_Swiney_1037::StaticClass());
    }
};

class UWorldPointActor_Rogue01_890 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_ORG_Rogue01_890::StaticClass());
    }
};

class UWorldPointActor_Rogue02_891: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_ORG_Rogue02_891::StaticClass());
    }
};

class UWorldPointActor_Rogue03_892: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_ORG_Rogue03_892::StaticClass());
    }
};

class UWorldPointActor_Scraper01_1001: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SFB_Scraper01_1001::StaticClass());
    }
};


class UWorldPointActor_Scraper03_1032: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SFB_Scraper03_1032::StaticClass());
    }
};

class UWorldPointActor_Scraper14_1044: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SFB_Scraper14_1044::StaticClass());
    }
};

class UWorldPointActor_Scraper07_1036: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SFB_Scraper07_1036::StaticClass());
    }
};

class UWorldPointActor_Scraper06_1035: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SFB_Scraper06_1035::StaticClass());
    }
};

class UWorldPointActor_Scraper02_1031: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SFB_Scraper02_1031::StaticClass());
    }
};

class UWorldPointActor_Scraper08_1038: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SFB_Scraper08_1038::StaticClass());
    }
};

class UWorldPointActor_Scraper09_1039: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SFB_Scraper09_1039::StaticClass());
    }
};

class UWorldPointActor_Scraper05_1034: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SFB_Scraper05_1034::StaticClass());
    }
};

class UWorldPointActor_Scraper04_1033: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SFB_Scraper04_1033::StaticClass());
    }
};

class UWorldPointActor_Mercenary02_751: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SLD_Mercenary02_751::StaticClass());
    }
};

class UWorldPointActor_Mercenary03_755: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SLD_Mercenary03_755::StaticClass());
    }
};

class UWorldPointActor_Mercenary04_756: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SLD_Mercenary04_756::StaticClass());
    }
};

class UWorldPointActor_Mercenary01_750: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SLD_Mercenary01_750::StaticClass());
    }
};

class UWorldPointActor_Mercenary05_757: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SLD_Mercenary05_757::StaticClass());
    }
};

class UWorldPointActor_Mercenary06_758: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SLD_Mercenary06_758::StaticClass());
    }
};

class UWorldPointActor_Mercenary07_759: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SLD_Mercenary07_759::StaticClass());
    }
};

class UWorldPointActor_Mercenary08_760: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SLD_Mercenary08_760::StaticClass());
    }
};

class UWorldPointActor_Mercenary09_761: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SLD_Mercenary09_761::StaticClass());
    }
};

class UWorldPointActor_Mercenary10_762: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SLD_Mercenary10_762::StaticClass());
    }
};

class UWorldPointActor_Mercenary11_763: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SLD_Mercenary11_763::StaticClass());
    }
};

class UWorldPointActor_Mercenary12_764: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SLD_Mercenary12_764::StaticClass());
    }
};

class UWorldPointActor_Mercenary13_765: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SLD_Mercenary13_765::StaticClass());
    }
};

class UWorldPointActor_Okyl_752: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SLD_Okyl_752::StaticClass());
    }
};

class UWorldPointActor_Baloro_753: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_SLD_Baloro_753::StaticClass());
    }
};

class UWorldPointActor_Shadow01_336: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_STT_Shadow01_336::StaticClass());
    }
};

class UWorldPointActor_Shadow02_337: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_STT_Shadow02_337::StaticClass());
    }
};

class UWorldPointActor_Shadow03_338: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_STT_Shadow03_338::StaticClass());
    }
};

class UWorldPointActor_Guard01_246: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard01_246::StaticClass());
    }
};

class UWorldPointActor_Guard02_284: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard02_284::StaticClass());
    }
};

class UWorldPointActor_Guard04_286: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard04_286::StaticClass());
    }
};

class UWorldPointActor_Guard05_287: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard05_287::StaticClass());
    }
};

class UWorldPointActor_Guard06_288: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard06_288::StaticClass());
    }
};

class UWorldPointActor_Guard07_289: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard07_289::StaticClass());
    }
};

class UWorldPointActor_Guard08_290: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard08_290::StaticClass());
    }
};

class UWorldPointActor_Guard09_291: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard09_291::StaticClass());
    }
};

class UWorldPointActor_Guard10_292: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard10_292::StaticClass());
    }
};

class UWorldPointActor_Guard11_293: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard11_293::StaticClass());
    }
};

class UWorldPointActor_Guard12_294: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard12_294::StaticClass());
    }
};

class UWorldPointActor_Guard13_295: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard13_295::StaticClass());
    }
};

class UWorldPointActor_Guard14_296: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard14_296::StaticClass());
    }
};

class UWorldPointActor_Guard15_297: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard15_297::StaticClass());
    }
};

class UWorldPointActor_Guard16_298: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard16_298::StaticClass());
    }
};


class UWorldPointActor_Guard17_299: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard17_299::StaticClass());
    }
};

class UWorldPointActor_Guard18_300N: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard18_300N::StaticClass());
    }
};

class UWorldPointActor_Guard19_301N: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard19_301N::StaticClass());
    }
};

class UWorldPointActor_Guard20_302N: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard20_302N::StaticClass());
    }
};

class UWorldPointActor_Guard21_303N: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard21_303N::StaticClass());
    }
};

class UWorldPointActor_Guard22_304N: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard22_304N::StaticClass());
    }
};

class UWorldPointActor_Guard23_305N: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard23_305N::StaticClass());
    }
};

class UWorldPointActor_Guard24_306N: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard24_306N::StaticClass());
    }
};

class UWorldPointActor_Guard25_307N: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard25_307N::StaticClass());
    }
};

class UWorldPointActor_Guard26_308N: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard26_308N::StaticClass());
    }
};

class UWorldPointActor_Guard27_309N: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_GRD_Guard27_309N::StaticClass());
    }
};

class UWorldPointActor_Digger01_5001: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_VLK_Digger01_5001::StaticClass());
    }
};

class UWorldPointActor_Digger02_5002: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_VLK_Digger02_5002::StaticClass());
    }
};

class UWorldPointActor_Digger03_5003: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_VLK_Digger03_5003::StaticClass());
    }
};

class UWorldPointActor_Digger04_5004: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_VLK_Digger04_5004::StaticClass());
    }
};

class UWorldPointActor_Digger05_5005: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_VLK_Digger05_5005::StaticClass());
    }
};

class UWorldPointActor_Digger06_5006: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_VLK_Digger06_5006::StaticClass());
    }
};

class UWorldPointActor_Digger07_5007: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_VLK_Digger07_5007::StaticClass());
    }
};

class UWorldPointActor_Tarrok_2001 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_FM_OSL_Tarrok_2001::StaticClass());
    }
};


//FLOCKS
class UWP_WarningFlock_FM_01 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(UPidgeonWarningMid_AmbientLife_Config::StaticClass(),5, 230.0f, 10.0f);
    }
};

class UWP_WarningFlock_FM_02 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(UPidgeonWarningMid_AmbientLife_Config::StaticClass(),2, 230.0f, 5.0f);
    }
};

class UWP_WarningFlock_FM_03 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(UPidgeonWarningFar_AmbientLife_Config::StaticClass(),3, 200.0f, 2.0f);
    }
};

class UWP_AreaFlock_FM_01 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAreaFlock(UPidgeonAreaMidDistance_AmbientLife_Config::StaticClass(),2);
    }
};

class UWP_AreaFlock_FM_02 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAreaFlock(UPidgeonAreaMidDistance_AmbientLife_Config::StaticClass(),3);
    }
};

class UWP_AreaFlock_FM_03 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAreaFlock(UPidgeonAreaMidDistance_AmbientLife_Config::StaticClass(),2);
    }
};

class UWP_AreaFlock_FM_04 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAreaFlock(UPidgeonAreaSmall_AmbientLife_Config::StaticClass(),3);
    }
};

class UWP_AreaFlock_FM_05 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAreaFlock(UPidgeonAreaSmall_AmbientLife_Config::StaticClass(),2);
    }
};

class UWP_AreaFlock_FM_06 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAreaFlock(UPidgeonAreaSmall_AmbientLife_Config::StaticClass(),2);
    }
};

class UWP_AreaFlock_FM_07 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAreaFlock(UPidgeonAreaSmall_AmbientLife_Config::StaticClass(),2);
    }
};

class UWP_AreaFlock_FM_08 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAreaFlock(UPidgeonAreaSmall_AmbientLife_Config::StaticClass(),3);
    }
};

//ULU CREATURES

class UWP_OW_COAST_SHIPWRECK_WARAN : UWorldPointScript
{
    UFUNCTION()
    void SpawnMonstersAfterFM()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_LizardFire_Prime);
    }
}

class UWP_OW_COAST_SHIPWRECK_WARAN_CH2 : UWorldPointScript
{
    UFUNCTION()
    void OnChapterRespawn()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_LizardFire);
    }
}

class UWP_SPAWN_OW_WARAN_DEMON_01 : UWorldPointScript
{
    UFUNCTION()
    void SpawnMonstersAfterFM()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_LizardFire_Prime);
    }
}

class UWP_OW_PATH_SCAVENGER15_SPAWN01 : UWorldPointScript
{
    UFUNCTION()
    void SpawnMonstersAfterFM()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_LizardFire_Prime);
    }
}

class UWP_OW_PATH_SCAVENGER15_SPAWN01_CH2 : UWorldPointScript
{
    UFUNCTION()
    void OnChapterRespawn()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_LizardFire);
    }
}

class UWP_PATH_AROUND_PSI16 : UWorldPointScript
{
    UFUNCTION()
    void SpawnMonstersAfterFM()
    {
        for (auto SwampShark : FCharacterUniqueName(n"SwampsharkNamed").AllNPCStates)
        {
            if (!SwampShark.IsDead())
            {
                SwampShark.RemoveFromWorld();
            }
        }

        SpawnAIAgent(USpawnAIAgentDefinition_Swampshark_Prime);

    }
}

class UWP_SPAWN_OW_SHADOWBEAST2_PSIWOOD_02 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ShadowBeast_Forest);
    }

    UFUNCTION()
    void SpawnMonstersAfterFM()
    {
        for (auto ShadowBeast : FCharacterUniqueName(n"ShadowBeastForest").AllNPCStates)
        {
            if (!ShadowBeast.IsDead())
            {
                ShadowBeast.RemoveFromWorld();
            }
        }
        
        SpawnAIAgent(USpawnAIAgentDefinition_ShadowBeast_Prime);
    }
}

class UWP_OW_PATH_033_TO_CAVE5 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ShadowBeast_Cave);
    }

    UFUNCTION()
    void SpawnMonstersAfterFM()
    {
        for (auto ShadowBeast : FCharacterUniqueName(n"ShadowBeastCave").AllNPCStates)
        {
            if (!ShadowBeast.IsDead())
            {
                ShadowBeast.RemoveFromWorld();
            }
        }

        SpawnAIAgent(USpawnAIAgentDefinition_ShadowBeast_Prime);
    }
}

class UWP_OW_PATH_260 : UWorldPointScript
{
    UFUNCTION()
    void SpawnMonstersAfterFM()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_ShadowBeast_Prime);
    }
} 
class UWP_LOCATION_12_12 : UWorldPointScript
{
    UFUNCTION()
    void SpawnMonstersAfterFM()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_TC_TrollPrime);
    }
}