#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OM_TPL_GORNAKOSH_1401 : UConversationCharacterSettings
        {
            default ForCharacter = n"OM_TPL_GORNAKOSH_1401";
        }
        
        
        class UTopic_Hero__OM_TPL_GORNAKOSH_1401 : UG1RDialogTopic
        {
            default ForCharacter = n"OM_TPL_GORNAKOSH_1401";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGorNaKosh() const property
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
            
            AGothicCharacterState GetGorNaVid() const property
            {
                return GetCharacter(n"OM_TPL_GORNAVID_1433");
            }
            
            AGothicCharacterState GetLester() const property
            {
                return GetCharacter(n"SC_NOV_LESTER");
            }
        }
        
        
        class UChoiceGornakosh93129 : UTopic_Hero__OM_TPL_GORNAKOSH_1401
        {
            default DebugId = int64(0x64f7d963b11ca30d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceGornakosh93129);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x5dae0ae66c6deffe), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x5dae0ae66c6df001), G1R.Tunnel_Opened != 0);
                    DB(int64(0x5dae0ae66c6df002), GorNaKosh != nullptr && !GorNaKosh.CanSenseAnyAliveCharacterOfKind(MINECRAWLER, 2000.0f));
                    DB(int64(0x5dae0ae66c6df008), Hero != nullptr && !Hero.HasItem(UItAt_Crawlerqueen, 1, 0));
                }
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (G1R.Tunnel_Opened == 0)
                    return false;
                
                if (GorNaKosh != nullptr && GorNaKosh.CanSenseAnyAliveCharacterOfKind(MINECRAWLER, 2000.0f))
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UItAt_Crawlerqueen, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x64f7d963b11ca30a), EConversationDebugInfo::Executing);
                // What a fight. I've never seen minecrawlers so enraged. 
                GorNaKosh.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_135228_2238"));
                DC(int64(0x64f7d963b11ca30a), EConversationDebugInfo::Done);
                DC(int64(0xe185eea8889077e), EConversationDebugInfo::Executing);
                
                // Might be because they're defending their nest. 
                Hero.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_193910"));
                DC(int64(0xe185eea8889077e), EConversationDebugInfo::Done);
                DC(int64(0xe185eea8889077f), EConversationDebugInfo::Executing);
                
                // That's what we all hope. I'm sorry we can't accompany ...
                GorNaKosh.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_193932"));
                DC(int64(0xe185eea8889077f), EConversationDebugInfo::Done);
                DC(int64(0xe185eea88890781), EConversationDebugInfo::Executing);
                // But if Y'Berion chose you for this mission, perhaps this ...
                GorNaKosh.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_193950"));
                DC(int64(0xe185eea88890781), EConversationDebugInfo::Done);
                DC(int64(0xe185eea88890782), EConversationDebugInfo::Executing);
                
                // That's what people keep telling me. 
                Hero.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_194014"));
                DC(int64(0xe185eea88890782), EConversationDebugInfo::Done);
                DC(int64(0xe185eea88890783), EConversationDebugInfo::Executing);
                
                // (snorts) Good luck in there. 
                GorNaKosh.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_194018"));
                DC(int64(0xe185eea88890783), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTpl1401GornakoshCrawler : UTopic_Hero__OM_TPL_GORNAKOSH_1401
        {
            default DebugId = int64(0x33b81a2ddb2ca6b5);
            default Caption = LocText("TPL_1401_GORNAKOSH_CRAWLER_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTpl1401GornakoshInfo);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x33b81a2ddb2ca6b6), EConversationDebugInfo::Executing);
                
                // If I run into a crawler, what do I do?
                Hero.AI.Say(LocText("TPL_1401_GORNAKOSH_CRAWLER_INFO_15_01"));
                DC(int64(0x33b81a2ddb2ca6b6), EConversationDebugInfo::Done);
                DC(int64(0x33b81a2ddb2ca6b7), EConversationDebugInfo::Executing);
                
                // You run the other way.
                GorNaKosh.AI.Say(LocText("TPL_1401_GORNAKOSH_CRAWLER_INFO_13_02"));
                DC(int64(0x33b81a2ddb2ca6b7), EConversationDebugInfo::Done);
                DC(int64(0x33b81a2ddb2ca6b8), EConversationDebugInfo::Executing);
                // And if that's not an option, fight, and go straight for ...
                GorNaKosh.AI.Say(LocText("TPL_1401_GORNAKOSH_CRAWLER_INFO_13_03"));
                DC(int64(0x33b81a2ddb2ca6b8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTpl1401GornakoshExit : UTopic_Hero__OM_TPL_GORNAKOSH_1401
        {
            default DebugId = int64(0x33b81a2ddb2ca6a2);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x33b81a2ddb2ca6a3), EConversationDebugInfo::Executing);
                // Sleeper awaken!
                GorNaKosh.AI.Say(LocText("TPL_1401_GORNAKOSH_EXIT_INFO_13_02"));
                DC(int64(0x33b81a2ddb2ca6a3), EConversationDebugInfo::Done);
                DC(int64(0x33b81a2ddb2ca6a4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x33b81a2ddb2ca6a4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTpl1401GornakoshInfo : UTopic_Hero__OM_TPL_GORNAKOSH_1401
        {
            default DebugId = int64(0x33b81a2ddb2ca6ae);
            default Caption = LocText("TPL_1401_GORNAKOSH_INFO_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceGrd263AsghanNest);
            default Rules.HideIfKnows(UChoiceTpl1401GornakoshInfo);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xae34c5512d5ef929), GorNaKosh != nullptr && !GorNaKosh.HasAssignedDailyRoutine(UDailyRoutine_OM_TPL_GorNaKosh_1401_Collapsed));
                }
                
                return GorNaKosh != nullptr && !GorNaKosh.HasAssignedDailyRoutine(UDailyRoutine_OM_TPL_GorNaKosh_1401_Collapsed);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x33b81a2ddb2ca6af), EConversationDebugInfo::Executing);
                // What brings you here?
                Hero.AI.Say(LocText("TPL_1401_GORNAKOSH_INFO_INFO_15_01"));
                DC(int64(0x33b81a2ddb2ca6af), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_TPL_GORNAKOSH, Document::UDocumentSegment_Glossary_OM_TPL_GORNAKOSH_Introduction);
                DB(int64(0xe185eea88890719), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0xe185eea8889071f), EConversationDebugInfo::Executing);
                    // Well, well, a novice. Huh? This is different from lying ...
                    GorNaKosh.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_192401_41"));
                    DC(int64(0xe185eea8889071f), EConversationDebugInfo::Done);
                    DC(int64(0xe185eea8889072e), EConversationDebugInfo::Executing);
                    // Well. Back to your question...
                    GorNaKosh.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_192420"));
                    DC(int64(0xe185eea8889072e), EConversationDebugInfo::Done);
                }
                DC(int64(0xe185eea88890723), EConversationDebugInfo::Executing);
                // I'm hunting minecrawlers. We need the ichor in their ...
                GorNaKosh.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_192404_2083"));
                DC(int64(0xe185eea88890723), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTpl1401GornakoshSuggest : UTopic_Hero__OM_TPL_GORNAKOSH_1401
        {
            default DebugId = int64(0x33b81a2ddb2ca6a5);
            default Caption = LocText("TEXT_WIP_KOQECXC_20240429_191419_2050");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceTpl1401GornakoshSuggest);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x33b81a2ddb2ca6a6), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_TPL_GORNAKOSH, Document::UDocumentSegment_Glossary_OM_TPL_GORNAKOSH_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_MCEGGS, Document::UDocumentSegment_CH2_MCEGGS_GorNaKosh);
                DB(int64(0xe185eea88890736), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                DB(int64(0xe185eea8889073b), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp));
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                {
                    DC(int64(0x8e70368ac0328cc6), EConversationDebugInfo::Executing);
                    // I'm here on Master Y'Berion's orders. We found a way to ...
                    Hero.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_192346"));
                    DC(int64(0x8e70368ac0328cc6), EConversationDebugInfo::Done);
                    DC(int64(0x8e70368ac0328cc7), EConversationDebugInfo::Executing);
                    // I'll need your help defending it when the crawlers come ...
                    Hero.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_192350"));
                    DC(int64(0x8e70368ac0328cc7), EConversationDebugInfo::Done);
                    DC(int64(0xe185eea88890738), EConversationDebugInfo::Executing);
                    
                    // What? I thought you were send from the camp, bringing ...
                    GorNaKosh.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_192652_2238"));
                    DC(int64(0xe185eea88890738), EConversationDebugInfo::Done);
                    DC(int64(0xe185eea88890764), EConversationDebugInfo::Executing);
                    
                    // Long story. 
                    Hero.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_193043"));
                    DC(int64(0xe185eea88890764), EConversationDebugInfo::Done);
                }
                else if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp))
                {
                    DC(int64(0x8e70368ac0328cc9), EConversationDebugInfo::Executing);
                    // I'm here on your Master Y'Berion's orders. We found a ...
                    Hero.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_192415"));
                    DC(int64(0x8e70368ac0328cc9), EConversationDebugInfo::Done);
                    DC(int64(0x8e70368ac0328cc8), EConversationDebugInfo::Executing);
                    // I'll need your help defending it when the crawlers come ...
                    Hero.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_192408"));
                    DC(int64(0x8e70368ac0328cc8), EConversationDebugInfo::Done);
                    DC(int64(0xe185eea8889073f), EConversationDebugInfo::Executing);
                    
                    // What? Is that a joke, bandit? Because I'm not in the ...
                    GorNaKosh.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_192725_1924"));
                    DC(int64(0xe185eea8889073f), EConversationDebugInfo::Done);
                    DC(int64(0xe185eea88890762), EConversationDebugInfo::Executing);
                    
                    // Do I look like I'm joking?
                    Hero.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_193010"));
                    DC(int64(0xe185eea88890762), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x8e70368ac0328cca), EConversationDebugInfo::Executing);
                    // I'm here on your Master Y'Berion's orders. We found a ...
                    Hero.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_192429"));
                    DC(int64(0x8e70368ac0328cca), EConversationDebugInfo::Done);
                    DC(int64(0x8e70368ac0328ccb), EConversationDebugInfo::Executing);
                    // I'll need your help defending it when the crawlers come ...
                    Hero.AI.Say(LocText("TEXT_WIP_BGXCIAC_20240905_192433"));
                    DC(int64(0x8e70368ac0328ccb), EConversationDebugInfo::Done);
                    DC(int64(0xe185eea88890746), EConversationDebugInfo::Executing);
                    
                    // What? Is that a joke, Shadow? Because I'm not in the ...
                    GorNaKosh.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_192730_2785"));
                    DC(int64(0xe185eea88890746), EConversationDebugInfo::Done);
                    DC(int64(0xe185eea88890763), EConversationDebugInfo::Executing);
                    
                    // I'm not joking. 
                    Hero.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_193014"));
                    DC(int64(0xe185eea88890763), EConversationDebugInfo::Done);
                }
                DC(int64(0xe185eea88890759), EConversationDebugInfo::Executing);
                // You could go ask Cor Kalom or Cor Angar if you don't ...
                Hero.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_192940"));
                DC(int64(0xe185eea88890759), EConversationDebugInfo::Done);
                DC(int64(0xe185eea88890766), EConversationDebugInfo::Executing);
                
                // You- (sighs) Fine, you don't strike me as a liar. You ...
                GorNaKosh.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_193153"));
                DC(int64(0xe185eea88890766), EConversationDebugInfo::Done);
                DC(int64(0xe185eea88890767), EConversationDebugInfo::Executing);
                
                // Yes. 
                Hero.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_193220"));
                DC(int64(0xe185eea88890767), EConversationDebugInfo::Done);
                DC(int64(0xe185eea88890768), EConversationDebugInfo::Executing);
                
                // Then I'll be there. Are you coming with me? 
                GorNaKosh.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_193228"));
                DC(int64(0xe185eea88890768), EConversationDebugInfo::Done);
                DC(int64(0xc9bbf0de13e7d739), EConversationDebugInfo::Executing);
                GorNaKosh.ExchangeDailyRoutineToClass(UDailyRoutine_OM_TPL_GorNaKosh_1401_Tunnel);
                DC(int64(0xc9bbf0de13e7d739), EConversationDebugInfo::Done);
                DC(int64(0xc9bbf0de13e7d73b), EConversationDebugInfo::Executing);
                GorNaKosh.SetRelationshipTowards(Hero, ERelationship::Friend);
                DC(int64(0xc9bbf0de13e7d73b), EConversationDebugInfo::Done);
                DC(int64(0xc9bbf0de13e7d73d), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_MCEGGS_HIREKOSH);
                DC(int64(0xc9bbf0de13e7d73d), EConversationDebugInfo::Done);
                DC(int64(0x2e98bf9a62fc927b), EConversationDebugInfo::Executing);
                G1R.GatheredTemplars += 1;
                DC(int64(0x2e98bf9a62fc927b), EConversationDebugInfo::Done);
                DB(int64(0x2e98bf9a62fc927d), G1R.GatheredTemplars == 3);
                
                if (G1R.GatheredTemplars == 3)
                {
                    DC(int64(0x8d453fe08e1e1c4e), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(GorNaVid))) { GorNaVid.ExchangeDailyRoutineToClass(UDailyRoutine_OM_TPL_GorNaVid_1433_Tunnel); }
                    DC(int64(0x8d453fe08e1e1c4e), EConversationDebugInfo::Done);
                    DB(int64(0xf5b9b345b80925d7), Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL != nullptr && Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL.HasSucceeded());
                    
                    if (Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL != nullptr && Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL.HasSucceeded())
                    {
                        DC(int64(0x2e98bf9a62fc9280), EConversationDebugInfo::Executing);
                        // Not yet. We have enough blades now, but I've got to go ...
                        Hero.AI.Say(LocText("TEXT_WIP_KPQXWNL_20240405_120840"));
                        DC(int64(0x2e98bf9a62fc9280), EConversationDebugInfo::Done);
                        DC(int64(0x2e98bf9a62fc9281), EConversationDebugInfo::Executing);
                        
                        // I see. Then I'll go on ahead. Sleeper guide you. 
                        GorNaKosh.AI.Say(LocText("TEXT_WIP_KPQXWNL_20240405_120840_41"));
                        DC(int64(0x2e98bf9a62fc9281), EConversationDebugInfo::Done);
                        DC(int64(0xf5b9b345b8092636), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Lester))) { Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_OutsideOldMine); }
                        DC(int64(0xf5b9b345b8092636), EConversationDebugInfo::Done);
                        DC(int64(0xf5b9b345b809263d), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Milten))) { Milten.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_FourFriendsMeeting); }
                        DC(int64(0xf5b9b345b809263d), EConversationDebugInfo::Done);
                        DC(int64(0xf5b9b345b809263f), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Gorn))) { Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_FourFriendsMeeting); }
                        DC(int64(0xf5b9b345b809263f), EConversationDebugInfo::Done);
                        DC(int64(0xf5b9b345b8092641), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Diego))) { Diego.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Diego_FourFriendsMeeting); }
                        DC(int64(0xf5b9b345b8092641), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xf5b9b345b80925da), EConversationDebugInfo::Executing);
                        // Not yet. We have enough blades now, but I need to talk ...
                        Hero.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_144913"));
                        DC(int64(0xf5b9b345b80925da), EConversationDebugInfo::Done);
                        DC(int64(0xf5b9b345b80925db), EConversationDebugInfo::Executing);
                        
                        // About clearing that rubble, I suppose. Good luck - he's ...
                        GorNaKosh.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_144913_443"));
                        DC(int64(0xf5b9b345b80925db), EConversationDebugInfo::Done);
                        DC(int64(0xe185eea88890770), EConversationDebugInfo::Executing);
                        // I'll be waiting. 
                        GorNaKosh.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_193631"));
                        DC(int64(0xe185eea88890770), EConversationDebugInfo::Done);
                    }
                    DC(int64(0x2e98bf9a62fc927f), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.SucceedQuest();
                    DC(int64(0x2e98bf9a62fc927f), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_tpl_1401_gornakosh_suggest_exit_1");
                    DC(int64(0x33b81a2ddb2ca6ad), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x33b81a2ddb2ca6ad), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xe185eea88890769), EConversationDebugInfo::Executing);
                    // In a bit. I need to talk to the other templars first. 
                    Hero.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_193324"));
                    DC(int64(0xe185eea88890769), EConversationDebugInfo::Done);
                    DC(int64(0xe185eea8889076f), EConversationDebugInfo::Executing);
                    
                    // Then do that. Sleeper guide you. 
                    GorNaKosh.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_193343"));
                    DC(int64(0xe185eea8889076f), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_tpl_1401_gornakosh_suggest_exit_2");
                    DC(int64(0x2e98bf9a62fc9282), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x2e98bf9a62fc9282), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceTpl1401GornakoshVictory : UTopic_Hero__OM_TPL_GORNAKOSH_1401
        {
            default DebugId = int64(0x33b81a2ddb2ca6b9);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceTpl1401GornakoshVictory);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x33b81a2ddb2ca6ba), Hero != nullptr && Hero.HasItem(UItAt_Crawlerqueen, 4, 0));
                    DB(int64(0x33b81a2ddb2ca6bb), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning());
                    DB(int64(0x5dae0ae66c6df00b), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Crawlerqueen, 4, 0))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS != nullptr && !Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe185eea88890786), EConversationDebugInfo::Executing);
                // You found the nest. Didn't you? 
                GorNaKosh.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_194056"));
                DC(int64(0xe185eea88890786), EConversationDebugInfo::Done);
                DC(int64(0x33b81a2ddb2ca6bc), EConversationDebugInfo::Executing);
                
                // What gave it away?
                Hero.AI.Say(LocText("TPL_1401_GORNAKOSH_VICTORY_INFO_15_01"));
                DC(int64(0x33b81a2ddb2ca6bc), EConversationDebugInfo::Done);
                DC(int64(0x33b81a2ddb2ca6bd), EConversationDebugInfo::Executing);
                
                // That you're still breathing. 
                GorNaKosh.AI.Say(LocText("TPL_1401_GORNAKOSH_VICTORY_INFO_13_02"));
                DC(int64(0x33b81a2ddb2ca6bd), EConversationDebugInfo::Done);
                DC(int64(0x626b7fdd392ed30b), EConversationDebugInfo::Executing);
                // I'd ask you about the ichor, but something tells me you ...
                GorNaKosh.AI.Say(LocText("TEXT_WIP_QGRCRRE_20240903_181131"));
                DC(int64(0x626b7fdd392ed30b), EConversationDebugInfo::Done);
                DC(int64(0xe185eea88890788), EConversationDebugInfo::Executing);
                // Make haste, stranger. The Great Awakening draws near. 
                GorNaKosh.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_194151"));
                DC(int64(0xe185eea88890788), EConversationDebugInfo::Done);
                DC(int64(0xd4bfca7c20283f78), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Asghan))) { Asghan.LeavePartyOf(Hero); }
                DC(int64(0xd4bfca7c20283f78), EConversationDebugInfo::Done);
                DC(int64(0xd4bfca7c20283f7c), EConversationDebugInfo::Executing);
                if (ensure(IsValid(GorNaVid))) { GorNaVid.LeavePartyOf(Hero); }
                DC(int64(0xd4bfca7c20283f7c), EConversationDebugInfo::Done);
                DC(int64(0xd4bfca7c20283f7e), EConversationDebugInfo::Executing);
                if (ensure(IsValid(GorNaBar))) { GorNaBar.LeavePartyOf(Hero); }
                DC(int64(0xd4bfca7c20283f7e), EConversationDebugInfo::Done);
                DC(int64(0xd4bfca7c20283f80), EConversationDebugInfo::Executing);
                GorNaKosh.LeavePartyOf(Hero);
                DC(int64(0xd4bfca7c20283f80), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */