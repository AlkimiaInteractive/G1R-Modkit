#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_NOV_LESTER : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_NOV_LESTER";
        }
        
        
        class UTopic_NC_SLD_GORN_699__SC_NOV_LESTER : UG1RDialogTopic
        {
            default ForCharacter = n"SC_NOV_LESTER";
            default WithCharacter = n"NC_SLD_GORN_699";
            
            AGothicCharacterState GetLester() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetGOLEM_STONE_BRIDGE() const property
            {
                return GetCharacter(n"GOLEM_STONE_BRIDGE");
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetGorn() const property
            {
                return GetCharacter(n"NC_SLD_GORN_699");
            }
            
            AGothicCharacterState GetMilten() const property
            {
                return GetCharacter(n"OC_KDF_MILTEN");
            }
            
            AGothicCharacterState GetRodriguez() const property
            {
                return GetCharacter(n"OC_KDF_RODRIGUEZ_400");
            }
            
            AGothicCharacterState GetDiego() const property
            {
                return GetCharacter(n"OC_STT_DIEGO");
            }
            
            AGothicCharacterState GetBaalNamib() const property
            {
                return GetCharacter(n"SC_GUR_BAALNAMIB_1204");
            }
            
            AGothicCharacterState GetCorKalom() const property
            {
                return GetCharacter(n"SC_GUR_CORKALOM_1201");
            }
            
            AGothicCharacterState GetYBerion() const property
            {
                return GetCharacter(n"SC_GUR_YBERION_1200");
            }
            
            AGothicCharacterState GetChani() const property
            {
                return GetCharacter(n"SC_WSC_CHANI_1205");
            }
            
            AGothicCharacterState GetNatalia() const property
            {
                return GetCharacter(n"SC_WSC_NATALIA_1207");
            }
        }
        
        
        class UTopic_Hero__SC_NOV_LESTER : UG1RDialogTopic
        {
            default ForCharacter = n"SC_NOV_LESTER";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetLester() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetGOLEM_STONE_BRIDGE() const property
            {
                return GetCharacter(n"GOLEM_STONE_BRIDGE");
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetGorn() const property
            {
                return GetCharacter(n"NC_SLD_GORN_699");
            }
            
            AGothicCharacterState GetMilten() const property
            {
                return GetCharacter(n"OC_KDF_MILTEN");
            }
            
            AGothicCharacterState GetRodriguez() const property
            {
                return GetCharacter(n"OC_KDF_RODRIGUEZ_400");
            }
            
            AGothicCharacterState GetDiego() const property
            {
                return GetCharacter(n"OC_STT_DIEGO");
            }
            
            AGothicCharacterState GetBaalNamib() const property
            {
                return GetCharacter(n"SC_GUR_BAALNAMIB_1204");
            }
            
            AGothicCharacterState GetCorKalom() const property
            {
                return GetCharacter(n"SC_GUR_CORKALOM_1201");
            }
            
            AGothicCharacterState GetYBerion() const property
            {
                return GetCharacter(n"SC_GUR_YBERION_1200");
            }
            
            AGothicCharacterState GetChani() const property
            {
                return GetCharacter(n"SC_WSC_CHANI_1205");
            }
            
            AGothicCharacterState GetNatalia() const property
            {
                return GetCharacter(n"SC_WSC_NATALIA_1207");
            }
        }
        
        
        class UChoiceLester105823_0 : UTopic_NC_SLD_GORN_699__SC_NOV_LESTER
        {
            default DebugId = int64(0x24fa65b4f334d9bf);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceLester105823);
            
            default RequiredNearbyCharacters.Add(n"Hero");
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_OM_LESTER_CAMP", 1000.0f, int64(0x24fa65b4f334d9bf));
            default Rules.HideIfKnows(UChoiceLester105823_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf5b9b345b8092668), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning());
                    DB(int64(0xf5b9b345b809266b), Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL != nullptr && Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL.HasSucceeded());
                    DB(int64(0xf5b9b345b809266c), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.HasSucceeded());
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning())
                    return false;
                
                if (Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL != nullptr && !Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL.HasSucceeded())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x24fa65b4f334d9bc), EConversationDebugInfo::Executing);
                // Hey, guys.
                Lester.AI.Say(LocText("TEXT_WIP_CMBCCMG_20241025_164904_41"));
                DC(int64(0x24fa65b4f334d9bc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLester105823 : UTopic_NC_SLD_GORN_699__SC_NOV_LESTER
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLester105823_0);
            default Rules.HideIfKnows(UChoiceLester105823);
            default DebugId = int64(0x24fa65b4f334d9bf);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x24fa65b4f334d9c1), EConversationDebugInfo::Executing);
                
                // Took your time.
                Gorn.AI.Say(LocText("TEXT_WIP_CMBCCMG_20241025_164921"));
                DC(int64(0x24fa65b4f334d9c1), EConversationDebugInfo::Done);
                DC(int64(0xe2af83a3cfd853e), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_FourFriendsMeeting);
                DC(int64(0xe2af83a3cfd853e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLester106856 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0xe0777e9560dc8416);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceLester106856);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8243605411b4402e), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning());
                    DB(int64(0x1748b60c9b860632), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe0777e9560dc8432), EConversationDebugInfo::Executing);
                // Is it true? You went into the orc enclave?
                Lester.AI.Say(LocText("TEXT_WIP_XRDAKHC_20240813_182613"));
                DC(int64(0xe0777e9560dc8432), EConversationDebugInfo::Done);
                DC(int64(0xe0777e9560dc8412), EConversationDebugInfo::Executing);
                
                // The enclave and the Sleeper temple, yes. 
                Hero.AI.Say(LocText("TEXT_WIP_XRDAKHC_20240813_182545"));
                DC(int64(0xe0777e9560dc8412), EConversationDebugInfo::Done);
                DC(int64(0xe0777e9560dc8413), EConversationDebugInfo::Executing);
                
                // I have so many questions about that ... but I guess ...
                Lester.AI.Say(LocText("TEXT_WIP_XRDAKHC_20240813_182545_41"));
                DC(int64(0xe0777e9560dc8413), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLester121198 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x6fdd4e97a36cd040);
            default Caption = LocText("TEXT_WIP_KGTRMXB_20240924_151641");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLester106856);
            default Rules.HideIfKnows(UChoiceLester121198);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("INFO_MILTEN_LOADSWORD_02_01"), int64(0x6fdd4e97a36cd040));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6fdd4e97a36cd03c), EConversationDebugInfo::Executing);
                
                // I'm looking for Milten. Have you seen him?
                Hero.AI.Say(LocText("TEXT_WIP_KGTRMXB_20240924_151641"));
                DC(int64(0x6fdd4e97a36cd03c), EConversationDebugInfo::Done);
                DC(int64(0x6fdd4e97a36cd03d), EConversationDebugInfo::Executing);
                
                // No ... at least not since that thing with the mages ...
                Lester.AI.Say(LocText("TEXT_WIP_KGTRMXB_20240924_151641_3436"));
                DC(int64(0x6fdd4e97a36cd03d), EConversationDebugInfo::Done);
                DC(int64(0x6fdd4e97a36cd042), EConversationDebugInfo::Executing);
                
                // All right. I'll go look for him.
                Hero.AI.Say(LocText("TEXT_WIP_KGTRMXB_20240924_151738"));
                DC(int64(0x6fdd4e97a36cd042), EConversationDebugInfo::Done);
                DC(int64(0x6fdd4e97a36cd043), EConversationDebugInfo::Executing);
                
                // Do that. And good luck with whatever this is. You're our ...
                Lester.AI.Say(LocText("TEXT_WIP_KGTRMXB_20240924_151747"));
                DC(int64(0x6fdd4e97a36cd043), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLester144425_0 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0xcf6cde32246c7d66);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceLester144425);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_JSOSVZF_20240509_124601"), int64(0xcf6cde32246c7d66));
            default Rules.HideIfKnows(UChoiceLester144425_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xcf6cde32246c7b88), Lester != nullptr && Lester.HasAssignedDailyRoutine(UDailyRoutine_SC_NOV_Lester_Book));
                    DB(int64(0xc7a8be143f043fac), Hero != nullptr && Hero.IsCloseToCharacter(Lester, 800.0f));
                    DB(int64(0xb4d34737b4129f91), G1R.FourFriendsFocus.IsValid() && G1R.FourFriendsFocus.IsAtLeastXMinutesAgo(20));
                }
                
                if (Lester != nullptr && !Lester.HasAssignedDailyRoutine(UDailyRoutine_SC_NOV_Lester_Book))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Lester, 800.0f))
                    return false;
                
                if (G1R.FourFriendsFocus.IsValid() && !G1R.FourFriendsFocus.IsAtLeastXMinutesAgo(20))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7d63), EConversationDebugInfo::Executing);
                // I never wanna see a harpy again ...
                Lester.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_133559_1091"));
                DC(int64(0xcf6cde32246c7d63), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLester144425 : UTopic_Hero__SC_NOV_LESTER
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLester144425_0);
            default Rules.HideIfKnows(UChoiceLester144425);
            default DebugId = int64(0xcf6cde32246c7d66);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb4d34737b4129f8c), EConversationDebugInfo::Executing);
                G1R.FourFriendsFocus = FInGameTime::Now();
                DC(int64(0xb4d34737b4129f8c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLester184934 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0xf9e12d6f73578d65);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceLester184934);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf9e12d6f73578d6a), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0xf9e12d6f73578da4), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded());
                    DB(int64(0xe5f0d12b37cd60b5), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasSucceeded())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf9e12d6f73578d62), EConversationDebugInfo::Executing);
                // Ah, there you are. What just happened? Kalom looked like ...
                Lester.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_104826_41"));
                DC(int64(0xf9e12d6f73578d62), EConversationDebugInfo::Done);
                DC(int64(0xecfb6fe4d4cbb958), EConversationDebugInfo::Executing);
                
                // The Sleeper is a demon and the orcs summoned him to ...
                Hero.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_120828"));
                DC(int64(0xecfb6fe4d4cbb958), EConversationDebugInfo::Done);
                DC(int64(0xecfb6fe4d4cbb959), EConversationDebugInfo::Executing);
                
                // ... You do have a knack for that, you know? Shaking ...
                Lester.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_120918"));
                DC(int64(0xecfb6fe4d4cbb959), EConversationDebugInfo::Done);
                DC(int64(0xecfb6fe4d4cbb95a), EConversationDebugInfo::Executing);
                
                // I'm just trying to get things done. 
                Hero.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_121050"));
                DC(int64(0xecfb6fe4d4cbb95a), EConversationDebugInfo::Done);
                DC(int64(0xecfb6fe4d4cbb95b), EConversationDebugInfo::Executing);
                
                // Aren't we all. Anyway, I have a lot of questions about ...
                Lester.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_121107"));
                DC(int64(0xecfb6fe4d4cbb95b), EConversationDebugInfo::Done);
                DC(int64(0xecfb6fe4d4cbb95c), EConversationDebugInfo::Executing);
                // I was actually looking for you. Saturas, the highest of ...
                Lester.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_121312"));
                DC(int64(0xecfb6fe4d4cbb95c), EConversationDebugInfo::Done);
                DC(int64(0xecfb6fe4d4cbb96e), EConversationDebugInfo::Executing);
                
                // What's this about? 
                Hero.AI.Say(LocText("TEXT_WIP_PKRDULC_20240503_121418"));
                DC(int64(0xecfb6fe4d4cbb96e), EConversationDebugInfo::Done);
                DC(int64(0xf9e12d6f73578d6d), EConversationDebugInfo::Executing);
                
                // I've heard rumors, but it's best he tells you himself. ...
                Lester.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_104907"));
                DC(int64(0xf9e12d6f73578d6d), EConversationDebugInfo::Done);
                DC(int64(0xf9e12d6f73578d84), EConversationDebugInfo::Executing);
                // Oh, and here, take this map, and come to this location ...
                Lester.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_110002"));
                DC(int64(0xf9e12d6f73578d84), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_LESTER, Document::UDocumentSegment_Glossary_SC_NOV_LESTER_FogTower);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_ESCAPEPLANNC, Document::UDocumentSegment_CH3_ESCAPEPLANNC_Lester);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Executing);
                Lester.AddItemToInventory(UItWr_Map_Lighthouse, 1);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Done);
                DC(int64(0xa18ab1093995308f), EConversationDebugInfo::Executing);
                G1R.Friends_SendToNC = 1;
                DC(int64(0xa18ab1093995308f), EConversationDebugInfo::Done);
                DC(int64(0xa18ab109399531ae), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_ESCAPEPLANNC.StartQuest();
                DC(int64(0xa18ab109399531ae), EConversationDebugInfo::Done);
                DC(int64(0x50028f2ea692c10d), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Diego))) { Diego.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Diego_LightHouse); }
                DC(int64(0x50028f2ea692c10d), EConversationDebugInfo::Done);
                DC(int64(0x50028f2ea692c10f), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Milten))) { Milten.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_LightHouse); }
                DC(int64(0x50028f2ea692c10f), EConversationDebugInfo::Done);
                DC(int64(0x50028f2ea692c111), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Gorn))) { Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_LightHouse); }
                DC(int64(0x50028f2ea692c111), EConversationDebugInfo::Done);
                DC(int64(0xa9075e981a82a06d), EConversationDebugInfo::Executing);
                Lester.AI.GiveItemTo(Hero, UItWr_Map_Lighthouse, 1);
                DC(int64(0xa9075e981a82a06d), EConversationDebugInfo::Done);
                DC(int64(0xa326d2a684224bbf), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_BRINGFOCI_BRINGFOCI_MAP_LIGHTHOUSE.StartQuest();
                DC(int64(0xa326d2a684224bbf), EConversationDebugInfo::Done);
                DC(int64(0x1a0c7e304e9b557a), EConversationDebugInfo::Executing);
                G1R.LighthouseMeeting();
                DC(int64(0x1a0c7e304e9b557a), EConversationDebugInfo::Done);
                DC(int64(0xb19fe5feff638cf), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Rodriguez))) { Rodriguez.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Rodriguez_400_Door); }
                DC(int64(0xb19fe5feff638cf), EConversationDebugInfo::Done);
                DC(int64(0xf9e12d6f73578d85), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf9e12d6f73578d85), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceLester226336 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3bb5737dde588db2);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceLester226336);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ec7293f812d1a7b), Hero != nullptr && Hero.HasItem(UItMs_Focus_03, 1, 0));
                    DB(int64(0x3ec7293f812d1a7c), Quest::SwampCamp_SCCHAPTER3_FORTRESS != nullptr && Quest::SwampCamp_SCCHAPTER3_FORTRESS.IsRunning());
                    DB(int64(0x3bb5737dde588db4), Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_LIBRARY != nullptr && !Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_LIBRARY.HasSucceeded());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItMs_Focus_03, 1, 0))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_FORTRESS != nullptr && !Quest::SwampCamp_SCCHAPTER3_FORTRESS.IsRunning())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_LIBRARY != nullptr && Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_LIBRARY.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3bb5737dde588dab), EConversationDebugInfo::Executing);
                // There you are - I was getting worried. Did you find it? 
                Lester.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_132641"));
                DC(int64(0x3bb5737dde588dab), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588dc2), EConversationDebugInfo::Executing);
                
                // Got it right here. Any more headaches?
                Hero.AI.Say(LocText("PC_PSIONIC_FINISH_INFO_15_02"));
                DC(int64(0x3bb5737dde588dc2), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588dc3), EConversationDebugInfo::Executing);
                
                // No - it just stopped at some point. Still, you keep that ...
                Lester.AI.Say(LocText("TEXT_WIP_JSOSVZF_20240509_124601"));
                DC(int64(0x3bb5737dde588dc3), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588dc4), EConversationDebugInfo::Executing);
                // I'll stay and explore this place a bit longer ... I ...
                Lester.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_132848"));
                DC(int64(0x3bb5737dde588dc4), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588dc5), EConversationDebugInfo::Executing);
                // Here - I found something that might come in handy.
                Lester.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_152814"));
                DC(int64(0x3bb5737dde588dc5), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_LESTER, Document::UDocumentSegment_Glossary_SC_NOV_LESTER_Library);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_FORTRESS, Document::UDocumentSegment_CH3_FORTRESS_Lester);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Executing);
                Lester.AddItemToInventory(UItAr_Scroll_Telekinesis, 2);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Done);
                DC(int64(0xb221732c2f20f575), EConversationDebugInfo::Executing);
                Lester.AI.GiveItemTo(Hero, UItAr_Scroll_Telekinesis, 2);
                DC(int64(0xb221732c2f20f575), EConversationDebugInfo::Done);
                DC(int64(0x273e200a45e68f46), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_LIBRARY.SucceedQuest();
                DC(int64(0x273e200a45e68f46), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588dd7), EConversationDebugInfo::Executing);
                // Scrolls?
                Hero.AI.Say(LocText("TEXT_WIP_JSOSVZF_20240509_124056"));
                DC(int64(0x3bb5737dde588dd7), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588dd8), EConversationDebugInfo::Executing);
                
                // Yeah, telekinesis scrolls. Always useful. 
                Lester.AI.Say(LocText("TEXT_WIP_JSOSVZF_20240509_124056_41"));
                DC(int64(0x3bb5737dde588dd8), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588ddf), EConversationDebugInfo::Executing);
                // If you have a minute, I also found something else that ...
                Lester.AI.Say(LocText("TEXT_WIP_SSOSVZF_20240506_155332_1609"));
                DC(int64(0x3bb5737dde588ddf), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588e29), EConversationDebugInfo::Executing);
                
                // What did you find? 
                Hero.AI.Say(LocText("TEXT_WIP_SSOSVZF_20240506_161208_2801"));
                DC(int64(0x3bb5737dde588e29), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588e2a), EConversationDebugInfo::Executing);
                
                // Here. 
                Lester.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_124808"));
                DC(int64(0x3bb5737dde588e2a), EConversationDebugInfo::Done);
                DC(int64(0xb221732c2f20f580), EConversationDebugInfo::Executing);
                Lester.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadScroll, 4);
                DC(int64(0xb221732c2f20f580), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588e46), EConversationDebugInfo::Executing);
                // It's a scroll of tenure - a deed that grants ownership ...
                Lester.AI.Say(LocText("PC_PSIONIC_STORY_INFO_05_02"));
                DC(int64(0x3bb5737dde588e46), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588e4d), EConversationDebugInfo::Executing);
                
                // I doubt anyone in the Colony cares about land ownership ...
                Hero.AI.Say(LocText("PC_PSIONIC_STORY_INFO_15_04"));
                DC(int64(0x3bb5737dde588e4d), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588e4e), EConversationDebugInfo::Executing);
                
                // No, but if the Barrier falls, it might be worth a ...
                Lester.AI.Say(LocText("PC_PSIONIC_STORY_INFO_05_05"));
                DC(int64(0x3bb5737dde588e4e), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588e4f), EConversationDebugInfo::Executing);
                // How's this: since you're getting around a lot these ...
                Lester.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_125225"));
                DC(int64(0x3bb5737dde588e4f), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Lester_226467,
                    UTopic_Lester_226487
                );
                DC(int64(0xf76d5eb2ff0a0f36), EConversationDebugInfo::Executing);
                Lester.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_Ugh);
                DC(int64(0xf76d5eb2ff0a0f36), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588ea3), EConversationDebugInfo::Executing);
                // UGH. 
                Lester.AI.Say(LocText("TEXT_WIP_SSOSVZF_20240506_161332_3750"));
                DC(int64(0x3bb5737dde588ea3), EConversationDebugInfo::Done);
                DC(int64(0xf76d5eb2ff0a0f52), EConversationDebugInfo::Executing);
                Lester.AI.WaitSeconds(2);
                DC(int64(0xf76d5eb2ff0a0f52), EConversationDebugInfo::Done);
                DC(int64(0xf76d5eb2ff0a0f66), EConversationDebugInfo::Executing);
                Lester.AI.EndAnyOngoingInteraction();
                DC(int64(0xf76d5eb2ff0a0f66), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588ebe), EConversationDebugInfo::Executing);
                // That headache again?
                Hero.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_130513"));
                DC(int64(0x3bb5737dde588ebe), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588ebf), EConversationDebugInfo::Executing);
                
                // Yes, but, it's ... stronger. So much stronger. ...
                Lester.AI.Say(LocText("TEXT_WIP_JSOSVZF_20240509_124144"));
                DC(int64(0x3bb5737dde588ebf), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588ec6), EConversationDebugInfo::Executing);
                
                // This reminds me of Nyras. 
                Hero.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_130658_2785"));
                DC(int64(0x3bb5737dde588ec6), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588ec7), EConversationDebugInfo::Executing);
                
                // What? Why?
                Lester.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_130715"));
                DC(int64(0x3bb5737dde588ec7), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588ec8), EConversationDebugInfo::Executing);
                
                // Nyras, the novice who helped me with the focus, said ...
                Hero.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_131154"));
                DC(int64(0x3bb5737dde588ec8), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588ec9), EConversationDebugInfo::Executing);
                
                // Are you serious? Bloody hell. Maybe ... ah, no. ...
                Lester.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_131234"));
                DC(int64(0x3bb5737dde588ec9), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Lester_226588,
                    UTopic_Lester_226608
                );
            }
        }
        
        
        class UTopic_Lester_226467 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3bb5737dde588e51);
            default Caption = LocText("TEXT_WIP_JHGWENC_20240514_130132_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_226467);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3bb5737dde588e52), EConversationDebugInfo::Executing);
                // Deal. 
                Hero.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_130132_41"));
                DC(int64(0x3bb5737dde588e52), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588e5f), EConversationDebugInfo::Executing);
                
                // Great. Here, take it. 
                Lester.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_130219"));
                DC(int64(0x3bb5737dde588e5f), EConversationDebugInfo::Done);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Executing);
                Lester.AddItemToInventory(UItWr_Scroll_Certificate, 1);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Done);
                DC(int64(0x45363f081b045999), EConversationDebugInfo::Executing);
                Lester.AI.GiveItemTo(Hero, UItWr_Scroll_Certificate, 1);
                DC(int64(0x45363f081b045999), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588ea1), EConversationDebugInfo::Executing);
                // Now-
                Lester.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_130233_1924"));
                DC(int64(0x3bb5737dde588ea1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lester_226487 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3bb5737dde588e55);
            default Caption = LocText("TEXT_WIP_JHGWENC_20240514_130132_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_226487);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3bb5737dde588e56), EConversationDebugInfo::Executing);
                
                // Better hold on to it. That Barrier might be gone sooner ...
                Hero.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_130132_2238"));
                DC(int64(0x3bb5737dde588e56), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588e7e), EConversationDebugInfo::Executing);
                
                // Hm. Yeah, I guess you're right. Fine. Then let's-
                Lester.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_130337"));
                DC(int64(0x3bb5737dde588e7e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lester_226588 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3bb5737dde588ecb);
            default Caption = LocText("TEXT_WIP_AGXCIAC_20240904_175453_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_226588);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3bb5737dde588ecc), EConversationDebugInfo::Executing);
                
                // Tell me, Lester. 
                Hero.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_175453_3984"));
                DC(int64(0x3bb5737dde588ecc), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588f0b), EConversationDebugInfo::Executing);
                
                // It's just .. I don't know. Maybe the Sleeper has ...
                Lester.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_175600"));
                DC(int64(0x3bb5737dde588f0b), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588f0c), EConversationDebugInfo::Executing);
                // I know a couple novices who also had these headaches and ...
                Lester.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_175602"));
                DC(int64(0x3bb5737dde588f0c), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588f0d), EConversationDebugInfo::Executing);
                // Anyway. Now's not the time. 
                Lester.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_175609"));
                DC(int64(0x3bb5737dde588f0d), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e3923), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_Book);
                DC(int64(0x1e953c06636e3923), EConversationDebugInfo::Done);
                DC(int64(0x273e200a45e68f51), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_REPORT.SucceedQuest();
                DC(int64(0x273e200a45e68f51), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588f40), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3bb5737dde588f40), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Lester_226608 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3bb5737dde588ecf);
            default Caption = LocText("TEXT_WIP_AGXCIAC_20240904_175453_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_226608);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3bb5737dde588ed0), EConversationDebugInfo::Executing);
                // All right. 
                Hero.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_175453_3569"));
                DC(int64(0x3bb5737dde588ed0), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588ef7), EConversationDebugInfo::Executing);
                
                // ... Yeah. It's gonna be fine. 
                Lester.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_175510"));
                DC(int64(0x3bb5737dde588ef7), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e3923), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_Book);
                DC(int64(0x1e953c06636e3923), EConversationDebugInfo::Done);
                DC(int64(0x273e200a45e68f51), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_REPORT.SucceedQuest();
                DC(int64(0x273e200a45e68f51), EConversationDebugInfo::Done);
                DC(int64(0x3bb5737dde588f57), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3bb5737dde588f57), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceLester227046 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x69492f9227437ba6);
            default Caption = LocText("TEXT_WIP_OPTVPFF_20240311_152427");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceLester227046);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_MPTVPFF_20240313_124515_41"), int64(0x69492f9227437ba6));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_IXHZGRJ_20240322_004403"), int64(0x69492f9227437ba6));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_PPQXWNL_20240408_133837_3984"), int64(0x69492f9227437ba6));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf2a42eb10820c6f5), Hero != nullptr && Hero.HasItem(UItWr_Scroll_AbandonMineSketch, 1, 0));
                    DB(int64(0xf2a42eb10820c701), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItWr_Scroll_AbandonMineSketch, 1, 0))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x69492f9227437b9e), EConversationDebugInfo::Executing);
                // I found this drawing. Do you know this place?
                Hero.AI.Say(LocText("TEXT_WIP_OPTVPFF_20240311_152427"));
                DC(int64(0x69492f9227437b9e), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FINDINGCAINE, Document::UDocumentSegment_CH2_FINDINGCAINE_Lester);
                DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Executing);
                RequestCameraReverseShot();
                DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Done);
                DC(int64(0xf5b9b345b809258e), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Lester, UItWr_Scroll_AbandonMineSketch, 1);
                DC(int64(0xf5b9b345b809258e), EConversationDebugInfo::Done);
                DC(int64(0xf5b9b345b80925a7), EConversationDebugInfo::Executing);
                Lester.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadDrawing, 2);
                DC(int64(0xf5b9b345b80925a7), EConversationDebugInfo::Done);
                DC(int64(0xe00c9f3bf3ee8c), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_DRAWING.SucceedQuest();
                DC(int64(0xe00c9f3bf3ee8c), EConversationDebugInfo::Done);
                DC(int64(0x69492f9227437bdf), EConversationDebugInfo::Executing);
                // A drawing? Where did you get that from?
                Lester.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_133837_3984"));
                DC(int64(0x69492f9227437bdf), EConversationDebugInfo::Done);
                DC(int64(0x69492f9227437be0), EConversationDebugInfo::Executing);
                
                // Long story. Is that a real place? Do you recognize it?
                Hero.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_134028"));
                DC(int64(0x69492f9227437be0), EConversationDebugInfo::Done);
                DC(int64(0x69492f9227437c03), EConversationDebugInfo::Executing);
                
                // Hmm ... I think ... yeah. Yeah, this has to be the ...
                Lester.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_134029"));
                DC(int64(0x69492f9227437c03), EConversationDebugInfo::Done);
                DC(int64(0x69492f9227437c04), EConversationDebugInfo::Executing);
                // It flooded a couple of years ago, though, and Gomez had ...
                Lester.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_134037"));
                DC(int64(0x69492f9227437c04), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Lester_227076,
                    UTopic_Lester_227096
                );
            }
        }
        
        
        class UTopic_Lester_227076 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x69492f9227437be8);
            default Caption = LocText("TEXT_WIP_PPQXWNL_20240408_124709_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_227076);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x69492f9227437be9), EConversationDebugInfo::Executing);
                // Like I said, it's complicated. Can I get into the mine ...
                Hero.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_124709_2238"));
                DC(int64(0x69492f9227437be9), EConversationDebugInfo::Done);
                DC(int64(0x69492f9227437c05), EConversationDebugInfo::Executing);
                
                // Well, I guess you can if you bring a gift for whoever ...
                Lester.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_124852"));
                DC(int64(0x69492f9227437c05), EConversationDebugInfo::Done);
                DC(int64(0x69492f9227437c06), EConversationDebugInfo::Executing);
                
                // All right. Thanks, Lester.
                Hero.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_125404"));
                DC(int64(0x69492f9227437c06), EConversationDebugInfo::Done);
                DC(int64(0x69492f9227437c07), EConversationDebugInfo::Executing);
                
                // Sure.
                Lester.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_125416"));
                DC(int64(0x69492f9227437c07), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lester_227096 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x69492f9227437bec);
            default Caption = LocText("TEXT_WIP_PPQXWNL_20240408_124709_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_227096);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x69492f9227437bed), EConversationDebugInfo::Executing);
                
                // Kalom's apprentice has gone missing. I found this in his ...
                Hero.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_124709_2785"));
                DC(int64(0x69492f9227437bed), EConversationDebugInfo::Done);
                DC(int64(0x69492f9227437c08), EConversationDebugInfo::Executing);
                
                // Caine, you mean? Interesting ... I heard him tell ...
                Lester.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_125515"));
                DC(int64(0x69492f9227437c08), EConversationDebugInfo::Done);
                DB(int64(0x69492f9227437c0a), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                DB(int64(0x69492f9227437c11), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                {
                    DC(int64(0x69492f9227437c13), EConversationDebugInfo::Executing);
                    // I would ask why an Old Camp SHADOW is looking into this, ...
                    Lester.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_132500_3436"));
                    DC(int64(0x69492f9227437c13), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue))
                {
                    DC(int64(0x69492f9227437c1b), EConversationDebugInfo::Executing);
                    // I would ask why one of Lares's guys is looking into ...
                    Lester.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_132503_3286"));
                    DC(int64(0x69492f9227437c1b), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x69492f9227437c23), EConversationDebugInfo::Executing);
                    // Kalom tasked you to find him, then? Beats mashing swamp ...
                    Lester.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_132507_686"));
                    DC(int64(0x69492f9227437c23), EConversationDebugInfo::Done);
                }
                DC(int64(0x69492f9227437c2b), EConversationDebugInfo::Executing);
                // If you want to check out the mine, make sure to bring ...
                Lester.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_132616_2386"));
                DC(int64(0x69492f9227437c2b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLester452778 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x485a05db1e2d58fc);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_pc_psionic_followme_exit_2");
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x485a05db1e2d59d2), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x485a05db1e2d59d9), G1R.BridgeGolemCombatActive == 0);
                    DB(int64(0xab27ea80fbb99524), GOLEM_STONE_BRIDGE != nullptr && !GOLEM_STONE_BRIDGE.IsEveryoneOfThisKindDead());
                }
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (G1R.BridgeGolemCombatActive != 0)
                    return false;
                
                if (GOLEM_STONE_BRIDGE != nullptr && GOLEM_STONE_BRIDGE.IsEveryoneOfThisKindDead())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x485a05db1e2d58f7), EConversationDebugInfo::Executing);
                // You have a blunt weapon with you?
                Lester.AI.Say(LocText("PC_PSIONIC_FOLLOWME_INFO_05_03"));
                DC(int64(0x485a05db1e2d58f7), EConversationDebugInfo::Done);
                DB(int64(0x485a05db1e2d5905), Hero != nullptr && Hero.HasItemOfType(GameplayTag::Item_Weapon_Mace, 1));
                
                if (Hero != nullptr && Hero.HasItemOfType(GameplayTag::Item_Weapon_Mace, 1))
                {
                    DC(int64(0x485a05db1e2d59ca), EConversationDebugInfo::Executing);
                    // I do.
                    Hero.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_132259"));
                    DC(int64(0x485a05db1e2d59ca), EConversationDebugInfo::Done);
                    DC(int64(0x485a05db1e2d59cb), EConversationDebugInfo::Executing);
                    
                    // Then use it. It'll help against that thing. 
                    Lester.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_132259_41"));
                    DC(int64(0x485a05db1e2d59cb), EConversationDebugInfo::Done);
                    DC(int64(0x485a05db1e2d59cc), EConversationDebugInfo::Executing);
                    // Anyway, lead on. I'll cover your back. 
                    Lester.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_132314_2238"));
                    DC(int64(0x485a05db1e2d59cc), EConversationDebugInfo::Done);
                    DC(int64(0xb221732c2f20f4e2), EConversationDebugInfo::Executing);
                    Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_Fortressfollow);
                    DC(int64(0xb221732c2f20f4e2), EConversationDebugInfo::Done);
                    DC(int64(0xb221732c2f20f4e6), EConversationDebugInfo::Executing);
                    Lester.JoinPartyOf(Hero);
                    DC(int64(0xb221732c2f20f4e6), EConversationDebugInfo::Done);
                    DC(int64(0xa8d4612cf54a43eb), EConversationDebugInfo::Executing);
                    G1R.BridgeStoneGolemEnemy = 1;
                    DC(int64(0xa8d4612cf54a43eb), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_lester_452778_exit_1");
                    DC(int64(0x485a05db1e2d59bd), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x485a05db1e2d59bd), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x485a05db1e2d59cf), EConversationDebugInfo::Executing);
                    // You mean, like a hammer? No.
                    Hero.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_132302"));
                    DC(int64(0x485a05db1e2d59cf), EConversationDebugInfo::Done);
                    DC(int64(0x485a05db1e2d59d0), EConversationDebugInfo::Executing);
                    
                    // Then maybe look for one before we do this. 
                    Lester.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_132302_2083"));
                    DC(int64(0x485a05db1e2d59d0), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_lester_452778_exit_2");
                    DC(int64(0xab27ea80fbb9951d), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xab27ea80fbb9951d), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceLester83361 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x57d402a666ffcd53);
            default Caption = LocText("TEXT_WIP_OPTVPFF_20240311_155625");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceLester83361);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_MPTVPFF_20240313_124515_41"), int64(0x57d402a666ffcd53));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_IXHZGRJ_20240322_004403"), int64(0x57d402a666ffcd53));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_PPQXWNL_20240408_133837_3984"), int64(0x57d402a666ffcd53));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf2a42eb10820c6f5), Hero != nullptr && Hero.HasItem(UItWr_Scroll_AbandonMineSketch, 1, 0));
                    DB(int64(0xf2a42eb10820c701), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItWr_Scroll_AbandonMineSketch, 1, 0))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x57d402a666ffcd51), EConversationDebugInfo::Executing);
                // People say you know your way around the Colony. Can you ...
                Hero.AI.Say(LocText("TEXT_WIP_OPTVPFF_20240311_155625"));
                DC(int64(0x57d402a666ffcd51), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FINDINGCAINE, Document::UDocumentSegment_CH2_FINDINGCAINE_Lester);
                DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Executing);
                RequestCameraReverseShot();
                DC(int64(0x1a51915304e8a78d), EConversationDebugInfo::Done);
                DC(int64(0xf5b9b345b809258e), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Lester, UItWr_Scroll_AbandonMineSketch, 1);
                DC(int64(0xf5b9b345b809258e), EConversationDebugInfo::Done);
                DC(int64(0xf5b9b345b80925a7), EConversationDebugInfo::Executing);
                Lester.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadDrawing, 2);
                DC(int64(0xf5b9b345b80925a7), EConversationDebugInfo::Done);
                DC(int64(0xe00c9f3bf3ee8c), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_DRAWING.SucceedQuest();
                DC(int64(0xe00c9f3bf3ee8c), EConversationDebugInfo::Done);
                DC(int64(0xf5b9b345b8092596), EConversationDebugInfo::Executing);
                // A drawing? Where did you get that from?
                Lester.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_133837_3984"));
                DC(int64(0xf5b9b345b8092596), EConversationDebugInfo::Done);
                DC(int64(0xf5b9b345b809259b), EConversationDebugInfo::Executing);
                
                // Long story. Is that a real place? Do you recognize it?
                Hero.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_134028"));
                DC(int64(0xf5b9b345b809259b), EConversationDebugInfo::Done);
                DC(int64(0xf5b9b345b809259c), EConversationDebugInfo::Executing);
                
                // Hmm ... I think ... yeah. Yeah, this has to be the ...
                Lester.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_134029"));
                DC(int64(0xf5b9b345b809259c), EConversationDebugInfo::Done);
                DC(int64(0xf5b9b345b809259d), EConversationDebugInfo::Executing);
                // It flooded a couple of years ago, though, and Gomez had ...
                Lester.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_134037"));
                DC(int64(0xf5b9b345b809259d), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Lester_88866,
                    UTopic_Lester_88886
                );
            }
        }
        
        
        class UTopic_Lester_88866 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0xf5b9b345b809255a);
            default Caption = LocText("TEXT_WIP_PPQXWNL_20240408_124709_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_88866);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf5b9b345b809255b), EConversationDebugInfo::Executing);
                // Like I said, it's complicated. Can I get into the mine ...
                Hero.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_124709_2238"));
                DC(int64(0xf5b9b345b809255b), EConversationDebugInfo::Done);
                DC(int64(0xf5b9b345b8092564), EConversationDebugInfo::Executing);
                
                // Well, I guess you can if you bring a gift for whoever ...
                Lester.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_124852"));
                DC(int64(0xf5b9b345b8092564), EConversationDebugInfo::Done);
                DC(int64(0xf5b9b345b8092566), EConversationDebugInfo::Executing);
                
                // All right. Thanks, Lester.
                Hero.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_125404"));
                DC(int64(0xf5b9b345b8092566), EConversationDebugInfo::Done);
                DC(int64(0xf5b9b345b8092567), EConversationDebugInfo::Executing);
                
                // Sure.
                Lester.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_125416"));
                DC(int64(0xf5b9b345b8092567), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lester_88886 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0xf5b9b345b809255e);
            default Caption = LocText("TEXT_WIP_PPQXWNL_20240408_124709_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_88886);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf5b9b345b809255f), EConversationDebugInfo::Executing);
                
                // Kalom's apprentice has gone missing. I found this in his ...
                Hero.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_124709_2785"));
                DC(int64(0xf5b9b345b809255f), EConversationDebugInfo::Done);
                DC(int64(0xf5b9b345b8092568), EConversationDebugInfo::Executing);
                
                // Caine, you mean? Interesting ... I heard him tell ...
                Lester.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_125515"));
                DC(int64(0xf5b9b345b8092568), EConversationDebugInfo::Done);
                DB(int64(0xf5b9b345b809256e), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow));
                DB(int64(0xf5b9b345b8092571), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Shadow))
                {
                    DC(int64(0xf5b9b345b8092573), EConversationDebugInfo::Executing);
                    // I would ask why an Old Camp SHADOW is looking into this, ...
                    Lester.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_132500_3436"));
                    DC(int64(0xf5b9b345b8092573), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_Rogue))
                {
                    DC(int64(0xf5b9b345b8092577), EConversationDebugInfo::Executing);
                    // I would ask why one of Lares's guys is looking into ...
                    Lester.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_132503_3286"));
                    DC(int64(0xf5b9b345b8092577), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xf5b9b345b809257b), EConversationDebugInfo::Executing);
                    // Kalom tasked you to find him, then? Beats mashing swamp ...
                    Lester.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_132507_686"));
                    DC(int64(0xf5b9b345b809257b), EConversationDebugInfo::Done);
                }
                DC(int64(0xf5b9b345b8092582), EConversationDebugInfo::Executing);
                // If you want to check out the mine, make sure to bring ...
                Lester.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_132616_2386"));
                DC(int64(0xf5b9b345b8092582), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLester87566 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x8a9901902869dab2);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceLester87566);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8a9901902869db2d), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FINDLESTER != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FINDLESTER.IsRunning());
                    DB(int64(0x6189ebf5f65173da), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FINDLESTER != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FINDLESTER.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8a9901902869daf6), EConversationDebugInfo::Executing);
                // Who- Oh. You just show up everywhere these days, don't ...
                Lester.AI.Say(LocText("TEXT_WIP_LPQXWNL_20240404_123108"));
                DC(int64(0x8a9901902869daf6), EConversationDebugInfo::Done);
                DC(int64(0x8a9901902869daf7), EConversationDebugInfo::Executing);
                
                // Cor Angar says you can help me find the crawler nest.
                Hero.AI.Say(LocText("TEXT_WIP_LPQXWNL_20240404_123830"));
                DC(int64(0x8a9901902869daf7), EConversationDebugInfo::Done);
                DC(int64(0x28f8ba30074eea0e), EConversationDebugInfo::Executing);
                
                // Does he, now? Interesting. I'm guessing this is part of ...
                Lester.AI.Say(LocText("TEXT_WIP_OOQECXC_20240425_173836"));
                DC(int64(0x28f8ba30074eea0e), EConversationDebugInfo::Done);
                DC(int64(0x6fdd4e97a36ccfe3), EConversationDebugInfo::Executing);
                // As part of the "Sleeper's plan"?
                Lester.AI.Say(LocText("TEXT_WIP_KGTRMXB_20240924_143241"));
                DC(int64(0x6fdd4e97a36ccfe3), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Lester_111068,
                    UTopic_Lester_111088,
                    UTopic_Lester_111110
                );
                DC(int64(0x8a9901902869daf8), EConversationDebugInfo::Executing);
                // Anyway, you come at the right time. We think the crawler ...
                Lester.AI.Say(LocText("TEXT_WIP_LPQXWNL_20240404_123929"));
                DC(int64(0x8a9901902869daf8), EConversationDebugInfo::Done);
                DC(int64(0x28f8ba30074eea17), EConversationDebugInfo::Executing);
                // It's an old tunnel the miners collapsed in the days ...
                Lester.AI.Say(LocText("TEXT_WIP_OOQECXC_20240425_174509"));
                DC(int64(0x28f8ba30074eea17), EConversationDebugInfo::Done);
                DC(int64(0x28f8ba30074eea18), EConversationDebugInfo::Executing);
                
                // That's a lot of rubble. How are we gonna get through ...
                Hero.AI.Say(LocText("TEXT_WIP_OOQECXC_20240425_174628"));
                DC(int64(0x28f8ba30074eea18), EConversationDebugInfo::Done);
                DC(int64(0x28f8ba30074eea19), EConversationDebugInfo::Executing);
                
                // I'm working on that part. How about you round up the ...
                Lester.AI.Say(LocText("TEXT_WIP_OOQECXC_20240425_174642"));
                DC(int64(0x28f8ba30074eea19), EConversationDebugInfo::Done);
                DC(int64(0x28f8ba30074eea1a), EConversationDebugInfo::Executing);
                // Once we open that thing, we'll need every sword we can ...
                Lester.AI.Say(LocText("TEXT_WIP_OOQECXC_20240425_174742"));
                DC(int64(0x28f8ba30074eea1a), EConversationDebugInfo::Done);
                DC(int64(0xf5b9b345b809253c), EConversationDebugInfo::Executing);
                // Oh, and Asghan, the warder, won't let us do anything ...
                Lester.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_111831"));
                DC(int64(0xf5b9b345b809253c), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Lester_88119,
                    UTopic_Lester_88139,
                    UTopic_Lester_88327
                );
            }
        }
        
        
        class UTopic_Lester_111068 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x73fa8602822d58a3);
            default Caption = LocText("TEXT_WIP_YFXCIAC_20240906_142407_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_111068);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x73fa8602822d58a4), EConversationDebugInfo::Executing);
                // You don't sound too convinced. 
                Hero.AI.Say(LocText("TEXT_WIP_YFXCIAC_20240906_142407_3436"));
                DC(int64(0x73fa8602822d58a4), EConversationDebugInfo::Done);
                DC(int64(0x73fa8602822d58b3), EConversationDebugInfo::Executing);
                
                // Ah, I don't know.
                Lester.AI.Say(LocText("TEXT_WIP_YFXCIAC_20240906_142444"));
                DC(int64(0x73fa8602822d58b3), EConversationDebugInfo::Done);
                DC(int64(0x73fa8602822d58b4), EConversationDebugInfo::Executing);
                // I mean, you DID find Caine and the focus stone, so maybe ...
                Lester.AI.Say(LocText("TEXT_WIP_YFXCIAC_20240906_142527"));
                DC(int64(0x73fa8602822d58b4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lester_111088 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x73fa8602822d58a7);
            default Caption = LocText("TEXT_WIP_YFXCIAC_20240906_142407_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_111088);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x73fa8602822d58a8), EConversationDebugInfo::Executing);
                
                // Honestly, I'm starting to wonder if Y'Berion is onto ...
                Hero.AI.Say(LocText("TEXT_WIP_YFXCIAC_20240906_142407_686"));
                DC(int64(0x73fa8602822d58a8), EConversationDebugInfo::Done);
                DC(int64(0x73fa8602822d58c3), EConversationDebugInfo::Executing);
                
                // I suppose. And hey, you did find Caine and the focus ...
                Lester.AI.Say(LocText("TEXT_WIP_YFXCIAC_20240906_142706"));
                DC(int64(0x73fa8602822d58c3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lester_111110 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x73fa8602822d58ad);
            default Caption = LocText("TEXT_WIP_YFXCIAC_20240906_142422_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_111110);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x73fa8602822d58ae), EConversationDebugInfo::Executing);
                
                // I have nothing to do with the Sleeper. I told him, but ...
                Hero.AI.Say(LocText("TEXT_WIP_YFXCIAC_20240906_142422_2386"));
                DC(int64(0x73fa8602822d58ae), EConversationDebugInfo::Done);
                DB(int64(0x73fa8602822d58c7), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0x73fa8602822d58ca), EConversationDebugInfo::Executing);
                    // And that from a novice. Makes me wonder why you joined ...
                    Lester.AI.Say(LocText("TEXT_WIP_YFXCIAC_20240906_142833"));
                    DC(int64(0x73fa8602822d58ca), EConversationDebugInfo::Done);
                    DC(int64(0x73fa8602822d58d8), EConversationDebugInfo::Executing);
                    // But hey, you did find Caine and the focus stone, so if ...
                    Lester.AI.Say(LocText("TEXT_WIP_YFXCIAC_20240906_142929"));
                    DC(int64(0x73fa8602822d58d8), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x73fa8602822d58ce), EConversationDebugInfo::Executing);
                    // Guess we all believe what we have to. 
                    Lester.AI.Say(LocText("TEXT_WIP_YFXCIAC_20240906_142839"));
                    DC(int64(0x73fa8602822d58ce), EConversationDebugInfo::Done);
                    DC(int64(0x73fa8602822d58d9), EConversationDebugInfo::Executing);
                    // But hey, you did find Caine and the focus stone, so if ...
                    Lester.AI.Say(LocText("TEXT_WIP_YFXCIAC_20240906_142929"));
                    DC(int64(0x73fa8602822d58d9), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Lester_88119 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x8a9901902869dafc);
            default Caption = LocText("TEXT_WIP_LPQXWNL_20240404_124646_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_88119);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8a9901902869dafd), EConversationDebugInfo::Executing);
                // What's your plan to get through the rubble?
                Hero.AI.Say(LocText("TEXT_WIP_LPQXWNL_20240404_124646_2785"));
                DC(int64(0x8a9901902869dafd), EConversationDebugInfo::Done);
                DC(int64(0x8a9901902869db06), EConversationDebugInfo::Executing);
                
                // Like I said, I'm working on it. You'll see. 
                Lester.AI.Say(LocText("TEXT_WIP_LPQXWNL_20240404_124705"));
                DC(int64(0x8a9901902869db06), EConversationDebugInfo::Done);
                DC(int64(0x8a9901902869daff), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x8a9901902869daff), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lester_88139 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x8a9901902869db00);
            default Caption = LocText("TEXT_WIP_LPQXWNL_20240404_124646_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_88139);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8a9901902869db01), EConversationDebugInfo::Executing);
                // How many templars do we need? 
                Hero.AI.Say(LocText("TEXT_WIP_LPQXWNL_20240404_124646_3286"));
                DC(int64(0x8a9901902869db01), EConversationDebugInfo::Done);
                DC(int64(0x8a9901902869db07), EConversationDebugInfo::Executing);
                
                // Three should be enough. 
                Lester.AI.Say(LocText("TEXT_WIP_LPQXWNL_20240404_124741"));
                DC(int64(0x8a9901902869db07), EConversationDebugInfo::Done);
                DC(int64(0x8a9901902869db03), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x8a9901902869db03), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lester_88327 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x8a9901902869db08);
            default Caption = LocText("TEXT_WIP_LPQXWNL_20240404_124851_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_88327);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8a9901902869db09), EConversationDebugInfo::Executing);
                // I'll handle it.
                Hero.AI.Say(LocText("TEXT_WIP_LPQXWNL_20240404_124851_686"));
                DC(int64(0x8a9901902869db09), EConversationDebugInfo::Done);
                DC(int64(0x8a9901902869db0e), EConversationDebugInfo::Executing);
                
                // Once you have Ian's permission and the templars, come ...
                Lester.AI.Say(LocText("TEXT_WIP_LPQXWNL_20240404_125118"));
                DC(int64(0x8a9901902869db0e), EConversationDebugInfo::Done);
                DC(int64(0x28f8ba30074eea28), EConversationDebugInfo::Executing);
                // Good luck!
                Lester.AI.Say(LocText("TEXT_WIP_OOQECXC_20240425_175950"));
                DC(int64(0x28f8ba30074eea28), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_MCEGGS, Document::UDocumentSegment_CH2_MCEGGS_Lester);
                DC(int64(0x63b0673d24caf98b), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FINDLESTER.SucceedQuest();
                DC(int64(0x63b0673d24caf98b), EConversationDebugInfo::Done);
                DC(int64(0xf5b9b345b8092558), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_OldMineLookingFor4Friends);
                DC(int64(0xf5b9b345b8092558), EConversationDebugInfo::Done);
                DC(int64(0x3c90afd4da3e3b52), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.StartQuest();
                DC(int64(0x3c90afd4da3e3b52), EConversationDebugInfo::Done);
                DC(int64(0x3c90afd4da3e3b54), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_IAN.StartQuest();
                DC(int64(0x3c90afd4da3e3b54), EConversationDebugInfo::Done);
                DC(int64(0x258017cab699a5c2), EConversationDebugInfo::Executing);
                if (ensure(IsValid(YBerion))) { YBerion.ExchangeDailyRoutineToClass(UDailyRoutine_SC_GUR_YBerion_1200_Discussion); }
                DC(int64(0x258017cab699a5c2), EConversationDebugInfo::Done);
                DC(int64(0x258017cab699a5c4), EConversationDebugInfo::Executing);
                if (ensure(IsValid(CorKalom))) { CorKalom.ExchangeDailyRoutineToClass(UDailyRoutine_SC_GUR_CorKalom_1201_Discussion); }
                DC(int64(0x258017cab699a5c4), EConversationDebugInfo::Done);
                DC(int64(0x258017cab699a5c6), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Natalia))) { Natalia.ExchangeDailyRoutineToClass(UDailyRoutine_SC_WSC_Natalia_1207_Rest); }
                DC(int64(0x258017cab699a5c6), EConversationDebugInfo::Done);
                DC(int64(0x258017cab699a5c8), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Chani))) { Chani.ExchangeDailyRoutineToClass(UDailyRoutine_SC_WSC_Chani_1205_Rest); }
                DC(int64(0x258017cab699a5c8), EConversationDebugInfo::Done);
                DC(int64(0x63b0673d24caf98e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x63b0673d24caf98e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceLester89073 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0xf5b9b345b80925bd);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceLester89073);
            
            default ExtraCharactersToInvite.Add(n"NC_SLD_GORN_699");
            default ExtraCharactersToInvite.Add(n"OC_KDF_MILTEN");
            default ExtraCharactersToInvite.Add(n"OC_STT_DIEGO");
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_OM_LESTER_CAMP", 100.0f, int64(0xf5b9b345b80925bd));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf5b9b345b8092668), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning());
                    DB(int64(0xf5b9b345b809266b), Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL != nullptr && Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL.HasSucceeded());
                    DB(int64(0xf5b9b345b809266c), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.HasSucceeded());
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning())
                    return false;
                
                if (Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL != nullptr && !Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL.HasSucceeded())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf5b9b345b80925ba), EConversationDebugInfo::Executing);
                // Here we are. 
                Lester.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_141530_1609"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                DC(int64(0xf5b9b345b80925ba), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_STT_DIEGO, Document::UDocumentSegment_Glossary_OC_STT_DIEGO_FourFriends);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_KDF_MILTEN, Document::UDocumentSegment_Glossary_OC_KDF_MILTEN_FourFriends);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_SLD_GORN, Document::UDocumentSegment_Glossary_NC_SLD_GORN_FourFriends);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_LESTER, Document::UDocumentSegment_Glossary_SC_NOV_LESTER_FourFriends);
                DC(int64(0xc3ed6bbca8845a6c), EConversationDebugInfo::Executing);
                Hero.AI.GotoWaypoint(n"FP_OM_WATERFALL_MEETING");
                DC(int64(0xc3ed6bbca8845a6c), EConversationDebugInfo::Done);
                DB(int64(0x41c71823c6ddc832), Hero != nullptr && Hero.HasListenedTo(LocText("DIA_GORN_FIRST_09_00")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("DIA_GORN_FIRST_09_00")))
                {
                    DC(int64(0x41c71823c6ddc838), EConversationDebugInfo::Executing);
                    // I'd do the introductions, but unless I'm mistaken, ...
                    Lester.AI.Say(LocText("TEXT_WIP_ROQECXC_20240426_121942_41"), ForceCameraPreset = n"PACK SHOT 1 4FRIENDS 1C", TargetCharacter = Hero.Character);
                    DC(int64(0x41c71823c6ddc838), EConversationDebugInfo::Done);
                    DC(int64(0x41c71823c6ddc907), EConversationDebugInfo::Executing);
                    
                    // Yeah.
                    Hero.AI.Say(LocText("TEXT_WIP_ROQECXC_20240426_122131"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM", TargetCharacter = Lester.Character);
                    DC(int64(0x41c71823c6ddc907), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x41c71823c6ddc83c), EConversationDebugInfo::Executing);
                    
                    // You already know Diego and Milten. The big guy's Gorn.
                    Lester.AI.Say(LocText("TEXT_WIP_ROQECXC_20240426_121948_2083"), ForceCameraPreset = n"PACK SHOT 1 4FRIENDS 1C", TargetCharacter = Hero.Character);
                    DC(int64(0x41c71823c6ddc83c), EConversationDebugInfo::Done);
                    DC(int64(0x1748b60c9b860637), EConversationDebugInfo::Executing);
                    
                    // Good to meet you.
                    Gorn.AI.Say(LocText("TEXT_WIP_FEGJUJG_20250312_135519"), ForceCameraPreset = n"INDIVIDUAL MEDIUM GORN 4FRIENDS 1C", TargetCharacter = Hero.Character);
                    DC(int64(0x1748b60c9b860637), EConversationDebugInfo::Done);
                }
                DC(int64(0x41c71823c6ddc90b), EConversationDebugInfo::Executing);
                // Long story short, we have an idea how to clear that ...
                Lester.AI.Say(LocText("TEXT_WIP_ROQECXC_20240426_122349"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM", TargetCharacter = Hero.Character);
                DC(int64(0x41c71823c6ddc90b), EConversationDebugInfo::Done);
                DC(int64(0x41c71823c6ddc841), EConversationDebugInfo::Executing);
                
                // I'm all ears. 
                Hero.AI.Say(LocText("TEXT_WIP_ROQECXC_20240426_121955"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM");
                DC(int64(0x41c71823c6ddc841), EConversationDebugInfo::Done);
                DC(int64(0xb65c23b710d2f474), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_FourFriendsMeeting);
                DC(int64(0xb65c23b710d2f474), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2eac), EConversationDebugInfo::Executing);
                Lester.AI.GotoWaypoint(n"FP_OM_LESTER_CAMP");
                DC(int64(0x163098d161fe2eac), EConversationDebugInfo::Done);
                DC(int64(0xc3ed6bbca8845a72), EConversationDebugInfo::Executing);
                Gorn.AI.TurnToCharacter(Hero);
                DC(int64(0xc3ed6bbca8845a72), EConversationDebugInfo::Done);
                DC(int64(0xc3ed6bbca8845a76), EConversationDebugInfo::Executing);
                Milten.AI.TurnToCharacter(Hero);
                DC(int64(0xc3ed6bbca8845a76), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2cc1), EConversationDebugInfo::Executing);
                // We're gonna blow it up.
                Gorn.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_172527"), TargetCharacter = Hero.Character, ForceCameraPreset = n"INDIVIDUAL MEDIUM GORN 4FRIENDS 1C");
                DC(int64(0x163098d161fe2cc1), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2cd3), EConversationDebugInfo::Executing);
                
                // Say again?
                Hero.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_172602"), TargetCharacter = Gorn.Character, ForceCameraPreset = n"OTS GORN TO NH 4FRIENDS 1C");
                DC(int64(0x163098d161fe2cd3), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2cc6), EConversationDebugInfo::Executing);
                
                // You heard me. With the right spell, you can release the ...
                Gorn.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_172544"), TargetCharacter = Hero.Character, ForceCameraPreset = n"OTS NH TO GORN 4FRIENDS 1C");
                DC(int64(0x163098d161fe2cc6), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2cea), EConversationDebugInfo::Executing);
                // It's the same thing our mages are gonna do with that ...
                Gorn.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_172620"), TargetCharacter = Hero.Character, ForceCameraPreset = n"WIDE SHOT GORN 4FRIENDS 1C");
                DC(int64(0x163098d161fe2cea), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2cf1), EConversationDebugInfo::Executing);
                
                // You want to blow up a pile of ore in a MINE?
                Hero.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_172630"), TargetCharacter = Gorn.Character, ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                DC(int64(0x163098d161fe2cf1), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2d89), EConversationDebugInfo::Executing);
                
                // Actually, you don't release it, you CHANNEL it. It's ...
                Milten.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_173303"), TargetCharacter = Hero.Character, ForceCameraPreset = n"TWO SHOT MILTEN DIEGO 4FRIENDS 1C");
                DC(int64(0x163098d161fe2d89), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2d8a), EConversationDebugInfo::Executing);
                
                // Layman terms, Milten. 
                Diego.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_173312"), TargetCharacter = Lester.Character, ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                DC(int64(0x163098d161fe2d8a), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2cf8), EConversationDebugInfo::Executing);
                
                // Don't worry, just a few nuggets, all you need is an ...
                Gorn.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_172639"), TargetCharacter = Hero.Character, ForceCameraPreset = n"WIDE SHOT DIEGO GORN 4FRIENDS 1C");
                DC(int64(0x163098d161fe2cf8), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2cff), EConversationDebugInfo::Executing);
                // Here - that should do the trick. 
                Gorn.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_172647"), ForceCameraPreset = n"WIDE SHOT DIEGO GORN 4FRIENDS 1C", TargetCharacter = Hero.Character);
                DC(int64(0x163098d161fe2cff), EConversationDebugInfo::Done);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Executing);
                Gorn.AddItemToInventory(UItMs_ExplosionBarrel, 1);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2d2b), EConversationDebugInfo::Executing);
                Gorn.AI.GiveItemTo(Hero, UItMs_ExplosionBarrel, 1);
                DC(int64(0x163098d161fe2d2b), EConversationDebugInfo::Done);
                DC(int64(0xc3ed6bbca8845a74), EConversationDebugInfo::Executing);
                Gorn.AI.TurnToCharacter(Diego);
                DC(int64(0xc3ed6bbca8845a74), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2d34), EConversationDebugInfo::Executing);
                // How am I gonna blow it up? I'm not a mage.
                Hero.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_172835"), ForceCameraPreset = n"OTS GORN TO NH 4FRIENDS 1C", TargetCharacter = Gorn.Character);
                DC(int64(0x163098d161fe2d34), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2d44), EConversationDebugInfo::Executing);
                
                // Milten took care of that.
                Gorn.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_172853"), ForceCameraPreset = n"INDIVIDUAL MEDIUM GORN 4FRIENDS 1C", TargetCharacter = Milten.Character);
                DC(int64(0x163098d161fe2d44), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2dd1), EConversationDebugInfo::Executing);
                
                // Right. Here, I made this. You've used scrolls, haven't ...
                Milten.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_173512"), TargetCharacter = Hero.Character, ForceCameraPreset = n"TWO SHOT MILTEN DIEGO 4FRIENDS 1C");
                DC(int64(0x163098d161fe2dd1), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2dc0), EConversationDebugInfo::Executing);
                
                // A few.
                Hero.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_173452"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM", TargetCharacter = Milten.Character);
                DC(int64(0x163098d161fe2dc0), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2dde), EConversationDebugInfo::Executing);
                
                // Good. It should be pretty intuitive - just place the ore ...
                Milten.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_173529"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM", TargetCharacter = Hero.Character);
                DC(int64(0x163098d161fe2dde), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2de7), EConversationDebugInfo::Executing);
                // Oh, and I recommend you take a few steps back. 
                Milten.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_173540"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP MILTEN 4FRIENDS 1C", TargetCharacter = Hero.Character);
                DC(int64(0x163098d161fe2de7), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Lester_109323,
                    UTopic_Lester_109343,
                    UTopic_Lester_109393
                );
            }
        }
        
        
        class UTopic_Lester_109323 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x163098d161fe2e17);
            default Caption = LocText("TEXT_WIP_TGEUQFG_20241009_173649_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_109323);
            
            default ExtraCharactersToInvite.Add(n"OC_KDF_MILTEN");
            default ExtraCharactersToInvite.Add(n"OC_STT_DIEGO");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x163098d161fe2e18), EConversationDebugInfo::Executing);
                // You're sure this won't bring down the mine on our heads?
                Hero.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_173649_686"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM", TargetCharacter = Milten.Character);
                DC(int64(0x163098d161fe2e18), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2e31), EConversationDebugInfo::Executing);
                
                // It shouldn't. 
                Milten.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_173717"), ForceCameraPreset = n"TWO SHOT MILTEN DIEGO 4FRIENDS 1C", TargetCharacter = Hero.Character);
                DC(int64(0x163098d161fe2e31), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2e3a), EConversationDebugInfo::Executing);
                
                // "Shouldn't" or "won't?"
                Hero.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_173725"), ForceCameraPreset = n"INDIVIDUAL MEDIUM", TargetCharacter = Milten.Character);
                DC(int64(0x163098d161fe2e3a), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2e3b), EConversationDebugInfo::Executing);
                
                // Well, it's, um, experimental. But I've tried it out in ...
                Milten.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_173727"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP MILTEN 4FRIENDS 1C", TargetCharacter = Hero.Character);
                DC(int64(0x163098d161fe2e3b), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2e4d), EConversationDebugInfo::Executing);
                
                // What could go wrong ... 
                Hero.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_173743"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                DC(int64(0x163098d161fe2e4d), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2e56), EConversationDebugInfo::Executing);
                
                // It'll be fine. Milten knows what he's doing, otherwise ...
                Diego.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_173753"), TargetCharacter = Hero.Character, ForceCameraPreset = n"OTS MILTEN TO DIEGO 4FRIENDS 1C");
                DC(int64(0x163098d161fe2e56), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2e1a), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x163098d161fe2e1a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lester_109343 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x163098d161fe2e1b);
            default Caption = LocText("TEXT_WIP_TGEUQFG_20241009_173649_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_109343);
            
            default ExtraCharactersToInvite.Add(n"OC_KDF_MILTEN");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x163098d161fe2e1c), EConversationDebugInfo::Executing);
                // You're a Fire Mage. Why don't you just come in and cast ...
                Hero.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_173649_3984"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM", TargetCharacter = Milten.Character);
                DC(int64(0x163098d161fe2e1c), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2e68), EConversationDebugInfo::Executing);
                
                // Yeah, well, the thing is ... I'm not really supposed to ...
                Milten.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_173833"), ForceCameraPreset = n"TWO SHOT MILTEN DIEGO 4FRIENDS 1C", TargetCharacter = Hero.Character);
                DC(int64(0x163098d161fe2e68), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2e71), EConversationDebugInfo::Executing);
                // If Master Drago hears about me blowing up nuggets in the ...
                Milten.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_173842"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP MILTEN 4FRIENDS 1C", TargetCharacter = Hero.Character);
                DC(int64(0x163098d161fe2e71), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2e1e), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x163098d161fe2e1e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lester_109393 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x163098d161fe2e7a);
            default Caption = LocText("TEXT_WIP_TGEUQFG_20241009_173852_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_109393);
            
            default ExtraCharactersToInvite.Add(n"OC_KDF_MILTEN");
            default ExtraCharactersToInvite.Add(n"OC_STT_DIEGO");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x163098d161fe2e7b), EConversationDebugInfo::Executing);
                // I'll see what I can do.
                Hero.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_173852_1609"), ForceCameraPreset = n"INDIVIDUAL MEDIUM", TargetCharacter = Lester.Character);
                DC(int64(0x163098d161fe2e7b), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2e88), EConversationDebugInfo::Executing);
                
                // It'll work. I'm sure of it. 
                Milten.AI.Say(LocText("TEXT_WIP_TGEUQFG_20241009_173903"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP MILTEN 4FRIENDS 1C", TargetCharacter = Hero.Character);
                DC(int64(0x163098d161fe2e88), EConversationDebugInfo::Done);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Executing);
                Milten.AddItemToInventory(UItMs_ExplosionScroll, 1);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Done);
                DC(int64(0x163098d161fe2e94), EConversationDebugInfo::Executing);
                Milten.AI.GiveItemTo(Hero, UItMs_ExplosionScroll, 1);
                DC(int64(0x163098d161fe2e94), EConversationDebugInfo::Done);
                DC(int64(0xc3ed6bbca8845a6e), EConversationDebugInfo::Executing);
                Diego.AI.TurnToCharacter(Hero);
                DC(int64(0xc3ed6bbca8845a6e), EConversationDebugInfo::Done);
                DC(int64(0xc3ed6bbca8845a70), EConversationDebugInfo::Executing);
                Hero.AI.TurnToCharacter(Diego);
                DC(int64(0xc3ed6bbca8845a70), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d259c), EConversationDebugInfo::Executing);
                // What about Ian? Lester said you talked to him? 
                Diego.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_105325"), TargetCharacter = Hero.Character, ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                DC(int64(0x65f4f79c338d259c), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d25a9), EConversationDebugInfo::Executing);
                
                // He thinks it's too dangerous to open the tunnel.
                Hero.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_105334"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM", TargetCharacter = Diego.Character);
                DC(int64(0x65f4f79c338d25a9), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d25aa), EConversationDebugInfo::Executing);
                
                // Figures. Time to call in that favor he still owes me ... ...
                Diego.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_105335"), ForceCameraPreset = n"OTS MILTEN TO DIEGO 4FRIENDS 1C", TargetCharacter = Hero.Character);
                DC(int64(0x65f4f79c338d25aa), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Lester_107748,
                    UTopic_Lester_107768,
                    UTopic_Lester_107790,
                    UTopic_Lester_107810
                );
            }
        }
        
        
        class UTopic_Lester_107748 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x65f4f79c338d25fa);
            default Caption = LocText("TEXT_WIP_EETMBHG_20241011_105836_2083");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_107748);
            
            default ExtraCharactersToInvite.Add(n"OC_STT_DIEGO");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x65f4f79c338d25fb), EConversationDebugInfo::Executing);
                // Why are you even helping me? 
                Hero.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_105836_2083"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM", TargetCharacter = Diego.Character);
                DC(int64(0x65f4f79c338d25fb), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d261c), EConversationDebugInfo::Executing);
                
                // It's less about you than it it's about getting out of ...
                Diego.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_105857"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM", TargetCharacter = Hero.Character);
                DC(int64(0x65f4f79c338d261c), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d2629), EConversationDebugInfo::Executing);
                // Honestly, I don't think this "Great Summoning" is going ...
                Diego.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_105905"), ForceCameraPreset = n"WIDE SHOT DIEGO 4FRIENDS 1C", TargetCharacter = Hero.Character);
                DC(int64(0x65f4f79c338d2629), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d2636), EConversationDebugInfo::Executing);
                // And since you somehow ended up in the middle of this, ...
                Diego.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_105913"), ForceCameraPreset = n"OTS MILTEN TO DIEGO 4FRIENDS 1C", TargetCharacter = Hero.Character);
                DC(int64(0x65f4f79c338d2636), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d25fd), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x65f4f79c338d25fd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lester_107768 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x65f4f79c338d25fe);
            default Caption = LocText("TEXT_WIP_EETMBHG_20241011_105836_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_107768);
            
            default ExtraCharactersToInvite.Add(n"OC_STT_DIEGO");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x65f4f79c338d25ff), EConversationDebugInfo::Executing);
                // Aren't you coming down with me? I could use some help.
                Hero.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_105836_1924"), ForceCameraPreset = n"INDIVIDUAL MEDIUM", TargetCharacter = Diego.Character);
                DC(int64(0x65f4f79c338d25ff), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d2667), EConversationDebugInfo::Executing);
                
                // Gorn's a Merc, they won't let him into the mine, and ...
                Diego.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_110029"), ForceCameraPreset = n"OTS MILTEN TO DIEGO 4FRIENDS 1C", TargetCharacter = Hero.Character);
                DC(int64(0x65f4f79c338d2667), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d2674), EConversationDebugInfo::Executing);
                // As for me, I'll be straight with you: helping you in the ...
                Diego.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_110038"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP", TargetCharacter = Hero.Character);
                DC(int64(0x65f4f79c338d2674), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d2681), EConversationDebugInfo::Executing);
                
                // ...
                Hero.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_110046"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP", TargetCharacter = Diego.Character);
                DC(int64(0x65f4f79c338d2681), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d2682), EConversationDebugInfo::Executing);
                
                // Sorry, lad. Just telling it like it is. 
                Diego.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_110047"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP", TargetCharacter = Hero.Character);
                DC(int64(0x65f4f79c338d2682), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d268f), EConversationDebugInfo::Executing);
                
                // It's the same for me. Plus, I'm not much of a fighter ...
                Lester.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_110058"), TargetCharacter = Hero.Character, ForceCameraPreset = n"INDIVIDUAL MEDIUM LESTER 4FRIENDS 1C");
                DC(int64(0x65f4f79c338d268f), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d2601), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x65f4f79c338d2601), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lester_107790 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x65f4f79c338d2604);
            default Caption = LocText("TEXT_WIP_EETMBHG_20241011_105841_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_107790);
            
            default ExtraCharactersToInvite.Add(n"OC_STT_DIEGO");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x65f4f79c338d2605), EConversationDebugInfo::Executing);
                // How do you guys know each other? 
                Hero.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_105841_2785"), TargetCharacter = Diego.Character, ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                DC(int64(0x65f4f79c338d2605), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d26b4), EConversationDebugInfo::Executing);
                
                // That's a long story. Maybe one for another time.
                Diego.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_110207"), ForceCameraPreset = n"OTS MILTEN TO DIEGO 4FRIENDS 1C", TargetCharacter = Hero.Character);
                DC(int64(0x65f4f79c338d26b4), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d2607), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x65f4f79c338d2607), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lester_107810 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x65f4f79c338d260a);
            default Caption = LocText("TEXT_WIP_EETMBHG_20241011_105843_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_107810);
            
            default ExtraCharactersToInvite.Add(n"OC_STT_DIEGO");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x65f4f79c338d260b), EConversationDebugInfo::Executing);
                // Let's do this. 
                Hero.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_105843_3436"), TargetCharacter = Diego.Character, ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                DC(int64(0x65f4f79c338d260b), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d26cd), EConversationDebugInfo::Executing);
                
                // Good. Come.
                Diego.AI.Say(LocText("TEXT_WIP_EETMBHG_20241011_110225"), ForceCameraPreset = n"WIDE SHOT DIEGO 4FRIENDS 1C", TargetCharacter = Hero.Character);
                DC(int64(0x65f4f79c338d26cd), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_MCEGGS, Document::UDocumentSegment_CH2_MCEGGS_FourFriends);
                DC(int64(0x65f4f79c338d2779), EConversationDebugInfo::Executing);
                Diego.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Diego_TalkToIan);
                DC(int64(0x65f4f79c338d2779), EConversationDebugInfo::Done);
                DC(int64(0x1dce4f30748f6572), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_FOURFRIENDS.SucceedQuest();
                DC(int64(0x1dce4f30748f6572), EConversationDebugInfo::Done);
                DC(int64(0x65f4f79c338d2788), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x65f4f79c338d2788), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceLester92080 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0xb65c23b710d2f47d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceLester92080);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb65c23b710d2f480), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning());
                    DB(int64(0xb65c23b710d2f483), Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL != nullptr && Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL.HasSucceeded());
                    DB(int64(0xb65c23b710d2f484), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.HasSucceeded());
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning())
                    return false;
                
                if (Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL != nullptr && !Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL.HasSucceeded())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb65c23b710d2f47a), EConversationDebugInfo::Executing);
                // Look who it is. How did it go? 
                Lester.AI.Say(LocText("TEXT_WIP_TINYNYE_20240424_142108_41"));
                DC(int64(0xb65c23b710d2f47a), EConversationDebugInfo::Done);
                DC(int64(0xb65c23b710d2f486), EConversationDebugInfo::Executing);
                
                // The templars are in position, but Ian won't budge.
                Hero.AI.Say(LocText("TEXT_WIP_TINYNYE_20240424_144015"));
                DC(int64(0xb65c23b710d2f486), EConversationDebugInfo::Done);
                DC(int64(0xb65c23b710d2f487), EConversationDebugInfo::Executing);
                
                // Yeah, I had a hunch. But I know someone who can take ...
                Lester.AI.Say(LocText("TEXT_WIP_TINYNYE_20240424_144020"));
                DC(int64(0xb65c23b710d2f487), EConversationDebugInfo::Done);
                DC(int64(0x28f8ba30074eea2c), EConversationDebugInfo::Executing);
                // Come, follow me. 
                Lester.AI.Say(LocText("TEXT_WIP_OOQECXC_20240425_180330"));
                DC(int64(0x28f8ba30074eea2c), EConversationDebugInfo::Done);
                DC(int64(0xb65c23b710d2f489), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_GuideToWatterfall);
                DC(int64(0xb65c23b710d2f489), EConversationDebugInfo::Done);
                DC(int64(0x44d05ae7709a5077), EConversationDebugInfo::Executing);
                G1R.WaterfallMeeting();
                DC(int64(0x44d05ae7709a5077), EConversationDebugInfo::Done);
                DC(int64(0xb65c23b710d2f492), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb65c23b710d2f492), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceLester95516 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x329204abc487091c);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::LetOtherWalk;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceLester95516);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_FORTRESS_LESTER_BALKON", 200.0f, int64(0x329204abc487091c));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb221732c2f20f4f4), Quest::SwampCamp_SCCHAPTER3_FORTRESS != nullptr && Quest::SwampCamp_SCCHAPTER3_FORTRESS.IsRunning());
                    DB(int64(0x3a5668d594c34646), Hero != nullptr && Hero.IsCloseToCharacter(Lester, 200.0f));
                }
                
                if (Quest::SwampCamp_SCCHAPTER3_FORTRESS != nullptr && !Quest::SwampCamp_SCCHAPTER3_FORTRESS.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Lester, 200.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x329204abc4870915), EConversationDebugInfo::Executing);
                // I knew it. There it is. Gods ... that power. You really ...
                Lester.AI.Say(LocText("TEXT_WIP_SSOSVZF_20240506_141405_41"), ForceCameraPreset = n"Lester Show Focus");
                DC(int64(0x329204abc4870915), EConversationDebugInfo::Done);
                DC(int64(0x329204abc487096a), EConversationDebugInfo::Executing);
                
                // Not really. How do we get there?
                Hero.AI.Say(LocText("TEXT_WIP_SSOSVZF_20240506_144206"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0x329204abc487096a), EConversationDebugInfo::Done);
                DC(int64(0x329204abc487096b), EConversationDebugInfo::Executing);
                
                // That's what we have to figure out. 
                Lester.AI.Say(LocText("TEXT_WIP_SSOSVZF_20240506_144213"), ForceCameraPreset = n"Lester Show Focus");
                DC(int64(0x329204abc487096b), EConversationDebugInfo::Done);
                DC(int64(0xb221732c2f20f530), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_Fortressfollow);
                DC(int64(0xb221732c2f20f530), EConversationDebugInfo::Done);
                DC(int64(0xb221732c2f20f539), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb221732c2f20f539), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceLester95651_0 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0xb221732c2f20f51f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.bDoAmbientDuringCombat = true;
            
            default Rules.HideIfKnows(UChoiceLester95651);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_FORTRESS_LESTER_SECONDFLOOR", 500.0f, int64(0xb221732c2f20f51f));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_SSOSVZF_20240506_141405_41"), int64(0xb221732c2f20f51f));
            default Rules.HideIfKnows(UChoiceLester95651_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb221732c2f20f525), Quest::SwampCamp_SCCHAPTER3_FORTRESS != nullptr && Quest::SwampCamp_SCCHAPTER3_FORTRESS.IsRunning());
                    DB(int64(0x63d7a534a2e5babe), Lester != nullptr && Lester.IsCloseToCharacter(Hero, 300.0f));
                }
                
                if (Quest::SwampCamp_SCCHAPTER3_FORTRESS != nullptr && !Quest::SwampCamp_SCCHAPTER3_FORTRESS.IsRunning())
                    return false;
                
                if (Lester != nullptr && !Lester.IsCloseToCharacter(Hero, 300.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb221732c2f20f51c), EConversationDebugInfo::Executing);
                // Follow me. 
                Lester.AI.Say(LocText("TEXT_WIP_SSOSVZF_20240506_145006_2238"));
                DC(int64(0xb221732c2f20f51c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLester95651 : UTopic_Hero__SC_NOV_LESTER
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLester95651_0);
            default Rules.HideIfKnows(UChoiceLester95651);
            default DebugId = int64(0xb221732c2f20f51f);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb221732c2f20f527), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_Balkon);
                DC(int64(0xb221732c2f20f527), EConversationDebugInfo::Done);
                DC(int64(0xb221732c2f20f52a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb221732c2f20f52a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceLester95746_0 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0xb221732c2f20f542);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceLester95746);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_FORTRESS_LESTER_LIBRARY", 400.0f, int64(0xb221732c2f20f542));
            default Rules.HideIfKnows(UChoiceLester95746_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb221732c2f20f548), Quest::SwampCamp_SCCHAPTER3_FORTRESS != nullptr && Quest::SwampCamp_SCCHAPTER3_FORTRESS.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER3_FORTRESS != nullptr && Quest::SwampCamp_SCCHAPTER3_FORTRESS.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb221732c2f20f53f), EConversationDebugInfo::Executing);
                // Nothing here. Dammit. 
                Lester.AI.Say(LocText("TEXT_WIP_SSOSVZF_20240506_151053_2785"));
                DC(int64(0xb221732c2f20f53f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLester95746 : UTopic_Hero__SC_NOV_LESTER
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLester95746_0);
            default Rules.HideIfKnows(UChoiceLester95746);
            default DebugId = int64(0xb221732c2f20f542);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb221732c2f20f55d), EConversationDebugInfo::Executing);
                // Hmm. Wait. What's that? 
                Lester.AI.Say(LocText("TEXT_WIP_SSOSVZF_20240506_152256"));
                DC(int64(0xb221732c2f20f55d), EConversationDebugInfo::Done);
                DC(int64(0xb221732c2f20f54a), EConversationDebugInfo::Executing);
                Lester.LeavePartyOf(Hero);
                DC(int64(0xb221732c2f20f54a), EConversationDebugInfo::Done);
                DC(int64(0xb221732c2f20f54e), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_SecretDoor);
                DC(int64(0xb221732c2f20f54e), EConversationDebugInfo::Done);
                DC(int64(0xb221732c2f20f54f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb221732c2f20f54f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceLester95853_0 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0xb221732c2f20f556);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceLester95853);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_FORTRESS_LESTER_SECRETDOOR", 300.0f, int64(0xb221732c2f20f556));
            default Rules.HideIfKnows(UChoiceLester95853_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb221732c2f20f55c), Quest::SwampCamp_SCCHAPTER3_FORTRESS != nullptr && Quest::SwampCamp_SCCHAPTER3_FORTRESS.IsRunning());
                    DB(int64(0xb1a55f6dcf9c735b), G1R != nullptr && !G1R.IsDoorOpen(n"OG_MountainFortress_Door"));
                }
                
                if (Quest::SwampCamp_SCCHAPTER3_FORTRESS != nullptr && !Quest::SwampCamp_SCCHAPTER3_FORTRESS.IsRunning())
                    return false;
                
                if (G1R != nullptr && G1R.IsDoorOpen(n"OG_MountainFortress_Door"))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb221732c2f20f553), EConversationDebugInfo::Executing);
                // Is it just me or does that look like a door?
                Lester.AI.Say(LocText("TEXT_WIP_SSOSVZF_20240506_152139_3286"));
                DC(int64(0xb221732c2f20f553), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLester95853_1 : UTopic_Hero__SC_NOV_LESTER
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLester95853_0);
            default Rules.HideIfKnows(UChoiceLester95853_1);
            default DebugId = int64(0xb221732c2f20f556);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x54241cb86ea95ccd), EConversationDebugInfo::Executing);
                
                // It does. 
                Hero.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_152259"));
                DC(int64(0x54241cb86ea95ccd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLester95853_2 : UTopic_Hero__SC_NOV_LESTER
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLester95853_1);
            default Rules.HideIfKnows(UChoiceLester95853_2);
            default DebugId = int64(0xb221732c2f20f556);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb221732c2f20f55e), EConversationDebugInfo::Executing);
                
                // Well, there's gotta be a way to open it.
                Lester.AI.Say(LocText("TEXT_WIP_SSOSVZF_20240506_152409"));
                DC(int64(0xb221732c2f20f55e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLester95853 : UTopic_Hero__SC_NOV_LESTER
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLester95853_2);
            default Rules.HideIfKnows(UChoiceLester95853);
            default DebugId = int64(0xb221732c2f20f556);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb221732c2f20f55f), EConversationDebugInfo::Executing);
                // Let's split up and see what we can find. 
                Lester.AI.Say(LocText("TEXT_WIP_SSOSVZF_20240506_152541"));
                DC(int64(0xb221732c2f20f55f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_FORTRESS, Document::UDocumentSegment_CH3_FORTRESS_DoorClosed);
                DC(int64(0xb221732c2f20f561), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_Book);
                DC(int64(0xb221732c2f20f561), EConversationDebugInfo::Done);
                DC(int64(0x273e200a45e68f43), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_LIBRARY.StartQuest();
                DC(int64(0x273e200a45e68f43), EConversationDebugInfo::Done);
                DC(int64(0xb221732c2f20f564), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb221732c2f20f564), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceLester96120 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0xb221732c2f20f56d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceLester96120);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb221732c2f20f570), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0xb221732c2f20f5a1), Quest::SwampCamp_SCCHAPTER3_FORTRESS != nullptr && Quest::SwampCamp_SCCHAPTER3_FORTRESS.IsRunning());
                    DB(int64(0x7bcb6815eedc4fe9), G1R != nullptr && G1R.IsDoorOpen(n"OG_MountainFortress_Door"));
                    DB(int64(0xfd49b4601e3eee99), Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_LIBRARY != nullptr && !Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_LIBRARY.HasSucceeded());
                    DB(int64(0xb1a55f6dcf9c735d), Lester != nullptr && !Lester.IsInPartyWith(Hero));
                }
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_FORTRESS != nullptr && !Quest::SwampCamp_SCCHAPTER3_FORTRESS.IsRunning())
                    return false;
                
                if (G1R != nullptr && !G1R.IsDoorOpen(n"OG_MountainFortress_Door"))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_LIBRARY != nullptr && Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_LIBRARY.HasSucceeded())
                    return false;
                
                if (Lester != nullptr && Lester.IsInPartyWith(Hero))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb221732c2f20f57a), EConversationDebugInfo::Executing);
                // The door's open. 
                Hero.AI.Say(LocText("TEXT_WIP_SSOSVZF_20240506_155222"));
                DC(int64(0xb221732c2f20f57a), EConversationDebugInfo::Done);
                DC(int64(0x54241cb86ea95cce), EConversationDebugInfo::Executing);
                
                // I heard. How did you do it? 
                Lester.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_152513"));
                DC(int64(0x54241cb86ea95cce), EConversationDebugInfo::Done);
                DC(int64(0x54241cb86ea95ccf), EConversationDebugInfo::Executing);
                
                // The books. There was a secret mechanism.
                Hero.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_152526"));
                DC(int64(0x54241cb86ea95ccf), EConversationDebugInfo::Done);
                DC(int64(0xb221732c2f20f56a), EConversationDebugInfo::Executing);
                
                // Always the bookshelves ... 
                Lester.AI.Say(LocText("TEXT_WIP_SSOSVZF_20240506_154319_2386"));
                DC(int64(0xb221732c2f20f56a), EConversationDebugInfo::Done);
                DC(int64(0x54241cb86ea95cd0), EConversationDebugInfo::Executing);
                // Here - I found something that might come in handy.
                Lester.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_152814"));
                DC(int64(0x54241cb86ea95cd0), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_FORTRESS, Document::UDocumentSegment_CH3_FORTRESS_DoorOpened);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Executing);
                Lester.AddItemToInventory(UItAr_Scroll_Telekinesis, 2);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Done);
                DC(int64(0xb221732c2f20f575), EConversationDebugInfo::Executing);
                Lester.AI.GiveItemTo(Hero, UItAr_Scroll_Telekinesis, 2);
                DC(int64(0xb221732c2f20f575), EConversationDebugInfo::Done);
                DC(int64(0x273e200a45e68f46), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_LIBRARY.SucceedQuest();
                DC(int64(0x273e200a45e68f46), EConversationDebugInfo::Done);
                DC(int64(0x45363f081b04598d), EConversationDebugInfo::Executing);
                // Scrolls?
                Hero.AI.Say(LocText("TEXT_WIP_JSOSVZF_20240509_124056"));
                DC(int64(0x45363f081b04598d), EConversationDebugInfo::Done);
                DC(int64(0x45363f081b04598e), EConversationDebugInfo::Executing);
                
                // Yeah, telekinesis scrolls. Always useful. 
                Lester.AI.Say(LocText("TEXT_WIP_JSOSVZF_20240509_124056_41"));
                DC(int64(0x45363f081b04598e), EConversationDebugInfo::Done);
                DC(int64(0xb221732c2f20f57c), EConversationDebugInfo::Executing);
                // If you have a minute, I also found something else that ...
                Lester.AI.Say(LocText("TEXT_WIP_SSOSVZF_20240506_155332_1609"));
                DC(int64(0xb221732c2f20f57c), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Lester_96509,
                    UTopic_Lester_96529
                );
                DC(int64(0xf76d5eb2ff0a0f36), EConversationDebugInfo::Executing);
                Lester.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_Ugh);
                DC(int64(0xf76d5eb2ff0a0f36), EConversationDebugInfo::Done);
                DC(int64(0xb221732c2f20f5d8), EConversationDebugInfo::Executing);
                // UGH. 
                Lester.AI.Say(LocText("TEXT_WIP_SSOSVZF_20240506_161332_3750"));
                DC(int64(0xb221732c2f20f5d8), EConversationDebugInfo::Done);
                DC(int64(0xf76d5eb2ff0a0f52), EConversationDebugInfo::Executing);
                Lester.AI.WaitSeconds(3);
                DC(int64(0xf76d5eb2ff0a0f52), EConversationDebugInfo::Done);
                DC(int64(0xf76d5eb2ff0a0f66), EConversationDebugInfo::Executing);
                Lester.AI.EndAnyOngoingInteraction();
                DC(int64(0xf76d5eb2ff0a0f66), EConversationDebugInfo::Done);
                DC(int64(0x91ee31fa3791a013), EConversationDebugInfo::Executing);
                // That headache again?
                Hero.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_130513"));
                DC(int64(0x91ee31fa3791a013), EConversationDebugInfo::Done);
                DC(int64(0x91ee31fa3791a014), EConversationDebugInfo::Executing);
                
                // Yes, but, it's ... stronger. So much stronger. ...
                Lester.AI.Say(LocText("TEXT_WIP_JSOSVZF_20240509_124144"));
                DC(int64(0x91ee31fa3791a014), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Lester_197063,
                    UTopic_Lester_197083
                );
            }
        }
        
        
        class UTopic_Lester_96509 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0xb221732c2f20f5af);
            default Caption = LocText("TEXT_WIP_SSOSVZF_20240506_161208_2801");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_96509);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb221732c2f20f5b0), EConversationDebugInfo::Executing);
                // What did you find? 
                Hero.AI.Say(LocText("TEXT_WIP_SSOSVZF_20240506_161208_2801"));
                DC(int64(0xb221732c2f20f5b0), EConversationDebugInfo::Done);
                DC(int64(0x136f0361f2d3e20d), EConversationDebugInfo::Executing);
                
                // Here. 
                Lester.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_124808"));
                DC(int64(0x136f0361f2d3e20d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_FORTRESS, Document::UDocumentSegment_CH3_FORTRESS_Deed);
                DC(int64(0xb221732c2f20f580), EConversationDebugInfo::Executing);
                Lester.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadScroll, 4);
                DC(int64(0xb221732c2f20f580), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1a3a), EConversationDebugInfo::Executing);
                // It's a scroll of tenure - a deed that grants ownership ...
                Lester.AI.Say(LocText("PC_PSIONIC_STORY_INFO_05_02"));
                DC(int64(0x3ec7293f812d1a3a), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1a3c), EConversationDebugInfo::Executing);
                
                // I doubt anyone in the Colony cares about land ownership ...
                Hero.AI.Say(LocText("PC_PSIONIC_STORY_INFO_15_04"));
                DC(int64(0x3ec7293f812d1a3c), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1a3d), EConversationDebugInfo::Executing);
                
                // No, but if the Barrier falls, it might be worth a ...
                Lester.AI.Say(LocText("PC_PSIONIC_STORY_INFO_05_05"));
                DC(int64(0x3ec7293f812d1a3d), EConversationDebugInfo::Done);
                DC(int64(0x136f0361f2d3e20e), EConversationDebugInfo::Executing);
                // How's this: since you're getting around a lot these ...
                Lester.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_125225"));
                DC(int64(0x136f0361f2d3e20e), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Lester_196014,
                    UTopic_Lester_196034
                );
            }
        }
        
        
        class UTopic_Lester_96529 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0xb221732c2f20f5b3);
            default Caption = LocText("TEXT_WIP_SSOSVZF_20240506_161208_1769");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_96529);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb221732c2f20f5b4), EConversationDebugInfo::Executing);
                // No time. Let's get that focus. 
                Hero.AI.Say(LocText("TEXT_WIP_SSOSVZF_20240506_161208_1769"));
                DC(int64(0xb221732c2f20f5b4), EConversationDebugInfo::Done);
                DC(int64(0x136f0361f2d3e20c), EConversationDebugInfo::Executing);
                
                // Hm. Fine. I-
                Lester.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_124755"));
                DC(int64(0x136f0361f2d3e20c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lester_197063 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x136f0361f2d3e23d);
            default Caption = LocText("TEXT_WIP_JHGWENC_20240514_130658_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_197063);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x136f0361f2d3e23e), EConversationDebugInfo::Executing);
                
                // This reminds me of Nyras. 
                Hero.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_130658_2785"));
                DC(int64(0x136f0361f2d3e23e), EConversationDebugInfo::Done);
                DC(int64(0x136f0361f2d3e24b), EConversationDebugInfo::Executing);
                
                // What? Why?
                Lester.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_130715"));
                DC(int64(0x136f0361f2d3e24b), EConversationDebugInfo::Done);
                DC(int64(0x136f0361f2d3e256), EConversationDebugInfo::Executing);
                
                // Nyras, the novice who helped me with the focus, said ...
                Hero.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_131154"));
                DC(int64(0x136f0361f2d3e256), EConversationDebugInfo::Done);
                DC(int64(0x136f0361f2d3e258), EConversationDebugInfo::Executing);
                
                // Are you serious? Bloody hell. Maybe ... ah, no. ...
                Lester.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_131234"));
                DC(int64(0x136f0361f2d3e258), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Lester_110773,
                    UTopic_Lester_110793
                );
            }
        }
        
        
        class UTopic_Lester_197083 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x136f0361f2d3e241);
            default Caption = LocText("TEXT_WIP_JHGWENC_20240514_130658_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_197083);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x136f0361f2d3e242), EConversationDebugInfo::Executing);
                // Stay here and rest. I'll get the focus. 
                Hero.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_130658_3286"));
                DC(int64(0x136f0361f2d3e242), EConversationDebugInfo::Done);
                DC(int64(0x136f0361f2d3e25f), EConversationDebugInfo::Executing);
                
                // Are you sure? I can- 
                Lester.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_132329"));
                DC(int64(0x136f0361f2d3e25f), EConversationDebugInfo::Done);
                DC(int64(0x136f0361f2d3e260), EConversationDebugInfo::Executing);
                
                // Stay. I got this. 
                Hero.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_132346"));
                DC(int64(0x136f0361f2d3e260), EConversationDebugInfo::Done);
                DC(int64(0x136f0361f2d3e261), EConversationDebugInfo::Executing);
                
                // All right. Thank you. 
                Lester.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_132355"));
                DC(int64(0x136f0361f2d3e261), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_LESTER, Document::UDocumentSegment_Glossary_SC_NOV_LESTER_Library);
                DC(int64(0x1e953c06636e398a), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_Book);
                DC(int64(0x1e953c06636e398a), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1a72), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3ec7293f812d1a72), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Lester_196014 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x136f0361f2d3e218);
            default Caption = LocText("TEXT_WIP_JHGWENC_20240514_130132_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_196014);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x136f0361f2d3e219), EConversationDebugInfo::Executing);
                // Deal. 
                Hero.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_130132_41"));
                DC(int64(0x136f0361f2d3e219), EConversationDebugInfo::Done);
                DC(int64(0x136f0361f2d3e22a), EConversationDebugInfo::Executing);
                
                // Great. Here, take it. 
                Lester.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_130219"));
                DC(int64(0x136f0361f2d3e22a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_MERCHANTSPRICE, Document::UDocumentSegment_CH1_MERCHANTSPRICE_Deed);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Executing);
                Lester.AddItemToInventory(UItWr_Scroll_Certificate, 1);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Done);
                DC(int64(0x45363f081b045999), EConversationDebugInfo::Executing);
                Lester.AI.GiveItemTo(Hero, UItWr_Scroll_Certificate, 1);
                DC(int64(0x45363f081b045999), EConversationDebugInfo::Done);
                DC(int64(0x136f0361f2d3e22e), EConversationDebugInfo::Executing);
                // Now-
                Lester.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_130233_1924"));
                DC(int64(0x136f0361f2d3e22e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lester_196034 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x136f0361f2d3e21c);
            default Caption = LocText("TEXT_WIP_JHGWENC_20240514_130132_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_196034);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x136f0361f2d3e21d), EConversationDebugInfo::Executing);
                
                // Better hold on to it. That Barrier might be gone sooner ...
                Hero.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_130132_2238"));
                DC(int64(0x136f0361f2d3e21d), EConversationDebugInfo::Done);
                DC(int64(0x136f0361f2d3e234), EConversationDebugInfo::Executing);
                
                // Hm. Yeah, I guess you're right. Fine. Then let's-
                Lester.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_130337"));
                DC(int64(0x136f0361f2d3e234), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lester_110773 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x162ad6fd32a9daed);
            default Caption = LocText("TEXT_WIP_AGXCIAC_20240904_175453_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_110773);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x162ad6fd32a9daee), EConversationDebugInfo::Executing);
                
                // Tell me, Lester. 
                Hero.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_175453_3984"));
                DC(int64(0x162ad6fd32a9daee), EConversationDebugInfo::Done);
                DC(int64(0x162ad6fd32a9daf8), EConversationDebugInfo::Executing);
                
                // It's just .. I don't know. Maybe the Sleeper has ...
                Lester.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_175600"));
                DC(int64(0x162ad6fd32a9daf8), EConversationDebugInfo::Done);
                DC(int64(0x162ad6fd32a9daf9), EConversationDebugInfo::Executing);
                // I know a couple novices who also had these headaches and ...
                Lester.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_175602"));
                DC(int64(0x162ad6fd32a9daf9), EConversationDebugInfo::Done);
                DC(int64(0x162ad6fd32a9dafa), EConversationDebugInfo::Executing);
                // Anyway. Now's not the time. 
                Lester.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_175609"));
                DC(int64(0x162ad6fd32a9dafa), EConversationDebugInfo::Done);
                DC(int64(0x162ad6fd32a9daf0), EConversationDebugInfo::Executing);
                ReturnToLastSelection(2);
                DC(int64(0x162ad6fd32a9daf0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lester_110793 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x162ad6fd32a9daf1);
            default Caption = LocText("TEXT_WIP_AGXCIAC_20240904_175453_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_110793);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x162ad6fd32a9daf2), EConversationDebugInfo::Executing);
                // All right. 
                Hero.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_175453_3569"));
                DC(int64(0x162ad6fd32a9daf2), EConversationDebugInfo::Done);
                DC(int64(0x162ad6fd32a9daf7), EConversationDebugInfo::Executing);
                
                // ... Yeah. It's gonna be fine. 
                Lester.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_175510"));
                DC(int64(0x162ad6fd32a9daf7), EConversationDebugInfo::Done);
                DC(int64(0x162ad6fd32a9daf4), EConversationDebugInfo::Executing);
                ReturnToLastSelection(2);
                DC(int64(0x162ad6fd32a9daf4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLesterCampinfo : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d1977);
            default Caption = LocText("DIA_LESTER_CAMPINFO_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLesterHallo);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ec7293f812d1978), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d1979), EConversationDebugInfo::Executing);
                // Tell me something about the Brotherhood.
                Hero.AI.Say(LocText("DIA_LESTER_CAMPINFO_15_00"));
                DC(int64(0x3ec7293f812d1979), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d197a), EConversationDebugInfo::Executing);
                
                // Such as?
                Lester.AI.Say(LocText("DIA_LESTER_CAMPINFO_05_01"));
                DC(int64(0x3ec7293f812d197a), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceLesterCampinfoGil,
                    UChoiceLesterCampinfoSleeper,
                    UChoiceLesterCampinfoHerb,
                    UChoiceLesterCampinfoBack
                );
            }
        }
        
        
        class UChoiceLesterCampinfoGil : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0xd1a32170fca8de7b);
            default Caption = LocText("DIA_LESTER_CAMPINFO_GIL_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d197d), EConversationDebugInfo::Executing);
                // Tell me about the different groups.
                Hero.AI.Say(LocText("DIA_LESTER_CAMPINFO_GIL_15_00"));
                DC(int64(0x3ec7293f812d197d), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d197e), EConversationDebugInfo::Executing);
                
                // Well, there are three: at the top are the gurus, which ...
                Lester.AI.Say(LocText("DIA_LESTER_CAMPINFO_GIL_05_01"));
                DC(int64(0x3ec7293f812d197e), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d197f), EConversationDebugInfo::Executing);
                // Now, if the gurus are the minds, the templars are the ...
                Lester.AI.Say(LocText("DIA_LESTER_CAMPINFO_GIL_05_02"));
                DC(int64(0x3ec7293f812d197f), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1980), EConversationDebugInfo::Executing);
                // Finally, there's us, the novices - I suppose you could ...
                Lester.AI.Say(LocText("DIA_LESTER_CAMPINFO_GIL_05_03"));
                DC(int64(0x3ec7293f812d1980), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1981), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x3ec7293f812d1981), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLesterCampinfoSleeper : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x12d59906d3ab562a);
            default Caption = LocText("DIA_LESTER_CAMPINFO_SLEEPER_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d1983), EConversationDebugInfo::Executing);
                // What exactly is this "Sleeper?"
                Hero.AI.Say(LocText("DIA_LESTER_CAMPINFO_SLEEPER_15_00"));
                DC(int64(0x3ec7293f812d1983), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1984), EConversationDebugInfo::Executing);
                
                // "This" Sleeper is the divine being that we worship. 
                Lester.AI.Say(LocText("DIA_LESTER_CAMPINFO_SLEEPER_05_01"));
                DC(int64(0x3ec7293f812d1984), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1985), EConversationDebugInfo::Executing);
                // He sent our master, Y'Berion, a vision many years ago ...
                Lester.AI.Say(LocText("DIA_LESTER_CAMPINFO_SLEEPER_05_02"));
                DC(int64(0x3ec7293f812d1985), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1986), EConversationDebugInfo::Executing);
                
                // And you believe that?
                Hero.AI.Say(LocText("DIA_LESTER_CAMPINFO_SLEEPER_15_03"));
                DC(int64(0x3ec7293f812d1986), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1987), EConversationDebugInfo::Executing);
                
                // Well, let's put it this way, two years in this hellhole ...
                Lester.AI.Say(LocText("DIA_LESTER_CAMPINFO_SLEEPER_05_04"));
                DC(int64(0x3ec7293f812d1987), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1988), EConversationDebugInfo::Executing);
                // I know what the other camps think we're all just a bunch ...
                Lester.AI.Say(LocText("DIA_LESTER_CAMPINFO_SLEEPER_05_05"));
                DC(int64(0x3ec7293f812d1988), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1989), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x3ec7293f812d1989), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLesterCampinfoHerb : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x6c79aec574923f44);
            default Caption = LocText("DIA_LESTER_CAMPINFO_HERB_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d198b), EConversationDebugInfo::Executing);
                // What's the deal with those herbs everyone here smokes?
                Hero.AI.Say(LocText("DIA_LESTER_CAMPINFO_HERB_15_00"));
                DC(int64(0x3ec7293f812d198b), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d198c), EConversationDebugInfo::Executing);
                
                // The swampweed? Its an herb that grows here in the swamp ...
                Lester.AI.Say(LocText("DIA_LESTER_CAMPINFO_HERB_05_01"));
                DC(int64(0x3ec7293f812d198c), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d198d), EConversationDebugInfo::Executing);
                // Honestly, though, most folk outside of the Brotherhood ...
                Lester.AI.Say(LocText("DIA_LESTER_CAMPINFO_HERB_05_02"));
                DC(int64(0x3ec7293f812d198d), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d198e), EConversationDebugInfo::Executing);
                // It's a shame, really, but at least it means we get to ...
                Lester.AI.Say(LocText("DIA_LESTER_CAMPINFO_HERB_05_03"));
                DC(int64(0x3ec7293f812d198e), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1990), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x3ec7293f812d1990), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLesterCampinfoBack : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0xb8d5d0d8e7d55c11);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UChoiceLesterGuideoffer : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d19c0);
            default Caption = LocText("DIA_LESTER_GUIDEOFFER_15_00");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLesterHallo);
            default Rules.HideIfKnows(UChoiceLesterGuideoffer);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ec7293f812d19c1), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d19c2), EConversationDebugInfo::Executing);
                // Can you help me find my way around? 
                Hero.AI.Say(LocText("DIA_LESTER_GUIDEOFFER_15_00"));
                DC(int64(0x3ec7293f812d19c2), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19c3), EConversationDebugInfo::Executing);
                
                // Hm, why not, I'm done for the day. Where do you wanna ...
                Lester.AI.Say(LocText("DIA_LESTER_GUIDEOFFER_05_01"));
                DC(int64(0x3ec7293f812d19c3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLesterHallo : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d196c);
            default Caption = LocText("DIA_LESTER_HALLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceLesterHallo);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ec7293f812d196d), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                return G1R != nullptr && !G1R.HasReachedChapter(2);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d196e), EConversationDebugInfo::Executing);
                
                // Who are you?
                Hero.AI.Say(LocText("DIA_LESTER_HALLO_15_00"));
                DC(int64(0x3ec7293f812d196e), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d196f), EConversationDebugInfo::Executing);
                
                // Me? I'm Lester. I take care of the newcomers around here ...
                Lester.AI.Say(LocText("DIA_LESTER_HALLO_05_01"));
                DC(int64(0x3ec7293f812d196f), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_LESTER, Document::UDocumentSegment_Glossary_SC_NOV_LESTER_Introduction);
                DC(int64(0x4e86cbd6c686cca7), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_LESTER.SucceedQuest();
                DC(int64(0x4e86cbd6c686cca7), EConversationDebugInfo::Done);
                DB(int64(0x11437211dc455114), Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT.IsRunning());
                
                if (Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT.IsRunning())
                {
                    DC(int64(0x11437211dc455122), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_VISIT.SucceedQuest();
                    DC(int64(0x11437211dc455122), EConversationDebugInfo::Done);
                }
                DB(int64(0x3ec7293f812d1971), G1R.BaalNamib_Sacrilege == 0);
                
                if (G1R.BaalNamib_Sacrilege == 0)
                {
                    DC(int64(0x3ec7293f812d1972), EConversationDebugInfo::Executing);
                    // Good thing you didn't just talk to Baal Namib. You ...
                    Lester.AI.Say(LocText("DIA_LESTER_HALLO_05_02"));
                    DC(int64(0x3ec7293f812d1972), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_lester_hallo_exit_1");
                }
                else
                {
                    
                    Other.Remember(n"choice_lester_hallo_exit_2");
                }
            }
        }
        
        
        class UChoiceLesterHowproofworthy : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d1997);
            default Caption = LocText("DIA_LESTER_HOWPROOFWORTHY_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLesterWannajoin);
            default Rules.HideIfKnows(UChoiceLesterHowproofworthy);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ec7293f812d1998), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x3ec7293f812d1999), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d199a), EConversationDebugInfo::Executing);
                // How do I convince the gurus if they won't talk to me?
                Hero.AI.Say(LocText("DIA_LESTER_HOWPROOFWORTHY_15_00"));
                DC(int64(0x3ec7293f812d199a), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d199b), EConversationDebugInfo::Executing);
                
                // Well, maybe it doesn't seem like it, but the gurus are ...
                Lester.AI.Say(LocText("DIA_LESTER_HOWPROOFWORTHY_05_01"));
                DC(int64(0x3ec7293f812d199b), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d199c), EConversationDebugInfo::Executing);
                // If they think you've made yourself useful to our ...
                Lester.AI.Say(LocText("DIA_LESTER_HOWPROOFWORTHY_05_02"));
                DC(int64(0x3ec7293f812d199c), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d199d), EConversationDebugInfo::Executing);
                // Just look around - there's plenty of chances to make an ...
                Lester.AI.Say(LocText("DIA_LESTER_HOWPROOFWORTHY_05_03"));
                DC(int64(0x3ec7293f812d199d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINPSI, Document::UDocumentSegment_CH1_JOINPSI_LesterApproach);
                DC(int64(0x1e953c06636e38b0), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI.StartQuest();
                DC(int64(0x1e953c06636e38b0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLesterSakrileg : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d1969);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceLesterSakrileg);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ec7293f812d196a), G1R.BaalNamib_Sacrilege != 0);
                }
                
                return G1R.BaalNamib_Sacrilege != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d196b), EConversationDebugInfo::Executing);
                // Wait! You just addressed a guru, you shouldn't have done ...
                Lester.AI.Say(LocText("DIA_LESTER_SAKRILEG_05_00"));
                DC(int64(0x3ec7293f812d196b), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_LESTER, Document::UDocumentSegment_Glossary_SC_NOV_LESTER_Introduction);
                DC(int64(0x4e86cbd6c686ccb4), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_LESTER.SucceedQuest();
                DC(int64(0x4e86cbd6c686ccb4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLesterShow : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d19b4);
            default Caption = LocText("DIA_LESTER_SHOW_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceLesterShow);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ec7293f812d19b5), Hero != nullptr && Hero.IsCloseToCharacter(BaalNamib, 500.0f));
                    DB(int64(0x3ec7293f812d19b6), G1R.BaalNamib_responsive == 0);
                    DB(int64(0x3ec7293f812d19b7), G1R.Lester_Show != 0);
                    DB(int64(0xc288d33c520871d5), G1R != nullptr && !G1R.HasReachedChapter(2));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(BaalNamib, 500.0f))
                    return false;
                
                if (G1R.BaalNamib_responsive != 0)
                    return false;
                
                if (G1R.Lester_Show == 0)
                    return false;
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d19b8), EConversationDebugInfo::Executing);
                // BROTHER LESTER, I RENOUNCED THE OLD GODS!
                Hero.AI.Say(LocText("DIA_LESTER_SHOW_15_00"));
                DC(int64(0x3ec7293f812d19b8), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19b9), EConversationDebugInfo::Executing);
                
                // WHAT?! HOW DID THAT COME TO PASS?
                Lester.AI.Say(LocText("DIA_LESTER_SHOW_05_01"));
                DC(int64(0x3ec7293f812d19b9), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19ba), EConversationDebugInfo::Executing);
                
                // I HAD A VISION, BROTHER LESTER! THE SLEEPER SPOKE TO ME!
                Hero.AI.Say(LocText("DIA_LESTER_SHOW_15_02"));
                DC(int64(0x3ec7293f812d19ba), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19bb), EConversationDebugInfo::Executing);
                
                // INCREDIBLE! WHAT DID HE TELL YOU?
                Lester.AI.Say(LocText("DIA_LESTER_SHOW_05_03"));
                DC(int64(0x3ec7293f812d19bb), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19bc), EConversationDebugInfo::Executing);
                
                // HE SAID, FIND THE SWAMP CAMP AND JOIN THE NOBLE ...
                Hero.AI.Say(LocText("DIA_LESTER_SHOW_15_04"));
                DC(int64(0x3ec7293f812d19bc), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19bd), EConversationDebugInfo::Executing);
                
                // WHAT WISDOM! YOU SHOULD REJOICE! FEW ARE THOSE WHOM THE ...
                Lester.AI.Say(LocText("DIA_LESTER_SHOW_05_05"));
                DC(int64(0x3ec7293f812d19bd), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e38bc), EConversationDebugInfo::Executing);
                G1R.BaalNamib_responsive = 1;
                DC(int64(0x1e953c06636e38bc), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19bf), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3ec7293f812d19bf), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceLesterShowhallo : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d19ae);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceLesterShowhallo);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ec7293f812d19af), Hero != nullptr && Hero.IsCloseToCharacter(BaalNamib, 500.0f));
                    DB(int64(0x3ec7293f812d19b0), G1R.BaalNamib_responsive == 0);
                    DB(int64(0x3ec7293f812d19b1), G1R.Lester_Show != 0);
                    DB(int64(0x3ec7293f812d19b2), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(BaalNamib, 500.0f))
                    return false;
                
                if (G1R.BaalNamib_responsive != 0)
                    return false;
                
                if (G1R.Lester_Show == 0)
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d19b3), EConversationDebugInfo::Executing);
                // AH, MY FRIEND, THERE YOU ARE! PRAY, HOW HAVE YOU BEEN?
                Lester.AI.Say(LocText("DIA_LESTER_SHOWHALLO_05_00"));
                DC(int64(0x3ec7293f812d19b3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLesterWannajoin : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d1991);
            default Caption = LocText("DIA_LESTER_WANNAJOIN_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLesterHallo);
            default Rules.HideIfKnows(UChoiceLesterWannajoin);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ec7293f812d1992), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d1993), EConversationDebugInfo::Executing);
                
                // I want to join the Brotherhood.
                Hero.AI.Say(LocText("DIA_LESTER_WANNAJOIN_15_00"));
                DC(int64(0x3ec7293f812d1993), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1994), EConversationDebugInfo::Executing);
                
                // I thought as much. Then you'll have to convince Cor ...
                Lester.AI.Say(LocText("DIA_LESTER_WANNAJOIN_05_01"));
                DC(int64(0x3ec7293f812d1994), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1995), EConversationDebugInfo::Executing);
                // He's a busy man, though, so he relies on the guru to ...
                Lester.AI.Say(LocText("DIA_LESTER_WANNAJOIN_05_02"));
                DC(int64(0x3ec7293f812d1995), EConversationDebugInfo::Done);
                DC(int64(0x2a2279989c264a3d), EConversationDebugInfo::Executing);
                
                // So I'll have to convince the other gurus first?
                Hero.AI.Say(LocText("TEXT_NISEA_20240122_192910"));
                DC(int64(0x2a2279989c264a3d), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1996), EConversationDebugInfo::Executing);
                
                // Exactly. 
                Lester.AI.Say(LocText("DIA_LESTER_WANNAJOIN_05_03"));
                DC(int64(0x3ec7293f812d1996), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINPSI, Document::UDocumentSegment_CH1_JOINPSI_LesterAdvice);
                DC(int64(0x7e5d602938fe6c62), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_JOINPSI_JOINPSI_OBJ_NAMIB.StartQuest();
                DC(int64(0x7e5d602938fe6c62), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLesterWannatalktomaster : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d1973);
            default Caption = LocText("DIA_LESTER_WANNATALKTOMASTER_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLesterHallo);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLesterSakrileg);
            default Rules.HideIfKnows(UChoiceLesterShowhallo);
            default Rules.HideIfKnows(UChoiceLesterWannatalktomaster);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_LESTER_SAKRILEG_05_00"), int64(0x3ec7293f812d1973));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ec7293f812d1974), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x4f89bf8b86dbe931), Hero != nullptr && !Hero.HasSaid(LocText("DIA_LESTER_HOWPROOFWORTHY_15_00")));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (Hero != nullptr && Hero.HasSaid(LocText("DIA_LESTER_HOWPROOFWORTHY_15_00")))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d1975), EConversationDebugInfo::Executing);
                // But I WANT to speak to your master. 
                Hero.AI.Say(LocText("DIA_LESTER_WANNATALKTOMASTER_15_00"));
                DC(int64(0x3ec7293f812d1975), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1976), EConversationDebugInfo::Executing);
                
                // Everydone does. Why don't we have a chat instead? I'm ...
                Lester.AI.Say(LocText("DIA_LESTER_WANNATALKTOMASTER_05_01"));
                DC(int64(0x3ec7293f812d1976), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceLesterWeitweg : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d199f);
            default Caption = LocText("DIA_LESTER_WEITWEG_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalcadarSleepspell);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalkaganSuccess);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalorunGotweed);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaalparvezGotopsi);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBaaltaranWaytost);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceGur1201CorkalomWannajoin);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLesterHowproofworthy);
            default Rules.HideIfKnows(UChoiceLesterWeitweg);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ec7293f812d19a0), Hero != nullptr && !Hero.IsCloseToCharacter(BaalNamib, 1000.0f));
                    DB(int64(0x3ec7293f812d19a1), G1R.BaalNamib_responsive == 0);
                    DB(int64(0x3ec7293f812d19a2), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None));
                    DB(int64(0x3ec7293f812d19a3), Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning());
                }
                
                if (Hero != nullptr && Hero.IsCloseToCharacter(BaalNamib, 1000.0f))
                    return false;
                
                if (G1R.BaalNamib_responsive != 0)
                    return false;
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_None))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER1_JOINPSI != nullptr && !Quest::SwampCamp_SCCHAPTER1_JOINPSI.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d19a4), EConversationDebugInfo::Executing);
                
                // How do I get YOUR master to speak to me?
                Hero.AI.Say(LocText("DIA_LESTER_WEITWEG_15_00"));
                DC(int64(0x3ec7293f812d19a4), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19a5), EConversationDebugInfo::Executing);
                
                // Simple. You have to know what he wants to hear.
                Lester.AI.Say(LocText("DIA_LESTER_WEITWEG_05_01"));
                DC(int64(0x3ec7293f812d19a5), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19a6), EConversationDebugInfo::Executing);
                
                // Which is?
                Hero.AI.Say(LocText("DIA_LESTER_WEITWEG_15_02"));
                DC(int64(0x3ec7293f812d19a6), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19a7), EConversationDebugInfo::Executing);
                
                // A show of faith. Here's what we're gonna do: next time ...
                Lester.AI.Say(LocText("DIA_LESTER_WEITWEG_05_03"));
                DC(int64(0x3ec7293f812d19a7), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19a8), EConversationDebugInfo::Executing);
                // You see, Baal Namib has been worried lately because ...
                Lester.AI.Say(LocText("DIA_LESTER_WEITWEG_05_04"));
                DC(int64(0x3ec7293f812d19a8), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19a9), EConversationDebugInfo::Executing);
                // That's why YOU will tell me that you've had a vision, a ...
                Lester.AI.Say(LocText("DIA_LESTER_WEITWEG_05_05"));
                DC(int64(0x3ec7293f812d19a9), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19aa), EConversationDebugInfo::Executing);
                // Make of a show of it, and don't hold back. The man loves ...
                Lester.AI.Say(LocText("DIA_LESTER_WEITWEG_05_06"));
                DC(int64(0x3ec7293f812d19aa), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19ab), EConversationDebugInfo::Executing);
                // You think you can manage that?
                Lester.AI.Say(LocText("DIA_LESTER_WEITWEG_05_07"));
                DC(int64(0x3ec7293f812d19ab), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19ac), EConversationDebugInfo::Executing);
                
                // Not a problem. 
                Hero.AI.Say(LocText("DIA_LESTER_WEITWEG_15_08"));
                DC(int64(0x3ec7293f812d19ac), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_JOINPSI, Document::UDocumentSegment_CH1_JOINPSI_NamibTrick);
                Subdialog(
                    UTopic_Lester_82020,
                    UTopic_Lester_82040
                );
            }
        }
        
        
        class UTopic_Lester_82020 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x16c8bb8d767ee45e);
            default Caption = LocText("TEXT_WIP_PTYHSLC_20240228_181553_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_82020);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x16c8bb8d767ee45f), EConversationDebugInfo::Executing);
                // Thanks, Lester.
                Hero.AI.Say(LocText("TEXT_WIP_PTYHSLC_20240228_181553_1924"));
                DC(int64(0x16c8bb8d767ee45f), EConversationDebugInfo::Done);
                DC(int64(0x16c8bb8d767ee468), EConversationDebugInfo::Executing);
                
                // Sure.
                Lester.AI.Say(LocText("TEXT_WIP_PTYHSLC_20240228_181634"));
                DC(int64(0x16c8bb8d767ee468), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e38d3), EConversationDebugInfo::Executing);
                G1R.Lester_Show = 1;
                DC(int64(0x1e953c06636e38d3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lester_82040 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x16c8bb8d767ee462);
            default Caption = LocText("TEXT_WIP_PTYHSLC_20240228_181553_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_82040);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x16c8bb8d767ee463), EConversationDebugInfo::Executing);
                // How do I recognize the gurus? By the title?
                Hero.AI.Say(LocText("TEXT_WIP_PTYHSLC_20240228_181553_3436"));
                DC(int64(0x16c8bb8d767ee463), EConversationDebugInfo::Done);
                DC(int64(0x16c8bb8d767ee469), EConversationDebugInfo::Executing);
                
                // What? Oh, no, "baal" is just ... it's hard to explain. 
                Lester.AI.Say(LocText("TEXT_WIP_PTYHSLC_20240228_181753"));
                DC(int64(0x16c8bb8d767ee469), EConversationDebugInfo::Done);
                DC(int64(0x16c8bb8d767ee46a), EConversationDebugInfo::Executing);
                // Just look for the stern men with the fancy robes. You'll ...
                Lester.AI.Say(LocText("TEXT_WIP_PTYHSLC_20240228_181818"));
                DC(int64(0x16c8bb8d767ee46a), EConversationDebugInfo::Done);
                DC(int64(0x16c8bb8d767ee465), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x16c8bb8d767ee465), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoicePcPsionicBalkon_0 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d1a73);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoicePcPsionicBalkon);
            
            default Rules.RequireCharacterCloseToWaypoint(n"hero", n"FP_FORTRESS_LESTER_STAIRS", 400.0f, int64(0x3ec7293f812d1a73));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_SSOSVZF_20240506_141405_41"), int64(0x3ec7293f812d1a73));
            default Rules.HideIfKnows(UChoicePcPsionicBalkon_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ec7293f812d1a74), Lester != nullptr && !Lester.HasItem(UItWr_Scroll_Certificate, 1, 0));
                }
                
                return Lester != nullptr && !Lester.HasItem(UItWr_Scroll_Certificate, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d1a77), EConversationDebugInfo::Executing);
                // I'll take a look 
                Lester.AI.Say(LocText("PC_PSIONIC_BALKON_INFO_05_01"));
                DC(int64(0x3ec7293f812d1a77), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoicePcPsionicBalkon : UTopic_Hero__SC_NOV_LESTER
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoicePcPsionicBalkon_0);
            default Rules.HideIfKnows(UChoicePcPsionicBalkon);
            default DebugId = int64(0x3ec7293f812d1a73);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb34e2a6501273af2), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_SecondFloor);
                DC(int64(0xb34e2a6501273af2), EConversationDebugInfo::Done);
                DC(int64(0xb34e2a6501273af7), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb34e2a6501273af7), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoicePcPsionicChange : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d19ca);
            default Caption = LocText("PC_PSIONIC_CHANGE_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLesterGuideoffer);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ec7293f812d19cb), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0x3ec7293f812d19cc), G1R.Lester_Guide >= 1);
                }
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                if (G1R.Lester_Guide < 1)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d19cd), EConversationDebugInfo::Executing);
                // On second thought, I'm fine.
                Hero.AI.Say(LocText("PC_PSIONIC_CHANGE_INFO_15_01"));
                DC(int64(0x3ec7293f812d19cd), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19ce), EConversationDebugInfo::Executing);
                
                // Okay. You know where to find me. 
                Lester.AI.Say(LocText("PC_PSIONIC_CHANGE_INFO_05_02"));
                DC(int64(0x3ec7293f812d19ce), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e38f1), EConversationDebugInfo::Executing);
                G1R.Lester_Guide = 0;
                DC(int64(0x1e953c06636e38f1), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e38f3), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_Start);
                DC(int64(0x1e953c06636e38f3), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19d1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3ec7293f812d19d1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoicePcPsionicComeagain : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d1a8b);
            default Caption = LocText("PC_PSIONIC_COMEAGAIN_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoicePcPsionicComeback);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoicePcPsionicComewithme);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb34e2a6501273ae4), Lester != nullptr && Lester.HasAssignedDailyRoutine(UDailyRoutine_SC_NOV_Lester_Fortresswait));
                    DB(int64(0xe470f8c648d27ccd), G1R.Fortress_Inside != 0);
                }
                
                if (Lester != nullptr && !Lester.HasAssignedDailyRoutine(UDailyRoutine_SC_NOV_Lester_Fortresswait))
                    return false;
                
                if (G1R.Fortress_Inside == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d1a8d), EConversationDebugInfo::Executing);
                // Come, let's explore the fortress. 
                Hero.AI.Say(LocText("PC_PSIONIC_COMEAGAIN_INFO_15_01"));
                DC(int64(0x3ec7293f812d1a8d), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1a8e), EConversationDebugInfo::Executing);
                
                // Lead the way. 
                Lester.AI.Say(LocText("PC_PSIONIC_COMEAGAIN_INFO_05_02"));
                DC(int64(0x3ec7293f812d1a8e), EConversationDebugInfo::Done);
                DC(int64(0x22d9f11b0482da52), EConversationDebugInfo::Executing);
                Lester.JoinPartyOf(Hero);
                DC(int64(0x22d9f11b0482da52), EConversationDebugInfo::Done);
                DC(int64(0x22d9f11b0482da54), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_Fortressfollow);
                DC(int64(0x22d9f11b0482da54), EConversationDebugInfo::Done);
                DC(int64(0x22d9f11b0482da55), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x22d9f11b0482da55), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoicePcPsionicComeback : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d1a4f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ec7293f812d1a50), G1R.Fortress_Outside != 0);
                    DB(int64(0x3ec7293f812d1a51), Hero != nullptr && !Hero.HasItem(UItMs_Focus_03, 1, 0));
                    DB(int64(0xd12c2eceb83794ae), Lester != nullptr && Lester.HasAssignedDailyRoutine(UDailyRoutine_SC_NOV_Lester_Fortressfollow));
                }
                
                if (G1R.Fortress_Outside == 0)
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UItMs_Focus_03, 1, 0))
                    return false;
                
                if (Lester != nullptr && !Lester.HasAssignedDailyRoutine(UDailyRoutine_SC_NOV_Lester_Fortressfollow))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d1a53), EConversationDebugInfo::Executing);
                // Wait, where are you going? We're not finished here. 
                Lester.AI.Say(LocText("PC_PSIONIC_COMEBACK_INFO_05_01"));
                DC(int64(0x3ec7293f812d1a53), EConversationDebugInfo::Done);
                DC(int64(0x136f0361f2d3e26a), EConversationDebugInfo::Executing);
                
                // Just looking around. 
                Hero.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_133036"));
                DC(int64(0x136f0361f2d3e26a), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e3909), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_Fortresswait);
                DC(int64(0x1e953c06636e3909), EConversationDebugInfo::Done);
                DC(int64(0x22d9f11b0482da4c), EConversationDebugInfo::Executing);
                Lester.LeavePartyOf(Hero);
                DC(int64(0x22d9f11b0482da4c), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1a55), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3ec7293f812d1a55), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoicePcPsionicComewithme : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d1a3e);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::CloseRange;
            
            default Rules.HideIfKnows(UChoicePcPsionicComewithme);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ec7293f812d1a3f), Quest::SwampCamp_SCCHAPTER3_FORTRESS != nullptr && !Quest::SwampCamp_SCCHAPTER3_FORTRESS.HasBeenStarted());
                    DB(int64(0x45363f081b045985), GOLEM_STONE_BRIDGE != nullptr && GOLEM_STONE_BRIDGE.IsEveryoneOfThisKindDead());
                    DB(int64(0xab7a26c1b7e0862e), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning());
                }
                
                if (Quest::SwampCamp_SCCHAPTER3_FORTRESS != nullptr && Quest::SwampCamp_SCCHAPTER3_FORTRESS.HasBeenStarted())
                    return false;
                
                if (GOLEM_STONE_BRIDGE != nullptr && !GOLEM_STONE_BRIDGE.IsEveryoneOfThisKindDead())
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb221732c2f20f4e7), EConversationDebugInfo::Executing);
                // Gods. That was a tough one. 
                Lester.AI.Say(LocText("TEXT_WIP_SSOSVZF_20240506_121555"));
                DC(int64(0xb221732c2f20f4e7), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1a40), EConversationDebugInfo::Executing);
                
                // Up to the fortress, then? 
                Hero.AI.Say(LocText("PC_PSIONIC_COMEWITHME_INFO_15_01"));
                DC(int64(0x3ec7293f812d1a40), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1a41), EConversationDebugInfo::Executing);
                
                // Yes. I've heard some weird sounds from there, so we -
                Lester.AI.Say(LocText("PC_PSIONIC_COMEWITHME_INFO_05_02"));
                DC(int64(0x3ec7293f812d1a41), EConversationDebugInfo::Done);
                DC(int64(0xf76d5eb2ff0a0f36), EConversationDebugInfo::Executing);
                Lester.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_Ugh);
                DC(int64(0xf76d5eb2ff0a0f36), EConversationDebugInfo::Done);
                DC(int64(0x54241cb86ea95cba), EConversationDebugInfo::Executing);
                // Ugh.
                Lester.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_141159"));
                DC(int64(0x54241cb86ea95cba), EConversationDebugInfo::Done);
                DC(int64(0xf76d5eb2ff0a0f52), EConversationDebugInfo::Executing);
                Lester.AI.WaitSeconds(2);
                DC(int64(0xf76d5eb2ff0a0f52), EConversationDebugInfo::Done);
                DC(int64(0xf76d5eb2ff0a0f66), EConversationDebugInfo::Executing);
                Lester.AI.EndAnyOngoingInteraction();
                DC(int64(0xf76d5eb2ff0a0f66), EConversationDebugInfo::Done);
                DC(int64(0xc222b96f4225c8af), EConversationDebugInfo::Executing);
                // What's wrong? 
                Hero.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_141237"));
                DC(int64(0xc222b96f4225c8af), EConversationDebugInfo::Done);
                DC(int64(0xc222b96f4225c8b0), EConversationDebugInfo::Executing);
                
                // Oh, just a headache ... I've been getting it for a while ...
                Lester.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_141241"));
                DC(int64(0xc222b96f4225c8b0), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Lester_98609,
                    UTopic_Lester_98629,
                    UTopic_Lester_98658
                );
            }
        }
        
        
        class UTopic_Lester_98609 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x54241cb86ea95c92);
            default Caption = LocText("TEXT_WIP_GHGWENC_20240513_133422_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_98609);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x54241cb86ea95c93), EConversationDebugInfo::Executing);
                // What's the story behind that fortress? 
                Hero.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_133422_1924"));
                DC(int64(0x54241cb86ea95c93), EConversationDebugInfo::Done);
                DC(int64(0x54241cb86ea95caf), EConversationDebugInfo::Executing);
                
                // Right, how would you know? An ore baron used to live ...
                Lester.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_140320"));
                DC(int64(0x54241cb86ea95caf), EConversationDebugInfo::Done);
                DC(int64(0x54241cb86ea95cb0), EConversationDebugInfo::Executing);
                // Word is that some inmates pillaged it after the ...
                Lester.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_140339"));
                DC(int64(0x54241cb86ea95cb0), EConversationDebugInfo::Done);
                DC(int64(0x54241cb86ea95c95), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x54241cb86ea95c95), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lester_98629 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x54241cb86ea95c96);
            default Caption = LocText("TEXT_WIP_GHGWENC_20240513_133422_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_98629);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x54241cb86ea95c97), EConversationDebugInfo::Executing);
                // Where is the focus stone? 
                Hero.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_133422_3436"));
                DC(int64(0x54241cb86ea95c97), EConversationDebugInfo::Done);
                DC(int64(0x54241cb86ea95cb2), EConversationDebugInfo::Executing);
                
                // I've never been there, so I don't know.
                Lester.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_140556"));
                DC(int64(0x54241cb86ea95cb2), EConversationDebugInfo::Done);
                DC(int64(0x54241cb86ea95cb3), EConversationDebugInfo::Executing);
                // But it IS up there, Milten's map is clear about that. 
                Lester.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_140657"));
                DC(int64(0x54241cb86ea95cb3), EConversationDebugInfo::Done);
                DC(int64(0x54241cb86ea95cb4), EConversationDebugInfo::Executing);
                // I'm sure we'll find it. 
                Lester.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_140747"));
                DC(int64(0x54241cb86ea95cb4), EConversationDebugInfo::Done);
                DC(int64(0x54241cb86ea95c99), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x54241cb86ea95c99), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Lester_98658 : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x54241cb86ea95ca3);
            default Caption = LocText("TEXT_WIP_GHGWENC_20240513_133512_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Lester_98658);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x54241cb86ea95ca4), EConversationDebugInfo::Executing);
                // Let's go. 
                Hero.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_133512_3286"));
                DC(int64(0x54241cb86ea95ca4), EConversationDebugInfo::Done);
                DC(int64(0x54241cb86ea95cb5), EConversationDebugInfo::Executing);
                
                // Lead the way. 
                Lester.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_140806"));
                DC(int64(0x54241cb86ea95cb5), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_FORTRESS, Document::UDocumentSegment_CH3_FORTRESS_Start);
                DC(int64(0x1e953c06636e3913), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_Fortressfollow);
                DC(int64(0x1e953c06636e3913), EConversationDebugInfo::Done);
                DC(int64(0x22d9f11b0482da4a), EConversationDebugInfo::Executing);
                Lester.JoinPartyOf(Hero);
                DC(int64(0x22d9f11b0482da4a), EConversationDebugInfo::Done);
                DC(int64(0x971be335b74177e1), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_FORTRESS.StartQuest();
                DC(int64(0x971be335b74177e1), EConversationDebugInfo::Done);
                DC(int64(0x54241cb86ea95c9e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x54241cb86ea95c9e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoicePcPsionicExit : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d1963);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x3ec7293f812d1965), Lester != nullptr && Lester.IsInPartyWith(Hero));
                
                if (Lester != nullptr && Lester.IsInPartyWith(Hero))
                {
                    DC(int64(0x3ec7293f812d1966), EConversationDebugInfo::Executing);
                    // Onwards.
                    Lester.AI.Say(LocText("INFO_LESTER_EXIT_05_01"));
                    DC(int64(0x3ec7293f812d1966), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x3ec7293f812d1967), EConversationDebugInfo::Executing);
                    // Sleeper watch over you.
                    Lester.AI.Say(LocText("INFO_LESTER_EXIT_05_02"));
                    DC(int64(0x3ec7293f812d1967), EConversationDebugInfo::Done);
                }
                DC(int64(0x3ec7293f812d1968), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3ec7293f812d1968), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoicePcPsionicFinish : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d1a7a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoicePcPsionicFinish);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ec7293f812d1a7b), Hero != nullptr && Hero.HasItem(UItMs_Focus_03, 1, 0));
                    DB(int64(0x3ec7293f812d1a7c), Quest::SwampCamp_SCCHAPTER3_FORTRESS != nullptr && Quest::SwampCamp_SCCHAPTER3_FORTRESS.IsRunning());
                    DB(int64(0x3bb5737dde588db4), Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_LIBRARY != nullptr && Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_LIBRARY.HasSucceeded());
                    DB(int64(0x7cda268e989c18c5), Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_REPORT != nullptr && !Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_REPORT.HasSucceeded());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItMs_Focus_03, 1, 0))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_FORTRESS != nullptr && !Quest::SwampCamp_SCCHAPTER3_FORTRESS.IsRunning())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_LIBRARY != nullptr && !Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_LIBRARY.HasSucceeded())
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_REPORT != nullptr && Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_REPORT.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x136f0361f2d3e266), EConversationDebugInfo::Executing);
                // There you are - I was getting worried. Did you find it? 
                Lester.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_132641"));
                DC(int64(0x136f0361f2d3e266), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1a7e), EConversationDebugInfo::Executing);
                
                // Got it right here. Any more headaches?
                Hero.AI.Say(LocText("PC_PSIONIC_FINISH_INFO_15_02"));
                DC(int64(0x3ec7293f812d1a7e), EConversationDebugInfo::Done);
                DC(int64(0x45363f081b0459a2), EConversationDebugInfo::Executing);
                
                // No - it just stopped at some point. Still, you keep that ...
                Lester.AI.Say(LocText("TEXT_WIP_JSOSVZF_20240509_124601"));
                DC(int64(0x45363f081b0459a2), EConversationDebugInfo::Done);
                DC(int64(0x136f0361f2d3e268), EConversationDebugInfo::Executing);
                // I'll stay and explore this place a bit longer ... I ...
                Lester.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_132848"));
                DC(int64(0x136f0361f2d3e268), EConversationDebugInfo::Done);
                DC(int64(0x136f0361f2d3e269), EConversationDebugInfo::Executing);
                // Good job - you might just get us out of here. 
                Lester.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_132957"));
                DC(int64(0x136f0361f2d3e269), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_LESTER, Document::UDocumentSegment_Glossary_SC_NOV_LESTER_Library);
                DC(int64(0x1e953c06636e3923), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_Book);
                DC(int64(0x1e953c06636e3923), EConversationDebugInfo::Done);
                DC(int64(0x273e200a45e68f51), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_REPORT.SucceedQuest();
                DC(int64(0x273e200a45e68f51), EConversationDebugInfo::Done);
                DC(int64(0x1a0c7e304e9b560d), EConversationDebugInfo::Executing);
                G1R.WaterMaguesPermission = 1;
                DC(int64(0x1a0c7e304e9b560d), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1a80), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3ec7293f812d1a80), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoicePcPsionicFokusplace : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d1a45);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            default ForceSettings.RangeType = EConversationForceRangeType::DefaultRange;
            
            default Rules.HideIfKnows(UChoicePcPsionicFokusplace);
            
            default Rules.RequireCharacterCloseToWaypoint(n"hero", n"FP_FORTRESS_LESTER_TALK", 1000.0f, int64(0x3ec7293f812d1a45));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ec7293f812d1a47), Quest::SwampCamp_SCCHAPTER3_FORTRESS != nullptr && Quest::SwampCamp_SCCHAPTER3_FORTRESS.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER3_FORTRESS != nullptr && Quest::SwampCamp_SCCHAPTER3_FORTRESS.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d1a49), EConversationDebugInfo::Executing);
                // Look, up there! That's got to be the foc-
                Lester.AI.Say(LocText("PC_PSIONIC_FOKUSPLACE_INFO_05_01"));
                DC(int64(0x3ec7293f812d1a49), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_FORTRESS, Document::UDocumentSegment_CH3_FORTRESS_Pedestal);
                DC(int64(0xf76d5eb2ff0a0f36), EConversationDebugInfo::Executing);
                Lester.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_Ugh);
                DC(int64(0xf76d5eb2ff0a0f36), EConversationDebugInfo::Done);
                DC(int64(0x136f0361f2d3e25c), EConversationDebugInfo::Executing);
                // UGH.
                Lester.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_131723"));
                DC(int64(0x136f0361f2d3e25c), EConversationDebugInfo::Done);
                DC(int64(0xf76d5eb2ff0a0f52), EConversationDebugInfo::Executing);
                Lester.AI.WaitSeconds(2);
                DC(int64(0xf76d5eb2ff0a0f52), EConversationDebugInfo::Done);
                DC(int64(0xf76d5eb2ff0a0f66), EConversationDebugInfo::Executing);
                Lester.AI.EndAnyOngoingInteraction();
                DC(int64(0xf76d5eb2ff0a0f66), EConversationDebugInfo::Done);
                DC(int64(0x91ee31fa37919fcd), EConversationDebugInfo::Executing);
                // Another headache? 
                Hero.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_141516"));
                DC(int64(0x91ee31fa37919fcd), EConversationDebugInfo::Done);
                DC(int64(0x91ee31fa37919fce), EConversationDebugInfo::Executing);
                
                // Yes, but it's ... strange. It's never been this strong. 
                Lester.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_140933"));
                DC(int64(0x91ee31fa37919fce), EConversationDebugInfo::Done);
                DC(int64(0x91ee31fa37919fdb), EConversationDebugInfo::Executing);
                // Maybe it's the focus? I don't know. 
                Lester.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_141535"));
                DC(int64(0x91ee31fa37919fdb), EConversationDebugInfo::Done);
                DC(int64(0x91ee31fa37919fdc), EConversationDebugInfo::Executing);
                // Anyway, it's up there, on that platform. Let's find a ...
                Lester.AI.Say(LocText("TEXT_WIP_JHGWENC_20240514_131814"));
                DC(int64(0x91ee31fa37919fdc), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1a4e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3ec7293f812d1a4e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoicePcPsionicFollowme : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d1a29);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoicePcPsionicFollowme);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_FORTRESS_LESTER_WAIT", 600.0f, int64(0x3ec7293f812d1a29));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x75b04343de444d27), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning());
                    DB(int64(0xa8d4612cf54a43f8), GOLEM_STONE_BRIDGE != nullptr && !GOLEM_STONE_BRIDGE.IsEveryoneOfThisKindDead());
                }
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning())
                    return false;
                
                if (GOLEM_STONE_BRIDGE != nullptr && GOLEM_STONE_BRIDGE.IsEveryoneOfThisKindDead())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6fdd4e97a36cd046), EConversationDebugInfo::Executing);
                // Ah, right on time. The focus is up in that fortress - I ...
                Lester.AI.Say(LocText("TEXT_WIP_KGTRMXB_20240924_151901"));
                DC(int64(0x6fdd4e97a36cd046), EConversationDebugInfo::Done);
                DC(int64(0x54241cb86ea95c8d), EConversationDebugInfo::Executing);
                
                // Let me guess: that chunk of rock up ahead?
                Hero.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_133018"));
                DC(int64(0x54241cb86ea95c8d), EConversationDebugInfo::Done);
                DC(int64(0x54241cb86ea95c69), EConversationDebugInfo::Executing);
                
                // You guess right. It's a stone golem ... I'm afraid we'll ...
                Lester.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_132107"));
                DC(int64(0x54241cb86ea95c69), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1a2f), EConversationDebugInfo::Executing);
                // You have a blunt weapon with you?
                Lester.AI.Say(LocText("PC_PSIONIC_FOLLOWME_INFO_05_03"));
                DC(int64(0x3ec7293f812d1a2f), EConversationDebugInfo::Done);
                DB(int64(0x54241cb86ea95c71), Hero != nullptr && Hero.HasItemOfType(GameplayTag::Item_Weapon_Mace, 1));
                
                if (Hero != nullptr && Hero.HasItemOfType(GameplayTag::Item_Weapon_Mace, 1))
                {
                    DC(int64(0x54241cb86ea95c74), EConversationDebugInfo::Executing);
                    // I do.
                    Hero.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_132259"));
                    DC(int64(0x54241cb86ea95c74), EConversationDebugInfo::Done);
                    DC(int64(0x54241cb86ea95c75), EConversationDebugInfo::Executing);
                    
                    // Then use it. It'll help against that thing. 
                    Lester.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_132259_41"));
                    DC(int64(0x54241cb86ea95c75), EConversationDebugInfo::Done);
                    DC(int64(0x54241cb86ea95c7f), EConversationDebugInfo::Executing);
                    // Anyway, lead on. I'll cover your back. 
                    Lester.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_132314_2238"));
                    DC(int64(0x54241cb86ea95c7f), EConversationDebugInfo::Done);
                    DC(int64(0xb221732c2f20f4e2), EConversationDebugInfo::Executing);
                    Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_Fortressfollow);
                    DC(int64(0xb221732c2f20f4e2), EConversationDebugInfo::Done);
                    DC(int64(0xb221732c2f20f4e6), EConversationDebugInfo::Executing);
                    Lester.JoinPartyOf(Hero);
                    DC(int64(0xb221732c2f20f4e6), EConversationDebugInfo::Done);
                    DC(int64(0xa8d4612cf54a43eb), EConversationDebugInfo::Executing);
                    G1R.BridgeStoneGolemEnemy = 1;
                    DC(int64(0xa8d4612cf54a43eb), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_pc_psionic_followme_exit_1");
                    DC(int64(0x971be335b741781a), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x971be335b741781a), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x54241cb86ea95c78), EConversationDebugInfo::Executing);
                    // You mean, like a hammer? No.
                    Hero.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_132302"));
                    DC(int64(0x54241cb86ea95c78), EConversationDebugInfo::Done);
                    DC(int64(0x54241cb86ea95c79), EConversationDebugInfo::Executing);
                    
                    // Then maybe look for one before we do this. 
                    Lester.AI.Say(LocText("TEXT_WIP_GHGWENC_20240513_132302_2083"));
                    DC(int64(0x54241cb86ea95c79), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_pc_psionic_followme_exit_2");
                    DC(int64(0xab27ea80fbb9950a), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xab27ea80fbb9950a), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoicePcPsionicGuidefirst : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d19d2);
            default Caption = LocText("PC_PSIONIC_GUIDEFIRST_INFO_15_01");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLesterGuideoffer);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ec7293f812d19d3), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0x3ec7293f812d19d4), G1R.Lester_Guide == 0);
                }
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                if (G1R.Lester_Guide != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d19d5), EConversationDebugInfo::Executing);
                // I'm looking for ...
                Hero.AI.Say(LocText("PC_PSIONIC_GUIDEFIRST_INFO_15_01"));
                DC(int64(0x3ec7293f812d19d5), EConversationDebugInfo::Done);
                Subdialog(
                    UChoicePcPsionicGuidefirstMaingate,
                    UChoicePcPsionicGuidefirstSmith,
                    UChoicePcPsionicGuidefirstTempel,
                    UChoicePcPsionicGuidefirstTrain,
                    UChoicePcPsionicGuidefirstHerb,
                    UChoicePcPsionicGuidefirstBack
                );
            }
        }
        
        
        class UChoicePcPsionicGuidefirstMaingate : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3fc0b5f0a0df5d95);
            default Caption = LocText("TEXT_CHOICE_PC_PSIONIC_GUIDEFIRST_MAINGATE");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x350f01073fd40ebf), Lester != nullptr && !Lester.HasAssignedDailyRoutine(UDailyRoutine_SC_NOV_Lester_Start));
                }
                
                return Lester != nullptr && !Lester.HasAssignedDailyRoutine(UDailyRoutine_SC_NOV_Lester_Start);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x1e953c06636e3949), EConversationDebugInfo::Executing);
                G1R.Lester_Guide = 0;
                DC(int64(0x1e953c06636e3949), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e394b), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_Start);
                DC(int64(0x1e953c06636e394b), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19da), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3ec7293f812d19da), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoicePcPsionicGuidefirstSmith : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0xd5ac162df8ba2ef7);
            default Caption = LocText("PC_PSIONIC_GUIDEFIRST_SMITH_INFO_15_01");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d19dc), EConversationDebugInfo::Executing);
                // The smithy.
                Hero.AI.Say(LocText("PC_PSIONIC_GUIDEFIRST_SMITH_INFO_15_01"));
                DC(int64(0x3ec7293f812d19dc), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19dd), EConversationDebugInfo::Executing);
                
                // Got it. Follow me.
                Lester.AI.Say(LocText("PC_PSIONIC_GUIDEFIRST_SMITH_INFO_05_02"));
                DC(int64(0x3ec7293f812d19dd), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e3952), EConversationDebugInfo::Executing);
                G1R.Lester_Guide = 1;
                DC(int64(0x1e953c06636e3952), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e3954), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_Guidetosmith);
                DC(int64(0x1e953c06636e3954), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19e0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3ec7293f812d19e0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoicePcPsionicGuidefirstTempel : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x124e6a5a97edd2a);
            default Caption = LocText("PC_PSIONIC_GUIDEFIRST_TEMPEL_INFO_15_01");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d19e2), EConversationDebugInfo::Executing);
                // The temple.
                Hero.AI.Say(LocText("PC_PSIONIC_GUIDEFIRST_TEMPEL_INFO_15_01"));
                DC(int64(0x3ec7293f812d19e2), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19e3), EConversationDebugInfo::Executing);
                
                // No problem. Come along!
                Lester.AI.Say(LocText("PC_PSIONIC_GUIDEFIRST_TEMPEL_INFO_05_02"));
                DC(int64(0x3ec7293f812d19e3), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e395b), EConversationDebugInfo::Executing);
                G1R.Lester_Guide = 2;
                DC(int64(0x1e953c06636e395b), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e395d), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_Guidetotempel);
                DC(int64(0x1e953c06636e395d), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19e6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3ec7293f812d19e6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoicePcPsionicGuidefirstTrain : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x80ca590288939b51);
            default Caption = LocText("PC_PSIONIC_GUIDEFIRST_TRAIN_INFO_15_01");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d19e8), EConversationDebugInfo::Executing);
                // Someone who can teach me.
                Hero.AI.Say(LocText("PC_PSIONIC_GUIDEFIRST_TRAIN_INFO_15_01"));
                DC(int64(0x3ec7293f812d19e8), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19e9), EConversationDebugInfo::Executing);
                
                // Sure thing. Follow me.
                Lester.AI.Say(LocText("PC_PSIONIC_GUIDEFIRST_TARIN_INFO_05_02"));
                DC(int64(0x3ec7293f812d19e9), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e3964), EConversationDebugInfo::Executing);
                G1R.Lester_Guide = 3;
                DC(int64(0x1e953c06636e3964), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e3966), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_Guidetotrain);
                DC(int64(0x1e953c06636e3966), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19ec), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3ec7293f812d19ec), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoicePcPsionicGuidefirstHerb : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0xae49a7ed53c07521);
            default Caption = LocText("PC_PSIONIC_GUIDEFIRST_HERB_INFO_15_01");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d19ee), EConversationDebugInfo::Executing);
                // Cor Kalom's laboratory.
                Hero.AI.Say(LocText("PC_PSIONIC_GUIDEFIRST_HERB_INFO_15_01"));
                DC(int64(0x3ec7293f812d19ee), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19ef), EConversationDebugInfo::Executing);
                
                // That's not far. Come.
                Lester.AI.Say(LocText("PC_PSIONIC_GUIDEFIRST_HERB_INFO_05_02"));
                DC(int64(0x3ec7293f812d19ef), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e396d), EConversationDebugInfo::Executing);
                G1R.Lester_Guide = 4;
                DC(int64(0x1e953c06636e396d), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e396f), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_Guidetoherb);
                DC(int64(0x1e953c06636e396f), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19f2), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3ec7293f812d19f2), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoicePcPsionicGuidefirstBack : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0xb8d5d0d8e7d55c15);
            default Caption = LocText("TEXT_BACK");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                
            }
        }
        
        
        class UChoicePcPsionicHerb : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d1a0b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoicePcPsionicHerb);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SC_NOV_LESTER", n"GuidePoint_SC_Herb", 800.0f, int64(0x3ec7293f812d1a0b));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ec7293f812d1a0d), G1R.Lester_Guide == 4);
                }
                
                return G1R.Lester_Guide == 4;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d1a0e), EConversationDebugInfo::Executing);
                // Okay - just climb that ladder, and you're right in front ...
                Lester.AI.Say(LocText("PC_PSIONIC_HERB_INFO_05_01"));
                DC(int64(0x3ec7293f812d1a0e), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1a0f), EConversationDebugInfo::Executing);
                // Come to think of it, I might stay here for a bit and ...
                Lester.AI.Say(LocText("PC_PSIONIC_HERB_INFO_05_02"));
                DC(int64(0x3ec7293f812d1a0f), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e3979), EConversationDebugInfo::Executing);
                G1R.Lester_Guide = 0;
                DC(int64(0x1e953c06636e3979), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e397b), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_WaitHerbForOneHour);
                DC(int64(0x1e953c06636e397b), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1a12), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3ec7293f812d1a12), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoicePcPsionicIamhurt : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d1a56);
            default Caption = LocText("PC_PSIONIC_IAMHURT_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoicePcPsionicIamhurt);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ec7293f812d1a57), Hero != nullptr && Hero.IsInjured(50));
                    DB(int64(0x648e91f7dcebbbad), Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning());
                    DB(int64(0x648e91f7dcebbbaf), Hero != nullptr && !Hero.HasItem(UItMs_Focus_03, 1, 0));
                }
                
                if (Hero != nullptr && !Hero.IsInjured(50))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER3_BRINGFOCI != nullptr && !Quest::NewCamp_NCCHAPTER3_BRINGFOCI.IsRunning())
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UItMs_Focus_03, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d1a58), EConversationDebugInfo::Executing);
                // I'm wounded. You got any potions? 
                Hero.AI.Say(LocText("PC_PSIONIC_IAMHURT_INFO_15_01"));
                DC(int64(0x3ec7293f812d1a58), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1a59), EConversationDebugInfo::Executing);
                
                // Sure. Here - this should do the trick. 
                Lester.AI.Say(LocText("PC_PSIONIC_IAMHURT_INFO_05_02"));
                DC(int64(0x3ec7293f812d1a59), EConversationDebugInfo::Done);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Executing);
                Lester.AddItemToInventory(UItFo_Potion_Health_02, 1);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e3983), EConversationDebugInfo::Executing);
                Lester.AI.GiveItemTo(Hero, UItFo_Potion_Health_02, 1);
                DC(int64(0x1e953c06636e3983), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoicePcPsionicSmith : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d1a04);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoicePcPsionicSmith);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SC_NOV_LESTER", n"GuidePoint_SC_Blacksmith", 900.0f, int64(0x3ec7293f812d1a04));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ec7293f812d1a06), G1R.Lester_Guide == 1);
                }
                
                return G1R.Lester_Guide == 1;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d1a07), EConversationDebugInfo::Executing);
                // Here we are - the smithy. Just take a look around, I'll ...
                Lester.AI.Say(LocText("PC_PSIONIC_SMITH_INFO_05_01"));
                DC(int64(0x3ec7293f812d1a07), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e39a3), EConversationDebugInfo::Executing);
                G1R.Lester_Guide = 0;
                DC(int64(0x1e953c06636e39a3), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e39a5), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_WaitSmithForOneHour);
                DC(int64(0x1e953c06636e39a5), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1a0a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3ec7293f812d1a0a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoicePcPsionicSoon : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d19c4);
            default Caption = LocText("PC_PSIONIC_SOON_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceLesterGuideoffer);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ec7293f812d19c5), G1R != nullptr && !G1R.HasReachedChapter(2));
                    DB(int64(0x3ec7293f812d19c6), G1R.Lester_Guide >= 1);
                }
                
                if (G1R != nullptr && G1R.HasReachedChapter(2))
                    return false;
                
                if (G1R.Lester_Guide < 1)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d19c7), EConversationDebugInfo::Executing);
                // How much farther is it? 
                Hero.AI.Say(LocText("PC_PSIONIC_SOON_INFO_15_01"));
                DC(int64(0x3ec7293f812d19c7), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19c8), EConversationDebugInfo::Executing);
                
                // Stop asking, and you'll find out. 
                Lester.AI.Say(LocText("PC_PSIONIC_SOON_INFO_05_02"));
                DC(int64(0x3ec7293f812d19c8), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19c9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3ec7293f812d19c9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoicePcPsionicTempel : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d19fd);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoicePcPsionicTempel);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SC_NOV_LESTER", n"GuidePoint_SC_Temple", 600.0f, int64(0x3ec7293f812d19fd));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ec7293f812d19ff), G1R.Lester_Guide == 2);
                }
                
                return G1R.Lester_Guide == 2;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d1a00), EConversationDebugInfo::Executing);
                // And here we are ... the Temple Square. Impressive, isn't ...
                Lester.AI.Say(LocText("PC_PSIONIC_TEMPEL_INFO_05_01"));
                DC(int64(0x3ec7293f812d1a00), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e39b7), EConversationDebugInfo::Executing);
                G1R.Lester_Guide = 0;
                DC(int64(0x1e953c06636e39b7), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e39b9), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_WaitTempelForOneHour);
                DC(int64(0x1e953c06636e39b9), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d1a03), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3ec7293f812d1a03), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoicePcPsionicTrain : UTopic_Hero__SC_NOV_LESTER
        {
            default DebugId = int64(0x3ec7293f812d19f3);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.RequireCharacterCloseToWaypoint(n"SC_NOV_LESTER", n"GuidePoint_SC_Train", 500.0f, int64(0x3ec7293f812d19f3));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x3ec7293f812d19f5), G1R.Lester_Guide == 3);
                }
                
                return G1R.Lester_Guide == 3;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3ec7293f812d19f6), EConversationDebugInfo::Executing);
                // All right - that man there is Baal Cadar. He teaches the ...
                Lester.AI.Say(LocText("PC_PSIONIC_TRAIN_INFO_05_01"));
                DC(int64(0x3ec7293f812d19f6), EConversationDebugInfo::Done);
                Print("Skipped Lester.AI.PointAtWaypoint(nPSI_PATH_9_14)");
                Print("Skipped Lester.AI.StopPointAt()");
                DC(int64(0x3ec7293f812d19f9), EConversationDebugInfo::Executing);
                // Climb that ladder, and you'll reach the templars' ...
                Lester.AI.Say(LocText("PC_PSIONIC_TRAIN_INFO_05_02"));
                DC(int64(0x3ec7293f812d19f9), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e39c3), EConversationDebugInfo::Executing);
                G1R.Lester_Guide = 0;
                DC(int64(0x1e953c06636e39c3), EConversationDebugInfo::Done);
                DC(int64(0x1e953c06636e39c5), EConversationDebugInfo::Executing);
                Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_WaitTrainForOneHour);
                DC(int64(0x1e953c06636e39c5), EConversationDebugInfo::Done);
                DC(int64(0x3ec7293f812d19fc), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x3ec7293f812d19fc), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */