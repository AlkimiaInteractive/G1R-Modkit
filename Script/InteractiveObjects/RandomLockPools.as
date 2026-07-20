struct FLockPoolEntry
{
	int Tier;
	FName LockName;

	FLockPoolEntry(int InTier, FName InLockName)
	{
		Tier = InTier;
		LockName = InLockName;
	}
}

class URandomLockSubsystem : UScriptWorldSubsystem
{
	UPROPERTY()
	bool bRandomLocksEnabled = false;

	UPROPERTY()
	TArray<FLockPoolEntry> m_LockPoolEntries;

	UPROPERTY()
	TArray<TSubclassOf<UIoChestDefault>> m_RegisteredChests;

	void AddLockToPool(int tier, FName lockName)
	{
		m_LockPoolEntries.Add(FLockPoolEntry(tier, lockName));
	}

	void RegisterChest(TSubclassOf<UIoChestDefault> chestClass)
	{
		m_RegisteredChests.Add(chestClass);
	}

	TArray<FName> GetLocksForTier(int tier) const
	{
		TArray<FName> result;
		for (auto entry : m_LockPoolEntries)
		{
			if (entry.Tier == tier)
				result.Add(entry.LockName);
		}
		return result;
	}

	// =========================================================================
	//  Lock pools — fill with lock m_UniqueName values per difficulty tier.
	//  Tiers should match the m_LockDifficulty values set on chest definitions.
	// =========================================================================

	// --- Tier 1: Novice - 33 locks ---
	default AddLockToPool(1, n"BC_Chest_01_Lock");
	default AddLockToPool(1, n"BC_Chest_07_Lock");
	default AddLockToPool(1, n"BC_Chest_10_Lock");
	default AddLockToPool(1, n"BC_Chest_11_Lock");
	default AddLockToPool(1, n"FME_Chest_EmptyHut_05_Lock");
	default AddLockToPool(1, n"FME_Chest_Mercenary13_765_01_Lock");
	default AddLockToPool(1, n"FME_Chest_Mercenary13_765_02_Lock");
	default AddLockToPool(1, n"NC_Chest_Mercenary03_705_Lock");
	default AddLockToPool(1, n"NC_Chest_Rogue11_821_Lock");
	default AddLockToPool(1, n"OC_Chest_Dexter_Lock");
	default AddLockToPool(1, n"OC_Chest_Digger502_Lock");
	default AddLockToPool(1, n"OC_Chest_Digger514_Lock");
	default AddLockToPool(1, n"OC_Chest_Digger529_Lock");
	default AddLockToPool(1, n"OC_Chest_Digger557_Lock");
	default AddLockToPool(1, n"OC_Chest_Digger578_Lock");
	default AddLockToPool(1, n"OC_Chest_Mud_Lock");
	default AddLockToPool(1, n"OC_Chest_Shadow310_Lock");
	default AddLockToPool(1, n"OC_Chest_Snaf_01_Lock");
	default AddLockToPool(1, n"OC_Chest_Throne_01_Lock");
	default AddLockToPool(1, n"OC_Chest_Whistler_Lock");
	default AddLockToPool(1, n"OM_Chest_Alberto_04_Lock");
	default AddLockToPool(1, n"OM_Chest_Alberto_05_Lock");
	default AddLockToPool(1, n"SC_Chest_CorKalom_01_Lock");
	default AddLockToPool(1, n"SW_Chest_07_Lock");
	default AddLockToPool(1, n"OC_Chest_Herek_Lock");
	default AddLockToPool(1, n"TST_Chest_Forge_01_Lock");
	default AddLockToPool(1, n"TST_Chest_Lava_Stronghold_01_Lock");
	default AddLockToPool(1, n"TST_Chest_Lava_Stronghold_02_Lock");
	default AddLockToPool(1, n"TST_Chest_Slave_01_Lock");
	default AddLockToPool(1, n"TST_Chest_Sleeper_01_Lock");
	default AddLockToPool(1, n"TST_Chest_Sleeper_02_Lock");
	default AddLockToPool(1, n"TST_Chest_WinchRoom_02_Lock");
	default AddLockToPool(1, n"TST_Chest_WinchRoom_03_Lock");

	// --- Tier 2: Apprentice - 50 locks ---
	default AddLockToPool(2, n"BC_Chest_02_Lock");
	default AddLockToPool(2, n"BC_Chest_03_Lock");
	default AddLockToPool(2, n"BC_Chest_04_Lock");
	default AddLockToPool(2, n"BC_Chest_05_Lock");
	default AddLockToPool(2, n"BC_Chest_09_Lock");
	default AddLockToPool(2, n"BC_Chest_12_Lock");
	default AddLockToPool(2, n"BC_Chest_13_Lock");
	default AddLockToPool(2, n"BC_Chest_14_Lock");
	default AddLockToPool(2, n"BC_Chest_23_Lock");
	default AddLockToPool(2, n"FME_Chest_ControlAccess_Lock");
	default AddLockToPool(2, n"FME_Chest_EmptyHut_02_Lock");
	default AddLockToPool(2, n"FME_Chest_EmptyHut_04_Lock");
	default AddLockToPool(2, n"NC_Chest_GateInterior_02_Lock");
	default AddLockToPool(2, n"NC_Chest_Jeremiah_Lock");
	default AddLockToPool(2, n"NC_Chest_Lefty_01_Lock");
	default AddLockToPool(2, n"NC_Chest_Lefty_02_Lock");
	default AddLockToPool(2, n"NC_Chest_Rogue01_800_Lock");
	default AddLockToPool(2, n"NC_Chest_Rogue07_815_Lock");
	default AddLockToPool(2, n"NC_Chest_Rogue13_823_Lock");
	default AddLockToPool(2, n"OC_Chest_Bullit_Lock");
	default AddLockToPool(2, n"OC_Chest_Digger504_Lock");
	default AddLockToPool(2, n"OC_Chest_Digger506_Lock");
	default AddLockToPool(2, n"OC_Chest_Digger516_Lock");
	default AddLockToPool(2, n"OC_Chest_Digger523_Lock");
	default AddLockToPool(2, n"OC_Chest_Digger526_Lock");
	default AddLockToPool(2, n"OC_Chest_Digger527_Lock");
	default AddLockToPool(2, n"OC_Chest_Digger528_Lock");
	default AddLockToPool(2, n"OC_Chest_Digger533_Lock");
	default AddLockToPool(2, n"OC_Chest_Digger535_Lock");
	default AddLockToPool(2, n"OC_Chest_Digger553_Lock");
	default AddLockToPool(2, n"OC_Chest_Digger554_Lock");
	default AddLockToPool(2, n"OC_Chest_Digger556_Lock");
	default AddLockToPool(2, n"OC_Chest_Digger560_Lock");
	default AddLockToPool(2, n"OC_Chest_Digger565_Lock");
	default AddLockToPool(2, n"OC_Chest_Digger575_Lock");
	default AddLockToPool(2, n"OC_Chest_Dusty_Lock");
	default AddLockToPool(2, n"OC_Chest_Fletcher_Lock");
	default AddLockToPool(2, n"OC_Chest_Guard206_Lock");
	default AddLockToPool(2, n"OC_Chest_Guard209_Lock");
	default AddLockToPool(2, n"OC_Chest_Guard220_Lock");
	default AddLockToPool(2, n"OC_Chest_Guard226_Lock");
	default AddLockToPool(2, n"OC_Chest_Guard229_Lock");
	default AddLockToPool(2, n"OC_Chest_Guard232_Lock");
	default AddLockToPool(2, n"OC_Chest_Guard253_Lock");
	default AddLockToPool(2, n"OC_Chest_Jesse_Lock");
	default AddLockToPool(2, n"OC_Chest_Kharim_Lock");
	default AddLockToPool(2, n"OC_Chest_Omid_Lock");
	default AddLockToPool(2, n"OM_Chest_Santino_02_Lock");
	default AddLockToPool(2, n"OM_Chest_Santino_03_Lock");
	default AddLockToPool(2, n"OC_Chest_02_Lock");

	// --- Tier 3: Journeyman - 68 locks ---
	default AddLockToPool(3, n"BC_Chest_08_Lock");
	default AddLockToPool(3, n"BC_Chest_15_Lock");
	default AddLockToPool(3, n"CV_Chest_07_Lock");
	default AddLockToPool(3, n"FME_Chest_Swiney_Lock");
	default AddLockToPool(3, n"IWML_Chest_01_Lock");
	default AddLockToPool(3, n"IWML_Chest_04_Lock");
	default AddLockToPool(3, n"NC_Chest_Blade_Lock");
	default AddLockToPool(3, n"NC_Chest_Bruce_Lock");
	default AddLockToPool(3, n"NC_Chest_Buster_Lock");
	default AddLockToPool(3, n"NC_Chest_Butch_Lock");
	default AddLockToPool(3, n"NC_Chest_Cellar_Lock");
	default AddLockToPool(3, n"NC_Chest_Gorn_Lock");
	default AddLockToPool(3, n"NC_Chest_Homer_Lock");
	default AddLockToPool(3, n"NC_Chest_Mercenary02_703_Lock");
	default AddLockToPool(3, n"NC_Chest_Mercenary04_706_Lock");
	default AddLockToPool(3, n"NC_Chest_Mercenary06_708_Lock");
	default AddLockToPool(3, n"NC_Chest_Mercenary17_735_Lock");
	default AddLockToPool(3, n"NC_Chest_Orik_Lock");
	default AddLockToPool(3, n"NC_Chest_Rogue05_810_Lock");
	default AddLockToPool(3, n"NC_Chest_Rogue06_811_Lock");
	default AddLockToPool(3, n"NC_Chest_Rogue08_816_Lock");
	default AddLockToPool(3, n"NC_Chest_Rogue09_817_Lock");
	default AddLockToPool(3, n"NC_Chest_Rogue10_820_Lock");
	default AddLockToPool(3, n"NC_Chest_Rogue22_837_Lock");
	default AddLockToPool(3, n"NC_Chest_Silas_Lock");
	default AddLockToPool(3, n"NC_Chest_Torlof_Lock");
	default AddLockToPool(3, n"NC_Chest_Wolf_Lock");
	default AddLockToPool(3, n"OA_Chest_01_Lock");
	default AddLockToPool(3, n"OC_Chest_BaalParvez_Lock");
	default AddLockToPool(3, n"OC_Chest_Digger501_Lock");
	default AddLockToPool(3, n"OC_Chest_Digger503_Lock");
	default AddLockToPool(3, n"OC_Chest_Digger505_Lock");
	default AddLockToPool(3, n"OC_Chest_Digger508_Lock");
	default AddLockToPool(3, n"OC_Chest_Digger509_Lock");
	default AddLockToPool(3, n"OC_Chest_Digger510_Lock");
	default AddLockToPool(3, n"OC_Chest_Digger512_Lock");
	default AddLockToPool(3, n"OC_Chest_Digger517_Lock");
	default AddLockToPool(3, n"OC_Chest_Digger519_Lock");
	default AddLockToPool(3, n"OC_Chest_Digger521_Lock");
	default AddLockToPool(3, n"OC_Chest_Digger522_Lock");
	default AddLockToPool(3, n"OC_Chest_Digger531_Lock");
	default AddLockToPool(3, n"OC_Chest_Digger532_Lock");
	default AddLockToPool(3, n"OC_Chest_Digger555_Lock");
	default AddLockToPool(3, n"OC_Chest_Digger561_Lock");
	default AddLockToPool(3, n"OC_Chest_Digger576_Lock");
	default AddLockToPool(3, n"OC_Chest_Digger577_Lock");
	default AddLockToPool(3, n"OC_Chest_Gravo_Lock");
	default AddLockToPool(3, n"OC_Chest_Grim_Lock");
	default AddLockToPool(3, n"OC_Chest_Cutter_Lock");
	default AddLockToPool(3, n"OC_Chest_Guard221_Lock");
	default AddLockToPool(3, n"OC_Chest_Guard228_Lock");
	default AddLockToPool(3, n"OC_Chest_Guard239_Lock");
	default AddLockToPool(3, n"OC_Chest_Guard240_Lock");
	default AddLockToPool(3, n"OC_Chest_Guard242_Lock");
	default AddLockToPool(3, n"OC_Chest_Jackal_Lock");
	default AddLockToPool(3, n"OC_Chest_Kyle_Lock");
	default AddLockToPool(3, n"OC_Chest_Ruins_02_Lock");
	default AddLockToPool(3, n"OC_Chest_Scatty_Lock");
	default AddLockToPool(3, n"OC_Chest_Scorpio_Lock");
	default AddLockToPool(3, n"OC_Chest_Shadow306_Lock");
	default AddLockToPool(3, n"OC_Chest_Shadow314_Lock");
	default AddLockToPool(3, n"OC_Chest_Shadow322_Lock");
	default AddLockToPool(3, n"OC_Chest_Shadow328_Lock");
	default AddLockToPool(3, n"OC_Chest_Shadow330_Lock");
	default AddLockToPool(3, n"OC_Chest_Stone_Lock");
	default AddLockToPool(3, n"OC_Chest_Tower_03_Lock");
	default AddLockToPool(3, n"OC_Chest_Tower_05_Lock");
	default AddLockToPool(3, n"OC_Chest_01_Lock");

	// --- Tier 4: Adept - 71 locks ---
	default AddLockToPool(4, n"AM_Chest_04_Lock");
	default AddLockToPool(4, n"AM_Chest_05_Lock");
	default AddLockToPool(4, n"AMR_Chest_04_Lock");
	default AddLockToPool(4, n"BC_Chest_20_Lock");
	default AddLockToPool(4, n"BC_Chest_22_Lock");
	default AddLockToPool(4, n"BT_Chest_01_Lock");
	default AddLockToPool(4, n"CV_Chest_01_Lock");
	default AddLockToPool(4, n"CV_Chest_02_Lock");
	default AddLockToPool(4, n"CV_Chest_10_Lock");
	default AddLockToPool(4, n"FM_Chest_Furnace_01_Lock");
	default AddLockToPool(4, n"FM_Chest_Furnace_02_Lock");
	default AddLockToPool(4, n"IWML_Chest_02_Lock");
	default AddLockToPool(4, n"IWML_Chest_03_Lock");
	default AddLockToPool(4, n"IWML_Chest_05_Lock");
	default AddLockToPool(4, n"MF_Chest_08_Lock");
	default AddLockToPool(4, n"NC_Chest_Cipher_Lock");
	default AddLockToPool(4, n"NC_Chest_Distillery_Lock");
	default AddLockToPool(4, n"NC_Chest_GateInterior_01_Lock");
	default AddLockToPool(4, n"NC_Chest_Mercenary07_710_Lock");
	default AddLockToPool(4, n"NC_Chest_Ricelord_Lock");
	default AddLockToPool(4, n"NC_Chest_Rogue03_806_Lock");
	default AddLockToPool(4, n"NC_Chest_Rogue23_838_Lock");
	default AddLockToPool(4, n"NC_Chest_Sharky_Lock");
	default AddLockToPool(4, n"NC_Chest_Sunken_01_Lock");
	default AddLockToPool(4, n"NC_Chest_Sunken_02_Lock");
	default AddLockToPool(4, n"OA_Chest_03_Lock");
	default AddLockToPool(4, n"OC_Chest_Balam_Lock");
	default AddLockToPool(4, n"OC_Chest_Bartholo_Lock");
	default AddLockToPool(4, n"OC_Chest_Bettingowner_Lock");
	default AddLockToPool(4, n"OC_Chest_Bloodwyn_Lock");
	default AddLockToPool(4, n"OC_Chest_Corristo_Lock");
	default AddLockToPool(4, n"OC_Chest_Digger507_Lock");
	default AddLockToPool(4, n"OC_Chest_Digger513_Lock");
	default AddLockToPool(4, n"OC_Chest_Digger515_Lock");
	default AddLockToPool(4, n"OC_Chest_Drago_Lock");
	default AddLockToPool(4, n"OC_Chest_Fisk_02_Lock");
	default AddLockToPool(4, n"OC_Chest_Fisk_04_Lock");
	default AddLockToPool(4, n"OC_Chest_Fisk_06_Lock");
	default AddLockToPool(4, n"OC_Chest_Fisk_07_Lock");
	default AddLockToPool(4, n"OC_Chest_Fisk_08_Lock");
	default AddLockToPool(4, n"OC_Chest_Forge_01_Lock");
	default AddLockToPool(4, n"OC_Chest_GorHanis_Lock");
	default AddLockToPool(4, n"OC_Chest_Guard230_Lock");
	default AddLockToPool(4, n"OC_Chest_Guard241_Lock");
	default AddLockToPool(4, n"OC_Chest_Guard252_Lock");
	default AddLockToPool(4, n"OC_Chest_Huno_Lock");
	default AddLockToPool(4, n"OC_Chest_Kirgo_Lock");
	default AddLockToPool(4, n"OC_Chest_Kitchen_Lock");
	default AddLockToPool(4, n"OC_Chest_Mordrag_Lock");
	default AddLockToPool(4, n"OC_Chest_Rodriguez_Lock");
	default AddLockToPool(4, n"OC_Chest_Ruins_01_Lock");
	default AddLockToPool(4, n"OC_Chest_Shadow304_Lock");
	default AddLockToPool(4, n"OC_Chest_Shadow313_Lock");
	default AddLockToPool(4, n"OC_Chest_Shadow316_Lock");
	default AddLockToPool(4, n"OC_Chest_Shadow318_Lock");
	default AddLockToPool(4, n"OC_Chest_Shadow319_Lock");
	default AddLockToPool(4, n"OC_Chest_Skip_Lock");
	default AddLockToPool(4, n"OC_Chest_Snaf_02_Lock");
	default AddLockToPool(4, n"OC_Chest_Tower_07_Lock");
	default AddLockToPool(4, n"OM_Chest_Alberto_01_Lock");
	default AddLockToPool(4, n"OM_Chest_Alberto_03_Lock");
	default AddLockToPool(4, n"OM_Chest_Santino_01_Lock");
	default AddLockToPool(4, n"OTT_Chest_05_Lock");
	default AddLockToPool(4, n"SC_Chest_BaalNamib_Lock");
	default AddLockToPool(4, n"SC_Chest_BaalOrun_Lock");
	default AddLockToPool(4, n"SC_Chest_BaalTondral_Lock");
	default AddLockToPool(4, n"SC_Chest_Chani_Lock");
	default AddLockToPool(4, n"SC_Chest_CorAngar_Lock");
	default AddLockToPool(4, n"SC_Chest_Nyras_Lock");
	default AddLockToPool(4, n"SC_Chest_Viran_Lock");
	default AddLockToPool(4, n"XT_Chest_02_Lock");

	// --- Tier 5: Expert - 38 locks ---
	default AddLockToPool(5, n"BC_Chest_17_Lock");
	default AddLockToPool(5, n"BC_Chest_18_Lock");
	default AddLockToPool(5, n"CV_Chest_09_Lock");
	default AddLockToPool(5, n"FME_Chest_Gate_Lock");
	default AddLockToPool(5, n"MF_Chest_07_Lock");
	default AddLockToPool(5, n"NC_Chest_Cord_Lock");
	default AddLockToPool(5, n"NC_Chest_Cronos_Lock");
	default AddLockToPool(5, n"NC_Chest_Lares_Lock");
	default AddLockToPool(5, n"NC_Chest_Lee_Lock");
	default AddLockToPool(5, n"NC_Chest_Merdarion_Lock");
	default AddLockToPool(5, n"NC_Chest_Myxir_Lock");
	default AddLockToPool(5, n"NC_Chest_Nefarius_Lock");
	default AddLockToPool(5, n"NC_Chest_Riordian_Lock");
	default AddLockToPool(5, n"NC_Chest_Saturas_Lock");
	default AddLockToPool(5, n"NC_Chest_Wedge_Lock");
	default AddLockToPool(5, n"OA_Chest_04_Lock");
	default AddLockToPool(5, n"OC_Chest_Damarok_Lock");
	default AddLockToPool(5, n"OC_Chest_Diego_Lock");
	default AddLockToPool(5, n"OC_Chest_Fingers_Lock");
	default AddLockToPool(5, n"OC_Chest_Fisk_01_Lock");
	default AddLockToPool(5, n"OC_Chest_Fisk_03_Lock");
	default AddLockToPool(5, n"OC_Chest_Guy_Lock");
	default AddLockToPool(5, n"OC_Chest_Milten_Lock");
	default AddLockToPool(5, n"OC_Chest_Sly_Lock");
	default AddLockToPool(5, n"OC_Chest_Thorus_Lock");
	default AddLockToPool(5, n"OC_Chest_Torrez_Lock");
	default AddLockToPool(5, n"OC_Chest_Tower_02_Lock");
	default AddLockToPool(5, n"OC_Chest_Tower_06_Lock");
	default AddLockToPool(5, n"OC_Chest_Tower_09_Lock");
	default AddLockToPool(5, n"OG_Chest_01_Lock");
	default AddLockToPool(5, n"Otown_Chest_01_Lock");
	default AddLockToPool(5, n"OTT_Chest_06_Lock");
	default AddLockToPool(5, n"OTT_Chest_09_Lock");
	default AddLockToPool(5, n"SC_Chest_BaalCadar_Lock");
	default AddLockToPool(5, n"SC_Chest_Natalia_Lock");
	default AddLockToPool(5, n"SNT_Chest_09_Lock");
	default AddLockToPool(5, n"SW_Chest_03_Lock");
	default AddLockToPool(5, n"TST_Chest_WinchRoom_01_Lock");

	// --- Tier 6: Master - 25 locks ---
	default AddLockToPool(6, n"OM_Chest_Ulbert_02_Lock");
	default AddLockToPool(6, n"BC_Chest_16_Lock");
	default AddLockToPool(6, n"CR_Chest_01_Lock");
	default AddLockToPool(6, n"CR_Chest_02_Lock");
	default AddLockToPool(6, n"EF_Chest_03_Lock");
	default AddLockToPool(6, n"MF_Chest_01_Lock");
	default AddLockToPool(6, n"MF_Chest_12_Lock");
	default AddLockToPool(6, n"OA_Chest_02_Lock");
	default AddLockToPool(6, n"OC_Chest_Fisk_05_Lock");
	default AddLockToPool(6, n"OC_Chest_Forge_04_Lock");
	default AddLockToPool(6, n"OC_Chest_Graham_Lock");
	default AddLockToPool(6, n"OC_Chest_Raven_Lock");
	default AddLockToPool(6, n"OC_Chest_Tower_01_Lock");
	default AddLockToPool(6, n"OC_Chest_Tower_04_Lock");
	default AddLockToPool(6, n"OC_Chest_Tower_08_Lock");
	default AddLockToPool(6, n"Otown_Chest_02_Lock");
	default AddLockToPool(6, n"Otown_Chest_03_Lock");
	default AddLockToPool(6, n"Otown_Chest_04_Lock");
	default AddLockToPool(6, n"SC_Chest_Blacksmith_Lock");
	default AddLockToPool(6, n"SC_Chest_Fortuno_Lock");
	default AddLockToPool(6, n"SC_Chest_Yberion_Lock");
	default AddLockToPool(6, n"SW_Chest_02_Lock");
	default AddLockToPool(6, n"XT_Chest_01_Lock");
	default AddLockToPool(6, n"XT_Chest_03_Lock");
	default AddLockToPool(6, n"XT_Chest_04_Lock");

	// --- Tier 7: Grandmaster - 22 locks ---
	default AddLockToPool(7, n"OC_Chest_Armory_01_Lock");
	default AddLockToPool(7, n"OC_Chest_Armory_02_Lock");
	default AddLockToPool(7, n"OC_Chest_Armory_03_Lock");
	default AddLockToPool(7, n"OC_Chest_Armory_04_Lock");
	default AddLockToPool(7, n"OC_Chest_Gomez_01_Lock");
	default AddLockToPool(7, n"OM_Chest_Aaron_Lock");
	default AddLockToPool(7, n"OM_Chest_Ulbert_01_Lock");
	default AddLockToPool(7, n"BC_Chest_19_Lock");
	default AddLockToPool(7, n"BT_Chest_02_Lock");
	default AddLockToPool(7, n"EF_Chest_05_Lock");
	default AddLockToPool(7, n"FM_Chest_Gallery_01_Lock");
	default AddLockToPool(7, n"MF_Chest_04_Lock");
	default AddLockToPool(7, n"OC_Chest_Arto_Lock");
	default AddLockToPool(7, n"OC_Chest_Forge_02_Lock");
	default AddLockToPool(7, n"OC_Chest_Scar_Lock");
	default AddLockToPool(7, n"OCS_Chest_04_Lock");
	default AddLockToPool(7, n"SC_Chest_CorKalom_03_Lock");
	default AddLockToPool(7, n"SW_Chest_01_Lock");
	default AddLockToPool(7, n"XT_Chest_05_Lock");
	default AddLockToPool(7, n"XT_Chest_06_Lock");
	default AddLockToPool(7, n"SNT_Chest_04_Lock");
	default AddLockToPool(7, n"SNT_Chest_06_Lock");

	// =========================================================================
	//  Chest registration — add every chest class that participates in lock
	//  randomization.  Only chests with m_LockDifficulty > 0 will actually
	//  have their locks swapped; the rest are skipped.
	// =========================================================================

	// --- Tier 1: Novice - 24 chests ---
	default RegisterChest(UIO_BC_CHEST_01::StaticClass());
	default RegisterChest(UIO_BC_CHEST_07::StaticClass());
	default RegisterChest(UIO_BC_CHEST_10::StaticClass());
	default RegisterChest(UIO_BC_CHEST_11::StaticClass());
	default RegisterChest(UIO_FME_CHEST_EMPTYHUT_05::StaticClass());
	default RegisterChest(UIO_FME_CHEST_MERCENARY13_765_01::StaticClass());
	default RegisterChest(UIO_FME_CHEST_MERCENARY13_765_02::StaticClass());
	default RegisterChest(UIO_NC_CHEST_MERCENARY03_705::StaticClass());
	default RegisterChest(UIO_NC_CHEST_ROGUE11_821::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DEXTER::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER502::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER514::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER529::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER557::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER578::StaticClass());
	default RegisterChest(UIO_OC_CHEST_MUD::StaticClass());
	default RegisterChest(UIO_OC_CHEST_SHADOW310::StaticClass());
	default RegisterChest(UIO_OC_CHEST_SNAF_01::StaticClass());
	default RegisterChest(UIO_OC_CHEST_THRONE_01::StaticClass());
	default RegisterChest(UIO_OC_CHEST_WHISTLER::StaticClass());
	default RegisterChest(UIO_OM_CHEST_ALBERTO_04::StaticClass());
	default RegisterChest(UIO_OM_CHEST_ALBERTO_05::StaticClass());
	default RegisterChest(UIO_SC_CHEST_CORKALOM_01::StaticClass());
	default RegisterChest(UIO_SW_CHEST_07::StaticClass());

	// --- Tier 2: Apprentice - 49 chests ---
	default RegisterChest(UIO_BC_CHEST_02::StaticClass());
	default RegisterChest(UIO_BC_CHEST_03::StaticClass());
	default RegisterChest(UIO_BC_CHEST_04::StaticClass());
	default RegisterChest(UIO_BC_CHEST_05::StaticClass());
	default RegisterChest(UIO_BC_CHEST_09::StaticClass());
	default RegisterChest(UIO_BC_CHEST_12::StaticClass());
	default RegisterChest(UIO_BC_CHEST_13::StaticClass());
	default RegisterChest(UIO_BC_CHEST_14::StaticClass());
	default RegisterChest(UIO_BC_CHEST_23::StaticClass());
	default RegisterChest(UIO_FME_CHEST_CONTROLACCESS::StaticClass());
	default RegisterChest(UIO_FME_CHEST_EMPTYHUT_02::StaticClass());
	default RegisterChest(UIO_FME_CHEST_EMPTYHUT_04::StaticClass());
	default RegisterChest(UIO_NC_CHEST_GATEINTERIOR_02::StaticClass());
	default RegisterChest(UIO_NC_CHEST_JEREMIAH::StaticClass());
	default RegisterChest(UIO_NC_CHEST_LEFTY_01::StaticClass());
	default RegisterChest(UIO_NC_CHEST_LEFTY_02::StaticClass());
	default RegisterChest(UIO_NC_CHEST_ROGUE01_800::StaticClass());
	default RegisterChest(UIO_NC_CHEST_ROGUE07_815::StaticClass());
	default RegisterChest(UIO_NC_CHEST_ROGUE13_823::StaticClass());
	default RegisterChest(UIO_OC_CHEST_BULLIT::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER504::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER506::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER516::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER523::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER526::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER527::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER528::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER533::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER535::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER553::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER554::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER556::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER560::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER565::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER575::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DUSTY::StaticClass());
	default RegisterChest(UIO_OC_CHEST_FLETCHER::StaticClass());
	default RegisterChest(UIO_OC_CHEST_GUARD206::StaticClass());
	default RegisterChest(UIO_OC_CHEST_GUARD209::StaticClass());
	default RegisterChest(UIO_OC_CHEST_GUARD220::StaticClass());
	default RegisterChest(UIO_OC_CHEST_GUARD226::StaticClass());
	default RegisterChest(UIO_OC_CHEST_GUARD229::StaticClass());
	default RegisterChest(UIO_OC_CHEST_GUARD232::StaticClass());
	default RegisterChest(UIO_OC_CHEST_GUARD253::StaticClass());
	default RegisterChest(UIO_OC_CHEST_JESSE::StaticClass());
	default RegisterChest(UIO_OC_CHEST_KHARIM::StaticClass());
	default RegisterChest(UIO_OC_CHEST_OMID::StaticClass());
	default RegisterChest(UIO_OM_CHEST_SANTINO_02::StaticClass());
	default RegisterChest(UIO_OM_CHEST_SANTINO_03::StaticClass());

	// --- Tier 3: Journeyman - 67 chests ---
	default RegisterChest(UIO_BC_CHEST_08::StaticClass());
	default RegisterChest(UIO_BC_CHEST_15::StaticClass());
	default RegisterChest(UIO_CV_CHEST_07::StaticClass());
	default RegisterChest(UIO_FME_CHEST_SWINEY::StaticClass());
	default RegisterChest(UIO_IWML_CHEST_01::StaticClass());
	default RegisterChest(UIO_IWML_CHEST_04::StaticClass());
	default RegisterChest(UIO_NC_CHEST_BLADE::StaticClass());
	default RegisterChest(UIO_NC_CHEST_BRUCE::StaticClass());
	default RegisterChest(UIO_NC_CHEST_BUSTER::StaticClass());
	default RegisterChest(UIO_NC_CHEST_BUTCH::StaticClass());
	default RegisterChest(UIO_NC_CHEST_CELLAR::StaticClass());
	default RegisterChest(UIO_NC_CHEST_GORN::StaticClass());
	default RegisterChest(UIO_NC_CHEST_HOMER::StaticClass());
	default RegisterChest(UIO_NC_CHEST_MERCENARY02_703::StaticClass());
	default RegisterChest(UIO_NC_CHEST_MERCENARY04_706::StaticClass());
	default RegisterChest(UIO_NC_CHEST_MERCENARY06_708::StaticClass());
	default RegisterChest(UIO_NC_CHEST_MERCENARY17_735::StaticClass());
	default RegisterChest(UIO_NC_CHEST_ORIK::StaticClass());
	default RegisterChest(UIO_NC_CHEST_ROGUE05_810::StaticClass());
	default RegisterChest(UIO_NC_CHEST_ROGUE06_811::StaticClass());
	default RegisterChest(UIO_NC_CHEST_ROGUE08_816::StaticClass());
	default RegisterChest(UIO_NC_CHEST_ROGUE09_817::StaticClass());
	default RegisterChest(UIO_NC_CHEST_ROGUE10_820::StaticClass());
	default RegisterChest(UIO_NC_CHEST_ROGUE22_837::StaticClass());
	default RegisterChest(UIO_NC_CHEST_SILAS::StaticClass());
	default RegisterChest(UIO_NC_CHEST_TORLOF::StaticClass());
	default RegisterChest(UIO_NC_CHEST_WOLF::StaticClass());
	default RegisterChest(UIO_OA_CHEST_01::StaticClass());
	default RegisterChest(UIO_OC_CHEST_BAALPARVEZ::StaticClass());
	default RegisterChest(UIO_OC_CHEST_CUTTER::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER501::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER503::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER505::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER508::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER509::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER510::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER512::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER517::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER519::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER521::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER522::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER531::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER532::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER555::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER561::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER576::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER577::StaticClass());
	default RegisterChest(UIO_OC_CHEST_GRAVO::StaticClass());
	default RegisterChest(UIO_OC_CHEST_GRIM::StaticClass());
	default RegisterChest(UIO_OC_CHEST_GUARD221::StaticClass());
	default RegisterChest(UIO_OC_CHEST_GUARD228::StaticClass());
	default RegisterChest(UIO_OC_CHEST_GUARD239::StaticClass());
	default RegisterChest(UIO_OC_CHEST_GUARD240::StaticClass());
	default RegisterChest(UIO_OC_CHEST_GUARD242::StaticClass());
	default RegisterChest(UIO_OC_CHEST_JACKAL::StaticClass());
	default RegisterChest(UIO_OC_CHEST_KYLE::StaticClass());
	default RegisterChest(UIO_OC_CHEST_RUINS_02::StaticClass());
	default RegisterChest(UIO_OC_CHEST_SCATTY::StaticClass());
	default RegisterChest(UIO_OC_CHEST_SCORPIO::StaticClass());
	default RegisterChest(UIO_OC_CHEST_SHADOW306::StaticClass());
	default RegisterChest(UIO_OC_CHEST_SHADOW314::StaticClass());
	default RegisterChest(UIO_OC_CHEST_SHADOW322::StaticClass());
	default RegisterChest(UIO_OC_CHEST_SHADOW328::StaticClass());
	default RegisterChest(UIO_OC_CHEST_SHADOW330::StaticClass());
	default RegisterChest(UIO_OC_CHEST_STONE::StaticClass());
	default RegisterChest(UIO_OC_CHEST_TOWER_03::StaticClass());
	default RegisterChest(UIO_OC_CHEST_TOWER_05::StaticClass());

	// --- Tier 4: Adept - 71 chests ---
	default RegisterChest(UIO_AMR_CHEST_04::StaticClass());
	default RegisterChest(UIO_AM_CHEST_04::StaticClass());
	default RegisterChest(UIO_AM_CHEST_05::StaticClass());
	default RegisterChest(UIO_BC_CHEST_20::StaticClass());
	default RegisterChest(UIO_BC_CHEST_22::StaticClass());
	default RegisterChest(UIO_BT_CHEST_01::StaticClass());
	default RegisterChest(UIO_CV_CHEST_01::StaticClass());
	default RegisterChest(UIO_CV_CHEST_02::StaticClass());
	default RegisterChest(UIO_CV_CHEST_10::StaticClass());
	default RegisterChest(UIO_FM_CHEST_FURNACE_01::StaticClass());
	default RegisterChest(UIO_FM_CHEST_FURNACE_02::StaticClass());
	default RegisterChest(UIO_IWML_CHEST_02::StaticClass());
	default RegisterChest(UIO_IWML_CHEST_03::StaticClass());
	default RegisterChest(UIO_IWML_CHEST_05::StaticClass());
	default RegisterChest(UIO_MF_CHEST_08::StaticClass());
	default RegisterChest(UIO_NC_CHEST_CIPHER::StaticClass());
	default RegisterChest(UIO_NC_CHEST_DISTILLERY::StaticClass());
	default RegisterChest(UIO_NC_CHEST_GATEINTERIOR_01::StaticClass());
	default RegisterChest(UIO_NC_CHEST_MERCENARY07_710::StaticClass());
	default RegisterChest(UIO_NC_CHEST_RICELORD::StaticClass());
	default RegisterChest(UIO_NC_CHEST_ROGUE03_806::StaticClass());
	default RegisterChest(UIO_NC_CHEST_ROGUE23_838::StaticClass());
	default RegisterChest(UIO_NC_CHEST_SHARKY::StaticClass());
	default RegisterChest(UIO_NC_CHEST_SUNKEN_01::StaticClass());
	default RegisterChest(UIO_NC_CHEST_SUNKEN_02::StaticClass());
	default RegisterChest(UIO_OA_CHEST_03::StaticClass());
	default RegisterChest(UIO_OC_CHEST_BALAM::StaticClass());
	default RegisterChest(UIO_OC_CHEST_BARTHOLO::StaticClass());
	default RegisterChest(UIO_OC_CHEST_BETTINGOWNER::StaticClass());
	default RegisterChest(UIO_OC_CHEST_BLOODWYN::StaticClass());
	default RegisterChest(UIO_OC_CHEST_CORRISTO::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER507::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER513::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIGGER515::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DRAGO::StaticClass());
	default RegisterChest(UIO_OC_CHEST_FISK_02::StaticClass());
	default RegisterChest(UIO_OC_CHEST_FISK_04::StaticClass());
	default RegisterChest(UIO_OC_CHEST_FISK_06::StaticClass());
	default RegisterChest(UIO_OC_CHEST_FISK_07::StaticClass());
	default RegisterChest(UIO_OC_CHEST_FISK_08::StaticClass());
	default RegisterChest(UIO_OC_CHEST_FORGE_01::StaticClass());
	default RegisterChest(UIO_OC_CHEST_GORHANIS::StaticClass());
	default RegisterChest(UIO_OC_CHEST_GUARD230::StaticClass());
	default RegisterChest(UIO_OC_CHEST_GUARD241::StaticClass());
	default RegisterChest(UIO_OC_CHEST_GUARD252::StaticClass());
	default RegisterChest(UIO_OC_CHEST_HUNO::StaticClass());
	default RegisterChest(UIO_OC_CHEST_KIRGO::StaticClass());
	default RegisterChest(UIO_OC_CHEST_KITCHEN::StaticClass());
	default RegisterChest(UIO_OC_CHEST_MORDRAG::StaticClass());
	default RegisterChest(UIO_OC_CHEST_RODRIGUEZ::StaticClass());
	default RegisterChest(UIO_OC_CHEST_RUINS_01::StaticClass());
	default RegisterChest(UIO_OC_CHEST_SHADOW304::StaticClass());
	default RegisterChest(UIO_OC_CHEST_SHADOW313::StaticClass());
	default RegisterChest(UIO_OC_CHEST_SHADOW316::StaticClass());
	default RegisterChest(UIO_OC_CHEST_SHADOW318::StaticClass());
	default RegisterChest(UIO_OC_CHEST_SHADOW319::StaticClass());
	default RegisterChest(UIO_OC_CHEST_SKIP::StaticClass());
	default RegisterChest(UIO_OC_CHEST_SNAF_02::StaticClass());
	default RegisterChest(UIO_OC_CHEST_TOWER_07::StaticClass());
	default RegisterChest(UIO_OM_CHEST_ALBERTO_01::StaticClass());
	default RegisterChest(UIO_OM_CHEST_ALBERTO_03::StaticClass());
	default RegisterChest(UIO_OM_CHEST_SANTINO_01::StaticClass());
	default RegisterChest(UIO_OTT_Chest_05::StaticClass());
	default RegisterChest(UIO_SC_CHEST_BAALNAMIB::StaticClass());
	default RegisterChest(UIO_SC_CHEST_BAALORUN::StaticClass());
	default RegisterChest(UIO_SC_CHEST_BAALTONDRAL::StaticClass());
	default RegisterChest(UIO_SC_CHEST_CHANI::StaticClass());
	default RegisterChest(UIO_SC_CHEST_CORANGAR::StaticClass());
	default RegisterChest(UIO_SC_CHEST_NYRAS::StaticClass());
	default RegisterChest(UIO_SC_CHEST_VIRAN::StaticClass());
	default RegisterChest(UIO_XT_CHEST_02::StaticClass());

	// --- Tier 5: Expert - 37 chests ---
	default RegisterChest(UIO_BC_CHEST_17::StaticClass());
	default RegisterChest(UIO_BC_CHEST_18::StaticClass());
	default RegisterChest(UIO_CV_CHEST_09::StaticClass());
	default RegisterChest(UIO_FME_CHEST_GATE::StaticClass());
	default RegisterChest(UIO_MF_CHEST_07::StaticClass());
	default RegisterChest(UIO_NC_CHEST_CORD::StaticClass());
	default RegisterChest(UIO_NC_CHEST_CRONOS::StaticClass());
	default RegisterChest(UIO_NC_CHEST_LARES::StaticClass());
	default RegisterChest(UIO_NC_CHEST_LEE::StaticClass());
	default RegisterChest(UIO_NC_CHEST_MERDARION::StaticClass());
	default RegisterChest(UIO_NC_CHEST_MYXIR::StaticClass());
	default RegisterChest(UIO_NC_CHEST_NEFARIUS::StaticClass());
	default RegisterChest(UIO_NC_CHEST_RIORDIAN::StaticClass());
	default RegisterChest(UIO_NC_CHEST_SATURAS::StaticClass());
	default RegisterChest(UIO_NC_CHEST_WEDGE::StaticClass());
	default RegisterChest(UIO_OA_CHEST_04::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DAMAROK::StaticClass());
	default RegisterChest(UIO_OC_CHEST_DIEGO::StaticClass());
	default RegisterChest(UIO_OC_CHEST_FINGERS::StaticClass());
	default RegisterChest(UIO_OC_CHEST_FISK_01::StaticClass());
	default RegisterChest(UIO_OC_CHEST_FISK_03::StaticClass());
	default RegisterChest(UIO_OC_CHEST_GUY::StaticClass());
	default RegisterChest(UIO_OC_CHEST_MILTEN::StaticClass());
	default RegisterChest(UIO_OC_CHEST_SLY::StaticClass());
	default RegisterChest(UIO_OC_CHEST_THORUS::StaticClass());
	default RegisterChest(UIO_OC_CHEST_TORREZ::StaticClass());
	default RegisterChest(UIO_OC_CHEST_TOWER_02::StaticClass());
	default RegisterChest(UIO_OC_CHEST_TOWER_06::StaticClass());
	default RegisterChest(UIO_OC_CHEST_TOWER_09::StaticClass());
	default RegisterChest(UIO_OG_CHEST_01::StaticClass());
	default RegisterChest(UIO_OTT_Chest_06::StaticClass());
	default RegisterChest(UIO_OTT_Chest_09::StaticClass());
	default RegisterChest(UIO_Otown_CHEST_01::StaticClass());
	default RegisterChest(UIO_SC_CHEST_BAALCADAR::StaticClass());
	default RegisterChest(UIO_SC_CHEST_NATALIA::StaticClass());
	default RegisterChest(UIO_SNT_CHEST_09::StaticClass());
	default RegisterChest(UIO_SW_CHEST_03::StaticClass());

	// --- Tier 6: Master - 25 chests ---
	default RegisterChest(UIO_BC_CHEST_16::StaticClass());
	default RegisterChest(UIO_CR_CHEST_01::StaticClass());
	default RegisterChest(UIO_CR_CHEST_02::StaticClass());
	default RegisterChest(UIO_EF_CHEST_03::StaticClass());
	default RegisterChest(UIO_MF_CHEST_01::StaticClass());
	default RegisterChest(UIO_MF_CHEST_12::StaticClass());
	default RegisterChest(UIO_OA_CHEST_02::StaticClass());
	default RegisterChest(UIO_OC_CHEST_FISK_05::StaticClass());
	default RegisterChest(UIO_OC_CHEST_FORGE_04::StaticClass());
	default RegisterChest(UIO_OC_CHEST_GRAHAM::StaticClass());
	default RegisterChest(UIO_OC_CHEST_RAVEN::StaticClass());
	default RegisterChest(UIO_OC_CHEST_TOWER_01::StaticClass());
	default RegisterChest(UIO_OC_CHEST_TOWER_04::StaticClass());
	default RegisterChest(UIO_OC_CHEST_TOWER_08::StaticClass());
	default RegisterChest(UIO_OM_CHEST_ULBERT_02::StaticClass());
	default RegisterChest(UIO_Otown_CHEST_02::StaticClass());
	default RegisterChest(UIO_Otown_CHEST_03::StaticClass());
	default RegisterChest(UIO_Otown_CHEST_04::StaticClass());
	default RegisterChest(UIO_SC_CHEST_BLACKSMITH::StaticClass());
	default RegisterChest(UIO_SC_CHEST_FORTUNO::StaticClass());
	default RegisterChest(UIO_SC_CHEST_YBERION::StaticClass());
	default RegisterChest(UIO_SW_CHEST_02::StaticClass());
	default RegisterChest(UIO_XT_CHEST_01::StaticClass());
	default RegisterChest(UIO_XT_CHEST_03::StaticClass());
	default RegisterChest(UIO_XT_CHEST_04::StaticClass());

	// --- Tier 7: Grandmaster - 20 chests ---
	default RegisterChest(UIO_BC_CHEST_19::StaticClass());
	default RegisterChest(UIO_BT_CHEST_02::StaticClass());
	default RegisterChest(UIO_EF_CHEST_05::StaticClass());
	default RegisterChest(UIO_FM_CHEST_GALLERY::StaticClass());
	default RegisterChest(UIO_MF_CHEST_04::StaticClass());
	default RegisterChest(UIO_OCS_CHEST_04::StaticClass());
	default RegisterChest(UIO_OC_CHEST_ARMORY_01::StaticClass());
	default RegisterChest(UIO_OC_CHEST_ARMORY_02::StaticClass());
	default RegisterChest(UIO_OC_CHEST_ARMORY_03::StaticClass());
	default RegisterChest(UIO_OC_CHEST_ARMORY_04::StaticClass());
	default RegisterChest(UIO_OC_CHEST_ARTO::StaticClass());
	default RegisterChest(UIO_OC_CHEST_FORGE_02::StaticClass());
	default RegisterChest(UIO_OC_CHEST_GOMEZ_01::StaticClass());
	default RegisterChest(UIO_OC_CHEST_SCAR::StaticClass());
	default RegisterChest(UIO_OM_CHEST_AARON::StaticClass());
	default RegisterChest(UIO_OM_CHEST_ULBERT_01::StaticClass());
	default RegisterChest(UIO_SC_CHEST_CORKALOM_03::StaticClass());
	default RegisterChest(UIO_SW_CHEST_01::StaticClass());
	default RegisterChest(UIO_XT_CHEST_05::StaticClass());
	default RegisterChest(UIO_XT_CHEST_06::StaticClass());

	/**
	 * On world init, iterate over every chest and replace its m_Lock with a random lock
	 * from the appropriate tier's pool.  The original lock is saved in m_OriginalLock
	 * so that it can be restored.
	 */
	UFUNCTION(BlueprintOverride)
	void PostInitialize()
	{
		if (World.IsEditorWorld())
			return;

		if (!bRandomLocksEnabled)
			return;

		for (auto chestClass : m_RegisteredChests)
		{
			UIoChestDefault cdo = Cast<UIoChestDefault>(chestClass.GetDefaultObject());
			if (cdo == nullptr)
				continue;

			if (cdo.m_bNoRandomLock)
				continue;

			if (cdo.m_LockDifficulty <= 0)
				continue;

			if (cdo.m_Lock.IsNone())
				continue;

			if (cdo.m_OriginalLock.IsNone())
				cdo.m_OriginalLock = cdo.m_Lock;

			cdo.m_Lock = cdo.m_OriginalLock;

			TArray<FName> pool = GetLocksForTier(cdo.m_LockDifficulty);
			if (pool.Num() > 0)
			{
				int idx = Math::RandRange(0, pool.Num() - 1);
				cdo.m_Lock = pool[idx];
				Log(f"[RandomLock] {cdo.m_UniqueName} -> {pool[idx]} (tier {cdo.m_LockDifficulty})");
			}
		}
	}
}
