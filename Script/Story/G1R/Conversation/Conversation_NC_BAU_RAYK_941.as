#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_BAU_RAYK_941 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_BAU_RAYK_941";
        }
        
        
        class UTopic_Hero__NC_BAU_RAYK_941 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_BAU_RAYK_941";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetRayk() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceRayk105842 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0x139e2a0927a4549f);
            default Caption = FText::FromString("[Fallback Topic]");;
            default bIsFallbackTopic = true;
            
            default Rules.HideIfKnows(UChoiceRayk105842);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x139e2a0927a454ba), Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && !Quest::NewCamp_NCCHAPTER1_RICELORDJOB.HasBeenStarted());
                }
                
                return Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && !Quest::NewCamp_NCCHAPTER1_RICELORDJOB.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x139e2a0927a45498), EConversationDebugInfo::Executing);
                // What? Huh? What's your fuckin' problem?
                Rayk.AI.Say(LocText("TEXT_WIP_HACNPYL_20241028_084616_41"));
                DC(int64(0x139e2a0927a45498), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRayk105999 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0x1a83a1c4641505c7);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x139e2a0927a454ea), Hero != nullptr && Hero.IsCloseToCharacter(Rayk, 500.0f));
                    DB(int64(0x4a77db7fbf8207ae), Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && !Quest::NewCamp_NCCHAPTER1_RICELORDJOB.HasSucceeded());
                    DB(int64(0x1a83a1c4641505dd), G1R.Rayk_Mad_BeforeConversation.IsValid() && G1R.Rayk_Mad_BeforeConversation.IsMoreThanXMinutesAgo(1));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Rayk, 500.0f))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDJOB.HasSucceeded())
                    return false;
                
                if (G1R.Rayk_Mad_BeforeConversation.IsValid() && !G1R.Rayk_Mad_BeforeConversation.IsMoreThanXMinutesAgo(1))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0x4afc5885578d8eb8), G1R.Rayk_Mad == 0);
                DB(int64(0x4afc5885578d8ebf), G1R.Rayk_Mad == 1);
                
                if (G1R.Rayk_Mad == 0)
                {
                    DC(int64(0x4afc5885578d8ec1), EConversationDebugInfo::Executing);
                    // What are YOU lookin' at?
                    Rayk.AI.Say(LocText("TEXT_WIP_YOVLFV_20241104_172744_41"));
                    DC(int64(0x4afc5885578d8ec1), EConversationDebugInfo::Done);
                    DC(int64(0x4afc5885578d8f21), EConversationDebugInfo::Executing);
                    G1R.Rayk_Mad += 1;
                    DC(int64(0x4afc5885578d8f21), EConversationDebugInfo::Done);
                }
                else if (G1R.Rayk_Mad == 1)
                {
                    DC(int64(0x4afc5885578d8ec9), EConversationDebugInfo::Executing);
                    // Bloody flesh maggot fuckers ...
                    Rayk.AI.Say(LocText("TEXT_WIP_YOVLFV_20241104_172755_2083"));
                    DC(int64(0x4afc5885578d8ec9), EConversationDebugInfo::Done);
                    DC(int64(0x4afc5885578d8f40), EConversationDebugInfo::Executing);
                    G1R.Rayk_Mad += 1;
                    DC(int64(0x4afc5885578d8f40), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x4afc5885578d8efb), EConversationDebugInfo::Executing);
                    // Was your mother a molerat, or was she just THAT ugly?
                    Rayk.AI.Say(LocText("TEXT_WIP_YOVLFV_20241104_172816_2238"));
                    DC(int64(0x4afc5885578d8efb), EConversationDebugInfo::Done);
                    DC(int64(0x4afc5885578d8f4b), EConversationDebugInfo::Executing);
                    G1R.Rayk_Mad = 0;
                    DC(int64(0x4afc5885578d8f4b), EConversationDebugInfo::Done);
                }
                DC(int64(0x4afc5885578d8f56), EConversationDebugInfo::Executing);
                G1R.Rayk_Mad_BeforeConversation = FInGameTime::Now();
                DC(int64(0x4afc5885578d8f56), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRayk78033 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0x70be289386490835);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            default Rules.HideIfKnows(UChoiceRayk78033);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x139e2a0927a454ba), Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDJOB.HasBeenStarted());
                }
                
                return Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDJOB.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x70be289386490834), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x70be289386490834), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRayk78049 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0x70be289386490839);
            default Caption = LocText("TEXT_DDIAZ_20240205_114026_41");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceRayk78049);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_DDIAZ_20240205_160425_41"), int64(0x70be289386490839));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc937a22c9f0120e8), Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDJOB.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDJOB.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x70be289386490837), EConversationDebugInfo::Executing);
                // Cut that out, will you?
                Hero.AI.Say(LocText("TEXT_DDIAZ_20240205_114026_41"));
                DC(int64(0x70be289386490837), EConversationDebugInfo::Done);
                DC(int64(0x70be289386490838), EConversationDebugInfo::Executing);
                
                // Or what? Little freshie gonna beat me up?
                Rayk.AI.Say(LocText("TEXT_DDIAZ_20240205_114026_2083"));
                DC(int64(0x70be289386490838), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_RAYK, Document::UDocumentSegment_Glossary_NC_BAU_RAYK_Introduction);
                Subdialog(
                    UTopic_Rayk_79097,
                    UTopic_Rayk_79117,
                    UTopic_Rayk_79767
                );
            }
        }
        
        
        class UTopic_Rayk_79097 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0x70be289386490888);
            default Caption = LocText("TEXT_DDIAZ_20240205_133702_731");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Rayk_79097);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x70be289386490889), EConversationDebugInfo::Executing);
                // That's right. This "little freshie" will kick your ass ...
                Hero.AI.Say(LocText("TEXT_DDIAZ_20240205_133702_731"));
                DC(int64(0x70be289386490889), EConversationDebugInfo::Done);
                DC(int64(0x552c413efca2d07), EConversationDebugInfo::Executing);
                
                // You-
                Rayk.AI.Say(LocText("TEXT_WIP_IIRELLM_20240207_121910"), Posture = GameplayTag::Posture_Standing_Neutral);
                DC(int64(0x552c413efca2d07), EConversationDebugInfo::Done);
                DC(int64(0x650859467163d7b2), EConversationDebugInfo::Executing);
                // Gaaaah!
                Rayk.AI.Say(LocText("TEXT_WIP_YFHDBGC_20240304_193135"));
                DC(int64(0x650859467163d7b2), EConversationDebugInfo::Done);
                DC(int64(0x9dc6f21bc5b718d7), EConversationDebugInfo::Executing);
                Rayk.AI.StartFightCustomWithFists(Hero, GameplayTag::AIConflict_FightType_Petty, GameplayTag::AIConflict_FightGoal_Defeat, GameplayTag::AIConflict_Duration_UntilDefeated);
                DC(int64(0x9dc6f21bc5b718d7), EConversationDebugInfo::Done);
                DC(int64(0x70be28938649083d), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x70be28938649083d), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Rayk_79117 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0x70be28938649088c);
            default Caption = LocText("TEXT_DDIAZ_20240205_133702_3719");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Rayk_79117);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x70be28938649088d), EConversationDebugInfo::Executing);
                // What's your problem? 
                Hero.AI.Say(LocText("TEXT_DDIAZ_20240205_133702_3719"));
                DC(int64(0x70be28938649088d), EConversationDebugInfo::Done);
                DC(int64(0x552c413efca2d08), EConversationDebugInfo::Executing);
                
                // You're my problem! Get outta my face, or I'll fuckin' ...
                Rayk.AI.Say(LocText("TEXT_WIP_IIRELLM_20240207_121959"), Posture = GameplayTag::Posture_Standing_Forced_Drunk01);
                DC(int64(0x552c413efca2d08), EConversationDebugInfo::Done);
                DC(int64(0x70be28938649088f), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x70be28938649088f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Rayk_79767 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0x552c413efca2cf5);
            default Caption = LocText("TEXT_WIP_IIRELLM_20240207_115803_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Rayk_79767);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x552c413efca2cfa), Hero != nullptr && Hero.HasSaid(LocText("TEXT_DDIAZ_20240205_133702_3719")));
                }
                
                return Hero != nullptr && Hero.HasSaid(LocText("TEXT_DDIAZ_20240205_133702_3719"));
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x552c413efca2cf6), EConversationDebugInfo::Executing);
                // Don't be an idiot. Why don't I buy you a beer and we ...
                Hero.AI.Say(LocText("TEXT_WIP_IIRELLM_20240207_115803_41"));
                DC(int64(0x552c413efca2cf6), EConversationDebugInfo::Done);
                DC(int64(0x552c413efca2cfb), EConversationDebugInfo::Executing);
                
                // Ha! That much of a coward, are you?
                Rayk.AI.Say(LocText("TEXT_WIP_IIRELLM_20240207_115851"), Posture = GameplayTag::Posture_Standing_Neutral);
                DC(int64(0x552c413efca2cfb), EConversationDebugInfo::Done);
                DC(int64(0x650859467163d7b4), EConversationDebugInfo::Executing);
                
                // No. Just not in the mood for a fight. 
                Hero.AI.Say(LocText("TEXT_WIP_YFHDBGC_20240304_193519"));
                DC(int64(0x650859467163d7b4), EConversationDebugInfo::Done);
                DC(int64(0x650859467163d7b5), EConversationDebugInfo::Executing);
                
                // I ... huh. Well, I guess a beer ain't gonna hurt. But ...
                Rayk.AI.Say(LocText("TEXT_WIP_YFHDBGC_20240304_193528"));
                DC(int64(0x650859467163d7b5), EConversationDebugInfo::Done);
                DC(int64(0x650859467163d7b6), EConversationDebugInfo::Executing);
                
                // I'll survive.
                Hero.AI.Say(LocText("TEXT_WIP_YFHDBGC_20240304_193607"));
                DC(int64(0x650859467163d7b6), EConversationDebugInfo::Done);
                DC(int64(0x70be28938649084e), EConversationDebugInfo::Executing);
                Rayk.ExchangeDailyRoutineToClass(UDailyRoutine_NC_BAU_Rayk_941_Outside);
                DC(int64(0x70be28938649084e), EConversationDebugInfo::Done);
                DC(int64(0x552c413efca2d06), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x552c413efca2d06), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRayk78445 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0x70be289386490851);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::CloseRange;
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Rayk_79767);
            default Rules.HideIfKnows(UChoiceRayk78445);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_NC_STANDAROUND_RAYK", 150.0f, int64(0x70be289386490851));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x70be289386490850), EConversationDebugInfo::Executing);
                // So? Where's that beer?
                Rayk.AI.Say(LocText("TEXT_DDIAZ_20240205_120242_2386"));
                DC(int64(0x70be289386490850), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_RAYK, Document::UDocumentSegment_Glossary_NC_BAU_RAYK_Useful);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RICELORDJOB, Document::UDocumentSegment_CH1_RICELORDJOB_Peaceful);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_RAYK, Document::UDocumentSegment_Glossary_NC_BAU_RAYK_Backstory);
                Subdialog(
                    UTopic_Rayk_81238,
                    UTopic_Rayk_81258,
                    UTopic_Rayk_81284,
                    UTopic_Rayk_81306,
                    UTopic_Rayk_81326
                );
                DC(int64(0x650859467163d7b9), EConversationDebugInfo::Executing);
                // That wasn't bad. Thanks.
                Rayk.AI.Say(LocText("TEXT_WIP_YFHDBGC_20240304_194047"));
                DC(int64(0x650859467163d7b9), EConversationDebugInfo::Done);
                DC(int64(0xeb67f06250d6d4db), EConversationDebugInfo::Executing);
                
                // Sure. Are you gonna stop bothering the guests now?
                Hero.AI.Say(LocText("TEXT_DDIAZ_20240205_161716"));
                DC(int64(0xeb67f06250d6d4db), EConversationDebugInfo::Done);
                DC(int64(0xeb67f06250d6d4dc), EConversationDebugInfo::Executing);
                
                // Hey, I ... I wasn't tryin' to be an arse, y'know? It's ...
                Rayk.AI.Say(LocText("TEXT_DDIAZ_20240205_161716_2785"));
                DC(int64(0xeb67f06250d6d4dc), EConversationDebugInfo::Done);
                DC(int64(0x650859467163d7bb), EConversationDebugInfo::Executing);
                
                // Maybe.
                Hero.AI.Say(LocText("TEXT_WIP_YFHDBGC_20240304_194306"));
                DC(int64(0x650859467163d7bb), EConversationDebugInfo::Done);
                DC(int64(0x70be289386490878), EConversationDebugInfo::Executing);
                
                // Can't blame you. I ain't always been like that, y'know? ...
                Rayk.AI.Say(LocText("TEXT_DDIAZ_20240205_122333_491"));
                DC(int64(0x70be289386490878), EConversationDebugInfo::Done);
                DC(int64(0x650859467163d7bc), EConversationDebugInfo::Executing);
                
                // Hakon - the Rice Lord?
                Hero.AI.Say(LocText("TEXT_WIP_YFHDBGC_20240304_194439"));
                DC(int64(0x650859467163d7bc), EConversationDebugInfo::Done);
                DC(int64(0x70be289386490879), EConversationDebugInfo::Executing);
                
                // Yeah. He's a bastard - pretends to be your friend, but ...
                Rayk.AI.Say(LocText("TEXT_DDIAZ_20240205_122502"));
                DC(int64(0x70be289386490879), EConversationDebugInfo::Done);
                DC(int64(0x70be28938649087b), EConversationDebugInfo::Executing);
                // We were equals! Built that barn together, hired the ...
                Rayk.AI.Say(LocText("TEXT_DDIAZ_20240205_122548"));
                DC(int64(0x70be28938649087b), EConversationDebugInfo::Done);
                DC(int64(0x70be28938649087c), EConversationDebugInfo::Executing);
                // Then, one day, just as we got the show runnin', one of ...
                Rayk.AI.Say(LocText("TEXT_DDIAZ_20240205_122625"));
                DC(int64(0x70be28938649087c), EConversationDebugInfo::Done);
                DC(int64(0xe6263f0bcd03c99), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_RAYK.SucceedQuest();
                DC(int64(0xe6263f0bcd03c99), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Rayk_85620,
                    UTopic_Rayk_85640,
                    UTopic_Rayk_85901,
                    UTopic_Rayk_86514
                );
            }
        }
        
        
        class UTopic_Rayk_81238 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0x653d12cc4be395fa);
            default Caption = LocText("TEXT_WIP_IIRELLM_20240207_120104");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Rayk_81238);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x653d12cc4be39614), Hero != nullptr && Hero.HasItem(UItFo_Potion_Booze, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItFo_Potion_Booze, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x552c413efca2cfd), EConversationDebugInfo::Executing);
                // Actually, how about some rice schnapps instead?
                Hero.AI.Say(LocText("TEXT_WIP_IIRELLM_20240207_120104"));
                DC(int64(0x552c413efca2cfd), EConversationDebugInfo::Done);
                DC(int64(0x552c413efca2cfe), EConversationDebugInfo::Executing);
                
                // Hmm ... well, why not. Pass it over. 
                Rayk.AI.Say(LocText("TEXT_WIP_IIRELLM_20240207_120104_2083"));
                DC(int64(0x552c413efca2cfe), EConversationDebugInfo::Done);
                DC(int64(0x552c413efca2d01), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Rayk, UItFo_Potion_Booze, 1);
                DC(int64(0x552c413efca2d01), EConversationDebugInfo::Done);
                DC(int64(0x552c413efca2d03), EConversationDebugInfo::Executing);
                Rayk.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_Drink, 9);
                DC(int64(0x552c413efca2d03), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Rayk_81258 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0x653d12cc4be395fe);
            default Caption = LocText("TEXT_DDIAZ_20240205_121419");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Rayk_81258);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x653d12cc4be39616), Hero != nullptr && Hero.HasItem(UItFo_Potion_Wine, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItFo_Potion_Wine, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x70be289386490864), EConversationDebugInfo::Executing);
                // I have some wine instead.
                Hero.AI.Say(LocText("TEXT_DDIAZ_20240205_121419"));
                DC(int64(0x70be289386490864), EConversationDebugInfo::Done);
                DC(int64(0x70be289386490865), EConversationDebugInfo::Executing);
                
                // Ha! Feelin' all fancy, are we?
                Rayk.AI.Say(LocText("TEXT_DDIAZ_20240205_121419_443"));
                DC(int64(0x70be289386490865), EConversationDebugInfo::Done);
                DC(int64(0x650859467163d7b7), EConversationDebugInfo::Executing);
                
                // You want it or not?
                Hero.AI.Say(LocText("TEXT_WIP_YFHDBGC_20240304_193813"));
                DC(int64(0x650859467163d7b7), EConversationDebugInfo::Done);
                DC(int64(0x650859467163d7b8), EConversationDebugInfo::Executing);
                
                // ... Sure.
                Rayk.AI.Say(LocText("TEXT_WIP_YFHDBGC_20240304_193816"));
                DC(int64(0x650859467163d7b8), EConversationDebugInfo::Done);
                DC(int64(0x70be289386490869), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Rayk, UItFo_Potion_Wine, 1);
                DC(int64(0x70be289386490869), EConversationDebugInfo::Done);
                DC(int64(0x70be28938649086d), EConversationDebugInfo::Executing);
                Rayk.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_Drink, 9);
                DC(int64(0x70be28938649086d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Rayk_81284 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0x653d12cc4be39604);
            default Caption = LocText("TEXT_DDIAZ_20240205_121345");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Rayk_81284);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x653d12cc4be39618), Hero != nullptr && Hero.HasItem(UItFo_Potion_Strongbeer, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItFo_Potion_Strongbeer, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x70be289386490862), EConversationDebugInfo::Executing);
                // How's that? It's stronger than the usual swill.
                Hero.AI.Say(LocText("TEXT_DDIAZ_20240205_121345"));
                DC(int64(0x70be289386490862), EConversationDebugInfo::Done);
                DC(int64(0x70be289386490863), EConversationDebugInfo::Executing);
                
                // Hmm ... Midlands Dark, ain't it? That's nice. 
                Rayk.AI.Say(LocText("TEXT_DDIAZ_20240205_121345_2801"));
                DC(int64(0x70be289386490863), EConversationDebugInfo::Done);
                DC(int64(0x70be289386490867), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Rayk, UItFo_Potion_Strongbeer, 1);
                DC(int64(0x70be289386490867), EConversationDebugInfo::Done);
                DC(int64(0x70be28938649086b), EConversationDebugInfo::Executing);
                Rayk.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_Drink, 9);
                DC(int64(0x70be28938649086b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Rayk_81306 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0x653d12cc4be39609);
            default Caption = LocText("TEXT_DDIAZ_20240205_120717");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Rayk_81306);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x653d12cc4be3961a), Hero != nullptr && Hero.HasItem(UItFo_Potion_Beer, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItFo_Potion_Beer, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x70be28938649085c), EConversationDebugInfo::Executing);
                // Here you go. 
                Hero.AI.Say(LocText("TEXT_DDIAZ_20240205_120717"));
                DC(int64(0x70be28938649085c), EConversationDebugInfo::Done);
                DC(int64(0x70be28938649085d), EConversationDebugInfo::Executing);
                
                // Hmm.
                Rayk.AI.Say(LocText("TEXT_DDIAZ_20240205_120717_3569"));
                DC(int64(0x70be28938649085d), EConversationDebugInfo::Done);
                DC(int64(0x70be28938649085f), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Rayk, UItFo_Potion_Beer, 1);
                DC(int64(0x70be28938649085f), EConversationDebugInfo::Done);
                DC(int64(0x70be289386490861), EConversationDebugInfo::Executing);
                Rayk.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_Drink, 9);
                DC(int64(0x70be289386490861), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Rayk_81326 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0x653d12cc4be3960d);
            default Caption = LocText("TEXT_DDIAZ_20240205_121729");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Rayk_81326);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x70be289386490870), EConversationDebugInfo::Executing);
                // Come to think of it, I don't have any. Just stop being a ...
                Hero.AI.Say(LocText("TEXT_DDIAZ_20240205_121729"));
                DC(int64(0x70be289386490870), EConversationDebugInfo::Done);
                DC(int64(0x70be289386490871), EConversationDebugInfo::Executing);
                
                // You ... This is some joke to you, eh? I'll fuckin' show ...
                Rayk.AI.Say(LocText("TEXT_DDIAZ_20240205_121750"));
                DC(int64(0x70be289386490871), EConversationDebugInfo::Done);
                DC(int64(0x9dc6f21bc5b718d7), EConversationDebugInfo::Executing);
                Rayk.AI.StartFightCustomWithFists(Hero, GameplayTag::AIConflict_FightType_Petty, GameplayTag::AIConflict_FightGoal_Defeat, GameplayTag::AIConflict_Duration_UntilDefeated);
                DC(int64(0x9dc6f21bc5b718d7), EConversationDebugInfo::Done);
                DC(int64(0x70be289386490876), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x70be289386490876), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Rayk_85620 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0x650859467163d7be);
            default Caption = LocText("TEXT_WIP_YFHDBGC_20240304_194841_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Rayk_85620);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x650859467163d7bf), EConversationDebugInfo::Executing);
                // He backstabbed you?
                Hero.AI.Say(LocText("TEXT_WIP_YFHDBGC_20240304_194841_2238"));
                DC(int64(0x650859467163d7bf), EConversationDebugInfo::Done);
                DC(int64(0x650859467163d7c7), EConversationDebugInfo::Executing);
                
                // No. He took that fuckin' sickle and shoved it right up ...
                Rayk.AI.Say(LocText("TEXT_WIP_YFHDBGC_20240304_194908"));
                DC(int64(0x650859467163d7c7), EConversationDebugInfo::Done);
                DC(int64(0x650859467163d7c8), EConversationDebugInfo::Executing);
                // Even then, I didn't wanna believe it. 
                Rayk.AI.Say(LocText("TEXT_WIP_YFHDBGC_20240304_194932"));
                DC(int64(0x650859467163d7c8), EConversationDebugInfo::Done);
                DC(int64(0x650859467163d7c1), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x650859467163d7c1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Rayk_85640 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0x650859467163d7c2);
            default Caption = LocText("TEXT_WIP_YFHDBGC_20240304_194841_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Rayk_85640);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x650859467163d7c3), EConversationDebugInfo::Executing);
                // You ever tried to talk it out?
                Hero.AI.Say(LocText("TEXT_WIP_YFHDBGC_20240304_194841_2785"));
                DC(int64(0x650859467163d7c3), EConversationDebugInfo::Done);
                DC(int64(0x650859467163d7cd), EConversationDebugInfo::Executing);
                
                // Hah...How dumb you think I am? 'Course I did. He just ...
                Rayk.AI.Say(LocText("TEXT_WIP_YFHDBGC_20240304_195059"));
                DC(int64(0x650859467163d7cd), EConversationDebugInfo::Done);
                DC(int64(0x650859467163d7cc), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x650859467163d7cc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Rayk_85901 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0x650859467163d7c9);
            default Caption = LocText("TEXT_WIP_YFHDBGC_20240304_195038_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Rayk_85901);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x650859467163d7ca), EConversationDebugInfo::Executing);
                // You shouldn't have trusted him.
                Hero.AI.Say(LocText("TEXT_WIP_YFHDBGC_20240304_195038_3436"));
                DC(int64(0x650859467163d7ca), EConversationDebugInfo::Done);
                DC(int64(0x650859467163d7cf), EConversationDebugInfo::Executing);
                
                // Yeah, yeah. Hindsight's a fuckin' oracle, ain't she?
                Rayk.AI.Say(LocText("TEXT_WIP_YFHDBGC_20240304_195237"));
                DC(int64(0x650859467163d7cf), EConversationDebugInfo::Done);
                DC(int64(0x650859467163d7d0), EConversationDebugInfo::Executing);
                // Anyway, tell Silas I ain't gonna bother his guests no ...
                Rayk.AI.Say(LocText("TEXT_WIP_YFHDBGC_20240304_195253"));
                DC(int64(0x650859467163d7d0), EConversationDebugInfo::Done);
                DC(int64(0x650859467163d7c6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x650859467163d7c6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Rayk_86514 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0x650859467163d7d1);
            default Caption = LocText("TEXT_WIP_YFHDBGC_20240304_195311_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Rayk_86514);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x650859467163d7d2), EConversationDebugInfo::Executing);
                // Sorry about that.
                Hero.AI.Say(LocText("TEXT_WIP_YFHDBGC_20240304_195311_3286"));
                DC(int64(0x650859467163d7d2), EConversationDebugInfo::Done);
                DC(int64(0x650859467163d7d5), EConversationDebugInfo::Executing);
                
                // Nah, don't be. I was an idiot. Now I know better.
                Rayk.AI.Say(LocText("TEXT_WIP_YFHDBGC_20240304_195321"));
                DC(int64(0x650859467163d7d5), EConversationDebugInfo::Done);
                DC(int64(0x650859467163d7d6), EConversationDebugInfo::Executing);
                // Anyway, tell Silas I ain't gonna bother his guests no ...
                Rayk.AI.Say(LocText("TEXT_WIP_YFHDBGC_20240304_195253"));
                DC(int64(0x650859467163d7d6), EConversationDebugInfo::Done);
                DC(int64(0x650859467163d7c6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x650859467163d7c6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRayk78827 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0x27a602e51aadf26);
            default Caption = LocText("TEXT_DDIAZ_20240206_113555");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceRayk78827);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_YFHDBGC_20240304_194047"), int64(0x27a602e51aadf26));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x27a602e51aadf24), EConversationDebugInfo::Executing);
                // Anything else I can do for you?
                Hero.AI.Say(LocText("TEXT_DDIAZ_20240206_113555"));
                DC(int64(0x27a602e51aadf24), EConversationDebugInfo::Done);
                DC(int64(0x27a602e51aadf25), EConversationDebugInfo::Executing);
                
                // Nah, I'm good. Thanks for that drink, though. 
                Rayk.AI.Say(LocText("TEXT_DDIAZ_20240206_113555_2785"));
                DC(int64(0x27a602e51aadf25), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_RAYK, Document::UDocumentSegment_Glossary_NC_BAU_RAYK_Useful);
            }
        }
        
        
        class UChoiceRayk78997 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0x70be28938649087f);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceRayk78997);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_DDIAZ_20240205_160425_41"), int64(0x70be28938649087f));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc937a22c9f0120eb), Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDJOB.IsRunning());
                    DB(int64(0x9dc6f21bc5b7190a), Hero != nullptr && Hero.HasRecentlyDefeated(Rayk));
                }
                
                if (Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && !Quest::NewCamp_NCCHAPTER1_RICELORDJOB.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.HasRecentlyDefeated(Rayk))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x70be28938649087e), EConversationDebugInfo::Executing);
                // All right, all right! You won ... Hope you feel better ...
                Rayk.AI.Say(LocText("TEXT_DDIAZ_20240205_122718_2995"));
                DC(int64(0x70be28938649087e), EConversationDebugInfo::Done);
                DC(int64(0xf5cfc80fce8045be), EConversationDebugInfo::Executing);
                // Tell Silas I ain't gonna bother him no more.
                Rayk.AI.Say(LocText("TEXT_WIP_KVXAWSC_20240412_100242"));
                DC(int64(0xf5cfc80fce8045be), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RICELORDJOB, Document::UDocumentSegment_CH1_RICELORDJOB_Violent);
                DC(int64(0x70be289386490886), EConversationDebugInfo::Executing);
                Rayk.ExchangeDailyRoutineToClass(UDailyRoutine_NC_BAU_Rayk_941_Sleep);
                DC(int64(0x70be289386490886), EConversationDebugInfo::Done);
                DC(int64(0xcf584b8ed87279b4), EConversationDebugInfo::Executing);
                G1R.RaykBeated = 1;
                DC(int64(0xcf584b8ed87279b4), EConversationDebugInfo::Done);
                DC(int64(0xe6263f0bcd03c8a), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_RAYK.SucceedQuest();
                DC(int64(0xe6263f0bcd03c8a), EConversationDebugInfo::Done);
                DC(int64(0x70be289386490883), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x70be289386490883), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRayk80131 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0x6479c34d94ad63c5);
            default Caption = LocText("TEXT_WIP_CIRELLM_20240209_111550");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceRayk80131);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_MFHDBGC_20240308_215053"), int64(0x6479c34d94ad63c5));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x132d36919eee4a1c), Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning());
                    DB(int64(0xff5f0336714a5edd), G1R.RaykBeated == 1);
                }
                
                if (Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && !Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning())
                    return false;
                
                if (G1R.RaykBeated != 1)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6479c34d94ad63c3), EConversationDebugInfo::Executing);
                // You wouldn't know a way into Silas's basement, would ...
                Hero.AI.Say(LocText("TEXT_WIP_CIRELLM_20240209_111550"));
                DC(int64(0x6479c34d94ad63c3), EConversationDebugInfo::Done);
                DC(int64(0x6479c34d94ad63c4), EConversationDebugInfo::Executing);
                
                // Nah. And even if I did, I wouldn't tell YOU. 
                Rayk.AI.Say(LocText("TEXT_WIP_CIRELLM_20240209_111550_41"));
                DC(int64(0x6479c34d94ad63c4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRayk80484 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0xdee782bb14339743);
            default Caption = LocText("TEXT_WIP_WOQQDM_20260713_111241_3487");
            default PriorityRank = 3;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_AGXCIAC_20240904_184115"), int64(0xdee782bb14339743));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_MIWVLHC_20240311_191249"), int64(0xdee782bb14339743));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdee782bb1433973f), EConversationDebugInfo::Executing);
                
                // Fine. Here.
                Hero.AI.Say(LocText("TEXT_WIP_CIRELLM_20240209_123222"));
                DC(int64(0xdee782bb1433973f), EConversationDebugInfo::Done);
                DB(int64(0xdee782bb14339746), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 30, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 30, 0))
                {
                    DC(int64(0xdee782bb1433974b), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Rayk, UItMi_Orenugget, 30);
                    DC(int64(0xdee782bb1433974b), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RICELORDFOREMAN, Document::UDocumentSegment_CH1_RICELORDFOREMAN_SecretEntry);
                    DC(int64(0xdee782bb1433974f), EConversationDebugInfo::Executing);
                    // Ahh! It's ALL comin' back to me now! So, what business ...
                    Rayk.AI.Say(LocText("TEXT_WIP_CIRELLM_20240209_123650_3286"));
                    DC(int64(0xdee782bb1433974f), EConversationDebugInfo::Done);
                    DC(int64(0xdee782bb14339750), EConversationDebugInfo::Executing);
                    
                    // Jacko told Bran about a stash Silas keeps in his cellar. ...
                    Hero.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_164951"));
                    DC(int64(0xdee782bb14339750), EConversationDebugInfo::Done);
                    DC(int64(0xdee782bb14339751), EConversationDebugInfo::Executing);
                    
                    // Huh ... well, ain't that strange. Yeah, I know another ...
                    Rayk.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_164957"));
                    DC(int64(0xdee782bb14339751), EConversationDebugInfo::Done);
                    DC(int64(0xfff29c9395e1bdc7), EConversationDebugInfo::Executing);
                    // You can get in through the lake. It's a steep dive, but ...
                    Rayk.AI.Say(LocText("TEXT_WIP_MIWVLHC_20240311_191249"));
                    DC(int64(0xfff29c9395e1bdc7), EConversationDebugInfo::Done);
                    DC(int64(0xe926a02ce57df45b), EConversationDebugInfo::Executing);
                    
                    // Got it.
                    Hero.AI.Say(LocText("TEXT_WIP_CIRELLM_20240209_125100_2238"));
                    DC(int64(0xe926a02ce57df45b), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_rayk_80484_exit_1");
                    DC(int64(0xe926a02ce57df45c), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xe926a02ce57df45c), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xfff29c9395e1bdc6), EConversationDebugInfo::Executing);
                    // Here what? Come back when you have it.
                    Rayk.AI.Say(LocText("TEXT_WIP_MIWVLHC_20240311_191537"));
                    DC(int64(0xfff29c9395e1bdc6), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_rayk_80484_exit_2");
                    DC(int64(0xdee782bb14339749), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xdee782bb14339749), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceRayk80850 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0x6479c34d94ad63d8);
            default Caption = LocText("TEXT_WIP_CIRELLM_20240209_120705_2238");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRayk80131);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_AGXCIAC_20240904_184115"), int64(0x6479c34d94ad63d8));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6479c34d94ad63cd), EConversationDebugInfo::Executing);
                // How about a beer to clear the air?
                Hero.AI.Say(LocText("TEXT_WIP_CIRELLM_20240209_120705_2238"));
                DC(int64(0x6479c34d94ad63cd), EConversationDebugInfo::Done);
                DB(int64(0x6479c34d94ad63e0), Hero != nullptr && Hero.HasItem(UItFo_Potion_Beer, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItFo_Potion_Beer, 1, 0))
                {
                    DC(int64(0x6479c34d94ad63e2), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Rayk, UItFo_Potion_Beer, 1);
                    DC(int64(0x6479c34d94ad63e2), EConversationDebugInfo::Done);
                    DC(int64(0xdee782bb1433973c), EConversationDebugInfo::Executing);
                    // Hmm ... all right, forgiven and forgotten. 
                    Rayk.AI.Say(LocText("TEXT_WIP_CIRELLM_20240209_120859"));
                    DC(int64(0xdee782bb1433973c), EConversationDebugInfo::Done);
                    DC(int64(0xdee782bb1433973e), EConversationDebugInfo::Executing);
                    // As for that thing about the basement ... I don't know. ...
                    Rayk.AI.Say(LocText("TEXT_WIP_CIRELLM_20240209_123010"));
                    DC(int64(0xdee782bb1433973e), EConversationDebugInfo::Done);
                    DC(int64(0x162ad6fd32a9db85), EConversationDebugInfo::Executing);
                    // Maybe a few more nuggets would help.
                    Rayk.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_184115"));
                    DC(int64(0x162ad6fd32a9db85), EConversationDebugInfo::Done);
                    DC(int64(0x162ad6fd32a9db86), EConversationDebugInfo::Executing);
                    
                    // You've got to be joking.
                    Hero.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_184120"));
                    DC(int64(0x162ad6fd32a9db86), EConversationDebugInfo::Done);
                    DC(int64(0x162ad6fd32a9db87), EConversationDebugInfo::Executing);
                    
                    // Well ...
                    Rayk.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_184124"));
                    DC(int64(0x162ad6fd32a9db87), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_rayk_80850_exit_1");
                }
                else
                {
                    DC(int64(0x6479c34d94ad63e3), EConversationDebugInfo::Executing);
                    // I don't see nothin' ...
                    Rayk.AI.Say(LocText("TEXT_WIP_CIRELLM_20240209_121510"));
                    DC(int64(0x6479c34d94ad63e3), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_rayk_80850_exit_2");
                    DC(int64(0x6479c34d94ad63e5), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x6479c34d94ad63e5), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceRayk80853 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0x6479c34d94ad63da);
            default Caption = LocText("TEXT_WIP_WOQQDM_20260713_103614_3853");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRayk80131);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_AGXCIAC_20240904_184115"), int64(0x6479c34d94ad63da));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6479c34d94ad63d1), EConversationDebugInfo::Executing);
                // How about a little something to clear the air?
                Hero.AI.Say(LocText("TEXT_WIP_CIRELLM_20240209_120705_2785"));
                DC(int64(0x6479c34d94ad63d1), EConversationDebugInfo::Done);
                DB(int64(0x6479c34d94ad63f7), Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMi_Orenugget, 10, 0))
                {
                    DC(int64(0xdee782bb14339739), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Rayk, UItMi_Orenugget, 10);
                    DC(int64(0xdee782bb14339739), EConversationDebugInfo::Done);
                    DC(int64(0xdee782bb1433973c), EConversationDebugInfo::Executing);
                    // Hmm ... all right, forgiven and forgotten. 
                    Rayk.AI.Say(LocText("TEXT_WIP_CIRELLM_20240209_120859"));
                    DC(int64(0xdee782bb1433973c), EConversationDebugInfo::Done);
                    DC(int64(0xdee782bb1433973e), EConversationDebugInfo::Executing);
                    // As for that thing about the basement ... I don't know. ...
                    Rayk.AI.Say(LocText("TEXT_WIP_CIRELLM_20240209_123010"));
                    DC(int64(0xdee782bb1433973e), EConversationDebugInfo::Done);
                    DC(int64(0x162ad6fd32a9db85), EConversationDebugInfo::Executing);
                    // Maybe a few more nuggets would help.
                    Rayk.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_184115"));
                    DC(int64(0x162ad6fd32a9db85), EConversationDebugInfo::Done);
                    DC(int64(0x162ad6fd32a9db86), EConversationDebugInfo::Executing);
                    
                    // You've got to be joking.
                    Hero.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_184120"));
                    DC(int64(0x162ad6fd32a9db86), EConversationDebugInfo::Done);
                    DC(int64(0x162ad6fd32a9db87), EConversationDebugInfo::Executing);
                    
                    // Well ...
                    Rayk.AI.Say(LocText("TEXT_WIP_AGXCIAC_20240904_184124"));
                    DC(int64(0x162ad6fd32a9db87), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_rayk_80853_exit_1");
                }
                else
                {
                    DC(int64(0xdee782bb14339735), EConversationDebugInfo::Executing);
                    // Maybe. If you HAD them.
                    Rayk.AI.Say(LocText("TEXT_WIP_CIRELLM_20240209_122747"));
                    DC(int64(0xdee782bb14339735), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_rayk_80853_exit_2");
                    DC(int64(0xdee782bb14339737), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xdee782bb14339737), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceRayk80872 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0xda8110e5f4b18b12);
            default Caption = LocText("TEXT_WIP_VHHDWEM_20240208_160640");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceRayk80872);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_DDIAZ_20240206_113555_2785"), int64(0xda8110e5f4b18b12));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_MFHDBGC_20240308_215053"), int64(0xda8110e5f4b18b12));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x132d36919eee4a1d), Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xda8110e5f4b18b10), EConversationDebugInfo::Executing);
                // You got a moment?
                Hero.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_160640"));
                DC(int64(0xda8110e5f4b18b10), EConversationDebugInfo::Done);
                DC(int64(0xda8110e5f4b18b11), EConversationDebugInfo::Executing);
                
                // Sure, mate. What is it?
                Rayk.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_160640_3569"));
                DC(int64(0xda8110e5f4b18b11), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceRayk81221 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0x9243ca153656a04e);
            default Caption = LocText("TEXT_WIP_XJSKLDM_20240215_114854");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Rayk_79097);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Rayk_81326);
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_DDIAZ_20240205_122718_2995"), int64(0x9243ca153656a04e));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9243ca153656a04c), EConversationDebugInfo::Executing);
                
                // We're not done yet.
                Hero.AI.Say(LocText("TEXT_WIP_XJSKLDM_20240215_114854"));
                DC(int64(0x9243ca153656a04c), EConversationDebugInfo::Done);
                DC(int64(0x9243ca153656a04d), EConversationDebugInfo::Executing);
                
                // Ain't learned your lesson yet, have you? Fine!
                Rayk.AI.Say(LocText("TEXT_WIP_XJSKLDM_20240215_114854_41"));
                DC(int64(0x9243ca153656a04d), EConversationDebugInfo::Done);
                DC(int64(0x9243ca153656a054), EConversationDebugInfo::Executing);
                Rayk.AI.StartFistFightImmediately(Hero);
                DC(int64(0x9243ca153656a054), EConversationDebugInfo::Done);
                DC(int64(0x9243ca153656a055), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9243ca153656a055), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRayk81374 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0xda8110e5f4b18b20);
            default Caption = LocText("TEXT_WIP_VHHDWEM_20240208_164231");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRayk80872);
            default Rules.HideIfKnows(UChoiceRayk81374);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xda8110e5f4b18b1e), EConversationDebugInfo::Executing);
                // You wouldn't know a way into Silas's cellar, would you?
                Hero.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_164231"));
                DC(int64(0xda8110e5f4b18b1e), EConversationDebugInfo::Done);
                DC(int64(0xda8110e5f4b18b1f), EConversationDebugInfo::Executing);
                
                // Why? Lookin' to snatch some rice schnapps?
                Rayk.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_164231_491"));
                DC(int64(0xda8110e5f4b18b1f), EConversationDebugInfo::Done);
                DC(int64(0xda8110e5f4b18b29), EConversationDebugInfo::Executing);
                
                // Jacko told Bran about a stash Silas keeps in his cellar. ...
                Hero.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_164951"));
                DC(int64(0xda8110e5f4b18b29), EConversationDebugInfo::Done);
                DC(int64(0xda8110e5f4b18b2a), EConversationDebugInfo::Executing);
                
                // Huh ... well, ain't that strange. Yeah, I know another ...
                Rayk.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_164957"));
                DC(int64(0xda8110e5f4b18b2a), EConversationDebugInfo::Done);
                DC(int64(0xfff29c9395e1bdc3), EConversationDebugInfo::Executing);
                // You can get in through the lake. It's a steep dive, but ...
                Rayk.AI.Say(LocText("TEXT_WIP_MIWVLHC_20240311_191249"));
                DC(int64(0xfff29c9395e1bdc3), EConversationDebugInfo::Done);
                DC(int64(0xfff29c9395e1bdc4), EConversationDebugInfo::Executing);
                
                // Got it. Thanks. 
                Hero.AI.Say(LocText("TEXT_WIP_MIWVLHC_20240311_191316"));
                DC(int64(0xfff29c9395e1bdc4), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RICELORDFOREMAN, Document::UDocumentSegment_CH1_RICELORDFOREMAN_SecretEntry);
                DC(int64(0xda8110e5f4b18b2c), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xda8110e5f4b18b2c), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceRayk81391 : UTopic_Hero__NC_BAU_RAYK_941
        {
            default DebugId = int64(0xda8110e5f4b18b24);
            default Caption = LocText("TEXT_WIP_VHHDWEM_20240208_164246");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceRayk80872);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xda8110e5f4b18b22), EConversationDebugInfo::Executing);
                // How's it going? 
                Hero.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_164246"));
                DC(int64(0xda8110e5f4b18b22), EConversationDebugInfo::Done);
                DC(int64(0xda8110e5f4b18b23), EConversationDebugInfo::Executing);
                
                // Well, Hakon is still runnin' the fields.
                Rayk.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_164246_3750"));
                DC(int64(0xda8110e5f4b18b23), EConversationDebugInfo::Done);
                DC(int64(0xfff29c9395e1bdc5), EConversationDebugInfo::Executing);
                // That work for an answer? 
                Rayk.AI.Say(LocText("TEXT_WIP_MIWVLHC_20240311_191429"));
                DC(int64(0xfff29c9395e1bdc5), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */