
UCLASS()
class UDefaultWorldDefinition: UWorldDefinition
{
    default m_DefaultOre = UItMi_Orenugget::StaticClass();
    default m_Regions = UDefaultRegionsDefinition::StaticClass();
    default m_TradersType = UDefaultTradersTypeDefinition::StaticClass();
    default m_DefaultTraderRegion = n"Wilderness";
    default m_DefaultTraderType = n"General";
    default m_CharactersDefaultInteraction = UDefaultCharacterInteraction::StaticClass();
    default m_CharactersLootInteraction = ULootCharacterInteraction::StaticClass();
    default m_CharactersExecutionInteraction = UExecutionCharacterInteraction::StaticClass();
    default m_CharactersRideInteraction = URideCharacterInteraction::StaticClass();
    default m_DefaultCamera.Add(UDefaultCamera::StaticClass()); //default camera
    default m_DefaultCamera.Add(UClassicCamera::StaticClass()); //classic camera
    default m_DefaultPhotoModeConfig = UDefaultPhotoModeConfig::StaticClass();
    default m_PhysicsDefinition = UDeedoPhysicsDefinition::StaticClass();
    //default m_SpawnAllAiFromStart = true;
    default m_MiningDefinition = UMiningConfig::StaticClass();
    default m_InteractCameraDefinition = UMIntCamConfig::StaticClass();
    default m_AIAgentsNameDistance = 400.0f;
    default m_AIAgentsNameImportantConversationsDistance = 2000.0f;
    default m_GothicGameViewportClientDisableGamepad = true;
    default m_ShowHealthBarTimer = 2.0f;
    default m_ShowGameOverTimer = 5.0f;
    default m_SensorConfigDefinition = USensorConfig::StaticClass();
    default m_StatsCalculatorConfiguration = UStatsConfigurationDefinition::StaticClass();
    default m_ShowNPCNames = true;
    default m_ReviveCounter = -1; // -1 = revive disabled
    default m_MaxRegionalMultiplier = 0.25f;
    default m_MaxLiquidityMultiplier = 0.25f;
	default m_RegionalMultiplierMax = 0.2f;
	default m_RegionalMultiplierMin = -1.0f;
	default m_RegionalMultiplierDivide = 0.5f;
	default m_LiquidityMultiplierMax = 0.05f;
	default m_LiquidityMultiplierMin = -1.0f;
    default m_MainRegions = 5.0f;
    default m_DropForce = 15000.0f;
    default m_ValidTagsControlledByPlayer.AddTag(GameplayTag::Action_Loot);
    default m_ValidTagsControlledByPlayer.AddTag(GameplayTag::Action_Open_Container);
    default m_ValidTagsControlledByPlayer.AddTag(GameplayTag::Action_Door);
    default m_ValidTagsControlledByPlayer.AddTag(GameplayTag::Action_Interact_Sit_Chair);
    default m_ValidTagsControlledByPlayer.AddTag(GameplayTag::Action_Ladder);
    default m_ValidTagsTransformed.AddTag(GameplayTag::Action_Loot);
    default m_ValidTagsTransformed.AddTag(GameplayTag::Action_Pick_ToInventory);
    default m_ValidTagsRunning.AddTag(GameplayTag::Action_Door);
    default m_ValidTagsRunning.AddTag(GameplayTag::Action_Pick_ToInventory);
    default m_CampAreasForBody.AddTag(GameplayTag::Area_NewCamp);
    default m_CampAreasForBody.AddTag(GameplayTag::Area_OldCamp);
    default m_CampAreasForBody.AddTag(GameplayTag::Area_SwampCamp);
    //default AddStationExperience(GameplayTag::Action_Crafting_Forge, 50); 
    //default AddStationExperience(GameplayTag::Action_Crafting_Anvil, 50); 
    //default AddStationExperience(GameplayTag::Action_Crafting_Barrel, 50); 

    default m_ItemVisualWorldGroup = n"Blueprint'/Game/Items/Group/BP_ItFo_GroupGeneric_World.BP_ItFo_GroupGeneric_World_C'";
    default m_ItemVisualWorldArrows = n"Blueprint'/Game/Items/Group/BP_ItFo_GroupArrow_World.BP_ItFo_GroupArrow_World_C'";
    default m_ItemVisualWorldBolts = n"Blueprint'/Game/Items/Group/BP_ItFo_GroupBolt_World.BP_ItFo_GroupBolt_World_C'";

    default m_MaxTorches = 5;
    default m_LockPickExp = 10;

#if WITH_IMGUI
    default m_AnimDebugPostProcess = n"AnimBlueprint'/Game/AnimLibrary/Humanoid/Man/ImGUIHumanPostProcessAnimBP.ImGUIHumanPostProcessAnimBP_C'";
#endif

    UFUNCTION(BlueprintOverride)
    int ExperienceRequiredForLevel(int level) const
    {
        return 250 * level * (level + 1);
    }

    /** Returns which level a character with the given amount of experience has */
    UFUNCTION(BlueprintOverride)
    int LevelFromExperience(int experience) const
    {
        int level = 0;

        // We could also solve this analytically, but using a loop saves us from
        // writing the inverse of the ExperienceRequiredForLevel-function here.
        while(experience >= ExperienceRequiredForLevel(level + 1))
        {
            level += 1;
        }

        return level;
    }

    // Given the current experience and level, should the character have a Levelup now?
    UFUNCTION(BlueprintOverride)
    bool ShouldLevelUp(const int ExperienceNow, const int LevelNow) const
    {
        return LevelFromExperience(ExperienceNow) > LevelNow;
    }
};

UCLASS()
class USensorConfig: USensorConfigDefinition
{
    default m_NonActionOutline.AddTag(GameplayTag::Action_Execution);
    default m_NonActionOutline.AddTag(GameplayTag::Action_Conversation);
    default m_NonActionOutline.AddTag(GameplayTag::Action_Ride);
    default m_NonSightOutline.AddTag(GameplayTag::Action_Conversation);
    default m_PerceptionIgnore.AddTag(GameplayTag::Action_Pick_ToCarry);
    default m_PerceptionExtraCheck.AddTag(GameplayTag::Action_Loot);
    default m_PerceptionExtraCheck.AddTag(GameplayTag::Action_Conversation);
    default m_PerceptionExtraCheck.AddTag(GameplayTag::Action_Ladder);
    default m_PerceptionExtraCheck.AddTag(GameplayTag::Action_Pickpocket);
    default m_PerceptionExtraCheck.AddTag(GameplayTag::Action_Pick_ToInventory_Pouch);
};

UCLASS()
class UMIntCamConfig: UInteractCameraDefinition
{
    default m_BlendFunction = EViewTargetBlendFunction::VTBlend_Cubic;
    default m_BlendExp = 4.0f;
    default m_LockOutgoing = true;
    default m_Time = 1.5f;
};

UCLASS()
class UMiningConfig: UMiningSpotConfig
{
    default m_MiningDuration = 3.0f;
    default m_HighOre = 5;
    default m_VisualMaxOre = 15;
    default m_AmountAtHighOre =3;
    default m_AmountAtLowOre = 1;
};

UCLASS()
class UDeedoPhysicsDefinition: UPhysicsDefinition
{
    default m_ShouldBounce = true;
    default m_Bounciness = 0.3f;
    default m_Friction = 0.3f;
    default m_BounceVelocityStop = 0.3f;
    default m_ThrowSpeed = 1000.0f;
    default m_ThrowDistance = 700.0f;
};

UCLASS()
class UDefaultRegionsDefinition: URegionsDefinition
{
    default AddRegionConfig(n"Old Camp", GameplayTag::Item_Food, 0.05f);
    default AddRegionConfig(n"Old Camp", GameplayTag::Item_Herb, 0.0f);
    default AddRegionConfig(n"Old Camp", GameplayTag::Item_Potion, 0.08f);
    default AddRegionConfig(n"Old Camp", GameplayTag::Item_Weapon_Rune, 0.1f);
    default AddRegionConfig(n"Old Camp", GameplayTag::Item_Weapon_Scroll, 0.1f);
    default AddRegionConfig(n"Old Camp", GameplayTag::Item_Armor, 0.00f);
    default AddRegionConfig(n"Old Camp", GameplayTag::Item_Weapon_Axe, -0.1f);
    default AddRegionConfig(n"Old Camp", GameplayTag::Item_Weapon_Sword, -0.1f);
    default AddRegionConfig(n"Old Camp", GameplayTag::Item_Weapon_Mace, -0.1f);
    default AddRegionConfig(n"Old Camp", GameplayTag::Item_Weapon_Staff, -0.1f);
    default AddRegionConfig(n"Old Camp", GameplayTag::Item_Weapon_Bow, -0.1f);
    default AddRegionConfig(n"Old Camp", GameplayTag::Item_Weapon_Crossbow, -0.1f);

    default AddRegionConfig(n"New Camp", GameplayTag::Item_Food, -0.1f);
    default AddRegionConfig(n"New Camp", GameplayTag::Item_Herb, 0.08f);
    default AddRegionConfig(n"New Camp", GameplayTag::Item_Potion, 0.1f);
    default AddRegionConfig(n"New Camp", GameplayTag::Item_Weapon_Rune, 0.0f);
    default AddRegionConfig(n"New Camp", GameplayTag::Item_Weapon_Scroll, 0.0f);
    default AddRegionConfig(n"New Camp", GameplayTag::Item_Armor, 0.0f);
    default AddRegionConfig(n"New Camp", GameplayTag::Item_Weapon_Axe, 0.1f);
    default AddRegionConfig(n"New Camp", GameplayTag::Item_Weapon_Sword, 0.1f);
    default AddRegionConfig(n"New Camp", GameplayTag::Item_Weapon_Mace, 0.1f);
    default AddRegionConfig(n"New Camp", GameplayTag::Item_Weapon_Staff, 0.1f);
    default AddRegionConfig(n"New Camp", GameplayTag::Item_Weapon_Bow, 0.1f);
    default AddRegionConfig(n"New Camp", GameplayTag::Item_Weapon_Crossbow, 0.1f);

    default AddRegionConfig(n"Swamp Camp", GameplayTag::Item_Food, 0.05f);
    default AddRegionConfig(n"Swamp Camp", GameplayTag::Item_Herb, 0.1f);
    default AddRegionConfig(n"Swamp Camp", GameplayTag::Item_Potion, -0.15f);
    default AddRegionConfig(n"Swamp Camp", GameplayTag::Item_Weapon_Rune, -0.1f);
    default AddRegionConfig(n"Swamp Camp", GameplayTag::Item_Weapon_Scroll, -0.1f);
    default AddRegionConfig(n"Swamp Camp", GameplayTag::Item_Armor, -0.2f);
    default AddRegionConfig(n"Swamp Camp", GameplayTag::Item_Weapon_Axe, -0.1f);
    default AddRegionConfig(n"Swamp Camp", GameplayTag::Item_Weapon_Sword, -0.1f);
    default AddRegionConfig(n"Swamp Camp", GameplayTag::Item_Weapon_Mace, -0.1f);
    default AddRegionConfig(n"Swamp Camp", GameplayTag::Item_Weapon_Staff, -0.1f);
    default AddRegionConfig(n"Swamp Camp", GameplayTag::Item_Weapon_Bow, -0.1f);
    default AddRegionConfig(n"Swamp Camp", GameplayTag::Item_Weapon_Crossbow, -0.1f);

    default AddRegionConfig(n"Old Mine", GameplayTag::Item_Food, 0.1f);
    default AddRegionConfig(n"Old Mine", GameplayTag::Item_Herb, 0.08f);
    default AddRegionConfig(n"Old Mine", GameplayTag::Item_Potion, 0.1f);
    default AddRegionConfig(n"Old Mine", GameplayTag::Item_Weapon_Rune, -0.2f);
    default AddRegionConfig(n"Old Mine", GameplayTag::Item_Weapon_Scroll, -0.2f);
    default AddRegionConfig(n"Old Mine", GameplayTag::Item_Armor, 0.0f);
    default AddRegionConfig(n"Old Mine", GameplayTag::Item_Weapon_Axe, 0.1f);
    default AddRegionConfig(n"Old Mine", GameplayTag::Item_Weapon_Sword, 0.1f);
    default AddRegionConfig(n"Old Mine", GameplayTag::Item_Weapon_Mace, 0.1f);
    default AddRegionConfig(n"Old Mine", GameplayTag::Item_Weapon_Staff, 0.1f);
    default AddRegionConfig(n"Old Mine", GameplayTag::Item_Weapon_Bow, 0.1f);
    default AddRegionConfig(n"Old Mine", GameplayTag::Item_Weapon_Crossbow, 0.1f);

    default AddRegionConfig(n"Wilderness", GameplayTag::Item_Food, 0.0f);
    default AddRegionConfig(n"Wilderness", GameplayTag::Item_Herb, 0.0f);
    default AddRegionConfig(n"Wilderness", GameplayTag::Item_Potion, 0.0f);
    default AddRegionConfig(n"Wilderness", GameplayTag::Item_Weapon_Rune, 0.0f);
    default AddRegionConfig(n"Wilderness", GameplayTag::Item_Armor, 0.0f);
    default AddRegionConfig(n"Wilderness", GameplayTag::Item_Weapon, 0.0f);
};

UCLASS()
class UDefaultTradersTypeDefinition: UTradersTypeDefinition
{
    default AddTraderCategory(n"General", GameplayTag::Item_Food, 0.05f);
    default AddTraderCategory(n"General", GameplayTag::Item_Herb, 0.0f);
    default AddTraderCategory(n"General", GameplayTag::Item_Potion, -0.05f);
    default AddTraderCategory(n"General", GameplayTag::Item_Weapon_Rune, -0.5f);
    default AddTraderCategory(n"General", GameplayTag::Item_Weapon_Scroll, -0.5f);
    default AddTraderCategory(n"General", GameplayTag::Item_Armor, 0.0f);
    default AddTraderCategory(n"General", GameplayTag::Item_Weapon_Axe, 0.0f);
    default AddTraderCategory(n"General", GameplayTag::Item_Weapon_Sword, 0.0f);
    default AddTraderCategory(n"General", GameplayTag::Item_Weapon_Mace, 0.0f);
    default AddTraderCategory(n"General", GameplayTag::Item_Weapon_Staff, 0.0f);
    default AddTraderCategory(n"General", GameplayTag::Item_Weapon_Bow, 0.0f);
    default AddTraderCategory(n"General", GameplayTag::Item_Weapon_Crossbow, 0.0f);
    default AddTraderCategory(n"General", GameplayTag::Item_Material, -0.1f);
    default AddTraderCategory(n"General", GameplayTag::Item_Trophy, -0.1f);
    default AddTraderCategory(n"General", GameplayTag::Item_Writing, -0.2f);
    default AddTraderCategory(n"General", GameplayTag::Item_Projectile, 0.0f);
    default AddTraderCategory(n"General", GameplayTag::Item_Ring, -0.2f);
    default AddTraderCategory(n"General", GameplayTag::Item_Amulet, -0.2f);
  
    default AddTraderCategory(n"Herbalist", GameplayTag::Item_Food, 0.05f);
    default AddTraderCategory(n"Herbalist", GameplayTag::Item_Herb, 0.1f);
    default AddTraderCategory(n"Herbalist", GameplayTag::Item_Potion, 0.00f);
    default AddTraderCategory(n"Herbalist", GameplayTag::Item_Weapon_Rune, -0.5f);
    default AddTraderCategory(n"Herbalist", GameplayTag::Item_Weapon_Scroll, -0.5f);
    default AddTraderCategory(n"Herbalist", GameplayTag::Item_Armor, -0.2f);
    default AddTraderCategory(n"Herbalist", GameplayTag::Item_Weapon_Axe, -0.2f);
    default AddTraderCategory(n"Herbalist", GameplayTag::Item_Weapon_Sword, -0.2f);
    default AddTraderCategory(n"Herbalist", GameplayTag::Item_Weapon_Mace, -0.2f);
    default AddTraderCategory(n"Herbalist", GameplayTag::Item_Weapon_Staff, -0.2f);
    default AddTraderCategory(n"Herbalist", GameplayTag::Item_Weapon_Bow, -0.2f);
    default AddTraderCategory(n"Herbalist", GameplayTag::Item_Weapon_Crossbow, -0.2f);
    default AddTraderCategory(n"Herbalist", GameplayTag::Item_Material, -0.1f);
    default AddTraderCategory(n"Herbalist", GameplayTag::Item_Trophy, -0.2f);
    default AddTraderCategory(n"Herbalist", GameplayTag::Item_Writing, -0.1f);
    default AddTraderCategory(n"Herbalist", GameplayTag::Item_Projectile, -0.2f);
    default AddTraderCategory(n"Herbalist", GameplayTag::Item_Ring, -0.2f);
    default AddTraderCategory(n"Herbalist", GameplayTag::Item_Amulet, -0.2f);
    
    default AddTraderCategory(n"Alchemist", GameplayTag::Item_Food, 0.00f);
    default AddTraderCategory(n"Alchemist", GameplayTag::Item_Herb, 0.05f);
    default AddTraderCategory(n"Alchemist", GameplayTag::Item_Potion, 0.2f);
    default AddTraderCategory(n"Alchemist", GameplayTag::Item_Weapon_Rune, 0.0f);
    default AddTraderCategory(n"Alchemist", GameplayTag::Item_Weapon_Scroll, 0.0f);
    default AddTraderCategory(n"Alchemist", GameplayTag::Item_Armor, -0.5f);
    default AddTraderCategory(n"Alchemist", GameplayTag::Item_Weapon_Axe, -0.5f);
    default AddTraderCategory(n"Alchemist", GameplayTag::Item_Weapon_Sword, -0.5f);
    default AddTraderCategory(n"Alchemist", GameplayTag::Item_Weapon_Mace, -0.5f);
    default AddTraderCategory(n"Alchemist", GameplayTag::Item_Weapon_Staff, -0.5f);
    default AddTraderCategory(n"Alchemist", GameplayTag::Item_Weapon_Bow, -0.5f);
    default AddTraderCategory(n"Alchemist", GameplayTag::Item_Weapon_Crossbow, -0.5f);
    default AddTraderCategory(n"Alchemist", GameplayTag::Item_Material, 0.05f);
    default AddTraderCategory(n"Alchemist", GameplayTag::Item_Trophy, 0.1f);
    default AddTraderCategory(n"Alchemist", GameplayTag::Item_Writing, 0.1f);
    default AddTraderCategory(n"Alchemist", GameplayTag::Item_Projectile, -0.5f);
    default AddTraderCategory(n"Alchemist", GameplayTag::Item_Ring, -0.1f);
    default AddTraderCategory(n"Alchemist", GameplayTag::Item_Amulet, -0.1f);
    
    default AddTraderCategory(n"Inscriber", GameplayTag::Item_Food, -0.1f);
    default AddTraderCategory(n"Inscriber", GameplayTag::Item_Herb, -0.1f);
    default AddTraderCategory(n"Inscriber", GameplayTag::Item_Potion, 0.0f);
    default AddTraderCategory(n"Inscriber", GameplayTag::Item_Weapon_Rune, 0.1f);
    default AddTraderCategory(n"Inscriber", GameplayTag::Item_Weapon_Scroll, 0.15f);
    default AddTraderCategory(n"Inscriber", GameplayTag::Item_Armor, -0.5f);
    default AddTraderCategory(n"Inscriber", GameplayTag::Item_Weapon_Axe, -0.5f);
    default AddTraderCategory(n"Inscriber", GameplayTag::Item_Weapon_Sword, -0.5f);
    default AddTraderCategory(n"Inscriber", GameplayTag::Item_Weapon_Mace, -0.5f);
    default AddTraderCategory(n"Inscriber", GameplayTag::Item_Weapon_Staff, -0.5f);
    default AddTraderCategory(n"Inscriber", GameplayTag::Item_Weapon_Bow, -0.5f);
    default AddTraderCategory(n"Inscriber", GameplayTag::Item_Weapon_Crossbow, -0.5f);
    default AddTraderCategory(n"Inscriber", GameplayTag::Item_Material, 0.05f);
    default AddTraderCategory(n"Inscriber", GameplayTag::Item_Trophy, 0.05f);
    default AddTraderCategory(n"Inscriber", GameplayTag::Item_Writing, 0.1f);
    default AddTraderCategory(n"Inscriber", GameplayTag::Item_Projectile, -0.5f);
    default AddTraderCategory(n"Inscriber", GameplayTag::Item_Ring, 0.1f);
    default AddTraderCategory(n"Inscriber", GameplayTag::Item_Amulet, 0.1f);
    
    default AddTraderCategory(n"Blacksmith", GameplayTag::Item_Food, -0.2f);
    default AddTraderCategory(n"Blacksmith", GameplayTag::Item_Herb, -0.2f);
    default AddTraderCategory(n"Blacksmith", GameplayTag::Item_Potion, 0.0f);
    default AddTraderCategory(n"Blacksmith", GameplayTag::Item_Weapon_Rune, -0.5f);
    default AddTraderCategory(n"Blacksmith", GameplayTag::Item_Weapon_Scroll, -0.5f);
    default AddTraderCategory(n"Blacksmith", GameplayTag::Item_Armor, 0.1f);
    default AddTraderCategory(n"Blacksmith", GameplayTag::Item_Weapon_Axe, 0.15f);
    default AddTraderCategory(n"Blacksmith", GameplayTag::Item_Weapon_Sword, 0.15f);
    default AddTraderCategory(n"Blacksmith", GameplayTag::Item_Weapon_Mace, 0.15f);
    default AddTraderCategory(n"Blacksmith", GameplayTag::Item_Weapon_Staff, 0.15f);
    default AddTraderCategory(n"Blacksmith", GameplayTag::Item_Weapon_Bow, -0.15f);
    default AddTraderCategory(n"Blacksmith", GameplayTag::Item_Weapon_Crossbow, 0.05f);
    default AddTraderCategory(n"Blacksmith", GameplayTag::Item_Material, 0.05f);
    default AddTraderCategory(n"Blacksmith", GameplayTag::Item_Trophy, -0.1f);
    default AddTraderCategory(n"Blacksmith", GameplayTag::Item_Writing, -0.1f);
    default AddTraderCategory(n"Blacksmith", GameplayTag::Item_Projectile, 0.0f);
    default AddTraderCategory(n"Blacksmith", GameplayTag::Item_Ring, 0.0f);
    default AddTraderCategory(n"Blacksmith", GameplayTag::Item_Amulet, 0.0f);
    
    default AddTraderCategory(n"Hunter", GameplayTag::Item_Food, 0.0f);
    default AddTraderCategory(n"Hunter", GameplayTag::Item_Herb, -0.1f);
    default AddTraderCategory(n"Hunter", GameplayTag::Item_Potion, 0.0f);
    default AddTraderCategory(n"Hunter", GameplayTag::Item_Weapon_Rune, -0.5f);
    default AddTraderCategory(n"Hunter", GameplayTag::Item_Weapon_Scroll, -0.5f);
    default AddTraderCategory(n"Hunter", GameplayTag::Item_Armor, 0.05f);
    default AddTraderCategory(n"Hunter", GameplayTag::Item_Weapon_Axe, 0.05f);
    default AddTraderCategory(n"Hunter", GameplayTag::Item_Weapon_Sword, 0.05f);
    default AddTraderCategory(n"Hunter", GameplayTag::Item_Weapon_Mace, 0.05f);
    default AddTraderCategory(n"Hunter", GameplayTag::Item_Weapon_Staff, 0.05f);
    default AddTraderCategory(n"Hunter", GameplayTag::Item_Weapon_Bow, 0.1f);
    default AddTraderCategory(n"Hunter", GameplayTag::Item_Weapon_Crossbow, 0.0f);
    default AddTraderCategory(n"Hunter", GameplayTag::Item_Material, -0.1f);
    default AddTraderCategory(n"Hunter", GameplayTag::Item_Trophy, 0.2f);
    default AddTraderCategory(n"Hunter", GameplayTag::Item_Writing, -0.05f);
    default AddTraderCategory(n"Hunter", GameplayTag::Item_Projectile, 0.15f);
    default AddTraderCategory(n"Hunter", GameplayTag::Item_Ring, -0.1f);
    default AddTraderCategory(n"Hunter", GameplayTag::Item_Amulet, -0.1f);
    
    default AddTraderCategory(n"Provisioner", GameplayTag::Item_Food, 0.50f);
    default AddTraderCategory(n"Provisioner", GameplayTag::Item_Herb, 0.1f);
    default AddTraderCategory(n"Provisioner", GameplayTag::Item_Potion, 0.05f);
    default AddTraderCategory(n"Provisioner", GameplayTag::Item_Weapon_Rune, -0.5f);
    default AddTraderCategory(n"Provisioner", GameplayTag::Item_Weapon_Scroll, -0.5f);
    default AddTraderCategory(n"Provisioner", GameplayTag::Item_Armor, -0.1f);
    default AddTraderCategory(n"Provisioner", GameplayTag::Item_Weapon_Axe, -0.2f);
    default AddTraderCategory(n"Provisioner", GameplayTag::Item_Weapon_Sword, -0.2f);
    default AddTraderCategory(n"Provisioner", GameplayTag::Item_Weapon_Mace, -0.2f);
    default AddTraderCategory(n"Provisioner", GameplayTag::Item_Weapon_Staff, -0.2f);
    default AddTraderCategory(n"Provisioner", GameplayTag::Item_Weapon_Bow, -0.2f);
    default AddTraderCategory(n"Provisioner", GameplayTag::Item_Weapon_Crossbow, -0.2f);
    default AddTraderCategory(n"Provisioner", GameplayTag::Item_Material, 0.0f);
    default AddTraderCategory(n"Provisioner", GameplayTag::Item_Trophy, 0.05f);
    default AddTraderCategory(n"Provisioner", GameplayTag::Item_Writing, -0.05f);
    default AddTraderCategory(n"Provisioner", GameplayTag::Item_Projectile, 0.15f);
    default AddTraderCategory(n"Provisioner", GameplayTag::Item_Ring, -0.2f);
    default AddTraderCategory(n"Provisioner", GameplayTag::Item_Amulet, -0.2f);

    default AddTraderCategory(n"Cartographer", GameplayTag::Item_Food, 0.05f);
    default AddTraderCategory(n"Cartographer", GameplayTag::Item_Herb, 0.0f);
    default AddTraderCategory(n"Cartographer", GameplayTag::Item_Potion, -0.05f);
    default AddTraderCategory(n"Cartographer", GameplayTag::Item_Weapon_Rune, -0.5f);
    default AddTraderCategory(n"Cartographer", GameplayTag::Item_Weapon_Scroll, 0.1f);
    default AddTraderCategory(n"Cartographer", GameplayTag::Item_Armor, 0.0f);
    default AddTraderCategory(n"Cartographer", GameplayTag::Item_Weapon_Axe, 0.0f);
    default AddTraderCategory(n"Cartographer", GameplayTag::Item_Weapon_Sword, 0.0f);
    default AddTraderCategory(n"Cartographer", GameplayTag::Item_Weapon_Mace, 0.0f);
    default AddTraderCategory(n"Cartographer", GameplayTag::Item_Weapon_Staff, 0.0f);
    default AddTraderCategory(n"Cartographer", GameplayTag::Item_Weapon_Bow, 0.0f);
    default AddTraderCategory(n"Cartographer", GameplayTag::Item_Weapon_Crossbow, 0.0f);
    default AddTraderCategory(n"Cartographer", GameplayTag::Item_Material, 0.1f);
    default AddTraderCategory(n"Cartographer", GameplayTag::Item_Trophy, 0.1f);
    default AddTraderCategory(n"Cartographer", GameplayTag::Item_Writing, 0.1f);
    default AddTraderCategory(n"Cartographer", GameplayTag::Item_Projectile, 0.0f);
    default AddTraderCategory(n"Cartographer", GameplayTag::Item_Ring, -0.2f);
    default AddTraderCategory(n"Cartographer", GameplayTag::Item_Amulet, -0.2f);
};

UCLASS()
class UDefaultPhotoModeConfig: UGothicPhotoModeConfig
{
    //default AddLut("Placeholder Blockbuster14", n"Texture2D'/Game/PhotoMode/LutTests/Placeholder_Blockbuster14.Placeholder_Blockbuster14'");
    //default AddLut("Placeholder GamebobAC", n"Texture2D'/Game/PhotoMode/LutTests/Placeholder_GamebobAC.Placeholder_GamebobAC'");
	//default AddLut("Placeholder Max2", n"Texture2D'/Game/PhotoMode/LutTests/Placeholder_Max2.Placeholder_Max2'");
	//default AddLut("Placeholder Underwater", n"Texture2D'/Game/PhotoMode/LutTests/Placeholder_Underwater.Placeholder_Underwater'");	
  
    // --------------------------------------------------
    // Spatial & Collision Limits
    // --------------------------------------------------
    default m_Settings.m_DilationTime = 0.0f;
    default m_Settings.m_MaxDistance = 3000.0f;
	default m_Settings.m_FreeCameraStartSpeed = 100.0f;
	default m_Settings.m_FreeCameraMaxSpeed = 1000.0f;
	default m_Settings.m_FreeCameraAccelerationTime = 2.0f;
	default m_Settings.m_OrbitCameraStartSpeed = 100.0f;
	default m_Settings.m_OrbitCameraMaxSpeed = 500.0f;
	default m_Settings.m_OrbitCameraAccelerationTime = 2.0f;
    default m_Settings.m_MinOrbitDistance = 50.0f;

    // --------------------------------------------------
    // Asset Injections (Stickers, Animations, Materials)
    // --------------------------------------------------
    // Stickers
    default AddSticker(n"/Script/Engine.Texture2D'/Game/PhotoMode/Stickers/Adanos_Sticker_Black.Adanos_Sticker_Black'");
    default AddSticker(n"/Script/Engine.Texture2D'/Game/PhotoMode/Stickers/Adanos_Sticker_White.Adanos_Sticker_White'");
    default AddSticker(n"/Script/Engine.Texture2D'/Game/PhotoMode/Stickers/Alkimia_Logo_BW.Alkimia_Logo_BW'");
    default AddSticker(n"/Script/Engine.Texture2D'/Game/PhotoMode/Stickers/Alkimia_Logo_Full.Alkimia_Logo_Full'");
    default AddSticker(n"/Script/Engine.Texture2D'/Game/PhotoMode/Stickers/Beliar_Sticker_Black.Beliar_Sticker_Black'");
    default AddSticker(n"/Script/Engine.Texture2D'/Game/PhotoMode/Stickers/Beliar_Sticker_White.Beliar_Sticker_White'");
    default AddSticker(n"/Script/Engine.Texture2D'/Game/PhotoMode/Stickers/Gothic_Remake_Logo.Gothic_Remake_Logo'");
    default AddSticker(n"/Script/Engine.Texture2D'/Game/PhotoMode/Stickers/Innos_Sticker_Black.Innos_Sticker_Black'");
    default AddSticker(n"/Script/Engine.Texture2D'/Game/PhotoMode/Stickers/Innos_Sticker_White.Innos_Sticker_White'");
    default AddSticker(n"/Script/Engine.Texture2D'/Game/PhotoMode/Stickers/NC_Banner_Sticker.NC_Banner_Sticker'");
    default AddSticker(n"/Script/Engine.Texture2D'/Game/PhotoMode/Stickers/NC_Sticker.NC_Sticker'");
    default AddSticker(n"/Script/Engine.Texture2D'/Game/PhotoMode/Stickers/NecroMancer_Banner_Sticker.NecroMancer_Banner_Sticker'");
    default AddSticker(n"/Script/Engine.Texture2D'/Game/PhotoMode/Stickers/Necromancer_Sticker.Necromancer_Sticker'");
    default AddSticker(n"/Script/Engine.Texture2D'/Game/PhotoMode/Stickers/OC_Banner_Sticker.OC_Banner_Sticker'");
    default AddSticker(n"/Script/Engine.Texture2D'/Game/PhotoMode/Stickers/OC_Sticker.OC_Sticker'");
    default AddSticker(n"/Script/Engine.Texture2D'/Game/PhotoMode/Stickers/SC_Banner_Sticker.SC_Banner_Sticker'");
    default AddSticker(n"/Script/Engine.Texture2D'/Game/PhotoMode/Stickers/SC_Sticker.SC_Sticker'");
    default AddSticker(n"/Script/Engine.Texture2D'/Game/PhotoMode/Stickers/Sleeper_Mask.Sleeper_Mask'");

    default m_Settings.m_StickerMaterial = n"MaterialInterface'/Game/PhotoMode/Stickers/M_Sticker.M_Sticker'";

    // Guides
    
    default AddGuideline(n"/Script/Engine.Texture2D'/Game/PhotoMode/Guides/Guide_1_Black.Guide_1_Black'");
    default AddGuideline(n"/Script/Engine.Texture2D'/Game/PhotoMode/Guides/Guide_1_White.Guide_1_White'");
    default AddGuideline(n"/Script/Engine.Texture2D'/Game/PhotoMode/Guides/Guide_2_Black.Guide_2_Black'");
    default AddGuideline(n"/Script/Engine.Texture2D'/Game/PhotoMode/Guides/Guide_2_White.Guide_2_White'");
    default AddGuideline(n"/Script/Engine.Texture2D'/Game/PhotoMode/Guides/Guide_3_Black.Guide_3_Black'");
    default AddGuideline(n"/Script/Engine.Texture2D'/Game/PhotoMode/Guides/Guide_3_White.Guide_3_White'");
    default AddGuideline(n"/Script/Engine.Texture2D'/Game/PhotoMode/Guides/Guide_4_Black.Guide_4_Black'");
    default AddGuideline(n"/Script/Engine.Texture2D'/Game/PhotoMode/Guides/Guide_4_White.Guide_4_White'");
    default AddGuideline(n"/Script/Engine.Texture2D'/Game/PhotoMode/Guides/Guide_5_Black.Guide_5_Black'");
    default AddGuideline(n"/Script/Engine.Texture2D'/Game/PhotoMode/Guides/Guide_5_White.Guide_5_White'");

    // Poses: Facial
    default AddFacialAnimation("Angry", n"/Script/Engine.AnimSequence'/Game/PhotoMode/PosesFacial/Angry.Angry'");
    default AddFacialAnimation("VeryAngry", n"/Script/Engine.AnimSequence'/Game/PhotoMode/PosesFacial/Very_angry.Very_angry'");
    default AddFacialAnimation("Charismatic", n"/Script/Engine.AnimSequence'/Game/PhotoMode/PosesFacial/Charismatic.Charismatic'");
    default AddFacialAnimation("Happy", n"/Script/Engine.AnimSequence'/Game/PhotoMode/PosesFacial/Happy.Happy'");
    default AddFacialAnimation("Hurt", n"/Script/Engine.AnimSequence'/Game/PhotoMode/PosesFacial/Hurt.Hurt'");
    default AddFacialAnimation("Neutral", n"/Script/Engine.AnimSequence'/Game/PhotoMode/PosesFacial/Neutral.Neutral'");
    default AddFacialAnimation("Sad", n"/Script/Engine.AnimSequence'/Game/PhotoMode/PosesFacial/Sad.Sad'");
    default AddFacialAnimation("Scared", n"/Script/Engine.AnimSequence'/Game/PhotoMode/PosesFacial/Scared.Scared'");
    default AddFacialAnimation("Surprised", n"/Script/Engine.AnimSequence'/Game/PhotoMode/PosesFacial/Surprised.Surprised'");
    default AddFacialAnimation("Suspicious", n"/Script/Engine.AnimSequence'/Game/PhotoMode/PosesFacial/Suspicious.Suspicious'");
    default AddFacialAnimation("Tired", n"/Script/Engine.AnimSequence'/Game/PhotoMode/PosesFacial/Tired.Tired'");
    
    // Poses: Full Body
    default AddAnimation("ArmsCrossed", n"/Script/Engine.AnimSequence'/Game/PhotoMode/PosesFullBody/Arms_crossed.Arms_crossed'");
    default AddAnimation("Cheering01", n"/Script/Engine.AnimSequence'/Game/PhotoMode/PosesFullBody/Cheering01.Cheering01'");
    default AddAnimation("Cheering02", n"/Script/Engine.AnimSequence'/Game/PhotoMode/PosesFullBody/Cheering02.Cheering02'");
    default AddAnimation("Cheering03", n"/Script/Engine.AnimSequence'/Game/PhotoMode/PosesFullBody/Cheering03.Cheering03'");
    default AddAnimation("HandsOnHips", n"/Script/Engine.AnimSequence'/Game/PhotoMode/PosesFullBody/Hands_on_hips.Hands_on_hips'");
    default AddAnimation("Listen", n"/Script/Engine.AnimSequence'/Game/PhotoMode/PosesFullBody/Listen.Listen'");
    default AddAnimation("Pointing", n"/Script/Engine.AnimSequence'/Game/PhotoMode/PosesFullBody/Pointing.Pointing'");
    default AddAnimation("Taunt01", n"/Script/Engine.AnimSequence'/Game/PhotoMode/PosesFullBody/Taunt01.Taunt01'");
    default AddAnimation("Taunt02", n"/Script/Engine.AnimSequence'/Game/PhotoMode/PosesFullBody/Taunt02.Taunt02'");
    default AddAnimation("Taunt03", n"/Script/Engine.AnimSequence'/Game/PhotoMode/PosesFullBody/Taunt03.Taunt03'");
    default AddAnimation("Taunt04", n"/Script/Engine.AnimSequence'/Game/PhotoMode/PosesFullBody/Taunt04.Taunt04'");
    default AddAnimation("WarmHands", n"/Script/Engine.AnimSequence'/Game/PhotoMode/PosesFullBody/Warm_Hands.Warm_Hands'");
    default AddAnimation("Wounded", n"/Script/Engine.AnimSequence'/Game/PhotoMode/PosesFullBody/Wounded.Wounded'");

    // Custom Post Process Effects
    default AddCustomPostProcessEffect("LensDistortion_NightVision", n"Script/Engine.MaterialInstanceConstant'/Game/LensAndFilmPostProcess/Materials/LensDistortion_NightVision.LensDistortion_NightVision'");

}