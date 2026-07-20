UCLASS()
class UCrimeSystemConfig : UCrimeSubsystemConfig
{
    // Sub-guild -> main guild inside the same camp.
    const float PATHWAY_WITHIN_CAMP = 4.0f;

    // Other camps Guilds sharing in a location.
    const float PATHWAY_CROSS_CAMP = 8.0f;

    // Main guild -> generic "Guild" bucket for a location
    const float PATHWAY_SLOW_DECAY = 24.0f;

    // Every bridge *into* Xardas Tower, from any world location.
    const float PATHWAY_XARDAS_BRIDGE = 8.0f;    

    // Cross-region permanent pathways
    const float PATHWAY_CROSS_REGION = 12.0f;

    // Carriers delay [not used]
    const float PATHWAY_CARRIER_TRANSIT = 0.0f;

    /**
     * Per-guild loot value cap applied when an NPC defeats a thief whose outstanding theft
     * crime references a container and therefore has no individual stolen item class to
     * reclaim. The defeated body is looted from prioritized item buckets up to this
     * total inventory value.
     *
     * Lookup falls back through guild hierarchy parents, then to ContainerTheftLootValueCapFallback.
     * Set to 0 to disable container-theft fallback looting for that guild.
     */
    UPROPERTY()
    TMap<FGameplayTag, int32> ContainerTheftLootValueCapByGuild;

    UPROPERTY()
    int32 ContainerTheftLootValueCapFallback = 100;

    int32 GetContainerTheftLootValueCapForGuild(FGameplayTag Guild) const
    {
        int32 Cap = 0;
        if (ContainerTheftLootValueCapByGuild.Find(Guild, Cap))
            return Cap;

        FGameplayTag Parent = Guild.RequestDirectParent();
        while (Parent.IsValid())
        {
            if (ContainerTheftLootValueCapByGuild.Find(Parent, Cap))
                return Cap;
            Parent = Parent.RequestDirectParent();
        }
        return ContainerTheftLootValueCapFallback;
    }

    void SetupContainerTheftLootValueCaps()
    {
        // Old Camp
        ContainerTheftLootValueCapByGuild.Add(GameplayTag::Guild_Human_OldCamp_Shadow,     80);
        ContainerTheftLootValueCapByGuild.Add(GameplayTag::Guild_Human_OldCamp_Guard,      120);
        ContainerTheftLootValueCapByGuild.Add(GameplayTag::Guild_Human_OldCamp_OreBaron,    250);
        ContainerTheftLootValueCapByGuild.Add(GameplayTag::Guild_Human_OldCamp_Digger,     40);
        ContainerTheftLootValueCapByGuild.Add(GameplayTag::Guild_Human_OldCamp_FireMage,    200);
        ContainerTheftLootValueCapByGuild.Add(GameplayTag::Guild_Human_OldCamp_WomanSlave,  40);

        // New Camp
        ContainerTheftLootValueCapByGuild.Add(GameplayTag::Guild_Human_NewCamp_Mercenary, 120);
        ContainerTheftLootValueCapByGuild.Add(GameplayTag::Guild_Human_NewCamp_Rogue,     80);
        ContainerTheftLootValueCapByGuild.Add(GameplayTag::Guild_Human_NewCamp_Scraper,   40);
        ContainerTheftLootValueCapByGuild.Add(GameplayTag::Guild_Human_NewCamp_Peasant,    40);
        ContainerTheftLootValueCapByGuild.Add(GameplayTag::Guild_Human_NewCamp_WaterMage,  200);

        // Swamp Camp
        ContainerTheftLootValueCapByGuild.Add(GameplayTag::Guild_Human_SwampCamp_Templar,          120);
        ContainerTheftLootValueCapByGuild.Add(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Templar,120);
        ContainerTheftLootValueCapByGuild.Add(GameplayTag::Guild_Human_SwampCamp_Guru,              200);
        ContainerTheftLootValueCapByGuild.Add(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Guru,    200);
        ContainerTheftLootValueCapByGuild.Add(GameplayTag::Guild_Human_SwampCamp_Novice,            40);
        ContainerTheftLootValueCapByGuild.Add(GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice,  40);

        // Bandit Camp
        ContainerTheftLootValueCapByGuild.Add(GameplayTag::Guild_Human_Bandit, 120);

        // Xardas
        ContainerTheftLootValueCapByGuild.Add(GameplayTag::Guild_Human_DemonSummoner, 200);
    }

    UFUNCTION(BlueprintOverride)
    void SetupCrimeMemoryLocations(UCrimeMemorySubsystem CrimeMemorySubsystem)
    {
        // OLD CAMP
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild, EAreaBoundMemoryContainerType::GeneralLocation);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_OldCamp, EAreaBoundMemoryContainerType::CampGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_OldCamp_OreBaron, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_OldCamp_FireMage, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_OldCamp_Guard, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_OldCamp_Shadow, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_OldCamp_Digger, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_OldCamp_WomanSlave, EAreaBoundMemoryContainerType::SubGuild);

        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_NewCamp, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_SwampCamp, EAreaBoundMemoryContainerType::SubGuild);

        // OLD MINE
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_OldMine, GameplayTag::Guild, EAreaBoundMemoryContainerType::GeneralLocation);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_OldMine, GameplayTag::Guild_Human_OldCamp, EAreaBoundMemoryContainerType::CampGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_OldMine, GameplayTag::Guild_Human_OldCamp_FireMage, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_OldMine, GameplayTag::Guild_Human_OldCamp_Guard, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_OldMine, GameplayTag::Guild_Human_OldCamp_Shadow, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_OldMine, GameplayTag::Guild_Human_OldCamp_Digger, EAreaBoundMemoryContainerType::SubGuild);

        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_OldMine, GameplayTag::Guild_Human_NewCamp, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_OldMine, GameplayTag::Guild_Human_SwampCamp, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_OldMine, GameplayTag::Guild_Orc, EAreaBoundMemoryContainerType::SubGuild);

        // FREE MINE
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_FreeMine, GameplayTag::Guild, EAreaBoundMemoryContainerType::GeneralLocation);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_FreeMine, GameplayTag::Guild_Human_NewCamp, EAreaBoundMemoryContainerType::CampGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_FreeMine, GameplayTag::Guild_Human_NewCamp_Mercenary, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_FreeMine, GameplayTag::Guild_Human_NewCamp_Rogue, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_FreeMine, GameplayTag::Guild_Human_NewCamp_Scraper, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_FreeMine, GameplayTag::Guild_Human_OldCamp, EAreaBoundMemoryContainerType::CampGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_FreeMine, GameplayTag::Guild_Human_OldCamp, EAreaBoundMemoryContainerType::SubGuild);

        // NEW CAMP
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild, EAreaBoundMemoryContainerType::GeneralLocation);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild_Human_NewCamp, EAreaBoundMemoryContainerType::CampGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild_Human_NewCamp_WaterMage, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild_Human_NewCamp_Mercenary, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild_Human_NewCamp_Rogue, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild_Human_NewCamp_Scraper, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild_Human_NewCamp_Peasant, EAreaBoundMemoryContainerType::SubGuild);

        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild_Human_OldCamp, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild_Human_SwampCamp, EAreaBoundMemoryContainerType::SubGuild);

        // SWAMP CAMP
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild, EAreaBoundMemoryContainerType::GeneralLocation);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild_Human_SwampCamp, EAreaBoundMemoryContainerType::CampGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild_Human_SwampCamp_Guru, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild_Human_SwampCamp_Templar, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild_Human_SwampCamp_Novice, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild_Human_SwampCamp_Kalomnist_Guru, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild_Human_SwampCamp_Kalomnist_Templar, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice, EAreaBoundMemoryContainerType::SubGuild);

        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild_Human_OldCamp, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild_Human_NewCamp, EAreaBoundMemoryContainerType::SubGuild);

        // BANDITS CAMP
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_BanditCamp, GameplayTag::Guild, EAreaBoundMemoryContainerType::GeneralLocation);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_BanditCamp, GameplayTag::Guild_Human_Bandit, EAreaBoundMemoryContainerType::SubGuild);

        // ORC ENCLAVE
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_OrcEnclave, GameplayTag::Guild, EAreaBoundMemoryContainerType::GeneralLocation);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_OrcEnclave, GameplayTag::Guild_Orc, EAreaBoundMemoryContainerType::SubGuild);

        // XARDAS TOWER
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_XardasTower, GameplayTag::Guild, EAreaBoundMemoryContainerType::GeneralLocation);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_XardasTower, GameplayTag::Guild_Human_DemonSummoner, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_XardasTower, GameplayTag::Guild, EAreaBoundMemoryContainerType::GeneralLocation);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_XardasTower, GameplayTag::Guild_Human_DemonSummoner, EAreaBoundMemoryContainerType::SubGuild);

        // WILDERNESS
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_Wilderness, GameplayTag::Guild_Human_DemonSummoner, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_Wilderness, GameplayTag::Guild_Human_OldCamp, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_Wilderness, GameplayTag::Guild_Human_NewCamp, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_Wilderness, GameplayTag::Guild_Human_SwampCamp, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_Wilderness, GameplayTag::Guild_Human_Bandit, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_Wilderness, GameplayTag::Guild_Orc, EAreaBoundMemoryContainerType::SubGuild);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_XardasTower, GameplayTag::Guild, EAreaBoundMemoryContainerType::GeneralLocation);
        CrimeMemorySubsystem.RegisterLocationCrimeEntry(GameplayTag::CrimeLocation_XardasTower, GameplayTag::Guild_Human_DemonSummoner, EAreaBoundMemoryContainerType::SubGuild);
    }

    UFUNCTION(BlueprintOverride)
    void SetupCrimeMemoryPathways(UCrimeMemorySubsystem CrimeMemorySubsystem)
    {    
        // OLD CAMP
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_OldCamp_OreBaron,
            GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_OldCamp);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_OldCamp_FireMage,
            GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_OldCamp);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_OldCamp_Guard,
            GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_OldCamp);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_OldCamp_Shadow,
            GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_OldCamp);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_OldCamp_Digger,
            GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_OldCamp);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_OldCamp_WomanSlave,
            GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_OldCamp);

        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_OldCamp,
            GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild);
 
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_CROSS_CAMP, 
            GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_NewCamp,
            GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_CROSS_CAMP, 
            GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_SwampCamp,
            GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild);

        // OLD MINE
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_OldMine, GameplayTag::Guild_Human_OldCamp_FireMage,
            GameplayTag::CrimeLocation_OldMine, GameplayTag::Guild_Human_OldCamp);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_OldMine, GameplayTag::Guild_Human_OldCamp_Guard,
            GameplayTag::CrimeLocation_OldMine, GameplayTag::Guild_Human_OldCamp);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_OldMine, GameplayTag::Guild_Human_OldCamp_Shadow,
            GameplayTag::CrimeLocation_OldMine, GameplayTag::Guild_Human_OldCamp);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_OldMine, GameplayTag::Guild_Human_OldCamp_Digger,
            GameplayTag::CrimeLocation_OldMine, GameplayTag::Guild_Human_OldCamp);

        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_OldMine, GameplayTag::Guild_Human_OldCamp,
            GameplayTag::CrimeLocation_OldMine, GameplayTag::Guild);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_CROSS_CAMP, 
            GameplayTag::CrimeLocation_OldMine, GameplayTag::Guild_Human_NewCamp,
            GameplayTag::CrimeLocation_OldMine, GameplayTag::Guild);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_CROSS_CAMP, 
            GameplayTag::CrimeLocation_OldMine, GameplayTag::Guild_Human_SwampCamp,
            GameplayTag::CrimeLocation_OldMine, GameplayTag::Guild);
        
        /* Commented out until proper UX is implemented for cross-camp crime memory sharing,
        * to avoid confusion for players about why they are getting crime reports from other camps. */ 
        // Old Mine <-> Old Camp communication
        // CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_CROSS_REGION, 
        //     GameplayTag::CrimeLocation_OldMine, GameplayTag::Guild_Human_OldCamp,
        //     GameplayTag::CrimeLocation_OldCamp, GameplayTag::CrimeLocation_OldMine);
        // CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_CROSS_REGION, 
        //     GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_OldCamp,
        //     GameplayTag::CrimeLocation_OldMine, GameplayTag::CrimeLocation_OldMine);

        // NEW CAMP
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild_Human_NewCamp_WaterMage,
            GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild_Human_NewCamp);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild_Human_NewCamp_Mercenary,
            GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild_Human_NewCamp);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild_Human_NewCamp_Rogue,
            GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild_Human_NewCamp);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild_Human_NewCamp_Scraper,
            GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild_Human_NewCamp);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild_Human_NewCamp_Peasant,
            GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild_Human_NewCamp);

        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_CROSS_CAMP, 
            GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild_Human_OldCamp,
            GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild_Human_NewCamp,
            GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_CROSS_CAMP, 
            GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild_Human_SwampCamp,
            GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild);

        // FREE MINE
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_FreeMine, GameplayTag::Guild_Human_NewCamp_Mercenary,
            GameplayTag::CrimeLocation_FreeMine, GameplayTag::Guild_Human_NewCamp);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_FreeMine, GameplayTag::Guild_Human_NewCamp_Rogue,
            GameplayTag::CrimeLocation_FreeMine, GameplayTag::Guild_Human_NewCamp);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_FreeMine, GameplayTag::Guild_Human_NewCamp_Scraper,
            GameplayTag::CrimeLocation_FreeMine, GameplayTag::Guild_Human_NewCamp);

        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_CROSS_CAMP, 
            GameplayTag::CrimeLocation_FreeMine, GameplayTag::Guild_Human_OldCamp,
            GameplayTag::CrimeLocation_FreeMine, GameplayTag::Guild);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_FreeMine, GameplayTag::Guild_Human_NewCamp,
            GameplayTag::CrimeLocation_FreeMine, GameplayTag::Guild);

        /* Commented out until proper UX is implemented for cross-camp crime memory sharing,
        * to avoid confusion for players about why they are getting crime reports from other camps. */ 
        // Free Mine <-> New Camp communication
        // CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_CROSS_REGION, 
        //     GameplayTag::CrimeLocation_FreeMine, GameplayTag::CrimeLocation_FreeMine,
        //     GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild_Human_NewCamp);
        // CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_CROSS_REGION, 
        //     GameplayTag::CrimeLocation_NewCamp, GameplayTag::CrimeLocation_FreeMine,
        //     GameplayTag::CrimeLocation_FreeMine, GameplayTag::Guild_Human_NewCamp);

        // SWAMP CAMP
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild_Human_SwampCamp_Guru,
            GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild_Human_SwampCamp);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild_Human_SwampCamp_Kalomnist_Guru,
            GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild_Human_SwampCamp);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild_Human_SwampCamp_Templar,
            GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild_Human_SwampCamp);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild_Human_SwampCamp_Kalomnist_Templar,
            GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild_Human_SwampCamp);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild_Human_SwampCamp_Novice,
            GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild_Human_SwampCamp);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice,
            GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild_Human_SwampCamp);

        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_CROSS_CAMP, 
            GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild_Human_OldCamp,
            GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_CROSS_CAMP, 
            GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild_Human_NewCamp,
            GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild_Human_SwampCamp,
            GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild);

        // BANDIT CAMP
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_BanditCamp, GameplayTag::Guild_Human_Bandit,
            GameplayTag::CrimeLocation_BanditCamp, GameplayTag::Guild);
        
        // ORC ENCLAVE
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_OrcEnclave, GameplayTag::Guild_Orc,
            GameplayTag::CrimeLocation_OrcEnclave, GameplayTag::Guild);
        
        // XARDAS
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_WITHIN_CAMP, 
            GameplayTag::CrimeLocation_XardasTower, GameplayTag::Guild_Human_DemonSummoner,
            GameplayTag::CrimeLocation_XardasTower, GameplayTag::Guild);
        
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_XARDAS_BRIDGE, 
            GameplayTag::CrimeLocation_OldCamp, GameplayTag::Guild_Human_OldCamp,
            GameplayTag::CrimeLocation_XardasTower, GameplayTag::Guild_Human_DemonSummoner);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_XARDAS_BRIDGE, 
            GameplayTag::CrimeLocation_NewCamp, GameplayTag::Guild_Human_NewCamp,
            GameplayTag::CrimeLocation_XardasTower, GameplayTag::Guild_Human_DemonSummoner);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_XARDAS_BRIDGE, 
            GameplayTag::CrimeLocation_SwampCamp, GameplayTag::Guild_Human_SwampCamp,
            GameplayTag::CrimeLocation_XardasTower, GameplayTag::Guild_Human_DemonSummoner);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_XARDAS_BRIDGE, 
            GameplayTag::CrimeLocation_OrcEnclave, GameplayTag::Guild_Orc,
            GameplayTag::CrimeLocation_XardasTower, GameplayTag::Guild_Human_DemonSummoner);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_XARDAS_BRIDGE, 
            GameplayTag::CrimeLocation_BanditCamp, GameplayTag::Guild_Human_Bandit,
            GameplayTag::CrimeLocation_XardasTower, GameplayTag::Guild_Human_DemonSummoner);

        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_XARDAS_BRIDGE, 
            GameplayTag::CrimeLocation_Wilderness, GameplayTag::Guild_Human_OldCamp,
            GameplayTag::CrimeLocation_XardasTower, GameplayTag::Guild_Human_DemonSummoner);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_XARDAS_BRIDGE, 
            GameplayTag::CrimeLocation_Wilderness, GameplayTag::Guild_Human_NewCamp,
            GameplayTag::CrimeLocation_XardasTower, GameplayTag::Guild_Human_DemonSummoner);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_XARDAS_BRIDGE, 
            GameplayTag::CrimeLocation_Wilderness, GameplayTag::Guild_Human_SwampCamp,
            GameplayTag::CrimeLocation_XardasTower, GameplayTag::Guild_Human_DemonSummoner);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_XARDAS_BRIDGE, 
            GameplayTag::CrimeLocation_Wilderness, GameplayTag::Guild_Orc,
            GameplayTag::CrimeLocation_XardasTower, GameplayTag::Guild_Human_DemonSummoner);
        CrimeMemorySubsystem.RegisterLocationMemoryPathway(PATHWAY_XARDAS_BRIDGE, 
            GameplayTag::CrimeLocation_Wilderness, GameplayTag::Guild_Human_Bandit,
            GameplayTag::CrimeLocation_XardasTower, GameplayTag::Guild_Human_DemonSummoner);

    }

    UFUNCTION(BlueprintOverride)
    void SetupGeneralConfig(UCrimeMemorySubsystem CrimeMemorySubsystem)
    {
        SetupContainerTheftLootValueCaps();

        CrimeMemorySubsystem.CrimeTypesToNeverSync.AddTag(GameplayTag::Crime_Dialogue_RealFight);
        CrimeMemorySubsystem.CrimeTypesToNeverSync.AddTag(GameplayTag::Crime_Dialogue_PettyFight);

        CrimeMemorySubsystem.CrimeTypesToNeverSave.AddTag(GameplayTag::Crime_BlockingPath);

        CrimeMemorySubsystem.CrimeTypesToNotSaveWhenForgiven.AddTag(GameplayTag::Crime_Trespassing);

        FGameplayTagContainer TheftCrimes;
        TheftCrimes.AddTag(GameplayTag::Crime_Theft);
        TheftCrimes.AddTag(GameplayTag::Crime_Pickpocket_Success);

        // Memories added to player only once, upon crime matching type added to a location of type EAreaBoundMemoryContainerType::GeneralLocation
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            TheftCrimes, AffectedGuild = GameplayTag::Guild_Human_OldCamp_OreBaron, MemoryTag = GameplayTag::Memory_Chatter_Stole_FromOreBaron);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            TheftCrimes, AffectedGuild = GameplayTag::Guild_Human_OldCamp_FireMage, MemoryTag = GameplayTag::Memory_Chatter_Stole_FromOldCamper);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            TheftCrimes, AffectedGuild = GameplayTag::Guild_Human_OldCamp_Guard, MemoryTag = GameplayTag::Memory_Chatter_Stole_FromOldCamper);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            TheftCrimes, AffectedGuild = GameplayTag::Guild_Human_OldCamp_Shadow, MemoryTag = GameplayTag::Memory_Chatter_Stole_FromOldCamper);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            TheftCrimes, AffectedGuild = GameplayTag::Guild_Human_OldCamp_Digger, MemoryTag = GameplayTag::Memory_Chatter_Stole_FromOldCamper);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            TheftCrimes, AffectedGuild = GameplayTag::Guild_Human_OldCamp_WomanSlave, MemoryTag = GameplayTag::Memory_Chatter_Stole_FromOldCamper);
        
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            TheftCrimes, AffectedGuild = GameplayTag::Guild_Human_NewCamp_WaterMage, MemoryTag = GameplayTag::Memory_Chatter_Stole_FromWaterMage);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            TheftCrimes, AffectedGuild = GameplayTag::Guild_Human_NewCamp_Mercenary, MemoryTag = GameplayTag::Memory_Chatter_Stole_FromNewCamper);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            TheftCrimes, AffectedGuild = GameplayTag::Guild_Human_NewCamp_Rogue, MemoryTag = GameplayTag::Memory_Chatter_Stole_FromNewCamper);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            TheftCrimes, AffectedGuild = GameplayTag::Guild_Human_NewCamp_Peasant, MemoryTag = GameplayTag::Memory_Chatter_Stole_FromNewCamper);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            TheftCrimes, AffectedGuild = GameplayTag::Guild_Human_NewCamp_Scraper, MemoryTag = GameplayTag::Memory_Chatter_Stole_FromNewCamper);

        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            TheftCrimes, AffectedGuild = GameplayTag::Guild_Human_SwampCamp_Guru, MemoryTag = GameplayTag::Memory_Chatter_Stole_FromGuru);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            TheftCrimes, AffectedGuild = GameplayTag::Guild_Human_SwampCamp_Kalomnist_Guru, MemoryTag = GameplayTag::Memory_Chatter_Stole_FromGuru);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            TheftCrimes, AffectedGuild = GameplayTag::Guild_Human_SwampCamp_Templar, MemoryTag = GameplayTag::Memory_Chatter_Stole_FromSwampCamper);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            TheftCrimes, AffectedGuild = GameplayTag::Guild_Human_SwampCamp_Kalomnist_Templar, MemoryTag = GameplayTag::Memory_Chatter_Stole_FromSwampCamper);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            TheftCrimes, AffectedGuild = GameplayTag::Guild_Human_SwampCamp_Novice, MemoryTag = GameplayTag::Memory_Chatter_Stole_FromSwampCamper);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            TheftCrimes, AffectedGuild = GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice, MemoryTag = GameplayTag::Memory_Chatter_Stole_FromSwampCamper);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            TheftCrimes, AffectedGuild = GameplayTag::Guild_Human_SwampCamp_WomanSlave, MemoryTag = GameplayTag::Memory_Chatter_Stole_FromSwampCamper);
        
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            TheftCrimes, AffectedGuild = GameplayTag::Guild_Human_DemonSummoner, MemoryTag = GameplayTag::Memory_Chatter_Stole_FromXardas);
        
        FGameplayTagContainer KillCrimes;
        KillCrimes.AddTag(GameplayTag::Crime_Murder);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            KillCrimes, AffectedGuild = GameplayTag::Guild_Human_OldCamp_OreBaron, MemoryTag = GameplayTag::Memory_Chatter_Killed_OreBaron);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            KillCrimes, AffectedGuild = GameplayTag::Guild_Human_OldCamp_FireMage, MemoryTag = GameplayTag::Memory_Chatter_Killed_OldCamper);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            KillCrimes, AffectedGuild = GameplayTag::Guild_Human_OldCamp_Guard, MemoryTag = GameplayTag::Memory_Chatter_Killed_OldCamper);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            KillCrimes, AffectedGuild = GameplayTag::Guild_Human_OldCamp_Shadow, MemoryTag = GameplayTag::Memory_Chatter_Killed_OldCamper);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            KillCrimes, AffectedGuild = GameplayTag::Guild_Human_OldCamp_Digger, MemoryTag = GameplayTag::Memory_Chatter_Killed_OldCamper);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            KillCrimes, AffectedGuild = GameplayTag::Guild_Human_OldCamp_WomanSlave, MemoryTag = GameplayTag::Memory_Chatter_Killed_OldCamper);
        
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            KillCrimes, AffectedGuild = GameplayTag::Guild_Human_NewCamp_WaterMage, MemoryTag = GameplayTag::Memory_Chatter_Killed_WaterMage);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            KillCrimes, AffectedGuild = GameplayTag::Guild_Human_NewCamp_Mercenary, MemoryTag = GameplayTag::Memory_Chatter_Killed_NewCamper);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            KillCrimes, AffectedGuild = GameplayTag::Guild_Human_NewCamp_Rogue, MemoryTag = GameplayTag::Memory_Chatter_Killed_NewCamper);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            KillCrimes, AffectedGuild = GameplayTag::Guild_Human_NewCamp_Peasant, MemoryTag = GameplayTag::Memory_Chatter_Killed_NewCamper);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            KillCrimes, AffectedGuild = GameplayTag::Guild_Human_NewCamp_Scraper, MemoryTag = GameplayTag::Memory_Chatter_Killed_NewCamper);

        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            KillCrimes, AffectedGuild = GameplayTag::Guild_Human_SwampCamp_Guru, MemoryTag = GameplayTag::Memory_Chatter_Killed_Guru);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            KillCrimes, AffectedGuild = GameplayTag::Guild_Human_SwampCamp_Kalomnist_Guru, MemoryTag = GameplayTag::Memory_Chatter_Killed_SwampCamper);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            KillCrimes, AffectedGuild = GameplayTag::Guild_Human_SwampCamp_Templar, MemoryTag = GameplayTag::Memory_Chatter_Killed_SwampCamper);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            KillCrimes, AffectedGuild = GameplayTag::Guild_Human_SwampCamp_Kalomnist_Templar, MemoryTag = GameplayTag::Memory_Chatter_Killed_SwampCamper);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            KillCrimes, AffectedGuild = GameplayTag::Guild_Human_SwampCamp_Novice, MemoryTag = GameplayTag::Memory_Chatter_Killed_SwampCamper);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            KillCrimes, AffectedGuild = GameplayTag::Guild_Human_SwampCamp_Kalomnist_Novice, MemoryTag = GameplayTag::Memory_Chatter_Killed_SwampCamper);
        CrimeMemorySubsystem.RegisterLongtermMemoryTagForCrimeData(
            KillCrimes, AffectedGuild = GameplayTag::Guild_Human_SwampCamp_WomanSlave, MemoryTag = GameplayTag::Memory_Chatter_Killed_SwampCamper);


        CrimeMemorySubsystem.SpeciesSpecificCrimeTags.AddTag(GameplayTag::Crime_Murder);

        CrimeMemorySubsystem.SpeciesToIncludeForMemorySpreadOfSpeciesExclusiveCrimes.AddTag(GameplayTag::Species_Human);
        CrimeMemorySubsystem.SpeciesToIncludeForMemorySpreadOfSpeciesExclusiveCrimes.AddTag(GameplayTag::Species_Orc);

        CrimeMemorySubsystem.CharacterGlobalIDsExcludedFromSpeciesSelection.Add(n"Dandy");
        CrimeMemorySubsystem.CharacterGlobalIDsExcludedFromSpeciesSelection.Add(n"Scavenger_Adult_Rideable_Cohsel");
        CrimeMemorySubsystem.CharacterGlobalIDsExcludedFromSpeciesSelection.Add(n"Scavenger_Adult_Rideable");
    }
}