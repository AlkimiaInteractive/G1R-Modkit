
class UOW_BLOODFLY_NEW_COAST_SPAWN_WP : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
	}
};

class UOW_BLOODFLY_NEW_COAST_SPAWN_WP_AMORDRAG : UWorldPointScript
{
	UFUNCTION()
	void SpawnMonstersAfterMordrag()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
	}
};

class UOW_BLOODFLY_NEW_COAST_SPAWN_CH2_WP : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
	}
};

class UOW_PATH_075_GUARD2_WP : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
	}
};

class UOW_PATH_075_GUARD3_WP : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
	}
};

class UOW_PATH_075_GUARD4_WP : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
	}
};

class UOW_PATH_075_GUARD5_WP : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
	}
};

class UOW_PATH_075_GUARD6_WP : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
	}
};

class UOW_PATH_075_GUARD7_WP : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
	}
};

class UOW_PATH_075_GUARD8_WP : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_ScavengerMedium::StaticClass());
	}
};

class UOW_PATH_075_GUARD9_WP : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass());
	}
};

class UWorldPointActor_Lee : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Lee_700::StaticClass());
    }
};

class UWorldPointActor_Orik : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Orik_701::StaticClass());
    }
};

class UWorldPointActor_Blade : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Blade_704::StaticClass());
    }
};

class UWorldPointActor_Cord : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Cord_709::StaticClass());
    }
};

class UWorldPointActor_Jarvis : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Jarvis_728::StaticClass());
    }
};

class UWorldPointActor_Torlof : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Torlof_737::StaticClass());
    }
};

class UWorldPointActor_Lares : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Lares_801::StaticClass());
    }
};

class UWorldPointActor_Bruce : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Bruce_828::StaticClass());
    }
};

class UWorldPointActor_Buster : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Buster_833::StaticClass());
    }
};

class UWorldPointActor_Roscoe : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Roscoe_840::StaticClass());
    }
};

class UWorldPointActor_Silas : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Silas_841::StaticClass());
    }
};

class UWorldPointActor_Shrike : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Shrike_842::StaticClass());
    }
};

class UWorldPointActor_Sharky : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Sharky_843::StaticClass());
    }
};

class UWorldPointActor_Lefty : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Lefty_844::StaticClass());
    }
};

class UWorldPointActor_Wedge : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Wedge_850::StaticClass());
    }
};

class UWorldPointActor_Butch : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Butch_851::StaticClass());
    }
};

class UWorldPointActor_Wolf : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Wolf_855::StaticClass());
    }
};

class UWorldPointActor_Cipher : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Cipher_873::StaticClass());
    }
};

class UWorldPointActor_Saturas : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_KDW_Saturas_600::StaticClass());
    }
};

class UWorldPointActor_Myxir : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_KDW_Myxir_601::StaticClass());
    }
};

class UWorldPointActor_Merdarion : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_KDW_Merdarion_602::StaticClass());
    }
};

class UWorldPointActor_Nefarius : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_KDW_Nefarius_603::StaticClass());
    }
};

class UWorldPointActor_Cronos : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_KDW_Cronos_604::StaticClass());
    }
};

class UWorldPointActor_Gorn : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Gorn_699::StaticClass());
    }
};

class UWorldPointActor_Riordian : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_KDW_Riordian_605::StaticClass());
    }
};

class UWorldPointActor_Ricelord : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Ricelord_900::StaticClass());
    }
};

class UWorldPointActor_Horatio : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Horatio_901::StaticClass());
    }
};

class UWorldPointActor_Rayk : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Rayk_941::StaticClass());
    }
};

class UWorldPointActor_Pock : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Pock_902::StaticClass());
    }
};

class UWorldPointActor_Rufus : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Rufus_903::StaticClass());
    }
};

class UWorldPointActor_Jeremiah : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Jeremiah_912::StaticClass());
    }
};

class UWorldPointActor_Homer : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Homer_935::StaticClass());
    }
};

class UWorldPointActor_Senyan : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SFB_Senyan_1000::StaticClass());
    }
};

class UWorldPointActor_BaalKagan : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_NOV_BaalKagan_1332::StaticClass());
    }
};

class UWorldPointActor_BaalIsidro : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_NOV_BaalIsidro_1333::StaticClass());
    }
};

class UWorldPointActor_Snipes : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_OM_VLK_Snipes_584::StaticClass());
    }
};

class UWorldPointActor_Xardas : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_XT_DMB_Xardas_404::StaticClass());
    }
};

class UWorldPointActor_Jacko : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_UL_ORG_Jacko_862::StaticClass());
    }
};

class UWorldPointActor_Gilbert : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_UL_NON_Gilbert_1500::StaticClass());
    }
};

class UWorldPointActor_Killian : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_UL_ORG_Killian_861::StaticClass());
    }
};

class UWorldPointActor_Renyu : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_UL_ORG_Renyu_860::StaticClass());
    }
};

class UWorldPointActor_Aleph : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_OM_VLK_Aleph_585::StaticClass());
    }
};

class UWorldPointActor_Grimes : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_OM_VLK_Grimes_586::StaticClass());
    }
};

class UWorldPointActor_Garp : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_OM_VLK_Garp_587::StaticClass());
    }
};

class UWorldPointActor_Peasant01_904 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Peasant01_904::StaticClass());
    }
};

class UWorldPointActor_Peasant02_905 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Peasant02_905::StaticClass());
    }
};

class UWorldPointActor_Peasant03_907 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Peasant03_907::StaticClass());
    }
};

class UWorldPointActor_Peasant04_908 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Peasant04_908::StaticClass());
    }
};

class UWorldPointActor_Peasant05_914 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Peasant05_914::StaticClass());
    }
};

class UWorldPointActor_Peasant06_915 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Peasant06_915::StaticClass());
    }
};

class UWorldPointActor_Peasant08_917 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Peasant08_917::StaticClass());
    }
};

class UWorldPointActor_Peasant09_919 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Peasant09_919::StaticClass());
    }
};

class UWorldPointActor_Peasant10_920 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Peasant10_920::StaticClass());
    }
};

class UWorldPointActor_Peasant11_921 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Peasant11_921::StaticClass());
    }
};

class UWorldPointActor_Peasant12_922 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Peasant12_922::StaticClass());
    }
};

class UWorldPointActor_Peasant13_923 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Peasant13_923::StaticClass());
    }
};

class UWorldPointActor_Peasant14_924 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Peasant14_924::StaticClass());
    }
};

class UWorldPointActor_Peasant15_925 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Peasant15_925::StaticClass());
    }
};

class UWorldPointActor_Peasant16_926 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Peasant16_926::StaticClass());
    }
};

class UWorldPointActor_Peasant17_927 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Peasant17_927::StaticClass());
    }
};

class UWorldPointActor_Peasant18_928 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Peasant18_928::StaticClass());
    }
};

class UWorldPointActor_Peasant19_929 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Peasant19_929::StaticClass());
    }
};

class UWorldPointActor_Malon : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Malon_930::StaticClass());
    }
};

class UWorldPointActor_Peasant07_916 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Peasant07_916::StaticClass());
    }
};

class UWorldPointActor_Rogue01_800 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue01_800::StaticClass());
    }
};

class UWorldPointActor_Rogue02_804 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue02_804::StaticClass());
    }
};

class UWorldPointActor_Rogue03_806 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue03_806::StaticClass());
    }
};

class UWorldPointActor_Rogue04_807 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue04_807::StaticClass());
    }
};

class UWorldPointActor_Rogue05_810 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue05_810::StaticClass());
    }
};

class UWorldPointActor_Rogue06_811 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue06_811::StaticClass());
    }
};

class UWorldPointActor_Rogue07_815 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue07_815::StaticClass());
    }
};

class UWorldPointActor_Rogue08_816 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue08_816::StaticClass());
    }
};

class UWorldPointActor_Rogue09_817 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue09_817::StaticClass());
    }
};

class UWorldPointActor_Rogue10_820 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue10_820::StaticClass());
    }
};

class UWorldPointActor_Rogue11_821 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue11_821::StaticClass());
    }
};

class UWorldPointActor_Rogue12_822 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue12_822::StaticClass());
    }
};

class UWorldPointActor_Rogue13_823 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue13_823::StaticClass());
    }
};

class UWorldPointActor_Rogue14_824 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue14_824::StaticClass());
    }
};

class UWorldPointActor_Rogue15_825 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue15_825::StaticClass());
    }
};

class UWorldPointActor_Rogue16_829 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue16_829::StaticClass());
    }
};

class UWorldPointActor_Rogue17_830 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue17_830::StaticClass());
    }
};

class UWorldPointActor_Rogue18_831 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue18_831::StaticClass());
    }
};

class UWorldPointActor_Rogue19_832 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue19_832::StaticClass());
    }
};

class UWorldPointActor_Rogue20_834 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue20_834::StaticClass());
    }
};

class UWorldPointActor_Rogue21_836 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue21_836::StaticClass());
    }
};

class UWorldPointActor_Rogue22_837 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue22_837::StaticClass());
    }
};

class UWorldPointActor_Rogue23_838 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue23_838::StaticClass());
    }
};

class UWorldPointActor_Rogue24_845 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue24_845::StaticClass());
    }
};

class UWorldPointActor_Rogue25_846 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue25_846::StaticClass());
    }
};

class UWorldPointActor_Rogue26_875 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue26_875::StaticClass());
    }
};

class UWorldPointActor_Rogue27_876 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue27_876::StaticClass());
    }
};

class UWorldPointActor_Rogue28_877N : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue28_877N::StaticClass());
    }
};

class UWorldPointActor_Rogue29_878N : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue29_878N::StaticClass());
    }
};

class UWorldPointActor_Rogue30_879N : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue30_879N::StaticClass());
    }
};

class UWorldPointActor_Rogue31_880N : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue31_880N::StaticClass());
    }
};

class UWorldPointActor_Ulmar_881N : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Ulmar_881N::StaticClass());
    }
};

class UWorldPointActor_Mercenary02_703 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Mercenary02_703::StaticClass());
    }
};

class UWorldPointActor_Mercenary01_702 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Mercenary01_702::StaticClass());
    }
};

class UWorldPointActor_Mercenary03_705 : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Mercenary03_705::StaticClass());
    }
};

class UWorldPointActor_Mercenary04_706: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Mercenary04_706::StaticClass());
    }
};

class UWorldPointActor_Mercenary05_707: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Mercenary05_707::StaticClass());
    }
};

class UWorldPointActor_Mercenary06_708: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Mercenary06_708::StaticClass());
    }
};

class UWorldPointActor_Mercenary07_710: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Mercenary07_710::StaticClass());
    }
};

class UWorldPointActor_Mercenary08_720: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Mercenary08_720::StaticClass());
    }
};

class UWorldPointActor_Mercenary09_723: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Mercenary09_723::StaticClass());
    }
};

class UWorldPointActor_Mercenary10_725: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Mercenary10_725::StaticClass());
    }
};

class UWorldPointActor_Mercenary11_726: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Mercenary11_726::StaticClass());
    }
};

class UWorldPointActor_Mercenary12_727: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Mercenary12_727::StaticClass());
    }
};

class UWorldPointActor_Mercenary14_731: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Mercenary14_731::StaticClass());
    }
};

class UWorldPointActor_Mercenary15_732: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Mercenary15_732::StaticClass());
    }
};

class UWorldPointActor_Mercenary13_730: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Mercenary13_730::StaticClass());
    }
};

class UWorldPointActor_Mercenary16_733: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Mercenary16_733::StaticClass());
    }
};

class UWorldPointActor_Mercenary18_736: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Mercenary18_736::StaticClass());
    }
};

class UWorldPointActor_Mercenary17_735: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Mercenary17_735::StaticClass());
    }
};

class UWorldPointActor_Mercenary19_738: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Mercenary19_738::StaticClass());
    }
};

class UWorldPointActor_Mercenary20_739N: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Mercenary20_739N::StaticClass());
    }
};

class UWorldPointActor_Mercenary21_740N: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Mercenary21_740N::StaticClass());
    }
};

class UWorldPointActor_Haenno_741: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_SLD_Haenno_741::StaticClass());
    }
};

class UWorldPointActor_Jan_942: UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_BAU_Jan_942::StaticClass());
    }
};

class UOW_LURKER_NEW_CAMP_HOMER_WP : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Lurker_Homer::StaticClass() );
	}
};

class UOW_WOLF_NEW_CAMP_SPAWN_01_WP : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(),dailyRoutine = UDailyRoutine_Wolf_Base(500));
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(),dailyRoutine = UDailyRoutine_Wolf_Base(500));
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(),dailyRoutine = UDailyRoutine_Wolf_Base(500));
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(),dailyRoutine = UDailyRoutine_Wolf_Base(500));
	}
};

class UOW_WOLF_NEW_CAMP_SPAWN_02_WP : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(),dailyRoutine = UDailyRoutine_Wolf_Base(500));
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(),dailyRoutine = UDailyRoutine_Wolf_Base(500));
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(),dailyRoutine = UDailyRoutine_Wolf_Base(500));
		SpawnAIAgent(USpawnAIAgentDefinition_Wolf::StaticClass(),dailyRoutine = UDailyRoutine_Wolf_Base(500));
	}
};

class UWP_WarningFlock_NC_01 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(UPidgeonWarningFar_AmbientLife_Config::StaticClass(),5, 120.0f, 6.0f);
    }
};

class UWP_WarningFlock_NC_02 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(UPidgeonWarningFar_AmbientLife_Config::StaticClass(),4, 140.0f, 4.0f);
    }
};

class UWP_WarningFlock_NC_03 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(UPidgeonWarningMid_AmbientLife_Config::StaticClass(),3, 250.0f, 3.0f);
    }
};

class UWP_WarningFlock_NC_04 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(UPidgeonWarningMid_AmbientLife_Config::StaticClass(),6, 200.0f, 20.0f);
    }
};

class UWP_WarningFlock_NC_05 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(UPidgeonWarningFar_AmbientLife_Config::StaticClass(),8, 85.0f, 5.0f);
    }
};

class UWP_WarningFlock_NC_06 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(UPidgeonWarningFar_AmbientLife_Config::StaticClass(),3, 90.0f, 3.0f);
    }
};

class UWP_WarningFlock_NC_07 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(UPidgeonWarningMid_AmbientLife_Config::StaticClass(),7, 0.0f, 17.0f);
    }
};

class UWP_WarningFlock_NC_08 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(UPidgeonWarningFar_AmbientLife_Config::StaticClass(),2, 90.0f, 7.0f);
    }
};

class UWP_WarningFlock_NC_09 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(UPidgeonWarningFar_AmbientLife_Config::StaticClass(),12, 180.0f, 30.0f);
    }
};

class UWP_WarningFlock_NC_10 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(UPidgeonWarningMid_AmbientLife_Config::StaticClass(),4, 180.0f, 10.0f);
    }
};

class UWP_WarningFlock_NC_11 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnWarningFlock(UCrowWarningAreaTree_AmbientLife_Config::StaticClass(),5, 200.0f, 10.0f);
    }
};

class UWP_Areaflock_NC_01 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAreaFlock(UPidgeonAreaSmall_AmbientLife_Config::StaticClass(),2);
    }
};

class UWP_AreaFlock_NC_02 : UWorldPointScript
{
	UFUNCTION()
    void OnWorldStart()
    {
        SpawnAreaFlock(UPidgeonAreaSmall_AmbientLife_Config::StaticClass(),2);
    }
};


class UWP_OW_CONVOY_SPAWN: UWorldPointScript
{
    UFUNCTION()
    void OnConvoyAttack()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue33_882N::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue34_883N::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue35_884N::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue36_885N::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_NC_ORG_Rogue37_886N::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_OC_GRD_Guard31_283N::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_OC_GRD_Guard32_284N::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_OC_GRD_Guard33_285N::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_OC_GRD_Guard34_286N::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_OC_GRD_Guard35_287N::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_OC_GRD_Guard36_288N::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_OC_GRD_Guard37_289N::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_OC_GRD_Guard38_290N::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_OC_GRD_Guard39_291N::StaticClass());
    }
};
