#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_UL_ORG_JACKO_862 : UConversationCharacterSettings
        {
            default ForCharacter = n"UL_ORG_JACKO_862";
        }
        
        
        class UTopic_Hero__UL_ORG_JACKO_862 : UG1RDialogTopic
        {
            default ForCharacter = n"UL_ORG_JACKO_862";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetJacko() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"hero");
            }
            
            AGothicCharacterState GetRayk() const property
            {
                return GetCharacter(n"NC_BAU_RAYK_941");
            }
            
            AGothicCharacterState GetKillian() const property
            {
                return GetCharacter(n"UL_ORG_KILLIAN_861");
            }
            
            AGothicCharacterState GetRenyu() const property
            {
                return GetCharacter(n"UL_ORG_RENYU_860");
            }
        }
        
        
        class UChoiceJacko79919 : UTopic_Hero__UL_ORG_JACKO_862
        {
            default DebugId = int64(0xda8110e5f4b18ade);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceJacko79919);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_XJSKLDM_20240215_140207_3286"), int64(0xda8110e5f4b18ade));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xda8110e5f4b18ae1), Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xda8110e5f4b18add), EConversationDebugInfo::Executing);
                // What have we here. 
                Jacko.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_113646_41"));
                DC(int64(0xda8110e5f4b18add), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_ORG_JACKO, Document::UDocumentSegment_Glossary_UL_ORG_JACKO_Introduction);
                DB(int64(0xda8110e5f4b18aef), G1R.Jacko_Fled != 0);
                DB(int64(0xda8110e5f4b18af0), Jacko != nullptr && Jacko.WasDefeatedBy(Hero));
                
                if (G1R.Jacko_Fled != 0)
                {
                    DC(int64(0x31e6834104170478), EConversationDebugInfo::Executing);
                    // ... Wait, I know you. You're the guy who tipped us off ...
                    Jacko.AI.Say(LocText("TEXT_WIP_BGHDBGC_20240307_180420_41"));
                    DC(int64(0x31e6834104170478), EConversationDebugInfo::Done);
                    DC(int64(0x9abbd37ababe1594), EConversationDebugInfo::Executing);
                    // Damn it. I was looking forward to some free nuggets from ...
                    Jacko.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_181418"));
                    DC(int64(0x9abbd37ababe1594), EConversationDebugInfo::Done);
                    DC(int64(0x9abbd37ababe1596), EConversationDebugInfo::Executing);
                    // Ah, well. What do you want? 
                    Jacko.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_182329"));
                    DC(int64(0x9abbd37ababe1596), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_jacko_79919_exit_1");
                }
                else if (Jacko != nullptr && Jacko.WasDefeatedBy(Hero))
                {
                    DC(int64(0x31e6834104170490), EConversationDebugInfo::Executing);
                    // Oh ... it's you. What, um, what do you want? 
                    Jacko.AI.Say(LocText("TEXT_WIP_BGHDBGC_20240307_181401_2785"));
                    DC(int64(0x31e6834104170490), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_jacko_79919_exit_3");
                }
                else
                {
                    DC(int64(0x31e6834104170482), EConversationDebugInfo::Executing);
                    // I'm here about-
                    Hero.AI.Say(LocText("TEXT_WIP_BGHDBGC_20240307_181155"));
                    DC(int64(0x31e6834104170482), EConversationDebugInfo::Done);
                    DC(int64(0x31e6834104170483), EConversationDebugInfo::Executing);
                    
                    // You know what, I couldn't care less. You, my friend, ...
                    Jacko.AI.Say(LocText("TEXT_WIP_BGHDBGC_20240307_181157"));
                    DC(int64(0x31e6834104170483), EConversationDebugInfo::Done);
                    DC(int64(0x9abbd37ababe1595), EConversationDebugInfo::Executing);
                    // Which is why WE will teach you a lesson. Don't worry ...
                    Jacko.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_182036"));
                    DC(int64(0x9abbd37ababe1595), EConversationDebugInfo::Done);
                    DC(int64(0xda8110e5f4b18ae5), EConversationDebugInfo::Executing);
                    Jacko.AI.StartAttackingImmediatelyLootOnly(Hero);
                    DC(int64(0xda8110e5f4b18ae5), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_jacko_79919_exit_3");
                    DC(int64(0xda8110e5f4b18ae6), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xda8110e5f4b18ae6), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceJacko80120 : UTopic_Hero__UL_ORG_JACKO_862
        {
            default DebugId = int64(0xda8110e5f4b18ae9);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceJacko80120);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_AGHDBGC_20240306_181425_1609"), int64(0xda8110e5f4b18ae9));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xda8110e5f4b18aec), Jacko != nullptr && Jacko.WasDefeatedBy(Hero));
                    DB(int64(0x132d36919eee4a24), Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning());
                }
                
                if (Jacko != nullptr && !Jacko.WasDefeatedBy(Hero))
                    return false;
                
                if (Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && !Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xda8110e5f4b18ae8), EConversationDebugInfo::Executing);
                // Ahh... Beliar's Balls, that fucking hurt.
                Jacko.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_124655_2238"));
                DC(int64(0xda8110e5f4b18ae8), EConversationDebugInfo::Done);
                DC(int64(0x31103667672fc211), EConversationDebugInfo::Executing);
                
                // Are you gonna answer my questions now? 
                Hero.AI.Say(LocText("TEXT_WIP_MFHDBGC_20240308_201221"));
                DC(int64(0x31103667672fc211), EConversationDebugInfo::Done);
                DC(int64(0x9abbd37ababe1597), EConversationDebugInfo::Executing);
                
                // Ahh, alright, alright. What do you want?
                Jacko.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_182555"));
                DC(int64(0x9abbd37ababe1597), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJacko80827 : UTopic_Hero__UL_ORG_JACKO_862
        {
            default DebugId = int64(0xda8110e5f4b18b08);
            default Caption = LocText("TEXT_WIP_VHHDWEM_20240208_151904");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceJacko83041);
            default Rules.HideIfKnows(UChoiceJacko80827);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xda8110e5f4b18b06), EConversationDebugInfo::Executing);
                
                // What does Bran look like?
                Hero.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_151904"));
                DC(int64(0xda8110e5f4b18b06), EConversationDebugInfo::Done);
                DC(int64(0xda8110e5f4b18b07), EConversationDebugInfo::Executing);
                
                // Short hair, moustache, farmer's rags ... he's got this ...
                Jacko.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_151904_2386"));
                DC(int64(0xda8110e5f4b18b07), EConversationDebugInfo::Done);
                DC(int64(0xda8110e5f4b18b0a), EConversationDebugInfo::Executing);
                // That's all I know.
                Jacko.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_151915"));
                DC(int64(0xda8110e5f4b18b0a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RICELORDFOREMAN, Document::UDocumentSegment_CH1_RICELORDFOREMAN_BranDesc);
            }
        }
        
        
        class UChoiceJacko80888 : UTopic_Hero__UL_ORG_JACKO_862
        {
            default DebugId = int64(0xda8110e5f4b18b16);
            default Caption = LocText("TEXT_WIP_VHHDWEM_20240208_160659");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceJacko83041);
            default Rules.HideIfKnows(UChoiceJacko80888);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xda8110e5f4b18b14), EConversationDebugInfo::Executing);
                // How do I get into his basement?
                Hero.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_160659"));
                DC(int64(0xda8110e5f4b18b14), EConversationDebugInfo::Done);
                DC(int64(0xda8110e5f4b18b15), EConversationDebugInfo::Executing);
                
                // Through the door, I imagine. Jokes aside, though, I'm ...
                Jacko.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_160659_443"));
                DC(int64(0xda8110e5f4b18b15), EConversationDebugInfo::Done);
                DC(int64(0xda8110e5f4b18b18), EConversationDebugInfo::Executing);
                // Maybe look around the place, or ask someone who goes ...
                Jacko.AI.Say(LocText("TEXT_WIP_VHHDWEM_20240208_161231"));
                DC(int64(0xda8110e5f4b18b18), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJacko83041 : UTopic_Hero__UL_ORG_JACKO_862
        {
            default DebugId = int64(0x31103667672fc215);
            default Caption = LocText("TEXT_WIP_MFHDBGC_20240308_201317");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceJacko83041);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_GGLOWIC_20240322_182555"), int64(0x31103667672fc215));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x31103667672fc213), EConversationDebugInfo::Executing);
                
                // I'm looking for Bran, the Rice Lord's foreman. Someone ...
                Hero.AI.Say(LocText("TEXT_WIP_MFHDBGC_20240308_201317"));
                DC(int64(0x31103667672fc213), EConversationDebugInfo::Done);
                DC(int64(0x31103667672fc214), EConversationDebugInfo::Executing);
                
                // Wait. He's missing? 
                Jacko.AI.Say(LocText("TEXT_WIP_MFHDBGC_20240308_201317_41"));
                DC(int64(0x31103667672fc214), EConversationDebugInfo::Done);
                DC(int64(0x67c2255838ead927), EConversationDebugInfo::Executing);
                
                // For a while. 
                Hero.AI.Say(LocText("TEXT_WIP_MFHDBGC_20240308_214412"));
                DC(int64(0x67c2255838ead927), EConversationDebugInfo::Done);
                DC(int64(0x9abbd37ababe159a), EConversationDebugInfo::Executing);
                
                // Aw, shit. I didn't kill him though, if that's what you ...
                Jacko.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_182933"));
                DC(int64(0x9abbd37ababe159a), EConversationDebugInfo::Done);
                DC(int64(0x9abbd37ababe159b), EConversationDebugInfo::Executing);
                // See, Bran owed me money. A ton of it. When he couldn't ...
                Jacko.AI.Say(LocText("TEXT_WIP_GGLOWIC_20240322_183027"));
                DC(int64(0x9abbd37ababe159b), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_ORG_JACKO, Document::UDocumentSegment_Glossary_UL_ORG_JACKO_Beated);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RICELORDFOREMAN, Document::UDocumentSegment_CH1_RICELORDFOREMAN_BranDebt);
                Subdialog(
                    UTopic_Jacko_82736,
                    UTopic_Jacko_82716
                );
                DC(int64(0x67c2255838ead93b), EConversationDebugInfo::Executing);
                // (sighs) I know Silas has a stash in his basement. 
                Jacko.AI.Say(LocText("TEXT_WIP_MFHDBGC_20240308_215053"));
                DC(int64(0x67c2255838ead93b), EConversationDebugInfo::Done);
                DC(int64(0x67c2255838ead93d), EConversationDebugInfo::Executing);
                // I, um, might've told Bran we could go halves if he ... ...
                Jacko.AI.Say(LocText("TEXT_WIP_MFHDBGC_20240308_215151"));
                DC(int64(0x67c2255838ead93d), EConversationDebugInfo::Done);
                DC(int64(0x67c2255838ead93f), EConversationDebugInfo::Executing);
                
                // You think he died?
                Hero.AI.Say(LocText("TEXT_WIP_MFHDBGC_20240308_215212"));
                DC(int64(0x67c2255838ead93f), EConversationDebugInfo::Done);
                DC(int64(0x67c2255838ead940), EConversationDebugInfo::Executing);
                
                // I didn't say that! But ... well. If he's been missing ...
                Jacko.AI.Say(LocText("TEXT_WIP_MFHDBGC_20240308_215239"));
                DC(int64(0x67c2255838ead940), EConversationDebugInfo::Done);
                DC(int64(0x67c2255838ead941), EConversationDebugInfo::Executing);
                
                // I'll look.
                Hero.AI.Say(LocText("TEXT_WIP_MFHDBGC_20240308_215319"));
                DC(int64(0x67c2255838ead941), EConversationDebugInfo::Done);
                DC(int64(0x67c2255838ead942), EConversationDebugInfo::Executing);
                
                // Yeah, do that. And don't even bother asking Silas to let ...
                Jacko.AI.Say(LocText("TEXT_WIP_MFHDBGC_20240308_215324"));
                DC(int64(0x67c2255838ead942), EConversationDebugInfo::Done);
                DC(int64(0x495be431265da39b), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Rayk))) { Rayk.ExchangeDailyRoutineToClass(UDailyRoutine_NC_BAU_Rayk_941_Sleep); }
                DC(int64(0x495be431265da39b), EConversationDebugInfo::Done);
                DC(int64(0x38e6b5a5d0b716d4), EConversationDebugInfo::Executing);
                Jacko.RemoveImmortality();
                DC(int64(0x38e6b5a5d0b716d4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Jacko_82736 : UTopic_Hero__UL_ORG_JACKO_862
        {
            default DebugId = int64(0x67c2255838ead92e);
            default Caption = LocText("TEXT_WIP_MFHDBGC_20240308_214449_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Jacko_82736);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x67c2255838ead92f), EConversationDebugInfo::Executing);
                // What do you mean? 
                Hero.AI.Say(LocText("TEXT_WIP_MFHDBGC_20240308_214449_2238"));
                DC(int64(0x67c2255838ead92f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Jacko_82716 : UTopic_Hero__UL_ORG_JACKO_862
        {
            default DebugId = int64(0x67c2255838ead92a);
            default Caption = LocText("TEXT_WIP_MFHDBGC_20240308_214449_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Jacko_82716);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x67c2255838ead92b), EConversationDebugInfo::Executing);
                // Spit it out. 
                Hero.AI.Say(LocText("TEXT_WIP_MFHDBGC_20240308_214449_41"));
                DC(int64(0x67c2255838ead92b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJacko83087 : UTopic_Hero__UL_ORG_JACKO_862
        {
            default DebugId = int64(0x67c2255838ead939);
            default Caption = LocText("TEXT_WIP_MFHDBGC_20240308_214815");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceJacko83041);
            default Rules.HideIfKnows(UChoiceJacko83087);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x67c2255838ead937), EConversationDebugInfo::Executing);
                // What did Bran borrow those nuggets for?
                Hero.AI.Say(LocText("TEXT_WIP_MFHDBGC_20240308_214815"));
                DC(int64(0x67c2255838ead937), EConversationDebugInfo::Done);
                DC(int64(0x67c2255838ead938), EConversationDebugInfo::Executing);
                
                // Booze, I guess? Don't know, don't care.
                Jacko.AI.Say(LocText("TEXT_WIP_MFHDBGC_20240308_214815_2785"));
                DC(int64(0x67c2255838ead938), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJacko83220 : UTopic_Hero__UL_ORG_JACKO_862
        {
            default DebugId = int64(0xfff29c9395e1bdbe);
            default Caption = LocText("TEXT_WIP_MIWVLHC_20240311_185533");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceJacko83041);
            default Rules.HideIfKnows(UChoiceJacko83220);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xfff29c9395e1bdbc), EConversationDebugInfo::Executing);
                
                // You think Silas might have killed Bran?
                Hero.AI.Say(LocText("TEXT_WIP_MIWVLHC_20240311_185533"));
                DC(int64(0xfff29c9395e1bdbc), EConversationDebugInfo::Done);
                DC(int64(0xfff29c9395e1bdbd), EConversationDebugInfo::Executing);
                
                // Honestly, I can't fathom it. But you never know. 
                Jacko.AI.Say(LocText("TEXT_WIP_MIWVLHC_20240311_185533_41"));
                DC(int64(0xfff29c9395e1bdbd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJackoExit : UTopic_Hero__UL_ORG_JACKO_862
        {
            default DebugId = int64(0xc909014289d41daa);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb2d537a50e539ee), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb2d537a50e539ee), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg862JackoBanditencamp : UTopic_Hero__UL_ORG_JACKO_862
        {
            default DebugId = int64(0xc909014289d41de0);
            default Caption = LocText("ORG_862_JACKO_BANDITENCAMP_15_00");
            default PriorityRank = 1;
            
            default Rules.RequireCharacterCloseToWaypoint(n"self", n"FP_BC_STANDAROUND_16", 200.0f, int64(0xc909014289d41de0));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc909014289d41de1), Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL != nullptr && Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL.HasSucceeded());
                }
                
                return Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL != nullptr && Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb2d537a50e53a01), EConversationDebugInfo::Executing);
                // So this is where you snuck off to.
                Hero.AI.Say(LocText("ORG_862_JACKO_BANDITENCAMP_15_00"));
                DC(int64(0xb2d537a50e53a01), EConversationDebugInfo::Done);
                DC(int64(0xb2d537a50e53a02), EConversationDebugInfo::Executing);
                
                // Yeah ... was a close shave, that. Those lunatics would ...
                Jacko.AI.Say(LocText("ORG_862_JACKO_BANDITENCAMP_06_01"));
                DC(int64(0xb2d537a50e53a02), EConversationDebugInfo::Done);
                DC(int64(0xb2d537a50e53a03), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb2d537a50e53a03), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg862JackoGoaway : UTopic_Hero__UL_ORG_JACKO_862
        {
            default DebugId = int64(0xc909014289d41dac);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceOrg862JackoGoaway);
            
            default Rules.RequireCharacterCloseToWaypoint(n"hero", n"FP_IWM_GUARD_01", 200.0f, int64(0xc909014289d41dac));
            default Rules.RequireCharacterHasNotListenedTo(n"HERO", LocText("TEXT_WIP_AGHDBGC_20240306_181425_1609"), int64(0xc909014289d41dac));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc909014289d41dae), Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL != nullptr && !Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL.HasBeenStarted());
                }
                
                return Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL != nullptr && !Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb2d537a50e539ef), EConversationDebugInfo::Executing);
                // What by Beliar are you doing here?
                Jacko.AI.Say(LocText("ORG_862_JACKO_GOAWAY_INFO_06_00"));
                DC(int64(0xb2d537a50e539ef), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_ORG_JACKO, Document::UDocumentSegment_Glossary_UL_ORG_JACKO_Introduction);
                DC(int64(0xc909014289d41db2), EConversationDebugInfo::Executing);
                Jacko.AI.StartAttackingImmediately(Hero);
                DC(int64(0xc909014289d41db2), EConversationDebugInfo::Done);
                DC(int64(0x132d36919eee4a6d), EConversationDebugInfo::Executing);
                Jacko.RefuseToTalk(5);
                DC(int64(0x132d36919eee4a6d), EConversationDebugInfo::Done);
                DC(int64(0x127f2d7f5dcd4e54), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Killian)) && ensure(IsValid(Killian.AI))) { Killian.AI.StartAttackingImmediately(Hero); }
                DC(int64(0x127f2d7f5dcd4e54), EConversationDebugInfo::Done);
                DC(int64(0xb2d537a50e539f0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb2d537a50e539f0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg862JackoGuard : UTopic_Hero__UL_ORG_JACKO_862
        {
            default DebugId = int64(0xc909014289d41db4);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceOrg862JackoGuard);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("MIS_1_PSI_KALOM_DRUGMONOPOL_10_06"), int64(0xc909014289d41db4));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc909014289d41db5), Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL != nullptr && Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL != nullptr && Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb2d537a50e539f1), EConversationDebugInfo::Executing);
                // Looks like someone got lost. 
                Jacko.AI.Say(LocText("ORG_862_JACKO_GUARD_INFO_06_00"));
                DC(int64(0xb2d537a50e539f1), EConversationDebugInfo::Done);
                DC(int64(0xb2d537a50e539f2), EConversationDebugInfo::Executing);
                
                // Cor Kalom knows about your little enterprise.
                Hero.AI.Say(LocText("ORG_862_JACKO_GUARD_INFO_15_01"));
                DC(int64(0xb2d537a50e539f2), EConversationDebugInfo::Done);
                DC(int64(0xb2d537a50e539f3), EConversationDebugInfo::Executing);
                
                // And? What's it to you?
                Jacko.AI.Say(LocText("ORG_862_JACKO_GUARD_INFO_06_02"));
                DC(int64(0xb2d537a50e539f3), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_ORG_JACKO, Document::UDocumentSegment_Glossary_UL_ORG_JACKO_Introduction);
                Subdialog(
                    UChoiceOrg862JackoGuardTempler,
                    UChoiceOrg862JackoGuardInfowert,
                    UChoiceOrg862JackoGuardAngriff
                );
            }
        }
        
        
        class UChoiceOrg862JackoGuardTempler : UTopic_Hero__UL_ORG_JACKO_862
        {
            default DebugId = int64(0xe8603e87342bfdf6);
            default Caption = LocText("ORG_862_JACKO_GUARD_TEMPLER_INFO_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb2d537a50e539f5), EConversationDebugInfo::Executing);
                // I just came to warn you. Kalom sent five templars to ...
                Hero.AI.Say(LocText("ORG_862_JACKO_GUARD_TEMPLER_INFO_15_00"));
                DC(int64(0xb2d537a50e539f5), EConversationDebugInfo::Done);
                DC(int64(0xb2d537a50e539f6), EConversationDebugInfo::Executing);
                
                // (snorts) Bullshit.
                Jacko.AI.Say(LocText("ORG_862_JACKO_GUARD_TEMPLER_INFO_06_01"));
                DC(int64(0xb2d537a50e539f6), EConversationDebugInfo::Done);
                DC(int64(0xb2d537a50e539f7), EConversationDebugInfo::Executing);
                
                // They'll be here any minute now.
                Hero.AI.Say(LocText("ORG_862_JACKO_GUARD_TEMPLER_INFO_15_02"));
                DC(int64(0xb2d537a50e539f7), EConversationDebugInfo::Done);
                DC(int64(0xb2d537a50e539f8), EConversationDebugInfo::Executing);
                
                // ... Shit. Guys! We gotta run!
                Jacko.AI.Say(LocText("ORG_862_JACKO_GUARD_TEMPLER_INFO_06_03"));
                DC(int64(0xb2d537a50e539f8), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_ORG_JACKO, Document::UDocumentSegment_Glossary_UL_ORG_JACKO_Realocated);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_DRUGMONOPOL, Document::UDocumentSegment_CH1_DRUGMONOPOL_Templars);
                DC(int64(0xc909014289d41dc0), EConversationDebugInfo::Executing);
                Jacko.ExchangeDailyRoutineToClass(UDailyRoutine_UL_ORG_Jacko_862_RunArbeitslos);
                DC(int64(0xc909014289d41dc0), EConversationDebugInfo::Done);
                DC(int64(0xc909014289d41dc1), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Killian))) { Killian.ExchangeDailyRoutineToClass(UDailyRoutine_UL_ORG_Killian_861_RunArbeitslos); }
                DC(int64(0xc909014289d41dc1), EConversationDebugInfo::Done);
                DC(int64(0xc909014289d41dc2), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Renyu))) { Renyu.ExchangeDailyRoutineToClass(UDailyRoutine_UL_ORG_Renyu_860_RunArbeitslos); }
                DC(int64(0xc909014289d41dc2), EConversationDebugInfo::Done);
                DC(int64(0xc909014289d41dc3), EConversationDebugInfo::Executing);
                G1R.Jacko_Fled = 1;
                DC(int64(0xc909014289d41dc3), EConversationDebugInfo::Done);
                DC(int64(0x8d453fe08e1feb4b), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL_DRUGMONOPOL_OBJ_CARE.SucceedQuest();
                DC(int64(0x8d453fe08e1feb4b), EConversationDebugInfo::Done);
                DC(int64(0xb2d537a50e539f9), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb2d537a50e539f9), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg862JackoGuardInfowert : UTopic_Hero__UL_ORG_JACKO_862
        {
            default DebugId = int64(0xe8603e87342bfe02);
            default Caption = LocText("ORG_862_JACKO_GUARD_INFOWERT_INFO_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb2d537a50e539fa), EConversationDebugInfo::Executing);
                // I just figured you'd be grateful for the tip-off.
                Hero.AI.Say(LocText("ORG_862_JACKO_GUARD_INFOWERT_INFO_15_00"));
                DC(int64(0xb2d537a50e539fa), EConversationDebugInfo::Done);
                DC(int64(0xb2d537a50e539fb), EConversationDebugInfo::Executing);
                
                // Ah, so that's what we're talking about. Well, alright ...
                Jacko.AI.Say(LocText("ORG_862_JACKO_GUARD_INFOWERT_INFO_06_01"));
                DC(int64(0xb2d537a50e539fb), EConversationDebugInfo::Done);
                DC(int64(0xb2d537a50e539fc), EConversationDebugInfo::Executing);
                // We're gonna relocate now ... and you should get outta ...
                Jacko.AI.Say(LocText("ORG_862_JACKO_GUARD_INFOWERT_INFO_06_02"));
                DC(int64(0xb2d537a50e539fc), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_ORG_JACKO, Document::UDocumentSegment_Glossary_UL_ORG_JACKO_Realocated);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_DRUGMONOPOL, Document::UDocumentSegment_CH1_DRUGMONOPOL_SmartTalking);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Executing);
                Jacko.AddItemToInventory(UItMi_Orenugget, 50);
                DC(int64(0xcbe41b81f2725efd), EConversationDebugInfo::Done);
                DC(int64(0xc909014289d41dc9), EConversationDebugInfo::Executing);
                Jacko.AI.GiveItemTo(Hero, UItMi_Orenugget, 50);
                DC(int64(0xc909014289d41dc9), EConversationDebugInfo::Done);
                DC(int64(0xc909014289d41dca), EConversationDebugInfo::Executing);
                Jacko.ExchangeDailyRoutineToClass(UDailyRoutine_UL_ORG_Jacko_862_Arbeitslos);
                DC(int64(0xc909014289d41dca), EConversationDebugInfo::Done);
                DC(int64(0xc909014289d41dcb), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Killian))) { Killian.ExchangeDailyRoutineToClass(UDailyRoutine_UL_ORG_Killian_861_Arbeitslos); }
                DC(int64(0xc909014289d41dcb), EConversationDebugInfo::Done);
                DC(int64(0xc909014289d41dcc), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Renyu))) { Renyu.ExchangeDailyRoutineToClass(UDailyRoutine_UL_ORG_Renyu_860_Arbeitslos); }
                DC(int64(0xc909014289d41dcc), EConversationDebugInfo::Done);
                DC(int64(0xc909014289d41dcd), EConversationDebugInfo::Executing);
                G1R.Jacko_Fled = 1;
                DC(int64(0xc909014289d41dcd), EConversationDebugInfo::Done);
                DC(int64(0x8d453fe08e1feb4d), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_DRUGMONOPOL_DRUGMONOPOL_OBJ_CARE.SucceedQuest();
                DC(int64(0x8d453fe08e1feb4d), EConversationDebugInfo::Done);
                DC(int64(0xb2d537a50e539fd), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb2d537a50e539fd), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceOrg862JackoGuardAngriff : UTopic_Hero__UL_ORG_JACKO_862
        {
            default DebugId = int64(0xe8603e87342bfe0e);
            default Caption = LocText("ORG_862_JACKO_GUARD_ANGRIFF_INFO_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb2d537a50e539fe), EConversationDebugInfo::Executing);
                // I just figured I might as well finish you off myself.
                Hero.AI.Say(LocText("ORG_862_JACKO_GUARD_ANGRIFF_INFO_15_00"));
                DC(int64(0xb2d537a50e539fe), EConversationDebugInfo::Done);
                DC(int64(0xb2d537a50e539ff), EConversationDebugInfo::Executing);
                
                // ... That so. Boys! Lend me a hand here, will you?
                Jacko.AI.Say(LocText("ORG_862_JACKO_GUARD_ANGRIFF_INFO_06_01"));
                DC(int64(0xb2d537a50e539ff), EConversationDebugInfo::Done);
                DC(int64(0xc909014289d41dd4), EConversationDebugInfo::Executing);
                Jacko.AI.StartAttackingImmediately(Hero);
                DC(int64(0xc909014289d41dd4), EConversationDebugInfo::Done);
                DC(int64(0xc909014289d41dd8), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Killian)) && ensure(IsValid(Killian.AI))) { Killian.AI.StartAttackingImmediately(Hero); }
                DC(int64(0xc909014289d41dd8), EConversationDebugInfo::Done);
                DC(int64(0xc909014289d41ddc), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Renyu)) && ensure(IsValid(Renyu.AI))) { Renyu.AI.StartAttackingImmediately(Hero); }
                DC(int64(0xc909014289d41ddc), EConversationDebugInfo::Done);
                DC(int64(0xf5618ed16cb40d5c), EConversationDebugInfo::Executing);
                G1R.Jacko_Fled = 2;
                DC(int64(0xf5618ed16cb40d5c), EConversationDebugInfo::Done);
                DC(int64(0xb2d537a50e53a00), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb2d537a50e53a00), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */