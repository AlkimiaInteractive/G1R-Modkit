	

	class UGothicModExt_ExampleItems : UGothicModExt_WorldPoints
	{
		default ItemSpawnConfigToExtend = UItemSpawnManagerConfig_MainMap;
		default WorldPointManagerConfigToExtend = UWorldpointManagerConfig_MainMap;

		// Example 1: ------------------------------------------------------------------------------------------------------------------------
		// This replaces an existing spawner (because the name exists in the base)
		default Items.SetWorldPoint(n"Spawner_EZ_Balcony_Weapon_01");
		default Items.AddItemsEvent(n"OnWorldStart");
		default Items.AddItem(1, UItMw_2H_Sword_Uriziel_03);


		// Example 2: ------------------------------------------------------------------------------------------------------------------------
		// Utility function that creates the WorldPoint and ItemConfig entries for a single item spawn
		default AddSingleItemSpawn(n"Spawner_Example_NewItem_1", UItMw_2H_Sword_Wind, FTransform(FRotator(0.00, 15.06, 0.00), FVector(108448.65, -76500.15, -573.91)));


		// Example 3: ------------------------------------------------------------------------------------------------------------------------
		// New item spawner from scratch (same that AddSingleItemSpawn does for you, but allows randomized item spawns on the same WorldPoint)
		// - Needs a new WorldPoint to get the transform from
		// - Needs at least one ProxyPoint (used for random item placement within a WorldPoint)
		default Points.AddWorldPoint(n"Spawner_Example_NewItem");
		default Points.AddWorldPosition(FRotator::ZeroRotator, FVector(108448.65, -76480, -573.91)); // Close to the other item spawner by the scavengers
		default Points.AddScriptDefinition(UWorldPointScript);
		default Points.AddProxyPoint(0,FRotator::ZeroRotator, FVector(108448.65, -76480, -573.91));
		default Points.AddProxyPoint(0,FRotator::ZeroRotator, FVector(108448.65, -76460, -573.91));
		default Points.AddProxyPoint(0,FRotator::ZeroRotator, FVector(108448.65, -76440, -573.91));

		default Items.SetWorldPoint(n"Spawner_Example_NewItem");
		default Items.AddItem(1, UItMi_Alchemy_Salt_01);
		default Items.AddItem(1, UItFo_Potion_Wine);
		default Items.AddItem(1, UItFo_Apple);
	}