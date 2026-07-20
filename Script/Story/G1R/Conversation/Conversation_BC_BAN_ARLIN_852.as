#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_BC_BAN_ARLIN_852 : UConversationCharacterSettings
        {
            default ForCharacter = n"BC_BAN_ARLIN_852";
        }
        
        
        class UTopic_Hero__BC_BAN_ARLIN_852 : UG1RDialogTopic
        {
            default ForCharacter = n"BC_BAN_ARLIN_852";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetBandit() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceBandit119943 : UTopic_Hero__BC_BAN_ARLIN_852
        {
            default DebugId = int64(0x96e984da4d5fa71e);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x96e984da4d5fa71d), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x96e984da4d5fa71d), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBandit119959 : UTopic_Hero__BC_BAN_ARLIN_852
        {
            default DebugId = int64(0xf10863793bb5f2f4);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_OKQHPDM_20241211_112657"), int64(0xf10863793bb5f2f4));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf10863793bb5f2fe), G1R.HeroInsideBanditCell == 0);
                    DB(int64(0x962bc0bf58524025), Hero != nullptr && Hero.IsInConversation());
                }
                
                if (G1R.HeroInsideBanditCell != 0)
                    return false;
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x80477fcbccac9318), EConversationDebugInfo::Executing);
                // Who are you?
                Hero.AI.Say(LocText("TEXT_WIP_JHRCFQN_20241210_135546"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0x80477fcbccac9318), EConversationDebugInfo::Done);
                DC(int64(0x80477fcbccac9319), EConversationDebugInfo::Executing);
                
                // (deep sigh) Just piss off, okay? Leave me be. 
                Bandit.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_111644"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                DC(int64(0x80477fcbccac9319), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_BC_BAN_ARLIN, Document::UDocumentSegment_Glossary_BC_BAN_ARLIN_Introduction);
            }
        }
        
        
        class UChoiceBandit121294 : UTopic_Hero__BC_BAN_ARLIN_852
        {
            default DebugId = int64(0x260aad6da5682028);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_bandit_121600_exit_1");
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_bandit_121600_exit_2");
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBandit122174);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBandit452441);
            default Rules.HideIfKnows(UChoiceBandit121294);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf10863793bb5f2cd), EConversationDebugInfo::Executing);
                // Put this on, too. You don't want to draw any attention. 
                Hero.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_122307"), ForceCameraPreset = n"OVER THE SHOULDER CLOSE UP");
                DC(int64(0xf10863793bb5f2cd), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e1bb5), EConversationDebugInfo::Executing);
                
                // Oh, man. You're a professional.
                Bandit.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_161455"), ForceCameraPreset = n"OVER THE SHOULDER CLOSE UP");
                DC(int64(0xa020c3390a9e1bb5), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_BC_BAN_ARLIN, Document::UDocumentSegment_Glossary_BC_BAN_ARLIN_Forgave);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_BANDITSTRUST, Document::UDocumentSegment_CH3_BANDITSTRUST_Out);
                DC(int64(0xf10863793bb5f35a), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Bandit, UItMs_FakeDiggerClothes, 1);
                DC(int64(0xf10863793bb5f35a), EConversationDebugInfo::Done);
                DC(int64(0x371beb2adcf6b8ee), EConversationDebugInfo::Executing);
                G1R.BanditCellVisited = 1;
                DC(int64(0x371beb2adcf6b8ee), EConversationDebugInfo::Done);
                DC(int64(0xf10863793bb5f35d), EConversationDebugInfo::Executing);
                // Can you, um, give me some privacy? 
                Bandit.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_130924"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                DC(int64(0xf10863793bb5f35d), EConversationDebugInfo::Done);
                DC(int64(0xf10863793bb5f35e), EConversationDebugInfo::Executing);
                
                // Are you serious? 
                Hero.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_130924_731"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                DC(int64(0xf10863793bb5f35e), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e1bb6), EConversationDebugInfo::Executing);
                
                // Please. 
                Bandit.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_161614"), ForceCameraPreset = n"OVER THE SHOULDER CLOSE UP");
                DC(int64(0xa020c3390a9e1bb6), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e1bb7), EConversationDebugInfo::Executing);
                
                // Fine. 
                Hero.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_161618"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0xa020c3390a9e1bb7), EConversationDebugInfo::Done);
                DB(int64(0x91e94f48c0e59b59), G1R.HeroInsideBanditCell != 0);
                
                if (G1R.HeroInsideBanditCell != 0)
                {
                    DC(int64(0x7e8261ba8bd81fde), EConversationDebugInfo::Executing);
                    Hero.AI.TurnAwayFrom(Bandit);
                    DC(int64(0x7e8261ba8bd81fde), EConversationDebugInfo::Done);
                    DC(int64(0x7e8261ba8bd81fe0), EConversationDebugInfo::Executing);
                    Hero.AI.WaitSeconds(3);
                    DC(int64(0x7e8261ba8bd81fe0), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x7e8261ba8bd81fda), EConversationDebugInfo::Executing);
                    Hero.AI.TurnAwayFrom(Bandit);
                    DC(int64(0x7e8261ba8bd81fda), EConversationDebugInfo::Done);
                    DC(int64(0x7e8261ba8bd81fdc), EConversationDebugInfo::Executing);
                    Hero.AI.WaitSeconds(3);
                    DC(int64(0x7e8261ba8bd81fdc), EConversationDebugInfo::Done);
                }
                DC(int64(0x6e85d59cb357ec07), EConversationDebugInfo::Executing);
                Bandit.AddItemToInventory(UArmor_BC_BAN_Arlin_852, 1);
                DC(int64(0x6e85d59cb357ec07), EConversationDebugInfo::Done);
                DC(int64(0x6e85d59cb357ec0e), EConversationDebugInfo::Executing);
                Bandit.Inventory.EquipArmorOfClass(UArmor_BC_BAN_Arlin_852);
                DC(int64(0x6e85d59cb357ec0e), EConversationDebugInfo::Done);
                DC(int64(0x80477fcbccac9402), EConversationDebugInfo::Executing);
                // Ah. Much better. 
                Bandit.AI.Say(LocText("TEXT_WIP_LHRCFQN_20241212_150835_2083"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0x80477fcbccac9402), EConversationDebugInfo::Done);
                DC(int64(0x80477fcbccac935e), EConversationDebugInfo::Executing);
                Hero.AI.TurnToCharacter(Bandit);
                DC(int64(0x80477fcbccac935e), EConversationDebugInfo::Done);
                DC(int64(0x80477fcbccac9373), EConversationDebugInfo::Executing);
                // Do you think, you'll make it out of the camp?
                Hero.AI.Say(LocText("TEXT_WIP_RKCQMAI_20250117_150256"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0x80477fcbccac9373), EConversationDebugInfo::Done);
                DC(int64(0x80477fcbccac9374), EConversationDebugInfo::Executing);
                
                // Easy. Wha- no, not easy, but I'll handle it. Thanks, ...
                Bandit.AI.Say(LocText("TEXT_WIP_LHRCFQN_20241212_152201"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                DC(int64(0x80477fcbccac9374), EConversationDebugInfo::Done);
                DC(int64(0x80477fcbccac9393), EConversationDebugInfo::Executing);
                
                // So, we'll meet in your camp later?
                Hero.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_161859"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM");
                DC(int64(0x80477fcbccac9393), EConversationDebugInfo::Done);
                DC(int64(0x80477fcbccac9394), EConversationDebugInfo::Executing);
                
                // We will.
                Bandit.AI.Say(LocText("TEXT_WIP_RKCQMAI_20250117_150412"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM");
                DC(int64(0x80477fcbccac9394), EConversationDebugInfo::Done);
                DC(int64(0x91e94f48c0e59b3f), EConversationDebugInfo::Executing);
                Bandit.ExchangeDailyRoutineToClass(UDailyRoutine_BC_BAN_Arlin_852_Home);
                DC(int64(0x91e94f48c0e59b3f), EConversationDebugInfo::Done);
                DC(int64(0x8c29f114262b1a4f), EConversationDebugInfo::Executing);
                Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_BACK.SucceedQuest();
                DC(int64(0x8c29f114262b1a4f), EConversationDebugInfo::Done);
                DC(int64(0x91e94f48c0e59b40), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x91e94f48c0e59b40), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceBandit121600 : UTopic_Hero__BC_BAN_ARLIN_852
        {
            default DebugId = int64(0xf10863793bb5f2c7);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Bandit_121356);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Bandit_121511);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xbe09c31f3aa299a3), G1R.HeroInsideBanditCell != 0);
                
                if (G1R.HeroInsideBanditCell != 0)
                {
                    DC(int64(0xa020c3390a9e1b7a), EConversationDebugInfo::Executing);
                    // So I can just walk outta here? 
                    Bandit.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_161229"), ForceCameraPreset = n"OVER THE SHOULDER COWBOY");
                    DC(int64(0xa020c3390a9e1b7a), EConversationDebugInfo::Done);
                    DC(int64(0x6e374164fd5ffcb2), EConversationDebugInfo::Executing);
                    
                    // Not quite. 
                    Hero.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_173626"), ForceCameraPreset = n"OVER THE SHOULDER COWBOY");
                    DC(int64(0x6e374164fd5ffcb2), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_bandit_121600_exit_1");
                }
                else
                {
                    DC(int64(0xa020c3390a9e1b7e), EConversationDebugInfo::Executing);
                    // How are we gettin' out, though? Those bars ain't no ...
                    Bandit.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_161256_686"), ForceCameraPreset = n"OVER THE SHOULDER COWBOY");
                    DC(int64(0xa020c3390a9e1b7e), EConversationDebugInfo::Done);
                    DC(int64(0xa020c3390a9e1bb4), EConversationDebugInfo::Executing);
                    
                    // You don't say. 
                    Hero.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_161338"), ForceCameraPreset = n"OVER THE SHOULDER COWBOY");
                    DC(int64(0xa020c3390a9e1bb4), EConversationDebugInfo::Done);
                    DB(int64(0x6e374164fd5ffcba), Hero != nullptr && Hero.HasItem(UItKe_BanditCell, 1, 0));
                    
                    if (Hero != nullptr && Hero.HasItem(UItKe_BanditCell, 1, 0))
                    {
                        DC(int64(0x6e374164fd5ffcbb), EConversationDebugInfo::Executing);
                        // Here's the key. Take it. 
                        Hero.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_173649"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM");
                        DC(int64(0x6e374164fd5ffcbb), EConversationDebugInfo::Done);
                        DC(int64(0x91e94f48c0e59b4b), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(Bandit, UItKe_BanditCell, 1);
                        DC(int64(0x91e94f48c0e59b4b), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_bandit_121600_exit_2");
                    }
                    else
                    {
                        DC(int64(0x6e374164fd5ffcc1), EConversationDebugInfo::Executing);
                        // I think the warder down here has a key. I'll get it from ...
                        Hero.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_173719"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM");
                        DC(int64(0x6e374164fd5ffcc1), EConversationDebugInfo::Done);
                        DC(int64(0x91e94f48c0e59b49), EConversationDebugInfo::Executing);
                        // You stay quiet.
                        Hero.AI.Say(LocText("TEXT_WIP_LHRCFQN_20241212_152504"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM");
                        DC(int64(0x91e94f48c0e59b49), EConversationDebugInfo::Done);
                        DC(int64(0x6e374164fd5ffcc2), EConversationDebugInfo::Executing);
                        
                        // Believe me, I will. 
                        Bandit.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_173719_2083"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM");
                        DC(int64(0x6e374164fd5ffcc2), EConversationDebugInfo::Done);
                        GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_BANDITSTRUST, Document::UDocumentSegment_CH3_BANDITSTRUST_Key);
                        DC(int64(0x8c29f114262b1a1f), EConversationDebugInfo::Executing);
                        Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_KEY.StartQuest();
                        DC(int64(0x8c29f114262b1a1f), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_bandit_121600_exit_3");
                    }
                }
            }
        }
        
        
        class UChoiceBandit121738 : UTopic_Hero__BC_BAN_ARLIN_852
        {
            default DebugId = int64(0xf10863793bb5f305);
            default Caption = LocText("TEXT_WIP_OKQHPDM_20241211_132436");
            default PriorityRank = 1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_OKQHPDM_20241211_112657"), int64(0xf10863793bb5f305));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf10863793bb5f336), G1R.HeroInsideBanditCell != 0);
                }
                
                return G1R.HeroInsideBanditCell != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf10863793bb5f368), EConversationDebugInfo::Executing);
                // Who are you?
                Hero.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_132436"));
                DC(int64(0xf10863793bb5f368), EConversationDebugInfo::Done);
                DC(int64(0xf10863793bb5f369), EConversationDebugInfo::Executing);
                
                // What the- I should be asking YOU that. How by Beliar did ...
                Bandit.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_132508"));
                DC(int64(0xf10863793bb5f369), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e1b25), EConversationDebugInfo::Executing);
                
                // I have my ways. 
                Hero.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_154047"));
                DC(int64(0xa020c3390a9e1b25), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_BC_BAN_ARLIN, Document::UDocumentSegment_Glossary_BC_BAN_ARLIN_Introduction);
            }
        }
        
        
        class UChoiceBandit121827 : UTopic_Hero__BC_BAN_ARLIN_852
        {
            default DebugId = int64(0xf10863793bb5f327);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBandit119959);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBandit121738);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x260aad6da5682075), Hero != nullptr && !Hero.HasSaid(LocText("TEXT_WIP_OKQHPDM_20241211_112135_41")));
                }
                
                return Hero != nullptr && !Hero.HasSaid(LocText("TEXT_WIP_OKQHPDM_20241211_112135_41"));
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DB(int64(0xf10863793bb5f2a0), Quest::BanditsCamp_BANDITSTRUST != nullptr && Quest::BanditsCamp_BANDITSTRUST.IsRunning());
                
                if (Quest::BanditsCamp_BANDITSTRUST != nullptr && Quest::BanditsCamp_BANDITSTRUST.IsRunning())
                {
                    DC(int64(0xf10863793bb5f28e), EConversationDebugInfo::Executing);
                    // You're Arlin, aren't you? 
                    Hero.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_112135_41"), ForceCameraPreset = n"OVER THE SHOULDER COWBOY");
                    DC(int64(0xf10863793bb5f28e), EConversationDebugInfo::Done);
                    DC(int64(0xa020c3390a9e1b26), EConversationDebugInfo::Executing);
                    
                    // ... How do you know?
                    Bandit.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_154204"), ForceCameraPreset = n"OVER THE SHOULDER COWBOY");
                    DC(int64(0xa020c3390a9e1b26), EConversationDebugInfo::Done);
                    DC(int64(0xa020c3390a9e1b27), EConversationDebugInfo::Executing);
                    
                    // Take your best guess. Your friend wants me to get you ...
                    Hero.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_154222"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                    DC(int64(0xa020c3390a9e1b27), EConversationDebugInfo::Done);
                    DC(int64(0xa020c3390a9e1b28), EConversationDebugInfo::Executing);
                    // IF you didn't snitch while you were here. 
                    Hero.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_154235"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM");
                    DC(int64(0xa020c3390a9e1b28), EConversationDebugInfo::Done);
                    DC(int64(0xf10863793bb5f296), EConversationDebugInfo::Executing);
                    
                    // I ... I didn't.
                    Bandit.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_112657"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                    DC(int64(0xf10863793bb5f296), EConversationDebugInfo::Done);
                    DC(int64(0xa020c3390a9e1b29), EConversationDebugInfo::Executing);
                    
                    // Will the warders confirm that when I ask them? 
                    Hero.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_154449"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM");
                    DC(int64(0xa020c3390a9e1b29), EConversationDebugInfo::Done);
                    DC(int64(0xa020c3390a9e1b2a), EConversationDebugInfo::Executing);
                    
                    // What? No, please, I- Oh, for fuck's sake, fine! I told ...
                    Bandit.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_154505"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM");
                    DC(int64(0xa020c3390a9e1b2a), EConversationDebugInfo::Done);
                    DC(int64(0xa020c3390a9e1b2b), EConversationDebugInfo::Executing);
                    // They don't even know where we're hidin'.
                    Bandit.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_154546"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                    DC(int64(0xa020c3390a9e1b2b), EConversationDebugInfo::Done);
                    DC(int64(0xa020c3390a9e1b2c), EConversationDebugInfo::Executing);
                    // Please, mate, don't leave me here. I didn't grass, I was ...
                    Bandit.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_154610"), ForceCameraPreset = n"OVER THE SHOULDER CLOSE UP");
                    DC(int64(0xa020c3390a9e1b2c), EConversationDebugInfo::Done);
                    DC(int64(0xa020c3390a9e1b2d), EConversationDebugInfo::Executing);
                    
                    // Yeah, I got the gist of it. Thanks.
                    Hero.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_154707"), ForceCameraPreset = n"OVER THE SHOULDER CLOSE UP");
                    DC(int64(0xa020c3390a9e1b2d), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_BANDITSTRUST, Document::UDocumentSegment_CH3_BANDITSTRUST_Found);
                    DC(int64(0x8c29f114262b19d2), EConversationDebugInfo::Executing);
                    Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_FIND.SucceedQuest();
                    DC(int64(0x8c29f114262b19d2), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Bandit_121356,
                        UTopic_Bandit_121376,
                        UTopic_Bandit_121491,
                        UTopic_Bandit_121511
                    );
                }
                else
                {
                    DB(int64(0xc413ac721f074a0f), G1R.HeroInsideBanditCell != 0);
                    
                    if (G1R.HeroInsideBanditCell != 0)
                    {
                        DC(int64(0xc413ac721f074a2c), EConversationDebugInfo::Executing);
                        // (deep sigh) Just piss off, okay? Leave me be. 
                        Bandit.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_111644"), ForceCameraPreset = n"OVER THE SHOULDER MEDIUM");
                        DC(int64(0xc413ac721f074a2c), EConversationDebugInfo::Done);
                    }
                    DC(int64(0xf10863793bb5f2a3), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xf10863793bb5f2a3), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UTopic_Bandit_121356 : UTopic_Hero__BC_BAN_ARLIN_852
        {
            default DebugId = int64(0xf10863793bb5f2a7);
            default Caption = LocText("TEXT_WIP_OKQHPDM_20241211_113152_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Bandit_121356);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf10863793bb5f2a8), EConversationDebugInfo::Executing);
                // You're lucky your friend sent me. I can be hard of ...
                Hero.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_113152_2785"), ForceCameraPreset = n"OVER THE SHOULDER CLOSE UP");
                DC(int64(0xf10863793bb5f2a8), EConversationDebugInfo::Done);
                DC(int64(0xf10863793bb5f2b0), EConversationDebugInfo::Executing);
                
                // Huh? 
                Bandit.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_113323"), ForceCameraPreset = n"OVER THE SHOULDER CLOSE UP");
                DC(int64(0xf10863793bb5f2b0), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e1b2e), EConversationDebugInfo::Executing);
                
                // My ears aren't what they used to be. For the right price ...
                Hero.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_154921"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0xa020c3390a9e1b2e), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e1b2f), EConversationDebugInfo::Executing);
                
                // I ... don't get it. I ain't no ear doctor or nothin'.
                Bandit.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_154934"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                DC(int64(0xa020c3390a9e1b2f), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e1b30), EConversationDebugInfo::Executing);
                
                // (sigh) I'm not gonna tell anyone you snitched. IF you ...
                Hero.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_155109"), ForceCameraPreset = n"OVER THE SHOULDER CLOSE UP");
                DC(int64(0xa020c3390a9e1b30), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e1b31), EConversationDebugInfo::Executing);
                
                // Worth your- OH! You mean, pay you? Why didn't you just ...
                Bandit.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_155203"), ForceCameraPreset = n"OVER THE SHOULDER CLOSE UP");
                DC(int64(0xa020c3390a9e1b31), EConversationDebugInfo::Done);
                DC(int64(0xf10863793bb5f2b1), EConversationDebugInfo::Executing);
                // But yes, YES, please. I ain't got much on me right now, ...
                Bandit.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_113335"), ForceCameraPreset = n"OVER THE SHOULDER CLOSE UP");
                DC(int64(0xf10863793bb5f2b1), EConversationDebugInfo::Done);
                DC(int64(0xf10863793bb5f2b2), EConversationDebugInfo::Executing);
                
                // Just ore won't cut it. Think of something. 
                Hero.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_114657"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0xf10863793bb5f2b2), EConversationDebugInfo::Done);
                DC(int64(0xf10863793bb5f2b3), EConversationDebugInfo::Executing);
                
                // Okay, okay, I will. Now please, get me out of here!
                Bandit.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_114823"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                DC(int64(0xf10863793bb5f2b3), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_BANDITSTRUST, Document::UDocumentSegment_CH3_BANDITSTRUST_Coerce);
                DC(int64(0x8c29f114262b19fd), EConversationDebugInfo::Executing);
                Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_BACK.StartQuest();
                DC(int64(0x8c29f114262b19fd), EConversationDebugInfo::Done);
                DC(int64(0x8c29f114262b1a4d), EConversationDebugInfo::Executing);
                Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE.SucceedQuest();
                DC(int64(0x8c29f114262b1a4d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Bandit_121376 : UTopic_Hero__BC_BAN_ARLIN_852
        {
            default DebugId = int64(0xf10863793bb5f2ab);
            default Caption = LocText("TEXT_WIP_OKQHPDM_20241211_113152_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Bandit_121376);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf10863793bb5f2ac), EConversationDebugInfo::Executing);
                // I'm going to leave you here. 
                Hero.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_113152_3286"), ForceCameraPreset = n"OVER THE SHOULDER CLOSE UP");
                DC(int64(0xf10863793bb5f2ac), EConversationDebugInfo::Done);
                DC(int64(0xf10863793bb5f2b4), EConversationDebugInfo::Executing);
                
                // What? Come on, mate, I ain't told 'em nothin'!
                Bandit.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_114914"), ForceCameraPreset = n"OVER THE SHOULDER CLOSE UP");
                DC(int64(0xf10863793bb5f2b4), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e1b32), EConversationDebugInfo::Executing);
                
                // That's not good enough. Good luck. 
                Hero.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_160426"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0xa020c3390a9e1b32), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e1b33), EConversationDebugInfo::Executing);
                
                // But ... no! Please!
                Bandit.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_160503"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                DC(int64(0xa020c3390a9e1b33), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_BANDITSTRUST, Document::UDocumentSegment_CH3_BANDITSTRUST_Left);
                DC(int64(0x371beb2adcf6b8da), EConversationDebugInfo::Executing);
                G1R.BanditCellVisited = 2;
                DC(int64(0x371beb2adcf6b8da), EConversationDebugInfo::Done);
                DC(int64(0x8c29f114262b19f9), EConversationDebugInfo::Executing);
                Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_REPORT.StartQuest();
                DC(int64(0x8c29f114262b19f9), EConversationDebugInfo::Done);
                DC(int64(0x8c29f114262b1a47), EConversationDebugInfo::Executing);
                Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE.SucceedQuest();
                DC(int64(0x8c29f114262b1a47), EConversationDebugInfo::Done);
                DC(int64(0xedc84834f122c4d5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xedc84834f122c4d5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Bandit_121491 : UTopic_Hero__BC_BAN_ARLIN_852
        {
            default DebugId = int64(0xf10863793bb5f2b6);
            default Caption = LocText("TEXT_WIP_OKQHPDM_20241211_115057_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Bandit_121491);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf10863793bb5f2b7), EConversationDebugInfo::Executing);
                // I'm going to kill you now.
                Hero.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_115057_686"), ForceCameraPreset = n"OVER THE SHOULDER CLOSE UP");
                DC(int64(0xf10863793bb5f2b7), EConversationDebugInfo::Done);
                DC(int64(0xf10863793bb5f2c1), EConversationDebugInfo::Executing);
                
                // What? You gotta be jokin'! 
                Bandit.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_115444"), ForceCameraPreset = n"OVER THE SHOULDER CLOSE UP");
                DC(int64(0xf10863793bb5f2c1), EConversationDebugInfo::Done);
                DC(int64(0xf10863793bb5f2c2), EConversationDebugInfo::Executing);
                
                // Just doing what your friend told me. Sorry, this isn't ...
                Hero.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_115459"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0xf10863793bb5f2c2), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e1b34), EConversationDebugInfo::Executing);
                
                // NO!
                Bandit.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_160610"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                DC(int64(0xa020c3390a9e1b34), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_BANDITSTRUST, Document::UDocumentSegment_CH3_BANDITSTRUST_Left);
                DB(int64(0x706e581cb20946c6), G1R.HeroInsideBanditCell != 0);
                
                if (G1R.HeroInsideBanditCell != 0)
                {
                    DC(int64(0xf10863793bb5f2c4), EConversationDebugInfo::Executing);
                    Hero.AI.DrawCombatWeapon();
                    DC(int64(0xf10863793bb5f2c4), EConversationDebugInfo::Done);
                    DC(int64(0x706e581cb2094736), EConversationDebugInfo::Executing);
                    Bandit.AI.StartAttackingImmediately(Hero);
                    DC(int64(0x706e581cb2094736), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x706e581cb209472a), EConversationDebugInfo::Executing);
                    Bandit.ExchangeDailyRoutineToClass(UDailyRoutine_BC_BAN_Arlin_852_Fear);
                    DC(int64(0x706e581cb209472a), EConversationDebugInfo::Done);
                }
                DC(int64(0x371beb2adcf6b8d3), EConversationDebugInfo::Executing);
                G1R.BanditCellVisited = 2;
                DC(int64(0x371beb2adcf6b8d3), EConversationDebugInfo::Done);
                DC(int64(0x8c29f114262b19fb), EConversationDebugInfo::Executing);
                Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_REPORT.StartQuest();
                DC(int64(0x8c29f114262b19fb), EConversationDebugInfo::Done);
                DC(int64(0x8c29f114262b1a49), EConversationDebugInfo::Executing);
                Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE.SucceedQuest();
                DC(int64(0x8c29f114262b1a49), EConversationDebugInfo::Done);
                DC(int64(0xf10863793bb5f2c5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xf10863793bb5f2c5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Bandit_121511 : UTopic_Hero__BC_BAN_ARLIN_852
        {
            default DebugId = int64(0xf10863793bb5f2ba);
            default Caption = LocText("TEXT_WIP_OKQHPDM_20241211_115059_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Bandit_121511);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xf10863793bb5f2bb), EConversationDebugInfo::Executing);
                // All right. I'm getting you out of here.
                Hero.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_115059_2386"), ForceCameraPreset = n"OVER THE SHOULDER CLOSE UP");
                DC(int64(0xf10863793bb5f2bb), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e1b35), EConversationDebugInfo::Executing);
                
                // Really? Even though I ... 
                Bandit.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_160637"), ForceCameraPreset = n"OVER THE SHOULDER CLOSE UP");
                DC(int64(0xa020c3390a9e1b35), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e1b36), EConversationDebugInfo::Executing);
                
                // I'm not going to tell anyone. Are you? 
                Hero.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_160646"), ForceCameraPreset = n"INDIVIDUAL MEDIUM");
                DC(int64(0xa020c3390a9e1b36), EConversationDebugInfo::Done);
                DC(int64(0xa020c3390a9e1b37), EConversationDebugInfo::Executing);
                
                // ... No. Of course not. Thank you, mate, I'll never ...
                Bandit.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_160654"), ForceCameraPreset = n"INDIVIDUAL CLOSE UP");
                DC(int64(0xa020c3390a9e1b37), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_BANDITSTRUST, Document::UDocumentSegment_CH3_BANDITSTRUST_Forgive);
                DC(int64(0x8c29f114262b1a0e), EConversationDebugInfo::Executing);
                Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_BACK.StartQuest();
                DC(int64(0x8c29f114262b1a0e), EConversationDebugInfo::Done);
                DC(int64(0x8c29f114262b1a4b), EConversationDebugInfo::Executing);
                Quest::BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE.SucceedQuest();
                DC(int64(0x8c29f114262b1a4b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBandit122174 : UTopic_Hero__BC_BAN_ARLIN_852
        {
            default DebugId = int64(0xf10863793bb5f380);
            default Caption = LocText("TEXT_WIP_OKQHPDM_20241211_173649");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_bandit_121600_exit_3");
            default Rules.HideIfKnows(UChoiceBandit122174);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x260aad6da5682042), Hero != nullptr && Hero.HasItem(UItKe_BanditCell, 1, 0));
                    DB(int64(0x260aad6da5682046), Quest::BanditsCamp_BANDITSTRUST != nullptr && Quest::BanditsCamp_BANDITSTRUST.IsRunning());
                    DB(int64(0x260aad6da5682056), G1R.HeroInsideBanditCell == 0);
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItKe_BanditCell, 1, 0))
                    return false;
                
                if (Quest::BanditsCamp_BANDITSTRUST != nullptr && !Quest::BanditsCamp_BANDITSTRUST.IsRunning())
                    return false;
                
                if (G1R.HeroInsideBanditCell != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x260aad6da5682055), EConversationDebugInfo::Executing);
                // Here's the key. Take it. 
                Hero.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_173649"), ForceCameraPreset = n"OVER THE SHOULDER COWBOY");
                DC(int64(0x260aad6da5682055), EConversationDebugInfo::Done);
                DC(int64(0x260aad6da5682058), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Bandit, UItKe_BanditCell, 1);
                DC(int64(0x260aad6da5682058), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBandit134683 : UTopic_Hero__BC_BAN_ARLIN_852
        {
            default DebugId = int64(0x6f17b48ad99f74d7);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceBandit134683);
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_BC_Campfire_02", 2000.0f, int64(0x6f17b48ad99f74d7));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xd20c82822dede498), Hero != nullptr && Hero.IsInConversation());
                }
                
                return Hero != nullptr && Hero.IsInConversation();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6f17b48ad99f74d6), EConversationDebugInfo::Executing);
                // Look who it is! Good to see a friendly face. 
                Bandit.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_135600_41"));
                DC(int64(0x6f17b48ad99f74d6), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f74de), EConversationDebugInfo::Executing);
                // Thanks again for helpin' me out back there. Gomez would ...
                Bandit.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_135657"));
                DC(int64(0x6f17b48ad99f74de), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBandit135597 : UTopic_Hero__BC_BAN_ARLIN_852
        {
            default DebugId = int64(0x6f17b48ad99f74e7);
            default Caption = LocText("TEXT_WIP_KPLRCKI_20250109_140723");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBandit181790);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6f17b48ad99f74e5), EConversationDebugInfo::Executing);
                
                // Any new lockpicks for me?
                Hero.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_140723"));
                DC(int64(0x6f17b48ad99f74e5), EConversationDebugInfo::Done);
                DB(int64(0x6f17b48ad99f74ea), G1R.BanditLockpick_Daily.IsValid() && G1R.BanditLockpick_Daily.IsInLessThanXDays(2));
                
                if (G1R.BanditLockpick_Daily.IsValid() && G1R.BanditLockpick_Daily.IsInLessThanXDays(2))
                {
                    DC(int64(0xd20c82822dede4a3), EConversationDebugInfo::Executing);
                    // Sorry, mate, not just yet. Come back another day. 
                    Bandit.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_140740"));
                    DC(int64(0xd20c82822dede4a3), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_bandit_135597_exit_1");
                    DC(int64(0x1748b60c9b8605e5), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x1748b60c9b8605e5), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x6f17b48ad99f74ed), EConversationDebugInfo::Executing);
                    // Well, you must be an oracle, 'cause I just got a new ...
                    Bandit.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_140742"));
                    DC(int64(0x6f17b48ad99f74ed), EConversationDebugInfo::Done);
                    DC(int64(0x6f17b48ad99f74f1), EConversationDebugInfo::Executing);
                    // Here you go, mate. Hope they'll be useful. 
                    Bandit.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_140811"));
                    DC(int64(0x6f17b48ad99f74f1), EConversationDebugInfo::Done);
                    DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                    Bandit.AddItemToInventory(UItKe_Lockpick, 5);
                    DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                    DC(int64(0x1748b60c9b8605dd), EConversationDebugInfo::Executing);
                    G1R.BanditLockpick_Daily = FInGameTime::Now();
                    DC(int64(0x1748b60c9b8605dd), EConversationDebugInfo::Done);
                    DC(int64(0x1748b60c9b8605eb), EConversationDebugInfo::Executing);
                    Bandit.AI.GiveItemTo(Hero, UItKe_Lockpick, 5);
                    DC(int64(0x1748b60c9b8605eb), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_bandit_135597_exit_2");
                    DC(int64(0x1748b60c9b8605f0), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x1748b60c9b8605f0), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceBandit135877 : UTopic_Hero__BC_BAN_ARLIN_852
        {
            default DebugId = int64(0x6f17b48ad99f74f6);
            default Caption = LocText("TEXT_WIP_KPLRCKI_20250109_140828");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBandit134683);
            default Rules.HideIfKnows(UChoiceBandit135877);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6f17b48ad99f74f2), EConversationDebugInfo::Executing);
                // Have you settled back in? 
                Hero.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_140828"));
                DC(int64(0x6f17b48ad99f74f2), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f74f3), EConversationDebugInfo::Executing);
                
                // Nice o' you to ask. Yeah, I guess I have. 
                Bandit.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_140828_2386"));
                DC(int64(0x6f17b48ad99f74f3), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f74f8), EConversationDebugInfo::Executing);
                // I'll be more careful next time. 
                Bandit.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_140859"));
                DC(int64(0x6f17b48ad99f74f8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBandit181790 : UTopic_Hero__BC_BAN_ARLIN_852
        {
            default DebugId = int64(0xd20c82822dede49e);
            default Caption = LocText("TEXT_WIP_KPLRCKI_20250109_135655");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceBandit134683);
            default Rules.HideIfKnows(UChoiceBandit181790);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6f17b48ad99f74da), EConversationDebugInfo::Executing);
                
                // What about our deal? 
                Hero.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_135655"));
                DC(int64(0x6f17b48ad99f74da), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f74db), EConversationDebugInfo::Executing);
                
                // You mean- Oh, right, o' course. 
                Bandit.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_135655_2238"));
                DC(int64(0x6f17b48ad99f74db), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f74e1), EConversationDebugInfo::Executing);
                // So, um, problem is, I'm kind of skint. Happens when ...
                Bandit.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_140447"));
                DC(int64(0x6f17b48ad99f74e1), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f74e2), EConversationDebugInfo::Executing);
                // How about some lockpicks, though? You look like the type ...
                Bandit.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_140519"));
                DC(int64(0x6f17b48ad99f74e2), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f74e3), EConversationDebugInfo::Executing);
                
                // Sure. 
                Hero.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_140634"));
                DC(int64(0x6f17b48ad99f74e3), EConversationDebugInfo::Done);
                DC(int64(0x6f17b48ad99f74e4), EConversationDebugInfo::Executing);
                
                // Grand. Here you go! Find me again next time you're here, ...
                Bandit.AI.Say(LocText("TEXT_WIP_KPLRCKI_20250109_140637"));
                DC(int64(0x6f17b48ad99f74e4), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_BC_BAN_ARLIN, Document::UDocumentSegment_Glossary_BC_BAN_ARLIN_Lockpick);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Executing);
                Bandit.AddItemToInventory(UItKe_Lockpick, 5);
                DC(int64(0xea2bca374667d380), EConversationDebugInfo::Done);
                DC(int64(0xd20c82822dede4a1), EConversationDebugInfo::Executing);
                Bandit.AI.GiveItemTo(Hero, UItKe_Lockpick, 5);
                DC(int64(0xd20c82822dede4a1), EConversationDebugInfo::Done);
                DC(int64(0x1748b60c9b8605dd), EConversationDebugInfo::Executing);
                G1R.BanditLockpick_Daily = FInGameTime::Now();
                DC(int64(0x1748b60c9b8605dd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceBandit452441 : UTopic_Hero__BC_BAN_ARLIN_852
        {
            default DebugId = int64(0x7c7361a318c40231);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default Rules.AllowIfCharacterHasKnowledgeOfId(n"choice_bandit_121600_exit_3");
            default Rules.HideIfKnows(UChoiceBandit122174);
            default Rules.HideIfKnows(UChoiceBandit452441);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x7c7361a318c40235), Hero != nullptr && Hero.IsInConversation());
                    DB(int64(0x7c7361a318c40240), G1R.HeroInsideBanditCell != 0);
                }
                
                if (Hero != nullptr && !Hero.IsInConversation())
                    return false;
                
                if (G1R.HeroInsideBanditCell == 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7c7361a318c4022b), EConversationDebugInfo::Executing);
                // So I can just walk outta here? 
                Bandit.AI.Say(LocText("TEXT_WIP_UPLRCKI_20250107_161229"));
                DC(int64(0x7c7361a318c4022b), EConversationDebugInfo::Done);
                DC(int64(0x7c7361a318c40233), EConversationDebugInfo::Executing);
                
                // Not quite. 
                Hero.AI.Say(LocText("TEXT_WIP_OKQHPDM_20241211_173626"));
                DC(int64(0x7c7361a318c40233), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */