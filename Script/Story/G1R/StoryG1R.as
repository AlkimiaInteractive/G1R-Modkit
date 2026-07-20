#ifdef WITH_STORY_G1R
namespace G1R
{
    class UStoryG1R : UStory
    {
        const int32 DurstigeBauern = 10;
        const int32 NerveSec = 30;
        const int32 VALUE_KDF_ARMOR_H = 1700;
        const int32 VALUE_KDW_ARMOR_H = 2600;
        const int32 XP_BC_BANDITSCAMP_COMPLETE = 500;
        const int32 XP_BC_BANDITSCAMP_QUENTIN = 500;
        const int32 XP_BC_BANDITSTRUST_COMPLETE = 500;
        const int32 XP_BC_BANDITSTRUST_FIND = 250;
        const int32 XP_BC_BANDITSTRUST_KEY = 250;
        const int32 XP_FM_BALOROSWAFFE_COMPLETE = 300;
        const int32 XP_GetCronosPermission = 250;
        const int32 XP_NC_BANNEDFROMOC_ASKLEE = 250;
        const int32 XP_NC_BANNEDFROMOC_COMPLETE = 500;
        const int32 XP_NC_BOWARTISAN_COMPLETE = 100;
        const int32 XP_NC_BRINGFOCI_MEETING = 1000;
        const int32 XP_NC_BRINGFOCI_YBERION = 500;
        const int32 XP_NC_BRINGLISTBACK_COMPLETE = 750;
        const int32 XP_NC_BRINGLISTBACK_GIVELIST = 250;
        const int32 XP_NC_CARRYWATER_COMPLETE = 100;
        const int32 XP_NC_CARRYWATER_CONFRONT = 300;
        const int32 XP_NC_CONVOY_COMPLETE = 500;
        const int32 XP_NC_CONVOY_GORN = 50;
        const int32 XP_NC_CRONOSMESSENGER_COMPLETE = 200;
        const int32 XP_NC_DAMLURKER_COMPLETE = 300;
        const int32 XP_NC_DEALERJOB_COMPLETE = 500;
        const int32 XP_NC_ESCAPEPLANNC_COMPLETE = 500;
        const int32 XP_NC_FINDXARDAS_COMPLETE = 2000;
        const int32 XP_NC_GET400ORE_COMPLETE = 500;
        const int32 XP_NC_GOTOPSICAMP_COMPLETE = 500;
        const int32 XP_NC_INNOSAMULET_AMULET = 500;
        const int32 XP_NC_INNOSAMULET_COMPLETE = 1000;
        const int32 XP_NC_JOINNC_COMPLETE = 1000;
        const int32 XP_NC_JOINNC_LARESHUT = 250;
        const int32 XP_NC_JOINNC_LARESRING = 250;
        const int32 XP_NC_JOINWATERMAGES_COMPLETE = 1000;
        const int32 XP_NC_JOINWATERMAGES_LEARNALCHEMY = 200;
        const int32 XP_NC_JOINWATERMAGES_LEARNINSCRIPTION = 200;
        const int32 XP_NC_MCPLATEARMOR_COMPLETE = 1000;
        const int32 XP_NC_MCPLATEARMOR_DELIVER = 2000;
        const int32 XP_NC_MONASTERYRUIN_COMPLETE = 3500;
        const int32 XP_NC_RANKUPMERCENARY_COMPLETE = 700;
        const int32 XP_NC_RANKUPMERCENARY_VIBRATIONS = 300;
        const int32 XP_NC_RECOVERFREEMINE_COMPLETE = 1000;
        const int32 XP_NC_RICELORDFOREMAN_COMPLETE = 300;
        const int32 XP_NC_RICELORDFOREMAN_CONFRONT = 150;
        const int32 XP_NC_RICELORDJOB_COMPLETE = 200;
        const int32 XP_NC_RICELORDJOB_REPORT = 100;
        const int32 XP_NC_SHRIKESHUT_COMPLETE = 200;
        const int32 XP_NC_SHRIKESHUT_REPORT = 100;
        const int32 XP_NC_SPREADJOINTS_COMPLETE = 200;
        const int32 XP_OC_BRINGLIST_COMPLETE = 750;
        const int32 XP_OC_BROWNIEPOINTS_KHARIMLOSS = 50;
        const int32 XP_OC_BROWNIEPOINTS_KHARIMVICTORY = 200;
        const int32 XP_OC_BROWNIEPOINTS_KIRGOVICTORY = 150;
        const int32 XP_OC_BULLYFORBULLIT_COMPLETE = 500;
        const int32 XP_OC_DREAMEDLAND_COMPLETE = 500;
        const int32 XP_OC_DREAMEDLAND_TALKSERAPHIA = 100;
        const int32 XP_OC_DREAMEDLAND_TALKVELAYA = 100;
        const int32 XP_OC_ESCAPEPLAN_COMPLETE = 1500;
        const int32 XP_OC_FINGERSRING_COMPLETE = 100;
        const int32 XP_OC_FIREMAGESLETTER_COMPLETE = 200;
        const int32 XP_OC_FIREMAGESLETTER_OPENED = 100;
        const int32 XP_OC_FISKNEWDEALER_COMPLETE = 300;
        const int32 XP_OC_FORGEDRIVALRIES1_COMPLETE = 500;
        const int32 XP_OC_FORGEDRIVALRIES1_CRAFT = 200;
        const int32 XP_OC_FORGEDRIVALRIES1_FINDSWORD = 75;
        const int32 XP_OC_FORGEDRIVALRIES3_COMPLETE = 1000;
        const int32 XP_OC_FORGEDRIVALRIES3_GETDARRIONKEY = 500;
        const int32 XP_OC_FORGEDRIVALRIES3_STONENC = 500;
        const int32 XP_OC_FORGEDRIVALRIES3_STONESC = 1000;
        const int32 XP_OC_FORGOTTENRECIPE_COMPLETE = 100;
        const int32 XP_OC_JOINOC_COMPLETE = 1000;
        const int32 XP_OC_KALOMSRECIPE_COMPLETE = 350;
        const int32 XP_OC_LOSTAMULET_COMPLETE = 200;
        const int32 XP_OC_LOSTNEK_COMPLETE = 250;
        const int32 XP_OC_LURKERBITE_COMPLETE = 100;
        const int32 XP_OC_LURKERBITE_FISK = 50;
        const int32 XP_OC_MAGICTRANSACTION_COMPLETE = 150;
        const int32 XP_OC_MERCHANTSPRICE_COMPLETE = 750;
        const int32 XP_OC_MORDRAGKO_CONVINCE = 250;
        const int32 XP_OC_MORDRAGKO_ESCORT = 200;
        const int32 XP_OC_MORDRAGKO_KILL = 300;
        const int32 XP_OC_RANKUPGUARD_COMPLETE = 700;
        const int32 XP_OC_RANKUPGUARD_PROTECT = 300;
        const int32 XP_OC_SNAFSRECIPE_COMPLETE = 100;
        const int32 XP_OC_STONEHENGE_COMPLETE = 3500;
        const int32 XP_OC_TRIALOFFIRE_COMPLETE = 1000;
        const int32 XP_OC_TRIALOFFIRE_SEA = 200;
        const int32 XP_OC_TRIALOFFIRE_WATERFALL = 200;
        const int32 XP_OC_TROLLCANYON_COMPLETE = 3500;
        const int32 XP_OC_WHISTLERSWORD_COMPLETE = 200;
        const int32 XP_OE_ACCESSSLEEPERTEMPLE_COMPLETE = 1000;
        const int32 XP_OE_MUKINCURSION_COMPLETE = 300;
        const int32 XP_OE_THECHAMPIONBURIAL_COMPLETE = 700;
        const int32 XP_OM_BLOWTHEENTRANCE_COMPLETE = 1500;
        const int32 XP_OM_GEARWHEEL_COMPLETE = 750;
        const int32 XP_OM_SNIPESDEAL_COMPLETE = 75;
        const int32 XP_OM_SNIPESDEAL_LURE = 75;
        const int32 XP_OM_STORAGESHED_COMPLETE = 75;
        const int32 XP_SC_BOOK_COMPLETE = 2500;
        const int32 XP_SC_BOOK_SATURAS = 500;
        const int32 XP_SC_CLIMBINGCLIFFS_COMPLETE = 100;
        const int32 XP_SC_CLIMBINGCLIFFS_GIVEJOINTS = 50;
        const int32 XP_SC_DELIVERWEED_BALOR = 100;
        const int32 XP_SC_DELIVERWEED_CIPHER = 50;
        const int32 XP_SC_DELIVERWEED_COMPLETE = 100;
        const int32 XP_SC_DELIVERWEED_REPORT = 200;
        const int32 XP_SC_DELIVERWEED_VIRAN = 500;
        const int32 XP_SC_DRUGMONOPOL_COMPLETE = 750;
        const int32 XP_SC_DRUGMONOPOL_JACKO = 500;
        const int32 XP_SC_FINDINGCAINE_ABANDONMINE = 200;
        const int32 XP_SC_FINDINGCAINE_COMPLETE = 1000;
        const int32 XP_SC_FOCUS_COMPLETE = 750;
        const int32 XP_SC_FORGEDRIVALRIES2_COMPLETE = 350;
        const int32 XP_SC_FORGEDRIVALRIES2_GIVEDESIGNTOSTONE = 500;
        const int32 XP_SC_FORGEDRIVALRIES2_REFUSEDARRION = 500;
        const int32 XP_SC_FORTRESS_COMPLETE = 3500;
        const int32 XP_SC_GHORIMSRELIEF_COMPLETE = 300;
        const int32 XP_SC_GREATINVOCATION_COMPLETE = 300;
        const int32 XP_SC_JOINPSI_ARRIVE = 200;
        const int32 XP_SC_JOINPSI_CADARIMPRESSED = 200;
        const int32 XP_SC_JOINPSI_COMPLETE = 750;
        const int32 XP_SC_JOINPSI_NAMIBIMPRESSED = 200;
        const int32 XP_SC_JOINPSI_ORUNIMPRESSED = 200;
        const int32 XP_SC_JOINPSI_TYONIMPRESSED = 200;
        const int32 XP_SC_JORUJOINTS_COMPLETE = 50;
        const int32 XP_SC_KALOMEXPERIMENTS_COMPLETE = 750;
        const int32 XP_SC_KALOMEXPERIMENTS_RECRUITBALOR = 250;
        const int32 XP_SC_KALOMEXPERIMENTS_RECRUITJORU = 250;
        const int32 XP_SC_KRAUTBOTE_COMPLETE = 200;
        const int32 XP_SC_KRAUTBOTE_DELIVER = 200;
        const int32 XP_SC_MCEGGS_COMPLETE = 2500;
        const int32 XP_SC_MCEGGS_HIREBAR = 250;
        const int32 XP_SC_MCEGGS_HIREKOSH = 250;
        const int32 XP_SC_MCEGGS_HIREVID = 250;
        const int32 XP_SC_MEETYBERION_COMPLETE = 200;
        const int32 XP_SC_ORCGRAVEYARD_COMPLETE = 2000;
        const int32 XP_SC_ORCGRAVEYARD_LUKOR = 750;
        const int32 XP_SC_RANKUPTEMPLAR_COMPLETE = 700;
        const int32 XP_SC_RANKUPTEMPLAR_SCATTER = 300;
        const int32 XP_SC_RECRUITDUSTY_BRIBE = 250;
        const int32 XP_SC_RECRUITDUSTY_COMPLETE = 500;
        const int32 XP_SC_RECRUITDUSTY_JOINED = 250;
        const int32 XP_ST_EXPLORESLEEPERTEMPLE_COMPLETE = 2000;
        const int32 XP_ST_EXPLORESLEEPERTEMPLE_URIZIEL = 1000;
        const int32 XP_ST_URIZIEL_COMPLETE = 5000;
        const int32 XP_ST_XARDASSUNKENTOWER_COMPLETE = 2000;
        const int32 XP_VOM_BESTIARY1_COMPLETE = 50;
        const int32 XP_VOM_BESTIARY2_COMPLETE = 500;
        const int32 XP_VOM_BESTIARY2_FINDSAMPLE = 500;
        const int32 XP_VOM_BESTIARY3_COMPLETE = 850;
        const int32 XP_VOM_BESTIARY4_COMPLETE = 1000;
        const int32 XP_VOM_BESTIARY5_COMPLETE = 1500;
        const int32 XP_VOM_CHROMANIN_1 = 300;
        const int32 XP_VOM_CHROMANIN_2 = 500;
        const int32 XP_VOM_CHROMANIN_3 = 700;
        const int32 XP_VOM_CHROMANIN_4 = 850;
        const int32 XP_VOM_CHROMANIN_5 = 1000;
        const int32 XP_VOM_FIGHTER_COMPLETE = 250;
        const int32 XP_VOM_FINDORCSHAMAN_COMPLETE = 1000;
        const int32 XP_VOM_FIREMAGES_COMPLETE = 1000;
        const int32 XP_VOM_GILBERTFOUND = 100;
        const int32 XP_VOM_ORCENCLAVE_COMPLETE = 1000;
        const int32 XP_VOM_PATHTOORCENCLAVE_COMPLETE = 2000;
        const int32 XP_VOM_SCAVENGERRAIDER_COMPLETE = 300;
        const int32 XP_VOM_ULUMULU_BRINGINGREDIENTS = 2000;
        const int32 XP_VOM_ULUMULU_COMPLETE = 10000;
        const int32 XP_VOM_ULUMULU_FINDTARROK = 2000;
        const int32 ZivilAnquatschDist = 3;
        
        UPROPERTY(SaveGame)
        FInGameTime Ambient_InExtremo = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Ambient_Orc = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime BaalParvez_GotoSC_Day = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Balor_CollectDay = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime BanditLockpick_Daily = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Blackmailer_Daily = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Blackmailer_Mad = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Bloodwyn_PayDay = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Bow_Artisan = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Convoy_Guard = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Convoy_RaidStartTime = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Darrion_MakeKey = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Darrion_MarkWeapon = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime DefeatBully = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Diego_Welcome = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Fletcher_Timer_Night = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Fortuno_RationDay = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime FourFriendsFocus = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime GenericDiggerCrawlerQueen = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime GenericNCAdmission = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime GenericOCAdmission = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime GenericSCAdmission = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Gorn_Timer_Battle = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Huno_WaitAfterTraining = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Lefty_WorkDay = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Lukor_Open_Door = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Melvin_Meditating = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Milten_Time_Troll = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Milten_Timer_Battle = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Mordrag_GotoNC_Day = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Mud_Path_OrcGraveyard = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Mud_Stay_Kalomists = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Myxir_Quest_Completed = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime NovicesSleeper_Mumbling = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime NovicesSleeper_Mumbling_Phase01 = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime NovicesSleeper_Mumbling_Phase02 = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Orcs_Desert_Timer = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Pock_Forget_Time = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Rayk_Mad_BeforeConversation = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Rogue01_Robbed = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Rogue01_ScaredPool = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Rogue03_Robbed = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Rogue03_ScaredPool = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Scavenger_Preparation = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Snaf_RagoutDay = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Snaf_SyraRecipe = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Stone_OreArmor = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Stone_StartMaceCraft = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Viran_DeliveryDay = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        FInGameTime Wolf_Crafting_Armor = FInGameTime::Invalid();
        
        UPROPERTY(SaveGame)
        int32 AfterCinematic_Nyras = 0;
        
        UPROPERTY(SaveGame)
        int32 AfterCinematic_Sleeper = 0;
        
        UPROPERTY(SaveGame)
        int32 AIV_GPS_BEGIN = 0;
        
        UPROPERTY(SaveGame)
        int32 AIV_GPS_FIRSTWARN = 0;
        
        UPROPERTY(SaveGame)
        int32 AIV_GPS_LASTWARN = 0;
        
        UPROPERTY(SaveGame)
        int32 Armor = 0;
        
        UPROPERTY(SaveGame)
        int32 armorInstance = 0;
        
        UPROPERTY(SaveGame)
        int32 BaalCadar_responsive = 0;
        
        UPROPERTY(SaveGame)
        int32 BaalCadar_Sacrilege = 0;
        
        UPROPERTY(SaveGame)
        int32 BaalIsidro_GotDrink = 0;
        
        UPROPERTY(SaveGame)
        int32 BaalKagan_three = 0;
        
        UPROPERTY(SaveGame)
        int32 BaalLukor_BringParchment = 0;
        
        UPROPERTY(SaveGame)
        int32 BaalLukor_KeyPart01 = 0;
        
        UPROPERTY(SaveGame)
        int32 BaalLukor_KeyPart02 = 0;
        
        UPROPERTY(SaveGame)
        int32 BaalNamib_responsive = 0;
        
        UPROPERTY(SaveGame)
        int32 BaalNamib_Sacrilege = 0;
        
        UPROPERTY(SaveGame)
        int32 BaalOrun_responsive = 0;
        
        UPROPERTY(SaveGame)
        int32 BaalOrun_Sacrilege = 0;
        
        UPROPERTY(SaveGame)
        int32 BaalTyon_responsive = 0;
        
        UPROPERTY(SaveGame)
        int32 BaalTyon_Sacrilege = 0;
        
        UPROPERTY(SaveGame)
        int32 Balor_Harvest = 0;
        
        UPROPERTY(SaveGame)
        int32 Balor_PlayerCheating = 0;
        
        UPROPERTY(SaveGame)
        int32 Balor_TellsNCDealer = 0;
        
        UPROPERTY(SaveGame)
        int32 Baloro_SC_choice = 0;
        
        UPROPERTY(SaveGame)
        int32 Baloro_SC_wantsToKnow = 0;
        
        UPROPERTY(SaveGame)
        int32 BanditCellVisited = 0;
        
        UPROPERTY(SaveGame)
        int32 Bartholo_flags = 0;
        
        UPROPERTY(SaveGame)
        int32 Bartholo_guild = 0;
        
        UPROPERTY(SaveGame)
        int32 Bartholo_Teleport_Conversation = 0;
        
        UPROPERTY(SaveGame)
        int32 Blackmailer_Encounter = 0;
        
        UPROPERTY(SaveGame)
        int32 Blackmailer_Permission = 0;
        
        UPROPERTY(SaveGame)
        int32 Blackmailer_Warning = 0;
        
        UPROPERTY(SaveGame)
        int32 Bloodwyn_ProtectionPaid = 0;
        
        UPROPERTY(SaveGame)
        int32 Bouncer876_GotJoint = 0;
        
        UPROPERTY(SaveGame)
        int32 Brannok_Permission = 0;
        
        UPROPERTY(SaveGame)
        int32 Brannok_Warning = 0;
        
        UPROPERTY(SaveGame)
        int32 BranNoteRead = 0;
        
        UPROPERTY(SaveGame)
        int32 BridgeGolemCombatActive = 0;
        
        UPROPERTY(SaveGame)
        int32 BridgeStoneGolemEnemy = 0;
        
        UPROPERTY(SaveGame)
        int32 Bullit_guild = 0;
        
        UPROPERTY(SaveGame)
        int32 BullitDefeated = 0;
        
        UPROPERTY(SaveGame)
        int32 Butch_Welcome = 0;
        
        UPROPERTY(SaveGame)
        int32 CaineVanished = 0;
        
        UPROPERTY(SaveGame)
        int32 CanUpgradeGuardArmor = 0;
        
        UPROPERTY(SaveGame)
        int32 CanUpgradeNoviceArmor = 0;
        
        UPROPERTY(SaveGame)
        int32 Cavalorn_BestiaryDiscovered = 0;
        
        UPROPERTY(SaveGame)
        int32 Cavalorn_BestiaryQuestion = 0;
        
        UPROPERTY(SaveGame)
        int32 Cavalorn_BestiaryQuestionRunning = 0;
        
        UPROPERTY(SaveGame)
        int32 Cavalorn_FirstTime = 0;
        
        UPROPERTY(SaveGame)
        int32 Chokta_angry = 0;
        
        UPROPERTY(SaveGame)
        int32 Chokta_angry_counter = 0;
        
        UPROPERTY(SaveGame)
        int32 ChromaninReaded = 0;
        
        UPROPERTY(SaveGame)
        int32 Cipher_Trade = 0;
        
        UPROPERTY(SaveGame)
        int32 CollapseMineNotify = 0;
        
        UPROPERTY(SaveGame)
        int32 ConversationWithDiegoAtStoneHenge = 0;
        
        UPROPERTY(SaveGame)
        int32 Convoy_CleanupStep = 0;
        
        UPROPERTY(SaveGame)
        int32 Convoy_PlayerBriefed = 0;
        
        UPROPERTY(SaveGame)
        int32 Convoy_RaidStart = 0;
        
        UPROPERTY(SaveGame)
        int32 CorAngar_GotoOGY = 0;
        
        UPROPERTY(SaveGame)
        int32 CorAngar_SendToNC = 0;
        
        UPROPERTY(SaveGame)
        int32 CorKalom_BringMCQBalls = 0;
        
        UPROPERTY(SaveGame)
        int32 Corristo_FireMagesTest = 0;
        
        UPROPERTY(SaveGame)
        int32 Corristo_FirsTalk = 0;
        
        UPROPERTY(SaveGame)
        int32 Counter = 0;
        
        UPROPERTY(SaveGame)
        int32 Crw_Armor_H = 0;
        
        UPROPERTY(SaveGame)
        int32 Damarok_GlandNegotiation = 0;
        
        UPROPERTY(SaveGame)
        int32 Darrion_Teacher = 0;
        
        UPROPERTY(SaveGame)
        int32 Dexter_SC = 0;
        
        UPROPERTY(SaveGame)
        int32 Dexter_Traded = 0;
        
        UPROPERTY(SaveGame)
        int32 DIA_Grd_216_DustyZoll_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 Diego_After_Gamestart = 0;
        
        UPROPERTY(SaveGame)
        int32 Diego_Follow = 0;
        
        UPROPERTY(SaveGame)
        int32 Diego_GomezAudience = 0;
        
        UPROPERTY(SaveGame)
        int32 Diego_Notes_DEX = 0;
        
        UPROPERTY(SaveGame)
        int32 Diego_Notes_STR = 0;
        
        UPROPERTY(SaveGame)
        int32 DiggerRankUpOrder = 0;
        
        UPROPERTY(SaveGame)
        int32 Drax_CanTeach = 0;
        
        UPROPERTY(SaveGame)
        int32 Drax_GotBeer = 0;
        
        UPROPERTY(SaveGame)
        int32 Dusty_aivar_AIV_PARTYMEMBER = 0;
        
        UPROPERTY(SaveGame)
        int32 Dusty_flags = 0;
        
        UPROPERTY(SaveGame)
        int32 Dusty_guild = 0;
        
        UPROPERTY(SaveGame)
        int32 Dusty_LetsGo = 0;
        
        UPROPERTY(SaveGame)
        int32 EncounteredHighPriest = 0;
        
        UPROPERTY(SaveGame)
        int32 EnteredFreeMine = 0;
        
        UPROPERTY(SaveGame)
        int32 ExploreSunkenTower = 0;
        
        UPROPERTY(SaveGame)
        int32 FindGolemHearts = 0;
        
        UPROPERTY(SaveGame)
        int32 FindXardas = 0;
        
        UPROPERTY(SaveGame)
        int32 Fingers_CanTeach = 0;
        
        UPROPERTY(SaveGame)
        int32 Fingers_Wherecavalorn = 0;
        
        UPROPERTY(SaveGame)
        int32 FireMagesBook = 0;
        
        UPROPERTY(SaveGame)
        int32 FireMagesDead = 0;
        
        UPROPERTY(SaveGame)
        int32 FireMagesPermission = 0;
        
        UPROPERTY(SaveGame)
        int32 Fisk_ForgetSword = 0;
        
        UPROPERTY(SaveGame)
        int32 Fisk_SellSword110 = 0;
        
        UPROPERTY(SaveGame)
        int32 Fisk_SwordSold = 0;
        
        UPROPERTY(SaveGame)
        int32 Fletcher_foundNek = 0;
        
        UPROPERTY(SaveGame)
        int32 Fletcher_whytalk = 0;
        
        UPROPERTY(SaveGame)
        int32 FMHostile = 0;
        
        UPROPERTY(SaveGame)
        int32 FMTaken = 0;
        
        UPROPERTY(SaveGame)
        int32 ForgedRivalries2_DarrionAngry = 0;
        
        UPROPERTY(SaveGame)
        int32 ForgedRivalries2_DarrionBanTrade = 0;
        
        UPROPERTY(SaveGame)
        int32 ForgedRivalries2_DarrionMarkedCraft = 0;
        
        UPROPERTY(SaveGame)
        int32 ForgedRivalries2_StoneKnowsDarrionPlanFull = 0;
        
        UPROPERTY(SaveGame)
        int32 ForgedRivalries2_StoneKnowsDarrionPlanPartial = 0;
        
        UPROPERTY(SaveGame)
        int32 ForgedRivalries2_StoneKnowsDesignIsGomez = 0;
        
        UPROPERTY(SaveGame)
        int32 ForgedRivalries2_StoneMarkedCraft = 0;
        
        UPROPERTY(SaveGame)
        int32 ForgedRivalries3_DarrionWillAcceptStone = 0;
        
        UPROPERTY(SaveGame)
        int32 ForgedRivalries3_StoneKnowsDarrionAccept = 0;
        
        UPROPERTY(SaveGame)
        int32 ForgedRivalries3_StoneKnowsDarrionReject = 0;
        
        UPROPERTY(SaveGame)
        int32 ForgedRivalries3_StoneRefreshed = 0;
        
        UPROPERTY(SaveGame)
        int32 ForgedRivalries_DarrionCraftDishonest = 0;
        
        UPROPERTY(SaveGame)
        int32 ForgedRivalries_DarrionCraftHonest = 0;
        
        UPROPERTY(SaveGame)
        int32 ForgedRivalries_DeliverStoneCraft = 0;
        
        UPROPERTY(SaveGame)
        int32 ForgedRivalries_OwnCraftDishonest = 0;
        
        UPROPERTY(SaveGame)
        int32 ForgedRivalries_StoneCraft = 0;
        
        UPROPERTY(SaveGame)
        int32 Fortress_Inside = 0;
        
        UPROPERTY(SaveGame)
        int32 Fortress_Outside = 0;
        
        UPROPERTY(SaveGame)
        int32 Fortuno_HasYBerionHerbs = 0;
        
        UPROPERTY(SaveGame)
        int32 FP_NC_PATH_41_MILTEN = 0;
        
        UPROPERTY(SaveGame)
        int32 FP_NC_WATER_MILTEN_IN = 0;
        
        UPROPERTY(SaveGame)
        int32 FP_OC_FREE_STONE = 0;
        
        UPROPERTY(SaveGame)
        int32 FP_OC_NORTHGATE_GUARDPASSAGE = 0;
        
        UPROPERTY(SaveGame)
        int32 FP_OC_RAVEN_END_GUIDE = 0;
        
        UPROPERTY(SaveGame)
        int32 FP_OC_STAIRCASE_TOP_CHAPEL = 0;
        
        UPROPERTY(SaveGame)
        int32 FP_OC_STANDAROUND_84_MILTEN = 0;
        
        UPROPERTY(SaveGame)
        int32 FP_OW_29_TALAS = 0;
        
        UPROPERTY(SaveGame)
        int32 FP_OW_DIEGO_190 = 0;
        
        UPROPERTY(SaveGame)
        int32 FP_OW_DIEGO_LOCATION_12_01 = 0;
        
        UPROPERTY(SaveGame)
        int32 FP_OW_DIEGO_WHEEL = 0;
        
        UPROPERTY(SaveGame)
        int32 FP_OW_TALAS_BRIDGE = 0;
        
        UPROPERTY(SaveGame)
        int32 FP_SC_MEDITATE_17 = 0;
        
        UPROPERTY(SaveGame)
        int32 FP_SC_MEDITATE_18 = 0;
        
        UPROPERTY(SaveGame)
        int32 FP_SC_START_SWAMPCAMP = 0;
        
        UPROPERTY(SaveGame)
        int32 FP_ST_MILTEN_FORCED = 0;
        
        UPROPERTY(SaveGame)
        int32 FP_ST_PATH_3_STONES_MILTEN = 0;
        
        UPROPERTY(SaveGame)
        int32 Freemine_GateOpen = 0;
        
        UPROPERTY(SaveGame)
        int32 Freemine_Recovered = 0;
        
        UPROPERTY(SaveGame)
        int32 FriendOfUrShak = 0;
        
        UPROPERTY(SaveGame)
        int32 Friends_SendToNC = 0;
        
        UPROPERTY(SaveGame)
        int32 GatheredTemplars = 0;
        
        UPROPERTY(SaveGame)
        int32 Gomez_Contacts = 0;
        
        UPROPERTY(SaveGame)
        int32 Gomez_flags = 0;
        
        UPROPERTY(SaveGame)
        int32 Gomez_guild = 0;
        
        UPROPERTY(SaveGame)
        int32 GorHanis_Challenged = 0;
        
        UPROPERTY(SaveGame)
        int32 GorHanis_Charged = 0;
        
        UPROPERTY(SaveGame)
        int32 GorHanis_Lose = 0;
        
        UPROPERTY(SaveGame)
        int32 GorHanis_Win = 0;
        
        UPROPERTY(SaveGame)
        int32 gorn_aivar_AIV_FINDABLE = 0;
        
        UPROPERTY(SaveGame)
        int32 Gorn_AloneForFM = 0;
        
        UPROPERTY(SaveGame)
        int32 Gorn_Follow = 0;
        
        UPROPERTY(SaveGame)
        int32 Gorn_GotoWolf = 0;
        
        UPROPERTY(SaveGame)
        int32 Gorn_Ignite = 0;
        
        UPROPERTY(SaveGame)
        int32 Gorn_JoinedForFM = 0;
        
        UPROPERTY(SaveGame)
        int32 Graham_OMMapBlackmailed = 0;
        
        UPROPERTY(SaveGame)
        int32 Graham_OMMapSold = 0;
        
        UPROPERTY(SaveGame)
        int32 GRD_200_Thorus_ZWEIHAND1_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 GRD_200_Thorus_ZWEIHAND2_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 GRD_205_Scorpio_CROSSBOW2_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 GRD_205_Scorpio_CROSSBOW_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 Grd_260_Drake_Crawler_Okay_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 GRD_262_Aaron_BLUFF_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 Grim_ProtectionBully = 0;
        
        UPROPERTY(SaveGame)
        int32 Grim_Tests = 0;
        
        UPROPERTY(SaveGame)
        int32 Guard_Order = 0;
        
        UPROPERTY(SaveGame)
        int32 Guard_Permission_Orc_Land = 0;
        
        UPROPERTY(SaveGame)
        int32 GuardDistraction = 0;
        
        UPROPERTY(SaveGame)
        int32 GuardOrcLandWarning_OC = 0;
        
        UPROPERTY(SaveGame)
        int32 GuardPassageTavernWarning_NC = 0;
        
        UPROPERTY(SaveGame)
        int32 GuardPassageWarning_NC = 0;
        
        UPROPERTY(SaveGame)
        int32 GuardPassageWarning_OC = 0;
        
        UPROPERTY(SaveGame)
        int32 GuardPassageWarning_SC = 0;
        
        UPROPERTY(SaveGame)
        int32 GuardPassageWaterMagesWarning_NC = 0;
        
        UPROPERTY(SaveGame)
        int32 Guild = 0;
        
        UPROPERTY(SaveGame)
        int32 Guild_Human_NewCamp_Mercenary = 0;
        
        UPROPERTY(SaveGame)
        int32 Guild_Human_NewCamp_Rogue = 0;
        
        UPROPERTY(SaveGame)
        int32 Guild_Human_NewCamp_WaterMage = 0;
        
        UPROPERTY(SaveGame)
        int32 Guild_Human_OldCamp_FireMage = 0;
        
        UPROPERTY(SaveGame)
        int32 Guild_Human_OldCamp_Guard = 0;
        
        UPROPERTY(SaveGame)
        int32 Guild_Human_SwampCamp_Novice = 0;
        
        UPROPERTY(SaveGame)
        int32 Guild_Human_SwampCamp_Templar = 0;
        
        UPROPERTY(SaveGame)
        int32 Guild_None = 0;
        
        UPROPERTY(SaveGame)
        int32 GUR_1202_CorAngar_WANNABETPL_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 GUR_1202_CorAngar_ZWEIHAND1_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 GUR_1202_CorAngar_ZWEIHAND2_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 Gur_1208_BaalCadar_KREIS1_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 Gur_1208_BaalCadar_KREIS2_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 Gur_1208_BaalCadar_KREIS4_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 Haenno_Bow_Knowledge = 0;
        
        UPROPERTY(SaveGame)
        int32 HappyFriends = 0;
        
        UPROPERTY(SaveGame)
        int32 HasULUMULU = 0;
        
        UPROPERTY(SaveGame)
        int32 Herek_ProtectionBully = 0;
        
        UPROPERTY(SaveGame)
        int32 hero_aivar_AIV_GUARDPASSAGE_STATUS = 0;
        
        UPROPERTY(SaveGame)
        int32 hero_attribute_Dexterity = 0;
        
        UPROPERTY(SaveGame)
        int32 hero_attribute_MaxMana = 0;
        
        UPROPERTY(SaveGame)
        int32 hero_attribute_Strength = 0;
        
        UPROPERTY(SaveGame)
        int32 HeroInsideBanditCell = 0;
        
        UPROPERTY(SaveGame)
        int32 HeroInsideThroneRoom = 0;
        
        UPROPERTY(SaveGame)
        int32 Hlp_GetInstanceIDarmor = 0;
        
        UPROPERTY(SaveGame)
        int32 Huno_DailyRoutine = 0;
        
        UPROPERTY(SaveGame)
        int32 Huno_LearnSmith = 0;
        
        UPROPERTY(SaveGame)
        int32 IlegalWeedMixer_Permision = 0;
        
        UPROPERTY(SaveGame)
        int32 InExtremoPlaying = 0;
        
        UPROPERTY(SaveGame)
        int32 Info_Bartholo_Krautbote_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 Info_Kalom_KrautboteBACK_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 Info_Xardas_LOADSWORD09_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 IntroInExtremo = 0;
        
        UPROPERTY(SaveGame)
        int32 Jackal_ProtectionPaid = 0;
        
        UPROPERTY(SaveGame)
        int32 Jacko_Fled = 0;
        
        UPROPERTY(SaveGame)
        int32 JackoNoteRead = 0;
        
        UPROPERTY(SaveGame)
        int32 Jan_Training = 0;
        
        UPROPERTY(SaveGame)
        int32 Jeremiah_Brewer = 0;
        
        UPROPERTY(SaveGame)
        int32 Joru_JoinSC = 0;
        
        UPROPERTY(SaveGame)
        int32 Joru_Tips = 0;
        
        UPROPERTY(SaveGame)
        int32 Joru_Tips_Mage = 0;
        
        UPROPERTY(SaveGame)
        int32 Kalom_Counter = 0;
        
        UPROPERTY(SaveGame)
        int32 Kalom_DeliveredWeed = 0;
        
        UPROPERTY(SaveGame)
        int32 Kalom_TalkedTo = 0;
        
        UPROPERTY(SaveGame)
        int32 KalomDead = 0;
        
        UPROPERTY(SaveGame)
        int32 KDF_402_Corristo_HEAVYARMOR_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 KDF_402_Corristo_KREIS1_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 KDF_402_Corristo_KREIS2_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 KDF_402_Corristo_KREIS3_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 KDF_402_Corristo_KREIS4_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 KDF_402_Corristo_WANNBEKDF_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 KDW_600_Saturas_HEAVYARMOR_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 KDW_600_Saturas_KREIS1_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 KDW_600_Saturas_KREIS2_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 KDW_600_Saturas_KREIS3_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 KDW_600_Saturas_KREIS4_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 KDW_600_Saturas_KREIS5_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 Kharim_Challenged = 0;
        
        UPROPERTY(SaveGame)
        int32 Kharim_Charged = 0;
        
        UPROPERTY(SaveGame)
        int32 Kharim_Lose = 0;
        
        UPROPERTY(SaveGame)
        int32 Kharim_Night = 0;
        
        UPROPERTY(SaveGame)
        int32 Kharim_Win = 0;
        
        UPROPERTY(SaveGame)
        int32 Kirgo_Challenged = 0;
        
        UPROPERTY(SaveGame)
        int32 Kirgo_Charged = 0;
        
        UPROPERTY(SaveGame)
        int32 Kirgo_Lose = 0;
        
        UPROPERTY(SaveGame)
        int32 Kirgo_Win = 0;
        
        UPROPERTY(SaveGame)
        int32 Knows_GetClaws = 0;
        
        UPROPERTY(SaveGame)
        int32 Knows_GetFur = 0;
        
        UPROPERTY(SaveGame)
        int32 Knows_GetHide = 0;
        
        UPROPERTY(SaveGame)
        int32 Knows_GetMCMandibles = 0;
        
        UPROPERTY(SaveGame)
        int32 Knows_GetMCPlates = 0;
        
        UPROPERTY(SaveGame)
        int32 Knows_GetTeeth = 0;
        
        UPROPERTY(SaveGame)
        int32 Knows_GetUluMulu = 0;
        
        UPROPERTY(SaveGame)
        int32 KnowStone = 0;
        
        UPROPERTY(SaveGame)
        int32 Lares_CheatedIntoHut = 0;
        
        UPROPERTY(SaveGame)
        int32 Lares_Permission = 0;
        
        UPROPERTY(SaveGame)
        int32 Lee_freeminereport = 0;
        
        UPROPERTY(SaveGame)
        int32 Lee_HeroProgression = 0;
        
        UPROPERTY(SaveGame)
        int32 Lee_SldPossible = 0;
        
        UPROPERTY(SaveGame)
        int32 Lefty_CarriedWater = 0;
        
        UPROPERTY(SaveGame)
        int32 Lefty_Dead = 0;
        
        UPROPERTY(SaveGame)
        int32 Lefty_WasBeaten = 0;
        
        UPROPERTY(SaveGame)
        int32 Lester_Follow = 0;
        
        UPROPERTY(SaveGame)
        int32 Lester_Guide = 0;
        
        UPROPERTY(SaveGame)
        int32 Lester_Show = 0;
        
        UPROPERTY(SaveGame)
        int32 LoadSword = 0;
        
        UPROPERTY(SaveGame)
        int32 Location_AbandonedMine_AfterAmulet = 0;
        
        UPROPERTY(SaveGame)
        int32 Location_AbandonedMine_OrcGrave = 0;
        
        UPROPERTY(SaveGame)
        int32 Location_NewCamp_OrePile = 0;
        
        UPROPERTY(SaveGame)
        int32 Location_OldCamp_Dungeons = 0;
        
        UPROPERTY(SaveGame)
        int32 Location_OldMineCollapsed = 0;
        
        UPROPERTY(SaveGame)
        int32 Location_OrcEnclave_Arena = 0;
        
        UPROPERTY(SaveGame)
        int32 Location_SwampCamp_Temple = 0;
        
        UPROPERTY(SaveGame)
        int32 Location_XardasTower_Bedroom = 0;
        
        UPROPERTY(SaveGame)
        int32 LOG_OBSOLETE = 0;
        
        UPROPERTY(SaveGame)
        int32 LOG_SUCCESS = 0;
        
        UPROPERTY(SaveGame)
        int32 LogBaalcadarsell = 0;
        
        UPROPERTY(SaveGame)
        int32 LogBaalcadartrain = 0;
        
        UPROPERTY(SaveGame)
        int32 LogCavalorntrain = 0;
        
        UPROPERTY(SaveGame)
        int32 LogDiegotrain = 0;
        
        UPROPERTY(SaveGame)
        int32 LogGornatothfight = 0;
        
        UPROPERTY(SaveGame)
        int32 LogGornatothtrain = 0;
        
        UPROPERTY(SaveGame)
        int32 LogScattytrain = 0;
        
        UPROPERTY(SaveGame)
        int32 LogScorpiocrossbow = 0;
        
        UPROPERTY(SaveGame)
        int32 LogThorusfight = 0;
        
        UPROPERTY(SaveGame)
        int32 LogThorustrain = 0;
        
        UPROPERTY(SaveGame)
        int32 LogWedgelearn = 0;
        
        UPROPERTY(SaveGame)
        int32 LogWolftrain = 0;
        
        UPROPERTY(SaveGame)
        int32 Magician_Level = 0;
        
        UPROPERTY(SaveGame)
        int32 MCPlatesDelivered = 0;
        
        UPROPERTY(SaveGame)
        int32 Melvin_Preaching = 0;
        
        UPROPERTY(SaveGame)
        int32 Milten_Follow = 0;
        
        UPROPERTY(SaveGame)
        int32 Milten_HasLetter = 0;
        
        UPROPERTY(SaveGame)
        int32 Milten_Sleeper_Battle = 0;
        
        UPROPERTY(SaveGame)
        int32 MiltenAlreadyKnown = 0;
        
        UPROPERTY(SaveGame)
        int32 Monastery_Inside = 0;
        
        UPROPERTY(SaveGame)
        int32 Monastery_Outside = 0;
        
        UPROPERTY(SaveGame)
        int32 MonasteryRuin_GateOpen = 0;
        
        UPROPERTY(SaveGame)
        int32 Mordrag_Traded = 0;
        
        UPROPERTY(SaveGame)
        int32 MordragKO_Exiled = 0;
        
        UPROPERTY(SaveGame)
        int32 MordragKO_PlayerChoseOreBarons = 0;
        
        UPROPERTY(SaveGame)
        int32 MordragKO_PlayerChoseThorus = 0;
        
        UPROPERTY(SaveGame)
        int32 MordragKO_StayAtNC = 0;
        
        UPROPERTY(SaveGame)
        int32 Mud_Follow = 0;
        
        UPROPERTY(SaveGame)
        int32 Mud_Leave = 0;
        
        UPROPERTY(SaveGame)
        int32 Mud_Nerve = 0;
        
        UPROPERTY(SaveGame)
        int32 Mud_NerveRealized = 0;
        
        UPROPERTY(SaveGame)
        int32 Mud_OrcGraveyard = 0;
        
        UPROPERTY(SaveGame)
        int32 Myarmor = 0;
        
        UPROPERTY(SaveGame)
        int32 NC_JointsDistributed = 0;
        
        UPROPERTY(SaveGame)
        int32 Novice_Guide_Kalom = 0;
        
        UPROPERTY(SaveGame)
        int32 Novice_Guide_MainGate = 0;
        
        UPROPERTY(SaveGame)
        int32 Novice_Guide_Smithy = 0;
        
        UPROPERTY(SaveGame)
        int32 Novice_Guide_Temple = 0;
        
        UPROPERTY(SaveGame)
        int32 Novice_Guide_Train = 0;
        
        UPROPERTY(SaveGame)
        int32 Novices_Mumbling = 0;
        
        UPROPERTY(SaveGame)
        int32 Novices_Mumbling_Phase01 = 0;
        
        UPROPERTY(SaveGame)
        int32 Novices_Mumbling_Phase02 = 0;
        
        UPROPERTY(SaveGame)
        int32 NoviceSaved = 0;
        
        UPROPERTY(SaveGame)
        int32 Novize_1_senses = 0;
        
        UPROPERTY(SaveGame)
        int32 Novize_senses = 0;
        
        UPROPERTY(SaveGame)
        int32 NPC_FLAG_IMMORTAL = 0;
        
        UPROPERTY(SaveGame)
        int32 Npc_GetEquippedArmorhero = 0;
        
        UPROPERTY(SaveGame)
        int32 Npc_GetTrueGuildhero = 0;
        
        UPROPERTY(SaveGame)
        int32 Npc_HasItemshero_ItAt_Crawler_01 = 0;
        
        UPROPERTY(SaveGame)
        int32 Npc_HasItemshero_ItMi_Orenugget = 0;
        
        UPROPERTY(SaveGame)
        int32 NpctypeFriend = 0;
        
        UPROPERTY(SaveGame)
        int32 NpctypeMain = 0;
        
        UPROPERTY(SaveGame)
        int32 Nyras_flags = 0;
        
        UPROPERTY(SaveGame)
        int32 OC_Test = 0;
        
        UPROPERTY(SaveGame)
        int32 OldCampAccess = 0;
        
        UPROPERTY(SaveGame)
        int32 oldHeroGuild = 0;
        
        UPROPERTY(SaveGame)
        int32 Orcs_Desert = 0;
        
        UPROPERTY(SaveGame)
        int32 Ore = 0;
        
        UPROPERTY(SaveGame)
        int32 Org_829_GotJoint = 0;
        
        UPROPERTY(SaveGame)
        int32 Peasants_have_water = 0;
        
        UPROPERTY(SaveGame)
        int32 PlaceholderCondition = 0;
        
        UPROPERTY(SaveGame)
        int32 Pock_ForgetAll = 0;
        
        UPROPERTY(SaveGame)
        int32 Points_NC = 0;
        
        UPROPERTY(SaveGame)
        int32 Points_OC = 0;
        
        UPROPERTY(SaveGame)
        int32 RandomDiggerPhrase_1 = 0;
        
        UPROPERTY(SaveGame)
        int32 RandomDiggerPhrase_2 = 0;
        
        UPROPERTY(SaveGame)
        int32 RandomDiggerPhrase_3 = 0;
        
        UPROPERTY(SaveGame)
        int32 RandomDiggerPhrase_4 = 0;
        
        UPROPERTY(SaveGame)
        int32 RandomDiggerPhrase_5 = 0;
        
        UPROPERTY(SaveGame)
        int32 Rayk_Mad = 0;
        
        UPROPERTY(SaveGame)
        int32 RaykBeated = 0;
        
        UPROPERTY(SaveGame)
        int32 RecruitedDiggers = 0;
        
        UPROPERTY(SaveGame)
        int32 RevealedKalomists = 0;
        
        UPROPERTY(SaveGame)
        int32 Ricelord_AskedForWater = 0;
        
        UPROPERTY(SaveGame)
        int32 Riordian_GlandNegotiation = 0;
        
        UPROPERTY(SaveGame)
        int32 Rogue01_Afraid = 0;
        
        UPROPERTY(SaveGame)
        int32 Rogue01_Permission = 0;
        
        UPROPERTY(SaveGame)
        int32 Rogue01_Warning = 0;
        
        UPROPERTY(SaveGame)
        int32 Rogue03_Afraid = 0;
        
        UPROPERTY(SaveGame)
        int32 Rogue03_Permission = 0;
        
        UPROPERTY(SaveGame)
        int32 Rogue03_Warning = 0;
        
        UPROPERTY(SaveGame)
        int32 Roscoe_aivar_AIV_PASSGATE = 0;
        
        UPROPERTY(SaveGame)
        int32 Saturas_BringFoci = 0;
        
        UPROPERTY(SaveGame)
        int32 SC_Walk = 0;
        
        UPROPERTY(SaveGame)
        int32 Scorpio_Exile = 0;
        
        UPROPERTY(SaveGame)
        int32 self_aivar_AIV_GUARDPASSAGE_STATUS = 0;
        
        UPROPERTY(SaveGame)
        int32 self_aivar_AIV_HAS_ERPRESSED = 0;
        
        UPROPERTY(SaveGame)
        int32 self_aivar_AIV_MISSION1 = 0;
        
        UPROPERTY(SaveGame)
        int32 self_aivar_AIV_PARTYMEMBER = 0;
        
        UPROPERTY(SaveGame)
        int32 self_aivar_AIV_PASSGATE = 0;
        
        UPROPERTY(SaveGame)
        int32 Self_flags = 0;
        
        UPROPERTY(SaveGame)
        int32 self_npcType = 0;
        
        UPROPERTY(SaveGame)
        int32 SENSE_SEESENSE_HEARSENSE_SMELL = 0;
        
        UPROPERTY(SaveGame)
        int32 SilasFound = 0;
        
        UPROPERTY(SaveGame)
        int32 SilasGuilty = 0;
        
        UPROPERTY(SaveGame)
        int32 SilasRemoved = 0;
        
        UPROPERTY(SaveGame)
        int32 Skip_guild = 0;
        
        UPROPERTY(SaveGame)
        int32 Skip_TradeFree = 0;
        
        UPROPERTY(SaveGame)
        int32 Sld_700_Lee_ZWEIHAND1_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 Sld_700_Lee_ZWEIHAND2_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 SLD_709_Cord_TRAIN_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 SLD_709_Cord_TRAINAGAIN_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 SLD_753_Baloro_SC_besorgt_den_Kram = 0;
        
        UPROPERTY(SaveGame)
        int32 Snaf_FreeMBRagout = 0;
        
        UPROPERTY(SaveGame)
        int32 StartChaptersSix = 0;
        
        UPROPERTY(SaveGame)
        int32 Stone_DailyRoutine = 0;
        
        UPROPERTY(SaveGame)
        int32 Stone_guild = 0;
        
        UPROPERTY(SaveGame)
        int32 Stone_ImprovedOreArmor = 0;
        
        UPROPERTY(SaveGame)
        int32 Stone_Teacher = 0;
        
        UPROPERTY(SaveGame)
        int32 StoneHenge_Inside = 0;
        
        UPROPERTY(SaveGame)
        int32 StoneHenge_Outside = 0;
        
        UPROPERTY(SaveGame)
        int32 StoneHengeSkeletonsDead = 0;
        
        UPROPERTY(SaveGame)
        int32 SunkenTowerElementsDoorOpen = 0;
        
        UPROPERTY(SaveGame)
        int32 SwampCampTemple_Permision = 0;
        
        UPROPERTY(SaveGame)
        int32 Tarrok = 0;
        
        UPROPERTY(SaveGame)
        int32 Tarrok_name_0 = 0;
        
        UPROPERTY(SaveGame)
        int32 Tavern_Permission = 0;
        
        UPROPERTY(SaveGame)
        int32 TeleportToWaterMagesBlockedDone = 0;
        
        UPROPERTY(SaveGame)
        int32 Templar_Duel = 0;
        
        UPROPERTY(SaveGame)
        int32 Templer_1_senses = 0;
        
        UPROPERTY(SaveGame)
        int32 Templer_senses = 0;
        
        UPROPERTY(SaveGame)
        int32 TemplerGuardAdvice = 0;
        
        UPROPERTY(SaveGame)
        int32 Thorus_AmuletShown = 0;
        
        UPROPERTY(SaveGame)
        int32 Thorus_flags = 0;
        
        UPROPERTY(SaveGame)
        int32 Thorus_MordragMageMessenger = 0;
        
        UPROPERTY(SaveGame)
        int32 Thorus_Permission_Exterior = 0;
        
        UPROPERTY(SaveGame)
        int32 Thorus_Permission_Interior = 0;
        
        UPROPERTY(SaveGame)
        int32 TPL_1402_GorNaToth_TRAIN_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 TPL_1402_GorNaToth_TRAINAGAIN_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 Tpl_1415_Templer_ROCK_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 Tpl_1438_Templer_TEACHZANGEN_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 Troll_Wheel = 0;
        
        UPROPERTY(SaveGame)
        int32 TrollCanyon_Inside = 0;
        
        UPROPERTY(SaveGame)
        int32 TrollCanyon_Outside = 0;
        
        UPROPERTY(SaveGame)
        int32 Tunnel_Opened = 0;
        
        UPROPERTY(SaveGame)
        int32 UluFight = 0;
        
        UPROPERTY(SaveGame)
        int32 UNITTEST_EXPECT_CONVERSATION_ENDED = 0;
        
        UPROPERTY(SaveGame)
        int32 UNITTEST_SELECT_SUBDIALOG_INDEX = 0;
        
        UPROPERTY(SaveGame)
        int32 UNITTEST_SUCCESS = 0;
        
        UPROPERTY(SaveGame)
        int32 UrNazkrog_Permission = 0;
        
        UPROPERTY(SaveGame)
        int32 UrNazkrog_Spores = 0;
        
        UPROPERTY(SaveGame)
        int32 UrShak = 0;
        
        UPROPERTY(SaveGame)
        int32 URSHAK_FRIEND = 0;
        
        UPROPERTY(SaveGame)
        int32 Urshak_name_0 = 0;
        
        UPROPERTY(SaveGame)
        int32 UrShak_SpokeOfUluMulu = 0;
        
        UPROPERTY(SaveGame)
        int32 VALUE_NOV_ARMOR_H = 0;
        
        UPROPERTY(SaveGame)
        int32 VALUE_STT_ARMOR_H = 0;
        
        UPROPERTY(SaveGame)
        int32 VLK_584_Snipes_DEAL_2_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 VLK_585_Aleph_DIRTY_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 VLK_585_Aleph_SCHUPPEN_permanent = 0;
        
        UPROPERTY(SaveGame)
        int32 wache218_aivar_AIV_PASSGATE = 0;
        
        UPROPERTY(SaveGame)
        int32 Warned_Gorn_or_Lester = 0;
        
        UPROPERTY(SaveGame)
        int32 WaterMaguesPermission = 0;
        
        UPROPERTY(SaveGame)
        int32 WaterMaguesTeleportBlocked = 0;
        
        UPROPERTY(SaveGame)
        int32 Whistler_BuyMySword = 0;
        
        UPROPERTY(SaveGame)
        int32 Whistler_BuyMySword_Day = 0;
        
        UPROPERTY(SaveGame)
        int32 WomenSaved = 0;
        
        UPROPERTY(SaveGame)
        int32 Yberion_Ashes = 0;
    }
    
    
    
    namespace Conversation
    {
        UCLASS(Abstract)
        class UG1RDialogTopic : UConversationTopic
        {    
            UStoryG1R GetG1R() property
            {
                return UStoryG1R::Get();
            }
            
            const UStoryG1R GetG1R() const property
            {
                return UStoryG1R::Get();
            }
        }
    }
    
    namespace Quest
    {
        UCLASS(Abstract)
        class UG1RQuest : UQuest
        {
            default BelongsToStory = UStoryG1R::StaticClass();
            
            UStoryG1R GetG1R() property
            {
                return UStoryG1R::Get();
            }
            
            const UStoryG1R GetG1R() const property
            {
                return UStoryG1R::Get();
            }
        }
    }
}
#endif /* WITH_STORY_G1R */