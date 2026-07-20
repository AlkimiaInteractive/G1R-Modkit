#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_KDW_MYXIR_601 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_KDW_MYXIR_601";
        }
        
        
        class UTopic_Hero__NC_KDW_MYXIR_601 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_KDW_MYXIR_601";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetMyxir() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceMyxir111952 : UTopic_Hero__NC_KDW_MYXIR_601
        {
            default DebugId = int64(0xe525574b1fff17ab);
            default Caption = LocText("TEXT_WIP_GSVMXID_20241017_140553");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceMyxir111952);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe525574b1fff17a9), EConversationDebugInfo::Executing);
                // What's your job around here?
                Hero.AI.Say(LocText("TEXT_WIP_GSVMXID_20241017_140553"));
                DC(int64(0xe525574b1fff17a9), EConversationDebugInfo::Done);
                DC(int64(0xe525574b1fff17aa), EConversationDebugInfo::Executing);
                
                // Uhh ... huh? Did you say something? 
                Myxir.AI.Say(LocText("TEXT_WIP_GSVMXID_20241017_140553_3286"));
                DC(int64(0xe525574b1fff17aa), EConversationDebugInfo::Done);
                DC(int64(0xe525574b1fff17ad), EConversationDebugInfo::Executing);
                
                // I said, what's your job with the Water Mages? 
                Hero.AI.Say(LocText("TEXT_WIP_GSVMXID_20241017_140635"));
                DC(int64(0xe525574b1fff17ad), EConversationDebugInfo::Done);
                DC(int64(0xe525574b1fff17ae), EConversationDebugInfo::Executing);
                
                // Oh. Of course. I'm the Listener of Magical Vibrations. 
                Myxir.AI.Say(LocText("TEXT_WIP_GSVMXID_20241017_140644"));
                DC(int64(0xe525574b1fff17ae), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_KDW_MYXIR, Document::UDocumentSegment_Glossary_NC_KDW_MYXIR_Introduction);
            }
        }
        
        
        class UChoiceMyxir112183 : UTopic_Hero__NC_KDW_MYXIR_601
        {
            default DebugId = int64(0xe525574b1fff17b1);
            default Caption = LocText("TEXT_WIP_GSVMXID_20241017_140737");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMyxir111952);
            default Rules.HideIfKnows(UChoiceMyxir112183);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe525574b1fff17af), EConversationDebugInfo::Executing);
                // Magical what now?
                Hero.AI.Say(LocText("TEXT_WIP_GSVMXID_20241017_140737"));
                DC(int64(0xe525574b1fff17af), EConversationDebugInfo::Done);
                DC(int64(0xe525574b1fff17b0), EConversationDebugInfo::Executing);
                
                // The magical vibrations! Wha- have you never heard of ...
                Myxir.AI.Say(LocText("TEXT_WIP_GSVMXID_20241017_140737_2386"));
                DC(int64(0xe525574b1fff17b0), EConversationDebugInfo::Done);
                DC(int64(0xe525574b1fff17b3), EConversationDebugInfo::Executing);
                // The simpletons of this world like to believe magic is ...
                Myxir.AI.Say(LocText("TEXT_WIP_GSVMXID_20241017_140841"));
                DC(int64(0xe525574b1fff17b3), EConversationDebugInfo::Done);
                DC(int64(0xe525574b1fff17b4), EConversationDebugInfo::Executing);
                // Magic is in a constant state of vibration. Every spell, ...
                Myxir.AI.Say(LocText("TEXT_WIP_GSVMXID_20241017_141038"));
                DC(int64(0xe525574b1fff17b4), EConversationDebugInfo::Done);
                DC(int64(0xe525574b1fff17b5), EConversationDebugInfo::Executing);
                // True mages must learn to ATTUNE themselves to the ...
                Myxir.AI.Say(LocText("TEXT_WIP_GSVMXID_20241017_141152"));
                DC(int64(0xe525574b1fff17b5), EConversationDebugInfo::Done);
                DC(int64(0xe525574b1fff17b6), EConversationDebugInfo::Executing);
                // Then - and only then - will they know true mastery. 
                Myxir.AI.Say(LocText("TEXT_WIP_GSVMXID_20241017_141305"));
                DC(int64(0xe525574b1fff17b6), EConversationDebugInfo::Done);
                DC(int64(0xe525574b1fff17b7), EConversationDebugInfo::Executing);
                
                // Right. 
                Hero.AI.Say(LocText("TEXT_WIP_GSVMXID_20241017_141334"));
                DC(int64(0xe525574b1fff17b7), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_KDW_MYXIR, Document::UDocumentSegment_Glossary_NC_KDW_MYXIR_Vibrations);
            }
        }
        
        
        class UChoiceMyxir113459 : UTopic_Hero__NC_KDW_MYXIR_601
        {
            default DebugId = int64(0xe525574b1fff17ba);
            default Caption = LocText("TEXT_WIP_GSVMXID_20241017_141351");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMyxir112183);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xe525574b1fff17b8), EConversationDebugInfo::Executing);
                // How are the vibrations today?
                Hero.AI.Say(LocText("TEXT_WIP_GSVMXID_20241017_141351"));
                DC(int64(0xe525574b1fff17b8), EConversationDebugInfo::Done);
                DC(int64(0xe525574b1fff17b9), EConversationDebugInfo::Executing);
                
                // Oh? How thoughtful of you to ask. The vibrations vibrate ...
                Myxir.AI.Say(LocText("TEXT_WIP_GSVMXID_20241017_141351_1609"));
                DC(int64(0xe525574b1fff17b9), EConversationDebugInfo::Done);
                DC(int64(0xe525574b1fff17bc), EConversationDebugInfo::Executing);
                // It's a fine day to be a mage!
                Myxir.AI.Say(LocText("TEXT_WIP_GSVMXID_20241017_141540"));
                DC(int64(0xe525574b1fff17bc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMyxir114929 : UTopic_Hero__NC_KDW_MYXIR_601
        {
            default DebugId = int64(0x14197298145f728d);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceMyxir114929);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x14197298145f7223), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage));
                    DB(int64(0x14197298145f722f), Hero != nullptr && Hero.IsCloseToCharacter(Myxir, 500.0f));
                }
                
                if (Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_NewCamp_WaterMage))
                    return false;
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Myxir, 500.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x14197298145f728c), EConversationDebugInfo::Executing);
                // Why, a new member in our ranks. Adanos bless you.
                Myxir.AI.Say(LocText("TEXT_WIP_XHHWUEL_20241202_111057_3569"));
                DC(int64(0x14197298145f728c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMyxir116633 : UTopic_Hero__NC_KDW_MYXIR_601
        {
            default DebugId = int64(0x33e046463a613682);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceMyxir116633);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_SW_MYXIR_WAIT", 500.0f, int64(0x33e046463a613682));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x33e046463a613685), Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY != nullptr && Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY != nullptr && Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x33e046463a613681), EConversationDebugInfo::Executing);
                // Gah! By Adanos, now I lost my focus! What do you want? 
                Myxir.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_142303_41"));
                DC(int64(0x33e046463a613681), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_RANKUPMERCENARY, Document::UDocumentSegment_CH3_RANKUPMERCENARY_Meet);
                DB(int64(0x3673fe4e769e6a68), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_GSVMXID_20241017_140553_3286")));
                
                if (Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_GSVMXID_20241017_140553_3286")))
                {
                    DC(int64(0x3673fe4e769e6a69), EConversationDebugInfo::Executing);
                    // Lee sent me. What are you doing out here? Looking for ...
                    Hero.AI.Say(LocText("TEXT_WIP_VEUKWGL_20241205_212020"));
                    DC(int64(0x3673fe4e769e6a69), EConversationDebugInfo::Done);
                    DC(int64(0x3673fe4e769e6a6a), EConversationDebugInfo::Executing);
                    
                    // I see you remembered. Yes, indeed I was. 
                    Myxir.AI.Say(LocText("TEXT_WIP_VEUKWGL_20241205_212020_41"));
                    DC(int64(0x3673fe4e769e6a6a), EConversationDebugInfo::Done);
                    DC(int64(0x41955848c526fa39), EConversationDebugInfo::Executing);
                    // I was just attuning myself to them when you snuck up on ...
                    Myxir.AI.Say(LocText("TEXT_WIP_IPMSWZD_20241211_145355"));
                    DC(int64(0x41955848c526fa39), EConversationDebugInfo::Done);
                    DC(int64(0x41955848c526fa3a), EConversationDebugInfo::Executing);
                    // Either way. You said Lee sent you? That's good. I need a ...
                    Myxir.AI.Say(LocText("TEXT_WIP_IPMSWZD_20241211_145427"));
                    DC(int64(0x41955848c526fa3a), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x41955848c526fa34), EConversationDebugInfo::Executing);
                    
                    // Lee sent me. What were you focusing on?
                    Hero.AI.Say(LocText("TEXT_WIP_IPMSWZD_20241211_145217"));
                    DC(int64(0x41955848c526fa34), EConversationDebugInfo::Done);
                    DC(int64(0x41955848c526fa35), EConversationDebugInfo::Executing);
                    
                    // The magical vibrations, of course! They're all around ...
                    Myxir.AI.Say(LocText("TEXT_WIP_IPMSWZD_20241211_145217_41"));
                    DC(int64(0x41955848c526fa35), EConversationDebugInfo::Done);
                    DC(int64(0x41955848c526fa38), EConversationDebugInfo::Executing);
                    // I was just attuning myself to them when you snuck up on ...
                    Myxir.AI.Say(LocText("TEXT_WIP_IPMSWZD_20241211_145355"));
                    DC(int64(0x41955848c526fa38), EConversationDebugInfo::Done);
                    DC(int64(0x41955848c526fa3b), EConversationDebugInfo::Executing);
                    // Either way. You said Lee sent you? That's good. I need a ...
                    Myxir.AI.Say(LocText("TEXT_WIP_IPMSWZD_20241211_145427"));
                    DC(int64(0x41955848c526fa3b), EConversationDebugInfo::Done);
                }
                DC(int64(0x41955848c526fa44), EConversationDebugInfo::Executing);
                // Any idea what causes them? 
                Hero.AI.Say(LocText("TEXT_WIP_IPMSWZD_20241211_153600"));
                DC(int64(0x41955848c526fa44), EConversationDebugInfo::Done);
                DB(int64(0xb40813a28a6be05c), Hero != nullptr && !Hero.HasItem(UItMs_Book_WaterMages, 1, 0));
                
                if (Hero != nullptr && !Hero.HasItem(UItMs_Book_WaterMages, 1, 0))
                {
                    DC(int64(0xb40813a28a6be05d), EConversationDebugInfo::Executing);
                    // That's what I'm trying to find. Come, let's explore the ...
                    Myxir.AI.Say(LocText("TEXT_WIP_REUKWGL_20241209_162500"));
                    DC(int64(0xb40813a28a6be05d), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xb40813a28a6be05f), EConversationDebugInfo::Executing);
                    // That's a good question. I sensed strong magical ...
                    Myxir.AI.Say(LocText("TEXT_WIP_REUKWGL_20241209_162513"));
                    DC(int64(0xb40813a28a6be05f), EConversationDebugInfo::Done);
                    DC(int64(0xb40813a28a6be0ae), EConversationDebugInfo::Executing);
                    // But it seems to be in flux. Right now, I am feeling it ...
                    Myxir.AI.Say(LocText("TEXT_WIP_REUKWGL_20241209_162922"));
                    DC(int64(0xb40813a28a6be0ae), EConversationDebugInfo::Done);
                    DC(int64(0xb40813a28a6be0af), EConversationDebugInfo::Executing);
                    // It's quite peculiar. Perhaps your aura has to do with ...
                    Myxir.AI.Say(LocText("TEXT_WIP_REUKWGL_20241209_163012"));
                    DC(int64(0xb40813a28a6be0af), EConversationDebugInfo::Done);
                    DC(int64(0xb40813a28a6be060), EConversationDebugInfo::Executing);
                    
                    // I've been here before. Yea... Maybe ...
                    Hero.AI.Say(LocText("TEXT_WIP_REUKWGL_20241209_162513_1924"));
                    DC(int64(0xb40813a28a6be060), EConversationDebugInfo::Done);
                    DC(int64(0xb40813a28a6be0b0), EConversationDebugInfo::Executing);
                    
                    // Shush. We're paying you to protect us, not to talk. 
                    Myxir.AI.Say(LocText("TEXT_WIP_REUKWGL_20241209_163101"));
                    DC(int64(0xb40813a28a6be0b0), EConversationDebugInfo::Done);
                    DC(int64(0xb40813a28a6be0b1), EConversationDebugInfo::Executing);
                    // Now let's explore the beach. I will feel when we get ...
                    Myxir.AI.Say(LocText("TEXT_WIP_REUKWGL_20241209_163131"));
                    DC(int64(0xb40813a28a6be0b1), EConversationDebugInfo::Done);
                }
                DC(int64(0x33e046463a613711), EConversationDebugInfo::Executing);
                Myxir.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Myxir_601_BeachRight);
                DC(int64(0x33e046463a613711), EConversationDebugInfo::Done);
                DC(int64(0xb272e6dedc4a2f58), EConversationDebugInfo::Executing);
                Myxir.JoinPartyOf(Hero);
                DC(int64(0xb272e6dedc4a2f58), EConversationDebugInfo::Done);
                DC(int64(0x570acab4847ebb00), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_MEET.SucceedQuest();
                DC(int64(0x570acab4847ebb00), EConversationDebugInfo::Done);
                DC(int64(0x33e046463a613712), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x33e046463a613712), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMyxir117019 : UTopic_Hero__NC_KDW_MYXIR_601
        {
            default DebugId = int64(0x33e046463a613706);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMyxir116633);
            default Rules.HideIfKnows(UChoiceMyxir117019);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_SW_MYXIR_BEACH_RIGHT", 300.0f, int64(0x33e046463a613706));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x33e046463a61370a), Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY != nullptr && Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY.IsRunning());
                    DB(int64(0x33e046463a61370c), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY != nullptr && !Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x33e046463a613704), EConversationDebugInfo::Executing);
                // How are the vibrations? 
                Hero.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_153740"));
                DC(int64(0x33e046463a613704), EConversationDebugInfo::Done);
                DC(int64(0x33e046463a613705), EConversationDebugInfo::Executing);
                
                // ... Weak. Nothing. The source must be elsewhere. 
                Myxir.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_153740_2238"));
                DC(int64(0x33e046463a613705), EConversationDebugInfo::Done);
                DC(int64(0x33e046463a61370d), EConversationDebugInfo::Executing);
                // But ... wait. The wreck! It's coming from the wreck! ...
                Myxir.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_154700"));
                DC(int64(0x33e046463a61370d), EConversationDebugInfo::Done);
                DC(int64(0x33e046463a61370f), EConversationDebugInfo::Executing);
                Myxir.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Myxir_601_BeachLeft);
                DC(int64(0x33e046463a61370f), EConversationDebugInfo::Done);
                DC(int64(0x33e046463a613713), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x33e046463a613713), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMyxir117244 : UTopic_Hero__NC_KDW_MYXIR_601
        {
            default DebugId = int64(0x33e046463a61371f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMyxir117019);
            default Rules.HideIfKnows(UChoiceMyxir117244);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_SW_MYXIR_BEACH_LEFT", 300.0f, int64(0x33e046463a61371f));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x33e046463a613722), Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY != nullptr && Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY != nullptr && Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x33e046463a61371e), EConversationDebugInfo::Executing);
                // Wait ... 
                Myxir.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_160023_2785"));
                DC(int64(0x33e046463a61371e), EConversationDebugInfo::Done);
                DB(int64(0x8959c8b3c1c7852a), Hero != nullptr && Hero.HasItem(UItMs_Book_WaterMages, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMs_Book_WaterMages, 1, 0))
                {
                    DC(int64(0xb40813a28a6be0b7), EConversationDebugInfo::Executing);
                    // Ahh! The vibrations are getting stronger. We- wait. Is ...
                    Myxir.AI.Say(LocText("TEXT_WIP_REUKWGL_20241209_163417"));
                    DC(int64(0xb40813a28a6be0b7), EConversationDebugInfo::Done);
                    DC(int64(0xb40813a28a6be0b3), EConversationDebugInfo::Executing);
                    
                    // I was trying to tell you. I've been here before, and ...
                    Hero.AI.Say(LocText("TEXT_WIP_REUKWGL_20241209_163408"));
                    DC(int64(0xb40813a28a6be0b3), EConversationDebugInfo::Done);
                    DC(int64(0xb40813a28a6be0b4), EConversationDebugInfo::Executing);
                    
                    // Did you ... find something?
                    Myxir.AI.Say(LocText("TEXT_WIP_REUKWGL_20241209_163408_2785"));
                    DC(int64(0xb40813a28a6be0b4), EConversationDebugInfo::Done);
                    DC(int64(0xb40813a28a6be0b8), EConversationDebugInfo::Executing);
                    
                    // Yes, an old book. But I can't get it open. 
                    Hero.AI.Say(LocText("TEXT_WIP_REUKWGL_20241209_163534"));
                    DC(int64(0xb40813a28a6be0b8), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_RANKUPMERCENARY, Document::UDocumentSegment_CH3_RANKUPMERCENARY_BookOwn);
                    DC(int64(0x8959c8b3c1c7852f), EConversationDebugInfo::Executing);
                    Myxir.LeavePartyOf(Hero);
                    DC(int64(0x8959c8b3c1c7852f), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_myxir_117244_exit_1");
                }
                else
                {
                    DC(int64(0x8959c8b3c1c7852c), EConversationDebugInfo::Executing);
                    // Ahh! The vibrations are getting stronger! We're getting ...
                    Myxir.AI.Say(LocText("TEXT_WIP_PFCKUON_20241209_165330_41"));
                    DC(int64(0x8959c8b3c1c7852c), EConversationDebugInfo::Done);
                    Print("Skipped Myxir.AI.PointAtWaypoint(nWP_SR_MYXIR)");
                    DC(int64(0xb272e6dedc4a2f5a), EConversationDebugInfo::Executing);
                    Myxir.LeavePartyOf(Hero);
                    DC(int64(0xb272e6dedc4a2f5a), EConversationDebugInfo::Done);
                    DC(int64(0x570acab4847ebebc), EConversationDebugInfo::Executing);
                    Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_NEW.SucceedQuest();
                    DC(int64(0x570acab4847ebebc), EConversationDebugInfo::Done);
                    DC(int64(0x33e046463a61376c), EConversationDebugInfo::Executing);
                    // Over there! That's the source. Go - see what it is.
                    Myxir.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_164450"));
                    DC(int64(0x33e046463a61376c), EConversationDebugInfo::Done);
                    DC(int64(0x3673fe4e769e6a79), EConversationDebugInfo::Executing);
                    
                    // ... You want me to swim there?
                    Hero.AI.Say(LocText("TEXT_WIP_VEUKWGL_20241205_213811"));
                    DC(int64(0x3673fe4e769e6a79), EConversationDebugInfo::Done);
                    DC(int64(0x3673fe4e769e6a7a), EConversationDebugInfo::Executing);
                    
                    // No. The source is underwater, so you'll have to dive. 
                    Myxir.AI.Say(LocText("TEXT_WIP_VEUKWGL_20241205_213906"));
                    DC(int64(0x3673fe4e769e6a7a), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Myxir_117391,
                        UTopic_Myxir_117523,
                        UTopic_Myxir_117411
                    );
                }
            }
        }
        
        
        class UTopic_Myxir_117391 : UTopic_Hero__NC_KDW_MYXIR_601
        {
            default DebugId = int64(0x33e046463a61372b);
            default Caption = LocText("TEXT_WIP_QMBPECM_20241204_162042_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Myxir_117391);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x33e046463a61372c), EConversationDebugInfo::Executing);
                // Why don't you do it? You're a Water Mage. 
                Hero.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_162042_686"));
                DC(int64(0x33e046463a61372c), EConversationDebugInfo::Done);
                DC(int64(0x33e046463a613733), EConversationDebugInfo::Executing);
                
                // I would if I could, but my lungs aren't what they used ...
                Myxir.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_162047"));
                DC(int64(0x33e046463a613733), EConversationDebugInfo::Done);
                DC(int64(0x3673fe4e769e6a7b), EConversationDebugInfo::Executing);
                
                // Makes sense. One feels for magical vibrations, the other ...
                Hero.AI.Say(LocText("TEXT_WIP_VEUKWGL_20241205_214159"));
                DC(int64(0x3673fe4e769e6a7b), EConversationDebugInfo::Done);
                DC(int64(0x3673fe4e769e6a7c), EConversationDebugInfo::Executing);
                
                // A perfect balance. As it is Adanos' will. 
                Myxir.AI.Say(LocText("TEXT_WIP_VEUKWGL_20241205_214228"));
                DC(int64(0x3673fe4e769e6a7c), EConversationDebugInfo::Done);
                DC(int64(0x33e046463a61372e), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x33e046463a61372e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Myxir_117523 : UTopic_Hero__NC_KDW_MYXIR_601
        {
            default DebugId = int64(0x33e046463a613734);
            default Caption = LocText("TEXT_WIP_QMBPECM_20241204_162121_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Myxir_117523);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x33e046463a613735), EConversationDebugInfo::Executing);
                // What am I looking for? 
                Hero.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_162121_1609"));
                DC(int64(0x33e046463a613735), EConversationDebugInfo::Done);
                DC(int64(0x33e046463a613741), EConversationDebugInfo::Executing);
                
                // Anything magical. A rune, a tome, a weapon ... 
                Myxir.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_162157"));
                DC(int64(0x33e046463a613741), EConversationDebugInfo::Done);
                DC(int64(0x41955848c526fa46), EConversationDebugInfo::Executing);
                // Or maybe it's a water demon! That would be fascinating ...
                Myxir.AI.Say(LocText("TEXT_WIP_IPMSWZD_20241211_161234"));
                DC(int64(0x41955848c526fa46), EConversationDebugInfo::Done);
                DC(int64(0x33e046463a613737), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x33e046463a613737), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Myxir_117411 : UTopic_Hero__NC_KDW_MYXIR_601
        {
            default DebugId = int64(0x33e046463a61372f);
            default Caption = LocText("TEXT_WIP_QMBPECM_20241204_162042_3984");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Myxir_117411);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x33e046463a613730), EConversationDebugInfo::Executing);
                // I'll go take a look. 
                Hero.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_162042_3984"));
                DC(int64(0x33e046463a613730), EConversationDebugInfo::Done);
                DC(int64(0x33e046463a61374b), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x33e046463a61374b), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMyxir117611 : UTopic_Hero__NC_KDW_MYXIR_601
        {
            default DebugId = int64(0x33e046463a61374e);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceMyxir117244);
            default Rules.HideIfKnows(UChoiceMyxir117611);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x33e046463a613751), Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY != nullptr && Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY.IsRunning());
                    DB(int64(0x33e046463a613752), Hero != nullptr && Hero.HasItem(UItMs_Book_WaterMages, 1, 0));
                }
                
                if (Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY != nullptr && !Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItMs_Book_WaterMages, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3673fe4e769e6a7d), EConversationDebugInfo::Executing);
                // You found it!
                Myxir.AI.Say(LocText("TEXT_WIP_VEUKWGL_20241205_215128"));
                DC(int64(0x3673fe4e769e6a7d), EConversationDebugInfo::Done);
                DC(int64(0x33e046463a61374c), EConversationDebugInfo::Executing);
                
                // That's one heavy book.
                Hero.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_162500"));
                DC(int64(0x33e046463a61374c), EConversationDebugInfo::Done);
                DC(int64(0x41955848c526fa47), EConversationDebugInfo::Executing);
                
                // Of course. It's full of secrets and lore!
                Myxir.AI.Say(LocText("TEXT_WIP_IPMSWZD_20241211_161406"));
                DC(int64(0x41955848c526fa47), EConversationDebugInfo::Done);
                DC(int64(0x33e046463a61375d), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Myxir, UItMs_Book_WaterMages, 1);
                DC(int64(0x33e046463a61375d), EConversationDebugInfo::Done);
                DC(int64(0x570acab4847ebb07), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_OBJ_VIBRATIONS.SucceedQuest();
                DC(int64(0x570acab4847ebb07), EConversationDebugInfo::Done);
                DB(int64(0x570acab4847ebd95), Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_NEW != nullptr && Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_NEW.HasSucceeded());
                
                if (Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_NEW != nullptr && Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY_RANKUPMERCENARY_NEW.HasSucceeded())
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_RANKUPMERCENARY, Document::UDocumentSegment_CH3_RANKUPMERCENARY_BookShip);
                }
                else
                {
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_RANKUPMERCENARY, Document::UDocumentSegment_CH3_RANKUPMERCENARY_BookOwn);
                }
                DC(int64(0x33e046463a61375e), EConversationDebugInfo::Executing);
                // At last, the vibrations are in balance. Thank you, my ...
                Myxir.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_163727"));
                DC(int64(0x33e046463a61375e), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Myxir_118520,
                    UTopic_Myxir_124018,
                    UTopic_Myxir_118540
                );
            }
        }
        
        
        class UTopic_Myxir_118520 : UTopic_Hero__NC_KDW_MYXIR_601
        {
            default DebugId = int64(0x33e046463a61381f);
            default Caption = LocText("TEXT_WIP_QMBPECM_20241204_171428_491");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Myxir_118520);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x33e046463a613820), EConversationDebugInfo::Executing);
                // Why is that book still intact? 
                Hero.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_171428_491"));
                DC(int64(0x33e046463a613820), EConversationDebugInfo::Done);
                DC(int64(0x33e046463a613831), EConversationDebugInfo::Executing);
                
                // What do you think?
                Myxir.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_171517"));
                DC(int64(0x33e046463a613831), EConversationDebugInfo::Done);
                DC(int64(0x33e046463a61383b), EConversationDebugInfo::Executing);
                
                // Some kind of protection spell? That's what sent out the ...
                Hero.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_171545"));
                DC(int64(0x33e046463a61383b), EConversationDebugInfo::Done);
                DC(int64(0x33e046463a61383c), EConversationDebugInfo::Executing);
                
                // Well surmised. You are not as hollow as you look. It's a ...
                Myxir.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_171548"));
                DC(int64(0x33e046463a61383c), EConversationDebugInfo::Done);
                DC(int64(0x41955848c526fa48), EConversationDebugInfo::Executing);
                
                // I guess they call it Water Magic for a reason.
                Hero.AI.Say(LocText("TEXT_WIP_IPMSWZD_20241211_161732"));
                DC(int64(0x41955848c526fa48), EConversationDebugInfo::Done);
                DC(int64(0x3673fe4e769e6a88), EConversationDebugInfo::Executing);
                
                // Ha! Indeed. However, this spell is also what keeps this ...
                Myxir.AI.Say(LocText("TEXT_WIP_VEUKWGL_20241205_221251"));
                DC(int64(0x3673fe4e769e6a88), EConversationDebugInfo::Done);
                DC(int64(0x33e046463a61384c), EConversationDebugInfo::Executing);
                
                // I see. 
                Hero.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_171611"));
                DC(int64(0x33e046463a61384c), EConversationDebugInfo::Done);
                DC(int64(0x33e046463a613822), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x33e046463a613822), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Myxir_124018 : UTopic_Hero__NC_KDW_MYXIR_601
        {
            default DebugId = int64(0x3673fe4e769e6a7e);
            default Caption = LocText("TEXT_WIP_VEUKWGL_20241205_220457_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Myxir_124018);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3673fe4e769e6a7f), EConversationDebugInfo::Executing);
                // What is this book? 
                Hero.AI.Say(LocText("TEXT_WIP_VEUKWGL_20241205_220457_2238"));
                DC(int64(0x3673fe4e769e6a7f), EConversationDebugInfo::Done);
                DC(int64(0x3673fe4e769e6a82), EConversationDebugInfo::Executing);
                
                // "The Old Ways of the Druids." A masterpiece. Surely, ...
                Myxir.AI.Say(LocText("TEXT_WIP_VEUKWGL_20241205_220613"));
                DC(int64(0x3673fe4e769e6a82), EConversationDebugInfo::Done);
                DC(int64(0x41955848c526fa49), EConversationDebugInfo::Executing);
                
                // Um ...
                Hero.AI.Say(LocText("TEXT_WIP_IPMSWZD_20241211_161854"));
                DC(int64(0x41955848c526fa49), EConversationDebugInfo::Done);
                DC(int64(0x3673fe4e769e6a83), EConversationDebugInfo::Executing);
                
                // It expounds on the magic of transformation and balance!
                Myxir.AI.Say(LocText("TEXT_WIP_VEUKWGL_20241205_220810"));
                DC(int64(0x3673fe4e769e6a83), EConversationDebugInfo::Done);
                DC(int64(0x3673fe4e769e6a84), EConversationDebugInfo::Executing);
                // Uh, the domain of Adanos! The complex vibrations of ...
                Myxir.AI.Say(LocText("TEXT_WIP_VEUKWGL_20241205_220919"));
                DC(int64(0x3673fe4e769e6a84), EConversationDebugInfo::Done);
                DC(int64(0x3673fe4e769e6a85), EConversationDebugInfo::Executing);
                // Ahh. Thank you, my friend. Thank you from all of us. We ...
                Myxir.AI.Say(LocText("TEXT_WIP_VEUKWGL_20241205_221007"));
                DC(int64(0x3673fe4e769e6a85), EConversationDebugInfo::Done);
                DC(int64(0x3673fe4e769e6a81), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x3673fe4e769e6a81), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Myxir_118540 : UTopic_Hero__NC_KDW_MYXIR_601
        {
            default DebugId = int64(0x33e046463a613823);
            default Caption = LocText("TEXT_WIP_QMBPECM_20241204_171428_3750");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Myxir_118540);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x33e046463a613824), EConversationDebugInfo::Executing);
                // I'm sure you'll let Lee know what a great help I was.
                Hero.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_171428_3750"));
                DC(int64(0x33e046463a613824), EConversationDebugInfo::Done);
                DC(int64(0x33e046463a613827), EConversationDebugInfo::Executing);
                
                // Of course! Adanos smiles upon you.
                Myxir.AI.Say(LocText("TEXT_WIP_QMBPECM_20241204_171445"));
                DC(int64(0x33e046463a613827), EConversationDebugInfo::Done);
                DC(int64(0x3673fe4e769e6a86), EConversationDebugInfo::Executing);
                // I'll inform the general as soon as I'm back at the Camp.
                Myxir.AI.Say(LocText("TEXT_WIP_VEUKWGL_20241205_221150"));
                DC(int64(0x3673fe4e769e6a86), EConversationDebugInfo::Done);
                DC(int64(0x3673fe4e769e6a87), EConversationDebugInfo::Executing);
                // Now it is time to bring that treasure to safety. I'll be ...
                Myxir.AI.Say(LocText("TEXT_WIP_VEUKWGL_20241205_221213"));
                DC(int64(0x3673fe4e769e6a87), EConversationDebugInfo::Done);
                DC(int64(0x33e046463a61377e), EConversationDebugInfo::Executing);
                Myxir.ExchangeDailyRoutineToClass(UDailyRoutine_NC_KDW_Myxir_601_Teleport);
                DC(int64(0x33e046463a61377e), EConversationDebugInfo::Done);
                DC(int64(0xb272e6dedc4a2f56), EConversationDebugInfo::Executing);
                Myxir.AddItemToInventory(UItAr_Rune_TeleportToMagiciansOfWater, 1);
                DC(int64(0xb272e6dedc4a2f56), EConversationDebugInfo::Done);
                DC(int64(0x1f4a84cc2abc7f79), EConversationDebugInfo::Executing);
                G1R.Myxir_Quest_Completed = FInGameTime::Now();
                DC(int64(0x1f4a84cc2abc7f79), EConversationDebugInfo::Done);
                DC(int64(0x33e046463a613781), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x33e046463a613781), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMyxir125219 : UTopic_Hero__NC_KDW_MYXIR_601
        {
            default DebugId = int64(0x3673fe4e769e6a8b);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceMyxir125219);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8959c8b3c1c78526), Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY != nullptr && Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY.HasSucceeded());
                    DB(int64(0xb36435628f92e45a), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY != nullptr && !Quest::NewCamp_NCCHAPTER3_RANKUPMERCENARY.HasSucceeded())
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3673fe4e769e6a8d), EConversationDebugInfo::Executing);
                // Ahh. It is you.
                Myxir.AI.Say(LocText("TEXT_WIP_VEUKWGL_20241205_221650"));
                DC(int64(0x3673fe4e769e6a8d), EConversationDebugInfo::Done);
                DC(int64(0x3673fe4e769e6a89), EConversationDebugInfo::Executing);
                
                // How are things with that book? Have you opened it yet?
                Hero.AI.Say(LocText("TEXT_WIP_VEUKWGL_20241205_221531"));
                DC(int64(0x3673fe4e769e6a89), EConversationDebugInfo::Done);
                DC(int64(0x3673fe4e769e6a8a), EConversationDebugInfo::Executing);
                
                // Unfortunately not. This protection spell is more ...
                Myxir.AI.Say(LocText("TEXT_WIP_VEUKWGL_20241205_221531_1924"));
                DC(int64(0x3673fe4e769e6a8a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMyxir147803 : UTopic_Hero__NC_KDW_MYXIR_601
        {
            default DebugId = int64(0x3f3055364bb57082);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceMyxir147803);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8840daf1ff7c2141), Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN.HasSucceeded());
                    DB(int64(0x9720fc4dba61836a), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning());
                    DB(int64(0x3f3055364bb570b7), Hero != nullptr && !Hero.HasListenedTo(LocText("KDW_600_SATURAS_TIMESUP_INFO_14_00")));
                    DB(int64(0x8840daf1ff7c2140), Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN.IsRunning());
                    DB(int64(0x9720fc4dba61836b), Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning());
                    DB(int64(0x3f3055364bb570cc), Hero != nullptr && !Hero.HasListenedTo(LocText("KDW_600_SATURAS_TIMESUP_INFO_14_00")));
                }
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN.HasSucceeded() && Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning() && Hero != nullptr && !Hero.HasListenedTo(LocText("KDW_600_SATURAS_TIMESUP_INFO_14_00")))
                    return true;
                
                if (Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_FINDORCSHAMAN.IsRunning() && Quest::SleeperTemple_STCHAPTER5_URIZIEL != nullptr && !Quest::SleeperTemple_STCHAPTER5_URIZIEL.IsRunning() && Hero != nullptr && !Hero.HasListenedTo(LocText("KDW_600_SATURAS_TIMESUP_INFO_14_00")))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3f3055364bb57081), EConversationDebugInfo::Executing);
                // You're back ... uh, go see Saturas, right away. He's in ...
                Myxir.AI.Say(LocText("TEXT_WIP_GVXGRO_20250128_151854_1924"));
                DC(int64(0x3f3055364bb57081), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMyxir199713 : UTopic_Hero__NC_KDW_MYXIR_601
        {
            default DebugId = int64(0xf564b5d475ca28f1);
            default Caption = LocText("TEXT_WIP_VKSPTUH_20250711_144303");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceMyxir199713);
            
            default Rules.RequireCharacterCloseToWaypoint(n"NC_KDW_MYXIR_601", n"WP_NC_TREE", 2000.0f, int64(0xf564b5d475ca28f1));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf564b5d475ca28ee), EConversationDebugInfo::Executing);
                
                // What's with the tree?
                Hero.AI.Say(LocText("TEXT_WIP_VKSPTUH_20250711_144303"));
                DC(int64(0xf564b5d475ca28ee), EConversationDebugInfo::Done);
                DC(int64(0xf564b5d475ca28ef), EConversationDebugInfo::Executing);
                
                // Impressive, isn't it? A tree in the middle of a stone ...
                Myxir.AI.Say(LocText("TEXT_WIP_VKSPTUH_20250711_144303_41"));
                DC(int64(0xf564b5d475ca28ef), EConversationDebugInfo::Done);
                DC(int64(0xf564b5d475ca28f4), EConversationDebugInfo::Executing);
                
                // It looks dead, though.
                Hero.AI.Say(LocText("TEXT_WIP_VKSPTUH_20250711_144334"));
                DC(int64(0xf564b5d475ca28f4), EConversationDebugInfo::Done);
                DC(int64(0xf564b5d475ca28f5), EConversationDebugInfo::Executing);
                
                // Yes. It's a miracle it sprouted at all in here - and a ...
                Myxir.AI.Say(LocText("TEXT_WIP_VKSPTUH_20250711_144337"));
                DC(int64(0xf564b5d475ca28f5), EConversationDebugInfo::Done);
                DC(int64(0xf564b5d475ca28f6), EConversationDebugInfo::Executing);
                // We leave it to itself and, who knows, Adanos willing, it ...
                Myxir.AI.Say(LocText("TEXT_WIP_VKSPTUH_20250711_144340"));
                DC(int64(0xf564b5d475ca28f6), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceMyxirExit : UTopic_Hero__NC_KDW_MYXIR_601
        {
            default DebugId = int64(0x34aa0fc8cb7e8cd0);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x34aa0fc8cb7e8cd1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x34aa0fc8cb7e8cd1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */