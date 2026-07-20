#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OM_TPL_GORNAVID_1433 : UConversationCharacterSettings
        {
            default ForCharacter = n"OM_TPL_GORNAVID_1433";
        }
        
        
        class UTopic_Hero__OM_TPL_GORNAVID_1433 : UG1RDialogTopic
        {
            default ForCharacter = n"OM_TPL_GORNAVID_1433";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGorNaVid() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetMINECRAWLER() const property
            {
                return GetCharacter(n"MINECRAWLER");
            }
            
            AGothicCharacterState GetGorn() const property
            {
                return GetCharacter(n"NC_SLD_GORN_699");
            }
            
            AGothicCharacterState GetMilten() const property
            {
                return GetCharacter(n"OC_KDF_MILTEN");
            }
            
            AGothicCharacterState GetDiego() const property
            {
                return GetCharacter(n"OC_STT_DIEGO");
            }
            
            AGothicCharacterState GetAsghan() const property
            {
                return GetCharacter(n"OM_GRD_ASGHAN_263");
            }
            
            AGothicCharacterState GetGorNaBar() const property
            {
                return GetCharacter(n"OM_TPL_GORNABAR_1400");
            }
            
            AGothicCharacterState GetGorNaKosh() const property
            {
                return GetCharacter(n"OM_TPL_GORNAKOSH_1401");
            }
            
            AGothicCharacterState GetLester() const property
            {
                return GetCharacter(n"SC_NOV_LESTER");
            }
        }
        
        
        class UChoiceGornavid109089 : UTopic_Hero__OM_TPL_GORNAVID_1433
        {
            default DebugId = int64(0x163098d161fe2bed);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_gornavid_92552_exit_1");
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_gornavid_92552_exit_2");
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_gornavid_92552_exit_3");
            default Rules.HideIfKnows(UChoiceGornavid109089);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc5662c035adf6ebf), EConversationDebugInfo::Executing);
                // Ahhhh ... yes. You have my blade. Where shall I go? 
                GorNaVid.AI.Say(LocText("TPL_1433_GORNAVID_HEALTH_SUC_INFO_13_02"));
                DC(int64(0xc5662c035adf6ebf), EConversationDebugInfo::Done);
                DC(int64(0x785897ee2a1af3a6), EConversationDebugInfo::Executing);
                
                // The collapsed tunnel at the bottom floor. Join Asghan. 
                Hero.AI.Say(LocText("TEXT_WIP_WPUISQL_20240423_125126"));
                DC(int64(0x785897ee2a1af3a6), EConversationDebugInfo::Done);
                DC(int64(0x785897ee2a1af3a7), EConversationDebugInfo::Executing);
                
                // I shall. What of you? 
                GorNaVid.AI.Say(LocText("TEXT_WIP_WPUISQL_20240423_125134"));
                DC(int64(0x785897ee2a1af3a7), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_MCEGGS, Document::UDocumentSegment_CH2_MCEGGS_GorNaVid);
                DC(int64(0xc9bbf0de13e7d75e), EConversationDebugInfo::Executing);
                GorNaVid.ExchangeDailyRoutineToClass(UDailyRoutine_OM_TPL_GorNaVid_1433_Tunnel);
                DC(int64(0xc9bbf0de13e7d75e), EConversationDebugInfo::Done);
                DC(int64(0xc9bbf0de13e7d760), EConversationDebugInfo::Executing);
                GorNaVid.SetRelationshipTowards(Hero, ERelationship::Friend);
                DC(int64(0xc9bbf0de13e7d760), EConversationDebugInfo::Done);
                DC(int64(0xc9bbf0de13e7d762), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_MCEGGS_HIREVID);
                DC(int64(0xc9bbf0de13e7d762), EConversationDebugInfo::Done);
                DC(int64(0x2e98bf9a62fc93ad), EConversationDebugInfo::Executing);
                G1R.GatheredTemplars += 1;
                DC(int64(0x2e98bf9a62fc93ad), EConversationDebugInfo::Done);
                DB(int64(0x2e98bf9a62fc93b2), G1R.GatheredTemplars == 3);
                
                if (G1R.GatheredTemplars == 3)
                {
                    DB(int64(0xf5b9b345b80925fc), Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL != nullptr && Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL.HasSucceeded());
                    
                    if (Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL != nullptr && Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL.HasSucceeded())
                    {
                        DC(int64(0x2e98bf9a62fc93be), EConversationDebugInfo::Executing);
                        // Not yet. We have enough blades now, but I've got to go ...
                        Hero.AI.Say(LocText("TEXT_WIP_KPQXWNL_20240405_164139"));
                        DC(int64(0x2e98bf9a62fc93be), EConversationDebugInfo::Done);
                        DC(int64(0x2e98bf9a62fc93bf), EConversationDebugInfo::Executing);
                        
                        // Very well. Sleeper awaken. 
                        GorNaVid.AI.Say(LocText("TEXT_WIP_KPQXWNL_20240405_164139_443"));
                        DC(int64(0x2e98bf9a62fc93bf), EConversationDebugInfo::Done);
                        DC(int64(0xf5b9b345b8092622), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Lester))) { Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_OutsideOldMine); }
                        DC(int64(0xf5b9b345b8092622), EConversationDebugInfo::Done);
                        DC(int64(0xf5b9b345b809262b), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Milten))) { Milten.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_FourFriendsMeeting); }
                        DC(int64(0xf5b9b345b809262b), EConversationDebugInfo::Done);
                        DC(int64(0xf5b9b345b809262d), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Gorn))) { Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_FourFriendsMeeting); }
                        DC(int64(0xf5b9b345b809262d), EConversationDebugInfo::Done);
                        DC(int64(0xf5b9b345b809262f), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Diego))) { Diego.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Diego_FourFriendsMeeting); }
                        DC(int64(0xf5b9b345b809262f), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xf5b9b345b8092601), EConversationDebugInfo::Executing);
                        // Not yet. We have enough blades now, but I need Ian's ...
                        Hero.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_145042"));
                        DC(int64(0xf5b9b345b8092601), EConversationDebugInfo::Done);
                        DC(int64(0xf5b9b345b8092602), EConversationDebugInfo::Executing);
                        
                        // Ian ... a stubborn man. He should smoke the Fumes more ...
                        GorNaVid.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_145042_1769"));
                        DC(int64(0xf5b9b345b8092602), EConversationDebugInfo::Done);
                        DC(int64(0xe185eea888907b8), EConversationDebugInfo::Executing);
                        
                        // Yeah, I'll tell him that. 
                        Hero.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_195257"));
                        DC(int64(0xe185eea888907b8), EConversationDebugInfo::Done);
                    }
                    DC(int64(0x2e98bf9a62fc93cd), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.SucceedQuest();
                    DC(int64(0x2e98bf9a62fc93cd), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gornavid_109089_exit_1");
                    DC(int64(0x2e98bf9a62fc93d3), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x2e98bf9a62fc93d3), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xe185eea888907a6), EConversationDebugInfo::Executing);
                    // I need to round up more fighters first. 
                    Hero.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_195152"));
                    DC(int64(0xe185eea888907a6), EConversationDebugInfo::Done);
                    DC(int64(0xe185eea888907a7), EConversationDebugInfo::Executing);
                    
                    // Then I will be waiting. 
                    GorNaVid.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_195152_686"));
                    DC(int64(0xe185eea888907a7), EConversationDebugInfo::Done);
                    DC(int64(0xc1a6dbb695197323), EConversationDebugInfo::Executing);
                    GorNaVid.ExchangeDailyRoutineToClass(UDailyRoutine_OM_TPL_GorNaVid_1433_Smoke);
                    DC(int64(0xc1a6dbb695197323), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gornavid_109089_exit_2");
                    DC(int64(0xc5662c035adf6ecb), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xc5662c035adf6ecb), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceGornavid92552 : UTopic_Hero__OM_TPL_GORNAVID_1433
        {
            default DebugId = int64(0x785897ee2a1af363);
            default Caption = LocText("TEXT_WIP_TINYNYE_20240424_155549");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTpl1433GornavidHealth);
            default Rules.HideIfKnows(UChoiceGornavid92552);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x791d75c2060b171), Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0));
                    DB(int64(0x791d75c2060b172), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.IsRunning());
                    DB(int64(0x791d75c2060b173), Hero != nullptr && Hero.HasItem(UItMi_Joint_02, 1, 0));
                    DB(int64(0x791d75c2060b174), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.IsRunning());
                    DB(int64(0x791d75c2060b175), Hero != nullptr && Hero.HasItem(UItMi_Joint_03, 1, 0));
                    DB(int64(0x791d75c2060b176), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.IsRunning());
                }
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0) && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.IsRunning())
                    return true;
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Joint_02, 1, 0) && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.IsRunning())
                    return true;
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Joint_03, 1, 0) && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.IsRunning())
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb65c23b710d2f4d3), EConversationDebugInfo::Executing);
                // Will these "fumes" help you fight?
                Hero.AI.Say(LocText("TEXT_WIP_TINYNYE_20240424_155549"));
                DC(int64(0xb65c23b710d2f4d3), EConversationDebugInfo::Done);
                DB(int64(0xc5662c035adf6ec2), Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0));
                DB(int64(0xc5662c035adf6ec4), Hero != nullptr && Hero.HasItem(UItMi_Joint_02, 1, 0));
                DB(int64(0xc5662c035adf6ec6), Hero != nullptr && Hero.HasItem(UItMi_Joint_03, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Joint_01, 1, 0))
                {
                    DC(int64(0xc9bbf0de13e7d766), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(GorNaVid, UItMi_Joint_01, 1);
                    DC(int64(0xc9bbf0de13e7d766), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gornavid_92552_exit_1");
                }
                else if (Hero != nullptr && Hero.HasItem(UItMi_Joint_02, 1, 0))
                {
                    DC(int64(0xc9bbf0de13e7d769), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(GorNaVid, UItMi_Joint_02, 1);
                    DC(int64(0xc9bbf0de13e7d769), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gornavid_92552_exit_2");
                }
                else if (Hero != nullptr && Hero.HasItem(UItMi_Joint_03, 1, 0))
                {
                    DC(int64(0xc9bbf0de13e7d76c), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(GorNaVid, UItMi_Joint_03, 1);
                    DC(int64(0xc9bbf0de13e7d76c), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gornavid_92552_exit_3");
                }
                else
                {
                    
                    Other.Remember(n"choice_gornavid_92552_exit_4");
                    DC(int64(0xb65c23b710d2f4e4), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xb65c23b710d2f4e4), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceGornavid93146 : UTopic_Hero__OM_TPL_GORNAVID_1433
        {
            default DebugId = int64(0x64f7d963b11ca31c);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceGornavid93146);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_KOQECXC_20240429_213031"), int64(0x64f7d963b11ca31c));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x36f542dcf94ceea8), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x5dae0ae66c6df024), GorNaVid != nullptr && !GorNaVid.CanSenseAnyAliveCharacterOfKind(MINECRAWLER, 2000.0f));
                    DB(int64(0x5dae0ae66c6df025), Hero != nullptr && !Hero.HasItem(UItAt_Crawlerqueen, 1, 0));
                }
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (GorNaVid != nullptr && GorNaVid.CanSenseAnyAliveCharacterOfKind(MINECRAWLER, 2000.0f))
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UItAt_Crawlerqueen, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x64f7d963b11ca317), EConversationDebugInfo::Executing);
                // So - you're not coming into the lair? 
                Hero.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_135254"));
                DC(int64(0x64f7d963b11ca317), EConversationDebugInfo::Done);
                DC(int64(0x64f7d963b11ca318), EConversationDebugInfo::Executing);
                
                // No. The infidel Asghan speaks the truth - it's better we ...
                GorNaVid.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_135254_2785"));
                DC(int64(0x64f7d963b11ca318), EConversationDebugInfo::Done);
                DC(int64(0xe185eea888907c1), EConversationDebugInfo::Executing);
                // But here, take this - may it guide your blade as well as ...
                GorNaVid.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_195408"));
                DC(int64(0xe185eea888907c1), EConversationDebugInfo::Done);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Executing);
                GorNaVid.AddItemToInventory(UItMi_Joint_01, 1);
                DC(int64(0x467cbe04e86a8e8f), EConversationDebugInfo::Done);
                DC(int64(0x5dae0ae66c6df02d), EConversationDebugInfo::Executing);
                GorNaVid.AI.GiveItemTo(Hero, UItMi_Joint_01, 1);
                DC(int64(0x5dae0ae66c6df02d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTpl1433GornavidExit : UTopic_Hero__OM_TPL_GORNAVID_1433
        {
            default DebugId = int64(0xc5662c035adf6eaf);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc5662c035adf6eb0), EConversationDebugInfo::Executing);
                // May the Sleeper guide you.
                GorNaVid.AI.Say(LocText("TPL_1433_GORNAVID_EXIT_INFO_13_02"));
                DC(int64(0xc5662c035adf6eb0), EConversationDebugInfo::Done);
                DC(int64(0xc5662c035adf6eb1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc5662c035adf6eb1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTpl1433GornavidHealth : UTopic_Hero__OM_TPL_GORNAVID_1433
        {
            default DebugId = int64(0xc5662c035adf6eb2);
            default Caption = LocText("TPL_1433_GORNAVID_HEALTH_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceTpl1433GornavidHealth);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc9bbf0de13e7eece), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc5662c035adf6eb3), EConversationDebugInfo::Executing);
                // I need your help. We found a way to clear the abandoned ...
                Hero.AI.Say(LocText("TPL_1433_GORNAVID_HEALTH_INFO_15_01"));
                DC(int64(0xc5662c035adf6eb3), EConversationDebugInfo::Done);
                DC(int64(0xe185eea8889079d), EConversationDebugInfo::Executing);
                // Will you be there?
                Hero.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_194542"));
                DC(int64(0xe185eea8889079d), EConversationDebugInfo::Done);
                DC(int64(0xe185eea8889079b), EConversationDebugInfo::Executing);
                
                // No. 
                GorNaVid.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_194413"));
                DC(int64(0xe185eea8889079b), EConversationDebugInfo::Done);
                DC(int64(0xc5662c035adf6eb5), EConversationDebugInfo::Executing);
                
                // Why not? 
                Hero.AI.Say(LocText("TPL_1433_GORNAVID_HEALTH_INFO_15_03"));
                DC(int64(0xc5662c035adf6eb5), EConversationDebugInfo::Done);
                DC(int64(0xc5662c035adf6eb6), EConversationDebugInfo::Executing);
                
                // Because I have run out of Sleeper's Fumes, and my blade ...
                GorNaVid.AI.Say(LocText("TPL_1433_GORNAVID_HEALTH_INFO_13_04"));
                DC(int64(0xc5662c035adf6eb6), EConversationDebugInfo::Done);
                DC(int64(0xe185eea888907a1), EConversationDebugInfo::Executing);
                
                // "Sleeper's fumes?" You mean ... swampweed? 
                Hero.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_194803"));
                DC(int64(0xe185eea888907a1), EConversationDebugInfo::Done);
                DC(int64(0xe185eea888907a2), EConversationDebugInfo::Executing);
                
                // Indeed. His fumes are what-
                GorNaVid.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_194836"));
                DC(int64(0xe185eea888907a2), EConversationDebugInfo::Done);
                DC(int64(0xe185eea888907a3), EConversationDebugInfo::Executing);
                
                // I'll get some rolls. 
                Hero.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_194957"));
                DC(int64(0xe185eea888907a3), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_TPL_GORNAVID, Document::UDocumentSegment_Glossary_OM_TPL_GORNAVID_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_MCEGGS, Document::UDocumentSegment_CH2_MCEGGS_GorNaVidQuest);
            }
        }
        
        
        class UChoiceTpl1433GornavidIan : UTopic_Hero__OM_TPL_GORNAVID_1433
        {
            default DebugId = int64(0xc5662c035adf6eb7);
            default Caption = LocText("TPL_1433_GORNAVID_IAN_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceTpl1433GornavidIan);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_LPQXWNL_20240404_123108"), int64(0xc5662c035adf6eb7));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc5662c035adf6eb8), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc5662c035adf6eb9), EConversationDebugInfo::Executing);
                // I'm looking for Lester.
                Hero.AI.Say(LocText("TPL_1433_GORNAVID_IAN_INFO_15_01"));
                DC(int64(0xc5662c035adf6eb9), EConversationDebugInfo::Done);
                DC(int64(0xc5662c035adf6eba), EConversationDebugInfo::Executing);
                
                // He's down by the collapsed tunnel. 
                GorNaVid.AI.Say(LocText("TPL_1433_GORNAVID_IAN_INFO_13_02"));
                DC(int64(0xc5662c035adf6eba), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_TPL_GORNAVID, Document::UDocumentSegment_Glossary_OM_TPL_GORNAVID_Introduction);
            }
        }
        
        
        class UChoiceTpl1433GornavidVictory : UTopic_Hero__OM_TPL_GORNAVID_1433
        {
            default DebugId = int64(0xc5662c035adf6ecc);
            default Caption = LocText("TPL_1433_GORNAVID_VICTORY_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceTpl1433GornavidVictory);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc5662c035adf6ecd), Hero != nullptr && Hero.HasItem(UItAt_Crawlerqueen, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItAt_Crawlerqueen, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc5662c035adf6ece), EConversationDebugInfo::Executing);
                // I found the nest of the minecrawlers!
                Hero.AI.Say(LocText("TPL_1433_GORNAVID_VICTORY_INFO_15_01"));
                DC(int64(0xc5662c035adf6ece), EConversationDebugInfo::Done);
                DC(int64(0xc5662c035adf6ecf), EConversationDebugInfo::Executing);
                
                // Good.
                GorNaVid.AI.Say(LocText("TPL_1433_GORNAVID_VICTORY_INFO_13_02"));
                DC(int64(0xc5662c035adf6ecf), EConversationDebugInfo::Done);
                DC(int64(0xe185eea888907c5), EConversationDebugInfo::Executing);
                
                // That's it? No "thank you?"
                Hero.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_195510"));
                DC(int64(0xe185eea888907c5), EConversationDebugInfo::Done);
                DC(int64(0xc5662c035adf6ed0), EConversationDebugInfo::Executing);
                
                // Thank you. 
                GorNaVid.AI.Say(LocText("TPL_1433_GORNAVID_VICTORY_INFO_13_03"));
                DC(int64(0xc5662c035adf6ed0), EConversationDebugInfo::Done);
                DC(int64(0xd4bfca7c20283f98), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Asghan))) { Asghan.LeavePartyOf(Hero); }
                DC(int64(0xd4bfca7c20283f98), EConversationDebugInfo::Done);
                DC(int64(0xd4bfca7c20283fa0), EConversationDebugInfo::Executing);
                GorNaVid.LeavePartyOf(Hero);
                DC(int64(0xd4bfca7c20283fa0), EConversationDebugInfo::Done);
                DC(int64(0xd4bfca7c20283fa2), EConversationDebugInfo::Executing);
                if (ensure(IsValid(GorNaBar))) { GorNaBar.LeavePartyOf(Hero); }
                DC(int64(0xd4bfca7c20283fa2), EConversationDebugInfo::Done);
                DC(int64(0xd4bfca7c20283fa4), EConversationDebugInfo::Executing);
                if (ensure(IsValid(GorNaKosh))) { GorNaKosh.LeavePartyOf(Hero); }
                DC(int64(0xd4bfca7c20283fa4), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */