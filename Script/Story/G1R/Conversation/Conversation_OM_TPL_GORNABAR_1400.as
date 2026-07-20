#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OM_TPL_GORNABAR_1400 : UConversationCharacterSettings
        {
            default ForCharacter = n"OM_TPL_GORNABAR_1400";
        }
        
        
        class UTopic_Hero__OM_TPL_GORNABAR_1400 : UG1RDialogTopic
        {
            default ForCharacter = n"OM_TPL_GORNABAR_1400";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGorNaBar() const property
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
            
            AGothicCharacterState GetGorNaKosh() const property
            {
                return GetCharacter(n"OM_TPL_GORNAKOSH_1401");
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
        
        
        class UChoiceGornabar89771 : UTopic_Hero__OM_TPL_GORNABAR_1400
        {
            default DebugId = int64(0x74bd1a1995dacd2);
            default Caption = LocText("TEXT_WIP_NRBFMML_20240411_113737");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceTpl1400GornabarSuggest);
            default Rules.HideIfKnows(UChoiceGornabar89771);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x74bd1a1995dacdc), Hero != nullptr && Hero.HasItem(UItAt_Crawler_01, 4, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItAt_Crawler_01, 4, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x74bd1a1995dacce), EConversationDebugInfo::Executing);
                // I have the mandibles. 
                Hero.AI.Say(LocText("TEXT_WIP_NRBFMML_20240411_113737"));
                DC(int64(0x74bd1a1995dacce), EConversationDebugInfo::Done);
                DC(int64(0x74bd1a1995daccf), EConversationDebugInfo::Executing);
                
                // Let me see ... hmm, yes, those are fresh. And you didn't ...
                GorNaBar.AI.Say(LocText("TEXT_WIP_NRBFMML_20240411_113737_41"));
                DC(int64(0x74bd1a1995daccf), EConversationDebugInfo::Done);
                DC(int64(0x344fb45fa6f2e60f), EConversationDebugInfo::Executing);
                
                // Are you joking?
                Hero.AI.Say(LocText("TEXT_WIP_ROQECXC_20240426_150701"));
                DC(int64(0x344fb45fa6f2e60f), EConversationDebugInfo::Done);
                DC(int64(0xbe01c25c5701b84e), EConversationDebugInfo::Executing);
                // What is wrong with you Templars? Cor Angar wouldn't let ...
                Hero.AI.Say(LocText("TEXT_WIP_EXYXWWB_20250204_222328"));
                DC(int64(0xbe01c25c5701b84e), EConversationDebugInfo::Done);
                DC(int64(0x74bd1a1995dacdf), EConversationDebugInfo::Executing);
                
                // ... Fine, I believe you. You have my sword. Are you ...
                GorNaBar.AI.Say(LocText("TEXT_WIP_NRBFMML_20240411_115556"));
                DC(int64(0x74bd1a1995dacdf), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_MCEGGS, Document::UDocumentSegment_CH2_MCEGGS_GorNaBar);
                DC(int64(0xc9bbf0de13e7d70e), EConversationDebugInfo::Executing);
                GorNaBar.ExchangeDailyRoutineToClass(UDailyRoutine_OM_TPL_GorNaBar_1400_Tunnel);
                DC(int64(0xc9bbf0de13e7d70e), EConversationDebugInfo::Done);
                DC(int64(0xc9bbf0de13e7d710), EConversationDebugInfo::Executing);
                GorNaBar.SetRelationshipTowards(Hero, ERelationship::Friend);
                DC(int64(0xc9bbf0de13e7d710), EConversationDebugInfo::Done);
                DC(int64(0xc9bbf0de13e7d712), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_MCEGGS_HIREBAR);
                DC(int64(0xc9bbf0de13e7d712), EConversationDebugInfo::Done);
                DC(int64(0x63b0673d24caf967), EConversationDebugInfo::Executing);
                G1R.GatheredTemplars += 1;
                DC(int64(0x63b0673d24caf967), EConversationDebugInfo::Done);
                DB(int64(0x63b0673d24caf969), G1R.GatheredTemplars == 3);
                
                if (G1R.GatheredTemplars == 3)
                {
                    DC(int64(0x8d453fe08e1e1c44), EConversationDebugInfo::Executing);
                    if (ensure(IsValid(GorNaVid))) { GorNaVid.ExchangeDailyRoutineToClass(UDailyRoutine_OM_TPL_GorNaVid_1433_Tunnel); }
                    DC(int64(0x8d453fe08e1e1c44), EConversationDebugInfo::Done);
                    DB(int64(0xf5b9b345b80925c6), Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL != nullptr && Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL.HasSucceeded());
                    
                    if (Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL != nullptr && Quest::OldMine_OMCHAPTER2_IAN_GEARWHEEL.HasSucceeded())
                    {
                        DC(int64(0x63b0673d24caf96a), EConversationDebugInfo::Executing);
                        // I have some business on the surface to take care of ...
                        Hero.AI.Say(LocText("TEXT_WIP_KPQXWNL_20240405_114837"));
                        DC(int64(0x63b0673d24caf96a), EConversationDebugInfo::Done);
                        DC(int64(0x63b0673d24caf96b), EConversationDebugInfo::Executing);
                        
                        // Ah. Well, then - I'll meet you at the tunnel. 
                        GorNaBar.AI.Say(LocText("TEXT_WIP_KPQXWNL_20240405_114837_2238"));
                        DC(int64(0x63b0673d24caf96b), EConversationDebugInfo::Done);
                        DC(int64(0xf5b9b345b809264c), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Lester))) { Lester.ExchangeDailyRoutineToClass(UDailyRoutine_SC_NOV_Lester_OutsideOldMine); }
                        DC(int64(0xf5b9b345b809264c), EConversationDebugInfo::Done);
                        DC(int64(0xf5b9b345b8092653), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Milten))) { Milten.ExchangeDailyRoutineToClass(UDailyRoutine_OC_KDF_Milten_FourFriendsMeeting); }
                        DC(int64(0xf5b9b345b8092653), EConversationDebugInfo::Done);
                        DC(int64(0xf5b9b345b8092655), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Gorn))) { Gorn.ExchangeDailyRoutineToClass(UDailyRoutine_NC_SLD_Gorn_699_FourFriendsMeeting); }
                        DC(int64(0xf5b9b345b8092655), EConversationDebugInfo::Done);
                        DC(int64(0xf5b9b345b8092657), EConversationDebugInfo::Executing);
                        if (ensure(IsValid(Diego))) { Diego.ExchangeDailyRoutineToClass(UDailyRoutine_OC_STT_Diego_FourFriendsMeeting); }
                        DC(int64(0xf5b9b345b8092657), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xf5b9b345b80925c9), EConversationDebugInfo::Executing);
                        // I have to talk to Ian first. We still need his ...
                        Hero.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_144728"));
                        DC(int64(0xf5b9b345b80925c9), EConversationDebugInfo::Done);
                        DC(int64(0xf5b9b345b80925ca), EConversationDebugInfo::Executing);
                        
                        // Hm. Good luck with that - I'll meet you at the tunnel. 
                        GorNaBar.AI.Say(LocText("TEXT_WIP_PPQXWNL_20240408_144728_2801"));
                        DC(int64(0xf5b9b345b80925ca), EConversationDebugInfo::Done);
                    }
                    DC(int64(0x63b0673d24caf975), EConversationDebugInfo::Executing);
                    Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.SucceedQuest();
                    DC(int64(0x63b0673d24caf975), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gornabar_89771_exit_1");
                    DC(int64(0x63b0673d24caf978), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x63b0673d24caf978), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x344fb45fa6f2e611), EConversationDebugInfo::Executing);
                    // I'll meet you there.
                    Hero.AI.Say(LocText("TEXT_WIP_ROQECXC_20240426_151025"));
                    DC(int64(0x344fb45fa6f2e611), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_gornabar_89771_exit_2");
                    DC(int64(0x63b0673d24caf96d), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x63b0673d24caf96d), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceGornabar93112 : UTopic_Hero__OM_TPL_GORNABAR_1400
        {
            default DebugId = int64(0x64f7d963b11ca301);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceGornabar93112);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x5dae0ae66c6defef), G1R.Tunnel_Opened != 0);
                    DB(int64(0x5dae0ae66c6deff2), GorNaBar != nullptr && !GorNaBar.CanSenseAnyAliveCharacterOfKind(MINECRAWLER, 2000.0f));
                    DB(int64(0x5dae0ae66c6deff3), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x5dae0ae66c6deff4), Hero != nullptr && !Hero.HasItem(UItAt_Crawlerqueen, 1, 0));
                }
                
                if (G1R.Tunnel_Opened == 0)
                    return false;
                
                if (GorNaBar != nullptr && GorNaBar.CanSenseAnyAliveCharacterOfKind(MINECRAWLER, 2000.0f))
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UItAt_Crawlerqueen, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x64f7d963b11ca2fe), EConversationDebugInfo::Executing);
                // Well fought, stranger. Well fought. 
                GorNaBar.AI.Say(LocText("TEXT_WIP_MPUISQL_20240429_135201_41"));
                DC(int64(0x64f7d963b11ca2fe), EConversationDebugInfo::Done);
                DC(int64(0xe185eea888906fe), EConversationDebugInfo::Executing);
                
                // Sure you're not coming with?
                Hero.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_191800"));
                DC(int64(0xe185eea888906fe), EConversationDebugInfo::Done);
                DC(int64(0xe185eea888906ff), EConversationDebugInfo::Executing);
                
                // Oh, believe me, I would. But as much as I hate to say ...
                GorNaBar.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_191804"));
                DC(int64(0xe185eea888906ff), EConversationDebugInfo::Done);
                DC(int64(0xe185eea88890700), EConversationDebugInfo::Executing);
                // The moment Ian allowed you to open this tunnel, the ...
                GorNaBar.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_191832"));
                DC(int64(0xe185eea88890700), EConversationDebugInfo::Done);
                DC(int64(0xe185eea88890701), EConversationDebugInfo::Executing);
                // We will cover your back. 
                GorNaBar.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_191859"));
                DC(int64(0xe185eea88890701), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceTpl1400GornabarExit : UTopic_Hero__OM_TPL_GORNABAR_1400
        {
            default DebugId = int64(0x763d346809b16a2c);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x763d346809b16a2d), EConversationDebugInfo::Executing);
                // Sleeper guide you. 
                GorNaBar.AI.Say(LocText("TPL_1400_GORNABAR_EXIT_INFO_09_02"));
                DC(int64(0x763d346809b16a2d), EConversationDebugInfo::Done);
                DC(int64(0x763d346809b16a2e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x763d346809b16a2e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceTpl1400GornabarInfo : UTopic_Hero__OM_TPL_GORNABAR_1400
        {
            default DebugId = int64(0x763d346809b16a39);
            default Caption = LocText("TPL_1400_GORNABAR_INFO_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceLester87566);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x763d346809b16a3a), EConversationDebugInfo::Executing);
                // What can you tell me about the crawlers?
                Hero.AI.Say(LocText("TPL_1400_GORNABAR_INFO_INFO_15_01"));
                DC(int64(0x763d346809b16a3a), EConversationDebugInfo::Done);
                DC(int64(0x763d346809b16a3b), EConversationDebugInfo::Executing);
                
                // What I can tell you about them? Stay away from them, ...
                GorNaBar.AI.Say(LocText("TPL_1400_GORNABAR_INFO_INFO_09_02"));
                DC(int64(0x763d346809b16a3b), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_TPL_GORNABAR, Document::UDocumentSegment_Glossary_OM_TPL_GORNABAR_Introduction);
            }
        }
        
        
        class UChoiceTpl1400GornabarSuggest : UTopic_Hero__OM_TPL_GORNABAR_1400
        {
            default DebugId = int64(0x763d346809b16a2f);
            default Caption = LocText("TPL_1400_GORNABAR_SUGGEST_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceTpl1400GornabarSuggest);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x763d346809b16a30), Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER != nullptr && Quest::SwampCamp_SCCHAPTER2_CORKALOM_BRINGMCQBALLS_CORKALOM_BRINGMCQBALLS_OBJ_GATHER.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x763d346809b16a31), EConversationDebugInfo::Executing);
                // I need your help. We're going to open the collapsed ...
                Hero.AI.Say(LocText("TPL_1400_GORNABAR_SUGGEST_INFO_15_01"));
                DC(int64(0x763d346809b16a31), EConversationDebugInfo::Done);
                DC(int64(0x763d346809b16a33), EConversationDebugInfo::Executing);
                // Can I count on you?
                Hero.AI.Say(LocText("TPL_1400_GORNABAR_SUGGEST_INFO_15_03"));
                DC(int64(0x763d346809b16a33), EConversationDebugInfo::Done);
                DC(int64(0x74bd1a1995dacd8), EConversationDebugInfo::Executing);
                
                // You're ... what? Who are you? 
                GorNaBar.AI.Say(LocText("TEXT_WIP_NRBFMML_20240411_114128"));
                DC(int64(0x74bd1a1995dacd8), EConversationDebugInfo::Done);
                DC(int64(0x344fb45fa6f2e60b), EConversationDebugInfo::Executing);
                
                // Long story, but I'm working for your master. Will you ...
                Hero.AI.Say(LocText("TEXT_WIP_ROQECXC_20240426_150329"));
                DC(int64(0x344fb45fa6f2e60b), EConversationDebugInfo::Done);
                DC(int64(0x74bd1a1995dacda), EConversationDebugInfo::Executing);
                
                // Hmm ... I don't know you, and I have no way to find out ...
                GorNaBar.AI.Say(LocText("TEXT_WIP_NRBFMML_20240411_115340"));
                DC(int64(0x74bd1a1995dacda), EConversationDebugInfo::Done);
                DC(int64(0x344fb45fa6f2e60c), EConversationDebugInfo::Executing);
                // If you want me to put my life on the line for whatever ...
                GorNaBar.AI.Say(LocText("TEXT_WIP_ROQECXC_20240426_150354"));
                DC(int64(0x344fb45fa6f2e60c), EConversationDebugInfo::Done);
                DC(int64(0x74bd1a1995dacd9), EConversationDebugInfo::Executing);
                // Bring me four minecrawler mandibles, torn fresh from the ...
                GorNaBar.AI.Say(LocText("TEXT_WIP_NRBFMML_20240411_115123"));
                DC(int64(0x74bd1a1995dacd9), EConversationDebugInfo::Done);
                DC(int64(0x344fb45fa6f2e610), EConversationDebugInfo::Executing);
                
                // (sighs) Have it your way. 
                Hero.AI.Say(LocText("TEXT_WIP_ROQECXC_20240426_150727"));
                DC(int64(0x344fb45fa6f2e610), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OM_TPL_GORNABAR, Document::UDocumentSegment_Glossary_OM_TPL_GORNABAR_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_MCEGGS, Document::UDocumentSegment_CH2_MCEGGS_GorNaBarQuest);
            }
        }
        
        
        class UChoiceTpl1400GornabarVictory : UTopic_Hero__OM_TPL_GORNABAR_1400
        {
            default DebugId = int64(0x763d346809b16a3c);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceTpl1400GornabarVictory);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x763d346809b16a3d), Hero != nullptr && Hero.HasItem(UItAt_Crawlerqueen, 1, 0));
                    DB(int64(0x5dae0ae66c6defeb), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItAt_Crawlerqueen, 1, 0))
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe185eea88890775), EConversationDebugInfo::Executing);
                // Huh - You're back. Did you do it? Did you find the nest?
                GorNaBar.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_193702"));
                DC(int64(0xe185eea88890775), EConversationDebugInfo::Done);
                DC(int64(0x763d346809b16a3e), EConversationDebugInfo::Executing);
                
                // And their queen, yes. 
                Hero.AI.Say(LocText("TPL_1400_GORNABAR_VICTORY_INFO_15_01"));
                DC(int64(0x763d346809b16a3e), EConversationDebugInfo::Done);
                DC(int64(0x763d346809b16a3f), EConversationDebugInfo::Executing);
                
                // What about the ichor? Please tell me you found some ...
                GorNaBar.AI.Say(LocText("TPL_1400_GORNABAR_VICTORY_INFO_09_02"));
                DC(int64(0x763d346809b16a3f), EConversationDebugInfo::Done);
                DC(int64(0xe185eea88890776), EConversationDebugInfo::Executing);
                
                // Don't worry, I did. I'm bringing it straight back to ...
                Hero.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_193735"));
                DC(int64(0xe185eea88890776), EConversationDebugInfo::Done);
                DC(int64(0xe185eea88890777), EConversationDebugInfo::Executing);
                
                // ... Sleeper praise. You surprised me, I'll give you ...
                GorNaBar.AI.Say(LocText("TEXT_WIP_KOQECXC_20240429_193754"));
                DC(int64(0xe185eea88890777), EConversationDebugInfo::Done);
                DC(int64(0xd4bfca7c20283f84), EConversationDebugInfo::Executing);
                if (ensure(IsValid(GorNaVid))) { GorNaVid.LeavePartyOf(Hero); }
                DC(int64(0xd4bfca7c20283f84), EConversationDebugInfo::Done);
                DC(int64(0xd4bfca7c20283f88), EConversationDebugInfo::Executing);
                GorNaBar.LeavePartyOf(Hero);
                DC(int64(0xd4bfca7c20283f88), EConversationDebugInfo::Done);
                DC(int64(0xd4bfca7c20283f8a), EConversationDebugInfo::Executing);
                if (ensure(IsValid(GorNaKosh))) { GorNaKosh.LeavePartyOf(Hero); }
                DC(int64(0xd4bfca7c20283f8a), EConversationDebugInfo::Done);
                DC(int64(0xd4bfca7c20283f8c), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Asghan))) { Asghan.LeavePartyOf(Hero); }
                DC(int64(0xd4bfca7c20283f8c), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */