//SWAMP CAMP
//Creatures
class UWP_SC_SWAMPSHARK_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Swampshark::StaticClass());
	}
};

class UWP_SC_SWAMPSHARK_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Swampshark_Named::StaticClass());
	}
};

class UWP_SC_SWAMPSHARK_SPAWN_03 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Swampshark::StaticClass());
	}
};

class UWP_SC_SWAMPSHARK_SPAWN_04 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Swampshark::StaticClass(), UDailyRoutine_Swampshark(1000.0f));
	}
};

class UWP_SC_SWAMPSHARK_SPAWN_05 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Swampshark::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Swampshark::StaticClass());
	}
};

class UWP_SC_SWAMPSHARK_SPAWN_06 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Swampshark::StaticClass());
	}
};

class UWP_SC_BLOODFLY_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
	}
};

class UWP_SC_BLOODFLY_SPAWN_01_CH2 : UWorldPointScript
{
	UFUNCTION()
	void OnChapterRespawn()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
	}
};

class UWP_SC_BLOODFLY_SPAWN_03 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
	}
};

class UWP_SC_BLOODFLY_SPAWN_03_APARVEZ : UWorldPointScript
{
	UFUNCTION()
	void SpawnMonstersAfterParvez()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
	}
};

class UWP_SC_BLOODFLY_SPAWN_04 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
	}
};

class UWP_SC_BLOODFLY_SPAWN_05 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
	}
};

class UWP_SC_BLOODFLY_SPAWN_06 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
	}
};

class UWP_SC_BLOODFLY_SPAWN_07 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
	}
};

class UWP_SC_BLOODFLY_SPAWN_08 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
	}
};

class UWP_SC_BLOODFLY_SPAWN_09 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_Bloodfly::StaticClass());
	}
};

class UWP_SC_BLOODFLY_VIRAN_SPAWN_01 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Viran_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Viran_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
	}
};

class UWP_SC_BLOODFLY_VIRAN_SPAWN_02 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Viran_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Viran_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Viran_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
	}
};

class UWP_SC_BLOODFLY_VIRAN_SPAWN_03 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Viran_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Viran_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Viran_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
	}
};

class UWP_SC_BLOODFLY_VIRAN_SPAWN_04 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Viran_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Viran_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());

	}
};

class UWP_SC_BLOODFLY_VIRAN_SPAWN_05 : UWorldPointScript
{
	UFUNCTION()
	void OnWorldStart()
	{
		SpawnAIAgent(USpawnAIAgentDefinition_Viran_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
		SpawnAIAgent(USpawnAIAgentDefinition_Viran_Bloodfly::StaticClass(), UDailyRoutine_Bloodfly_Short());
	}
};

//Human NPCs

class UWorldPointActor_GorNaToth : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_GorNaToth_1402::StaticClass());
    }
};

class UWorldPointActor_GorNaRan : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_GorNaRan_1405::StaticClass());
    }
};

class UWorldPointActor_GorNaDrak : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_GorNaDrak_1439::StaticClass());
    }
};

class UWorldPointActor_Talas : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Talas_1300::StaticClass());
    }
};

class UWorldPointActor_Caine : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Caine_1301::StaticClass());
    }
};

class UWorldPointActor_Viran : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Viran_1302::StaticClass());
    }
};

class UWorldPointActor_SC_NOV_Theron_1372N : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Theron_1372N::StaticClass());
    }
};

class UWorldPointActor_Nyras : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Nyras_1303::StaticClass());
    }
};

class UWorldPointActor_Balor : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Balor_1304::StaticClass());
    }
};

class UWorldPointActor_Joru : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Joru_1305::StaticClass());
    }
};

class UWorldPointActor_Ghorim : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Ghorim_1310::StaticClass());
    }
};

class UWorldPointActor_Darrion : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Darrion_1312::StaticClass());
    }
};

class UWorldPointActor_Lester : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Lester::StaticClass());
    }
};

class UWorldPointActor_Shrat : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Shrat_1356::StaticClass());
    }
};

class UWorldPointActor_Fortuno : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Fortuno_1357::StaticClass());
    }
};

class UWorldPointActor_Harlok : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Harlok_1358::StaticClass());
    }
};

class UWorldPointActor_BaalNetbek : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_BaalNetbek_1371::StaticClass());
    }
};

class UWorldPointActor_Chani : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_WSC_Chani_1205::StaticClass());
    }
};

class UWorldPointActor_Natalia : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_WSC_Natalia_1207::StaticClass());
    }
};

class UWorldPointActor_YBerion : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_GUR_YBerion_1200::StaticClass());
    }
};

class UWorldPointActor_CorKalom : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_GUR_CorKalom_1201::StaticClass());
    }
};

class UWorldPointActor_CorAngar : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_GUR_CorAngar_1202::StaticClass());
    }
};

class UWorldPointActor_BaalTondral : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_GUR_BaalTondral_1203::StaticClass());
    }
};

class UWorldPointActor_BaalNamib : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_GUR_BaalNamib_1204::StaticClass());
    }
};

class UWorldPointActor_BaalCadar : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_GUR_BaalCadar_1208::StaticClass());
    }
};

class UWorldPointActor_BaalOrun : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_GUR_BaalOrun_1209::StaticClass());
    }
};

class UWorldPointActor_BaalTyon : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_GUR_BaalTyon_1210::StaticClass());
    }
};

class UWorldPointActor_Melvin : UWorldPointScript
{
    UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_VLK_Melvin_582::StaticClass());
    }
};

class UWorldPointActor_Novice01_1306 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice01_1306::StaticClass());
    }
};

class UWorldPointActor_Novice02_1307 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice02_1307::StaticClass());
    }
};

class UWorldPointActor_Novice03_1308 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice03_1308::StaticClass());
    }
};

class UWorldPointActor_Novice04_1309 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice04_1309::StaticClass());
    }
};

class UWorldPointActor_Novice05_1311 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice05_1311::StaticClass());
    }
};

class UWorldPointActor_Novice06_1313 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice06_1313::StaticClass());
    }
};

class UWorldPointActor_Novice07_1314 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice07_1314::StaticClass());
    }
};

class UWorldPointActor_Novice08_1315 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice08_1315::StaticClass());
    }
};

class UWorldPointActor_Novice09_1316 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice09_1316::StaticClass());
    }
};

class UWorldPointActor_Novice10_1317 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice10_1317::StaticClass());
    }
};

class UWorldPointActor_Novice11_1318 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice11_1318::StaticClass());
    }
};

class UWorldPointActor_Novice12_1319 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice12_1319::StaticClass());
    }
};

class UWorldPointActor_Novice13_1320 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice13_1320::StaticClass());
    }
};

class UWorldPointActor_Novice14_1321 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice14_1321::StaticClass());
    }
};

class UWorldPointActor_Novice15_1322 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice15_1322::StaticClass());
    }
};

class UWorldPointActor_Novice16_1323 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice16_1323::StaticClass());
    }
};

class UWorldPointActor_Novice17_1324 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice17_1324::StaticClass());
    }
};

class UWorldPointActor_Novice18_1325 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice18_1325::StaticClass());
    }
};

class UWorldPointActor_Novice19_1326 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice19_1326::StaticClass());
    }
};

class UWorldPointActor_Novice20_1327 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice20_1327::StaticClass());
    }
};

class UWorldPointActor_Novice21_1328 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice21_1328::StaticClass());
    }
};

class UWorldPointActor_Novice22_1329 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice22_1329::StaticClass());
    }
};

class UWorldPointActor_Novice25_1336 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice25_1336::StaticClass());
    }
};

class UWorldPointActor_Novice26_1337 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice26_1337::StaticClass());
    }
};

class UWorldPointActor_Novice23_1334 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice23_1334::StaticClass());
    }
};

class UWorldPointActor_Novice24_1335 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice24_1335::StaticClass());
    }
};

class UWorldPointActor_Novice27_1338 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice27_1338::StaticClass());
    }
};

class UWorldPointActor_Novice28_1339 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice28_1339::StaticClass());
    }
};

class UWorldPointActor_Novice29_1340 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice29_1340::StaticClass());
    }
};

class UWorldPointActor_Novice30_1341 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice30_1341::StaticClass());
    }
};

class UWorldPointActor_Novice31_1342 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice31_1342::StaticClass());
    }
};

class UWorldPointActor_Novice32_1343 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice32_1343::StaticClass());
    }
};

class UWorldPointActor_Novice33_1344 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice33_1344::StaticClass());
    }
};

class UWorldPointActor_Novice34_1345 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice34_1345::StaticClass());
    }
};

class UWorldPointActor_Novice35_1346 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice35_1346::StaticClass());
    }
};

class UWorldPointActor_Novice36_1347 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice36_1347::StaticClass());
    }
};

class UWorldPointActor_Novice37_1348 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice37_1348::StaticClass());
    }
};

class UWorldPointActor_Novice38_1349 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice38_1349::StaticClass());
    }
};

class UWorldPointActor_Novice39_1350 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice39_1350::StaticClass());
    }
};

class UWorldPointActor_Novice40_1351 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice40_1351::StaticClass());
    }
};

class UWorldPointActor_Novice41_1353 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice41_1353::StaticClass());
    }
};

class UWorldPointActor_Novice42_1354 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice42_1354::StaticClass());
    }
};

class UWorldPointActor_Novice43_1355 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice43_1355::StaticClass());
    }
};

class UWorldPointActor_Novice44_1356N : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice44_1356N::StaticClass());
    }
};

class UWorldPointActor_Novice45_1357N : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice45_1357N::StaticClass());
    }
};

class UWorldPointActor_Templar01_1403 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar01_1403::StaticClass());
    }
};

class UWorldPointActor_Templar02_1404 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar02_1404::StaticClass());
    }
};

class UWorldPointActor_Templar03_1406 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar03_1406::StaticClass());
    }
};

class UWorldPointActor_Templar03_1407 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar03_1407::StaticClass());
    }
};

class UWorldPointActor_Templar04_1408 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar04_1408::StaticClass());
    }
};

class UWorldPointActor_Templar04_1446 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_OG_TPL_GorNaZar_1446::StaticClass());
    }
};

class UWorldPointActor_Templar05_1409 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar05_1409::StaticClass());
    }
};

class UWorldPointActor_Templar06_1410 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar06_1410::StaticClass());
    }
};

class UWorldPointActor_GorNaDun_1411 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_GorNaDun_1411::StaticClass());
    }
};

class UWorldPointActor_Templar08_1412 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar08_1412::StaticClass());
    }
};

class UWorldPointActor_Templar09_1413 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar09_1413::StaticClass());
    }
};

class UWorldPointActor_Templar10_1414 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar10_1414::StaticClass());
    }
};

class UWorldPointActor_Templar11_1415 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar11_1415::StaticClass());
    }
};

class UWorldPointActor_Templar12_1416 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar12_1416::StaticClass());
    }
};

class UWorldPointActor_Templar13_1417 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar13_1417::StaticClass());
    }
};

class UWorldPointActor_Templar14_1418 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar14_1418::StaticClass());
    }
};

class UWorldPointActor_Templar15_1419 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar15_1419::StaticClass());
    }
};

class UWorldPointActor_Templar16_1420 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar16_1420::StaticClass());
    }
};

class UWorldPointActor_Templar17_1423 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar17_1423::StaticClass());
    }
};

class UWorldPointActor_Templar18_1424 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar18_1424::StaticClass());
    }
};

class UWorldPointActor_Templar19_1425 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar19_1425::StaticClass());
    }
};

class UWorldPointActor_Templar20_1430 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar20_1430::StaticClass());
    }
};

class UWorldPointActor_Templar21_1431 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar21_1431::StaticClass());
    }
};

class UWorldPointActor_Templar22_1432 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar22_1432::StaticClass());
    }
};

class UWorldPointActor_Templar23_1440 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar23_1440::StaticClass());
    }
};

class UWorldPointActor_Templar24_1441 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar24_1441::StaticClass());
    }
};

class UWorldPointActor_Templar25_1442 : UWorldPointScript
{
     UFUNCTION()
    void OnWorldStart()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar25_1442::StaticClass());
    }
};

class UWP_SC_KALOM_EXPERIMENTS: UWorldPointScript
{
    UFUNCTION()
    void OnKalomExperimentsEscape()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar26_1443N::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_SC_TPL_Templar27_1444N::StaticClass());
    }
};

class UWP_SC_YBERION_ASHES: UWorldPointScript
{
    UFUNCTION()
    void OnYberionAshes()
    {
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice46_1358N::StaticClass());
        SpawnAIAgent(USpawnAIAgentDefinition_SC_NOV_Novice47_1359N::StaticClass());
    }
};

