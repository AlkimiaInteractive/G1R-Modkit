#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_ORG_SILAS_841 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_ORG_SILAS_841";
        }
        
        
        class UTopic_Hero__NC_ORG_SILAS_841 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_ORG_SILAS_841";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetSilas() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"Hero");
            }
            
            AGothicCharacterState GetRayk() const property
            {
                return GetCharacter(n"NC_BAU_RAYK_941");
            }
        }
        
        
        class UChoiceSilas78516 : UTopic_Hero__NC_ORG_SILAS_841
        {
            default DebugId = int64(0xeb67f06250d6d4c6);
            default Caption = LocText("TEXT_DDIAZ_20240205_160425");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceSilas78516);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xeb67f06250d6d4c9), Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDJOB.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDJOB.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeb67f06250d6d4c4), EConversationDebugInfo::Executing);
                // The Rice Lord sent me. He said you could use a hand?
                Hero.AI.Say(LocText("TEXT_DDIAZ_20240205_160425"));
                DC(int64(0xeb67f06250d6d4c4), EConversationDebugInfo::Done);
                DC(int64(0xeb67f06250d6d4c5), EConversationDebugInfo::Executing);
                
                // Ha. Right on the mark.
                Silas.AI.Say(LocText("TEXT_DDIAZ_20240205_160425_41"));
                DC(int64(0xeb67f06250d6d4c5), EConversationDebugInfo::Done);
                DC(int64(0xeb67f06250d6d4cb), EConversationDebugInfo::Executing);
                
                // What do you mean? 
                Hero.AI.Say(LocText("TEXT_DDIAZ_20240205_160806"));
                DC(int64(0xeb67f06250d6d4cb), EConversationDebugInfo::Done);
                DC(int64(0xeb67f06250d6d4ca), EConversationDebugInfo::Executing);
                
                // See that guy over there? The one who looks like he ain't ...
                Silas.AI.Say(LocText("TEXT_DDIAZ_20240205_160740"));
                DC(int64(0xeb67f06250d6d4ca), EConversationDebugInfo::Done);
                DC(int64(0x6cb95be92da295f6), EConversationDebugInfo::Executing);
                // I asked the bouncers to give him a proper pastin', but ...
                Silas.AI.Say(LocText("TEXT_WIP_VFHDBGC_20240301_182410"));
                DC(int64(0x6cb95be92da295f6), EConversationDebugInfo::Done);
                DC(int64(0x6cb95be92da295f7), EConversationDebugInfo::Executing);
                // Can you take care of it?
                Silas.AI.Say(LocText("TEXT_WIP_VFHDBGC_20240301_183532"));
                DC(int64(0x6cb95be92da295f7), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_SILAS, Document::UDocumentSegment_Glossary_NC_ORG_SILAS_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RICELORDJOB, Document::UDocumentSegment_CH1_RICELORDJOB_Tavern);
                DC(int64(0xe6263f0bcd03bc2), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_ASK_SILAS.SucceedQuest();
                DC(int64(0xe6263f0bcd03bc2), EConversationDebugInfo::Done);
                DC(int64(0xa9a741ef3bb53c87), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Rayk))) { Rayk.RemoveImmortality(); }
                DC(int64(0xa9a741ef3bb53c87), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Silas_86719,
                    UTopic_Silas_86739,
                    UTopic_Silas_86917
                );
            }
        }
        
        
        class UTopic_Silas_86719 : UTopic_Hero__NC_ORG_SILAS_841
        {
            default DebugId = int64(0x6cb95be92da295f9);
            default Caption = LocText("TEXT_WIP_VFHDBGC_20240301_183551_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Silas_86719);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6cb95be92da295fa), EConversationDebugInfo::Executing);
                // Who is he? One of the bandits?
                Hero.AI.Say(LocText("TEXT_WIP_VFHDBGC_20240301_183551_2785"));
                DC(int64(0x6cb95be92da295fa), EConversationDebugInfo::Done);
                DC(int64(0x6cb95be92da29601), EConversationDebugInfo::Executing);
                
                // Nah, a digger. Though he ain't gone down the pit for ...
                Silas.AI.Say(LocText("TEXT_WIP_VFHDBGC_20240301_183614"));
                DC(int64(0x6cb95be92da29601), EConversationDebugInfo::Done);
                DC(int64(0x6cb95be92da295fc), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x6cb95be92da295fc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Silas_86739 : UTopic_Hero__NC_ORG_SILAS_841
        {
            default DebugId = int64(0x6cb95be92da295fd);
            default Caption = LocText("TEXT_WIP_VFHDBGC_20240301_183551_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Silas_86739);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6cb95be92da295fe), EConversationDebugInfo::Executing);
                // What's got him so upset?
                Hero.AI.Say(LocText("TEXT_WIP_VFHDBGC_20240301_183551_3286"));
                DC(int64(0x6cb95be92da295fe), EConversationDebugInfo::Done);
                DC(int64(0x6cb95be92da29606), EConversationDebugInfo::Executing);
                
                // Don't know, and don't care. 
                Silas.AI.Say(LocText("TEXT_WIP_VFHDBGC_20240301_183804"));
                DC(int64(0x6cb95be92da29606), EConversationDebugInfo::Done);
                DC(int64(0x6cb95be92da29607), EConversationDebugInfo::Executing);
                // This ain't a confession room, it's a tavern, and the men ...
                Silas.AI.Say(LocText("TEXT_WIP_VFHDBGC_20240301_183855"));
                DC(int64(0x6cb95be92da29607), EConversationDebugInfo::Done);
                DC(int64(0x6cb95be92da29605), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x6cb95be92da29605), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Silas_86917 : UTopic_Hero__NC_ORG_SILAS_841
        {
            default DebugId = int64(0x6cb95be92da29602);
            default Caption = LocText("TEXT_WIP_VFHDBGC_20240301_183731_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Silas_86917);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x6cb95be92da29603), EConversationDebugInfo::Executing);
                // I'll take care of it. 
                Hero.AI.Say(LocText("TEXT_WIP_VFHDBGC_20240301_183731_686"));
                DC(int64(0x6cb95be92da29603), EConversationDebugInfo::Done);
                DC(int64(0x6cb95be92da29608), EConversationDebugInfo::Executing);
                
                // Good. Let me know when you're done.
                Silas.AI.Say(LocText("TEXT_WIP_VFHDBGC_20240301_183921"));
                DC(int64(0x6cb95be92da29608), EConversationDebugInfo::Done);
                DC(int64(0xeb67f06250d6d4cc), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xeb67f06250d6d4cc), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSilas78543 : UTopic_Hero__NC_ORG_SILAS_841
        {
            default DebugId = int64(0x27a602e51aadf19);
            default Caption = LocText("TEXT_DDIAZ_20240206_111400");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceSilas78543);
            default Rules.HideIfKnows(UChoiceSilas78776);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_DDIAZ_20240205_161716_2785"), int64(0x27a602e51aadf19));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xeb67f06250d6d4d7), Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDJOB.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDJOB.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x27a602e51aadf17), EConversationDebugInfo::Executing);
                // Rayk won't bother you anymore. 
                Hero.AI.Say(LocText("TEXT_DDIAZ_20240206_111400"));
                DC(int64(0x27a602e51aadf17), EConversationDebugInfo::Done);
                DC(int64(0x27a602e51aadf18), EConversationDebugInfo::Executing);
                
                // Really? All I saw was the two of you heading out there ...
                Silas.AI.Say(LocText("TEXT_DDIAZ_20240206_111400_41"));
                DC(int64(0x27a602e51aadf18), EConversationDebugInfo::Done);
                DC(int64(0x27a602e51aadf1c), EConversationDebugInfo::Executing);
                // What did you tell him? 
                Silas.AI.Say(LocText("TEXT_DDIAZ_20240206_112600"));
                DC(int64(0x27a602e51aadf1c), EConversationDebugInfo::Done);
                DC(int64(0xe6263f0bcd03bd2), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_REPORT_SILAS.SucceedQuest();
                DC(int64(0xe6263f0bcd03bd2), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Silas_83249,
                    UTopic_Silas_83269
                );
                DC(int64(0x466a7f49ecb2c67a), EConversationDebugInfo::Executing);
                // Anyway, let's just hope he learned his lesson - though I ...
                Silas.AI.Say(LocText("TEXT_WIP_ZFHDBGC_20240305_192637_3436"));
                DC(int64(0x466a7f49ecb2c67a), EConversationDebugInfo::Done);
                DC(int64(0x466a7f49ecb2c67b), EConversationDebugInfo::Executing);
                // Thanks for your help, freshie. It's good the Rice Lord ...
                Silas.AI.Say(LocText("TEXT_WIP_ZFHDBGC_20240305_192708"));
                DC(int64(0x466a7f49ecb2c67b), EConversationDebugInfo::Done);
                DC(int64(0x27a602e51aadf1d), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x27a602e51aadf1d), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Silas_83249 : UTopic_Hero__NC_ORG_SILAS_841
        {
            default DebugId = int64(0x466a7f49ecb2c66f);
            default Caption = LocText("TEXT_WIP_ZFHDBGC_20240305_192332_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Silas_83249);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x466a7f49ecb2c670), EConversationDebugInfo::Executing);
                // To stop being an asshole. 
                Hero.AI.Say(LocText("TEXT_WIP_ZFHDBGC_20240305_192332_2238"));
                DC(int64(0x466a7f49ecb2c670), EConversationDebugInfo::Done);
                DC(int64(0x466a7f49ecb2c678), EConversationDebugInfo::Executing);
                
                // Ah-ha. Well, you must have a way with words. 
                Silas.AI.Say(LocText("TEXT_WIP_ZFHDBGC_20240305_192616"));
                DC(int64(0x466a7f49ecb2c678), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Silas_83269 : UTopic_Hero__NC_ORG_SILAS_841
        {
            default DebugId = int64(0x466a7f49ecb2c673);
            default Caption = LocText("TEXT_WIP_ZFHDBGC_20240305_192332_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Silas_83269);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x466a7f49ecb2c674), EConversationDebugInfo::Executing);
                
                // I gave him something to drink. He told me about how the ...
                Hero.AI.Say(LocText("TEXT_WIP_ZFHDBGC_20240305_192332_2785"));
                DC(int64(0x466a7f49ecb2c674), EConversationDebugInfo::Done);
                DC(int64(0x466a7f49ecb2c677), EConversationDebugInfo::Executing);
                
                // Ah, that old rag. Yeah, Hakon fucked him over, but ...
                Silas.AI.Say(LocText("TEXT_WIP_ZFHDBGC_20240305_192517"));
                DC(int64(0x466a7f49ecb2c677), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSilas78776 : UTopic_Hero__NC_ORG_SILAS_841
        {
            default DebugId = int64(0xeb67f06250d6d4cf);
            default Caption = LocText("TEXT_DDIAZ_20240205_160952");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceSilas78543);
            default Rules.HideIfKnows(UChoiceSilas78776);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_KVXAWSC_20240412_100242"), int64(0xeb67f06250d6d4cf));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xeb67f06250d6d4d4), Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDJOB.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_RICELORDJOB != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDJOB.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xeb67f06250d6d4cd), EConversationDebugInfo::Executing);
                
                // Rayk won't bother you anymore.
                Hero.AI.Say(LocText("TEXT_DDIAZ_20240205_160952"));
                DC(int64(0xeb67f06250d6d4cd), EConversationDebugInfo::Done);
                DC(int64(0x466a7f49ecb2c680), EConversationDebugInfo::Executing);
                
                // Yeah, I saw it. You really showed him, didn't you?
                Silas.AI.Say(LocText("TEXT_WIP_ZFHDBGC_20240305_192939"));
                DC(int64(0x466a7f49ecb2c680), EConversationDebugInfo::Done);
                DC(int64(0x466a7f49ecb2c681), EConversationDebugInfo::Executing);
                // Let's just hope he learned his lesson this time. Though ...
                Silas.AI.Say(LocText("TEXT_WIP_ZFHDBGC_20240305_192945"));
                DC(int64(0x466a7f49ecb2c681), EConversationDebugInfo::Done);
                DC(int64(0x466a7f49ecb2c682), EConversationDebugInfo::Executing);
                // Thanks, freshie. Glad the Rice Lord sent you. 
                Silas.AI.Say(LocText("TEXT_WIP_ZFHDBGC_20240305_192952"));
                DC(int64(0x466a7f49ecb2c682), EConversationDebugInfo::Done);
                DC(int64(0xe6263f0bcd03bcc), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_RICELORDJOB_RICELORDJOB_OBJ_REPORT_SILAS.SucceedQuest();
                DC(int64(0xe6263f0bcd03bcc), EConversationDebugInfo::Done);
                DC(int64(0xeb67f06250d6d4d2), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xeb67f06250d6d4d2), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSilas80551 : UTopic_Hero__NC_ORG_SILAS_841
        {
            default DebugId = int64(0x132d36919eee4a28);
            default Caption = LocText("TEXT_WIP_QJSKLDM_20240212_111450");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceSilas80551);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x132d36919eee4a2b), Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x132d36919eee4a26), EConversationDebugInfo::Executing);
                // I'm looking for Bran, the Rice Lord's foreman. Any idea ...
                Hero.AI.Say(LocText("TEXT_WIP_QJSKLDM_20240212_111450"));
                DC(int64(0x132d36919eee4a26), EConversationDebugInfo::Done);
                DC(int64(0x132d36919eee4a27), EConversationDebugInfo::Executing);
                
                // Bran? Nah. Sorry. 
                Silas.AI.Say(LocText("TEXT_WIP_QJSKLDM_20240212_111450_2238"));
                DC(int64(0x132d36919eee4a27), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSilas80620 : UTopic_Hero__NC_ORG_SILAS_841
        {
            default DebugId = int64(0x132d36919eee4a2e);
            default Caption = LocText("TEXT_WIP_QJSKLDM_20240212_111727");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSilas80551);
            default Rules.HideIfKnows(UChoiceSilas80620);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x859f0b9ed0838fb5), Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_FINDBRAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_FINDBRAN.HasSucceeded());
                }
                
                return Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_FINDBRAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_FINDBRAN.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x132d36919eee4a2c), EConversationDebugInfo::Executing);
                
                // I found Bran dead in your basement. 
                Hero.AI.Say(LocText("TEXT_WIP_QJSKLDM_20240212_111727"));
                DC(int64(0x132d36919eee4a2c), EConversationDebugInfo::Done);
                DC(int64(0x132d36919eee4a2d), EConversationDebugInfo::Executing);
                
                // Dead? What by Beliar are you talking about? 
                Silas.AI.Say(LocText("TEXT_WIP_QJSKLDM_20240212_111727_2785"));
                DC(int64(0x132d36919eee4a2d), EConversationDebugInfo::Done);
                DC(int64(0xfff29c9395e1bdcd), EConversationDebugInfo::Executing);
                
                // You heard me. Are you sure you haven't seen him lately? 
                Hero.AI.Say(LocText("TEXT_WIP_MIWVLHC_20240311_193015"));
                DC(int64(0xfff29c9395e1bdcd), EConversationDebugInfo::Done);
                DC(int64(0x132d36919eee4a32), EConversationDebugInfo::Executing);
                
                // I ... No, I haven't. I had no idea about this, I swear ...
                Silas.AI.Say(LocText("TEXT_WIP_QJSKLDM_20240212_114920"));
                DC(int64(0x132d36919eee4a32), EConversationDebugInfo::Done);
                DC(int64(0xfff29c9395e1bdcf), EConversationDebugInfo::Executing);
                // ... The lake. That's it - he must have tried to break in ...
                Silas.AI.Say(LocText("TEXT_WIP_MIWVLHC_20240311_193418"));
                DC(int64(0xfff29c9395e1bdcf), EConversationDebugInfo::Done);
                DC(int64(0x132d36919eee4a3c), EConversationDebugInfo::Executing);
                // Shit. Poor fool. 
                Silas.AI.Say(LocText("TEXT_WIP_QJSKLDM_20240212_115558"));
                DC(int64(0x132d36919eee4a3c), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Silas_83253,
                    UTopic_Silas_83273,
                    UTopic_Silas_84013,
                    UTopic_Silas_83706
                );
            }
        }
        
        
        class UTopic_Silas_83253 : UTopic_Hero__NC_ORG_SILAS_841
        {
            default DebugId = int64(0x91cd37b949f162ba);
            default Caption = LocText("TEXT_WIP_LIWVLHC_20240312_170745_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Silas_83253);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x132d36919eee4a43), Hero != nullptr && Hero.HasItem(UItMs_Axe_Bran, 1, 0));
                    DB(int64(0xb0d0e657f6118725), Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_VHHDWEM_20240208_151904_2386")));
                    DB(int64(0x859f0b9ed0838fbc), Hero != nullptr && Hero.HasItem(UItMs_Axe_Bran, 1, 0));
                    DB(int64(0x859f0b9ed0838fbd), G1R.JackoNoteRead != 0);
                }
                
                if (Hero != nullptr && Hero.HasItem(UItMs_Axe_Bran, 1, 0) && Hero != nullptr && Hero.HasListenedTo(LocText("TEXT_WIP_VHHDWEM_20240208_151904_2386")))
                    return true;
                
                if (Hero != nullptr && Hero.HasItem(UItMs_Axe_Bran, 1, 0) && G1R.JackoNoteRead != 0)
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x91cd37b949f162bb), EConversationDebugInfo::Executing);
                // Don't play dumb. I know you killed him. 
                Hero.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_170745_41"));
                DC(int64(0x91cd37b949f162bb), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162c2), EConversationDebugInfo::Executing);
                
                // What are you on about?
                Silas.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_170839"));
                DC(int64(0x91cd37b949f162c2), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162c3), EConversationDebugInfo::Executing);
                
                // I found Bran's axe in your chest. He had it the last ...
                Hero.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_170855"));
                DC(int64(0x91cd37b949f162c3), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162c4), EConversationDebugInfo::Executing);
                
                // ... Shit. SHIT! All right, fine, I killed Bran. But only ...
                Silas.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_170939"));
                DC(int64(0x91cd37b949f162c4), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162d3), EConversationDebugInfo::Executing);
                // Serves him right if you ask me. That man ain't never ...
                Silas.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_171527"));
                DC(int64(0x91cd37b949f162d3), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162dd), EConversationDebugInfo::Executing);
                // The only reason he got away with it was because the Rice ...
                Silas.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_171651"));
                DC(int64(0x91cd37b949f162dd), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162df), EConversationDebugInfo::Executing);
                // And listen, let's just keep this between us, okay? I'll ...
                Silas.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_171819"));
                DC(int64(0x91cd37b949f162df), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Silas_84484,
                    UTopic_Silas_84504,
                    UTopic_Silas_85199
                );
            }
        }
        
        
        class UTopic_Silas_83273 : UTopic_Hero__NC_ORG_SILAS_841
        {
            default DebugId = int64(0x91cd37b949f162be);
            default Caption = LocText("TEXT_WIP_LIWVLHC_20240312_170745_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Silas_83273);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x91cd37b949f162bf), EConversationDebugInfo::Executing);
                // Did you kill Bran? 
                Hero.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_170745_2238"));
                DC(int64(0x91cd37b949f162bf), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162c9), EConversationDebugInfo::Executing);
                
                // What? Why would I do that? 
                Silas.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_171051"));
                DC(int64(0x91cd37b949f162c9), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162ca), EConversationDebugInfo::Executing);
                // I'd be careful throwing accusations around like that. 
                Silas.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_171125"));
                DC(int64(0x91cd37b949f162ca), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162c1), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x91cd37b949f162c1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Silas_84013 : UTopic_Hero__NC_ORG_SILAS_841
        {
            default DebugId = int64(0x91cd37b949f162cb);
            default Caption = LocText("TEXT_WIP_LIWVLHC_20240312_171325_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Silas_84013);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x91cd37b949f162cc), EConversationDebugInfo::Executing);
                // I think he was after your stash.
                Hero.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_171325_2785"));
                DC(int64(0x91cd37b949f162cc), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162cf), EConversationDebugInfo::Executing);
                
                // My ... how do you know that?
                Silas.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_171353"));
                DC(int64(0x91cd37b949f162cf), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162d1), EConversationDebugInfo::Executing);
                
                // Long story.
                Hero.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_171404"));
                DC(int64(0x91cd37b949f162d1), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162ce), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x91cd37b949f162ce), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Silas_83706 : UTopic_Hero__NC_ORG_SILAS_841
        {
            default DebugId = int64(0x91cd37b949f162c5);
            default Caption = LocText("TEXT_WIP_LIWVLHC_20240312_171016_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Silas_83706);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x91cd37b949f162c6), EConversationDebugInfo::Executing);
                // I'll go tell the Rice Lord. 
                Hero.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_171016_1924"));
                DC(int64(0x91cd37b949f162c6), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162d2), EConversationDebugInfo::Executing);
                
                // You should. He won't be happy about this.
                Silas.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_171408"));
                DC(int64(0x91cd37b949f162d2), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RICELORDFOREMAN, Document::UDocumentSegment_CH1_RICELORDFOREMAN_CorpseID);
                DC(int64(0x3262abdbfba919eb), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_REPORT.StartQuest();
                DC(int64(0x3262abdbfba919eb), EConversationDebugInfo::Done);
                DC(int64(0x3262abdbfba919f1), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_CONFRONT.SucceedQuest();
                DC(int64(0x3262abdbfba919f1), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a13a), EConversationDebugInfo::Executing);
                Silas.RemoveImmortality();
                DC(int64(0x7858bf075764a13a), EConversationDebugInfo::Done);
                DC(int64(0x132d36919eee4a41), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x132d36919eee4a41), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Silas_84484 : UTopic_Hero__NC_ORG_SILAS_841
        {
            default DebugId = int64(0x91cd37b949f162d5);
            default Caption = LocText("TEXT_WIP_LIWVLHC_20240312_171602_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Silas_84484);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x91cd37b949f162d6), EConversationDebugInfo::Executing);
                // Why didn't you get rid of the body?
                Hero.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_171602_3436"));
                DC(int64(0x91cd37b949f162d6), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162e0), EConversationDebugInfo::Executing);
                
                // What do you think I was trying to do for the past three ...
                Silas.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_171857"));
                DC(int64(0x91cd37b949f162e0), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162e1), EConversationDebugInfo::Executing);
                // And before you ask, yes, same story with that bloody axe ...
                Silas.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_171914"));
                DC(int64(0x91cd37b949f162e1), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162d8), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x91cd37b949f162d8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Silas_84504 : UTopic_Hero__NC_ORG_SILAS_841
        {
            default DebugId = int64(0x91cd37b949f162d9);
            default Caption = LocText("TEXT_WIP_QJSKLDM_20240212_114949_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Silas_84504);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x132d36919eee4a35), EConversationDebugInfo::Executing);
                // Forget it. 
                Hero.AI.Say(LocText("TEXT_WIP_QJSKLDM_20240212_114949_3286"));
                DC(int64(0x132d36919eee4a35), EConversationDebugInfo::Done);
                DC(int64(0x132d36919eee4a3d), EConversationDebugInfo::Executing);
                
                // You- (sharp sigh) Fine. I'll tell the Rice Lord what I ...
                Silas.AI.Say(LocText("TEXT_WIP_QJSKLDM_20240212_120029"));
                DC(int64(0x132d36919eee4a3d), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162ed), EConversationDebugInfo::Executing);
                // He'll get it. I'm sure of it.
                Silas.AI.Say(LocText("TEXT_WIP_LIWVLHC_20240312_172053"));
                DC(int64(0x91cd37b949f162ed), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RICELORDFOREMAN, Document::UDocumentSegment_CH1_RICELORDFOREMAN_SilasConfess);
                DC(int64(0x3262abdbfba919f1), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_CONFRONT.SucceedQuest();
                DC(int64(0x3262abdbfba919f1), EConversationDebugInfo::Done);
                DC(int64(0x3262abdbfba919f7), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_REPORT.StartQuest();
                DC(int64(0x3262abdbfba919f7), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a13e), EConversationDebugInfo::Executing);
                Silas.RemoveImmortality();
                DC(int64(0x7858bf075764a13e), EConversationDebugInfo::Done);
                DC(int64(0x132d36919eee4a3e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x132d36919eee4a3e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Silas_85199 : UTopic_Hero__NC_ORG_SILAS_841
        {
            default DebugId = int64(0x91cd37b949f162e7);
            default Caption = LocText("TEXT_WIP_QJSKLDM_20240212_114949_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Silas_85199);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x132d36919eee4a39), EConversationDebugInfo::Executing);
                // Deal.
                Hero.AI.Say(LocText("TEXT_WIP_QJSKLDM_20240212_114949_2386"));
                DC(int64(0x132d36919eee4a39), EConversationDebugInfo::Done);
                DC(int64(0x132d36919eee4a42), EConversationDebugInfo::Executing);
                
                // Good ... good. Let sleeping dogs lie. Here, this should ...
                Silas.AI.Say(LocText("TEXT_WIP_QJSKLDM_20240212_120324"));
                DC(int64(0x132d36919eee4a42), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RICELORDFOREMAN, Document::UDocumentSegment_CH1_RICELORDFOREMAN_SilasBribe);
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Executing);
                Silas.AddItemToInventory(UItMi_Orenugget, 50);
                DC(int64(0xe87722ef5b6a460d), EConversationDebugInfo::Done);
                DC(int64(0x132d36919eee4a40), EConversationDebugInfo::Executing);
                Silas.AI.GiveItemTo(Hero, UItMi_Orenugget, 50);
                DC(int64(0x132d36919eee4a40), EConversationDebugInfo::Done);
                DC(int64(0x3262abdbfba91a0d), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_REPORT.StartQuest();
                DC(int64(0x3262abdbfba91a0d), EConversationDebugInfo::Done);
                DC(int64(0x3262abdbfba91a0f), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN_RICELORDFOREMAN_OBJ_CONFRONT.SucceedQuest();
                DC(int64(0x3262abdbfba91a0f), EConversationDebugInfo::Done);
                DC(int64(0x7858bf075764a13c), EConversationDebugInfo::Executing);
                Silas.RemoveImmortality();
                DC(int64(0x7858bf075764a13c), EConversationDebugInfo::Done);
                DC(int64(0x91cd37b949f162ec), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x91cd37b949f162ec), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSilas81291 : UTopic_Hero__NC_ORG_SILAS_841
        {
            default DebugId = int64(0xb0d0e657f6118728);
            default Caption = LocText("TEXT_WIP_BKSKLDM_20240219_162155");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSilas80551);
            default Rules.HideIfKnows(UChoiceSilas81291);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb0d0e657f611872b), Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning());
                    DB(int64(0x1095bc8aa316c3f4), Hero != nullptr && Hero.HasItem(UItWr_Scroll_Bran_01, 1, 0));
                    DB(int64(0xb2b8122c509b2b2c), G1R.BranNoteRead == 0);
                }
                
                if (Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && !Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning())
                    return false;
                
                if (Hero != nullptr && !Hero.HasItem(UItWr_Scroll_Bran_01, 1, 0))
                    return false;
                
                if (G1R.BranNoteRead != 0)
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb0d0e657f6118726), EConversationDebugInfo::Executing);
                // I found a corpse in your cellar.
                Hero.AI.Say(LocText("TEXT_WIP_BKSKLDM_20240219_162155"));
                DC(int64(0xb0d0e657f6118726), EConversationDebugInfo::Done);
                DC(int64(0xb0d0e657f6118727), EConversationDebugInfo::Executing);
                
                // You - what are you talking about? Get out of here. 
                Silas.AI.Say(LocText("TEXT_WIP_BKSKLDM_20240219_162155_41"));
                DC(int64(0xb0d0e657f6118727), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_RICELORDFOREMAN, Document::UDocumentSegment_CH1_RICELORDFOREMAN_CorpseID);
                DC(int64(0xb0d0e657f611872e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xb0d0e657f611872e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSilasExit : UTopic_Hero__NC_ORG_SILAS_841
        {
            default DebugId = int64(0x7d9fce815b58cbf3);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7d9fce815b58cbf4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x7d9fce815b58cbf4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSilasHehler : UTopic_Hero__NC_ORG_SILAS_841
        {
            default DebugId = int64(0x7d9fce815b58cbf5);
            default Caption = LocText("DIA_SILAS_HEHLER_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSilasHehler);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7d9fce815b58cbf6), EConversationDebugInfo::Executing);
                // How's business?
                Hero.AI.Say(LocText("DIA_SILAS_HEHLER_15_00"));
                DC(int64(0x7d9fce815b58cbf6), EConversationDebugInfo::Done);
                DC(int64(0x7d9fce815b58cbf7), EConversationDebugInfo::Executing);
                
                // Good ... too good, actually, the lads drink so much ...
                Silas.AI.Say(LocText("DIA_SILAS_HEHLER_06_01"));
                DC(int64(0x7d9fce815b58cbf7), EConversationDebugInfo::Done);
                DC(int64(0x7d9fce815b58cbf8), EConversationDebugInfo::Executing);
                // But I get it. What else should they use their nuggets ...
                Silas.AI.Say(LocText("DIA_SILAS_HEHLER_06_02"));
                DC(int64(0x7d9fce815b58cbf8), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_SILAS, Document::UDocumentSegment_Glossary_NC_ORG_SILAS_Introduction);
            }
        }
        
        
        class UChoiceSilasTrade : UTopic_Hero__NC_ORG_SILAS_841
        {
            default DebugId = int64(0x7d9fce815b58cbf9);
            default Caption = LocText("DIA_SILAS_TRADE_15_00");
            default PriorityRank = 1;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x7d9fce815b58cbfa), EConversationDebugInfo::Executing);
                // I want a drink.
                Hero.AI.Say(LocText("DIA_SILAS_TRADE_15_00"));
                DC(int64(0x7d9fce815b58cbfa), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_SILAS, Document::UDocumentSegment_Glossary_NC_ORG_SILAS_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_ORG_SILAS, Document::UDocumentSegment_Glossary_NC_ORG_SILAS_Trader);
                DB(int64(0x7ec56dc721168ab6), Silas != nullptr && Silas.IsAngryTowards(Hero));
                
                if (Silas != nullptr && Silas.IsAngryTowards(Hero))
                {
                    DC(int64(0x7ec56dc721168ab8), EConversationDebugInfo::Executing);
                    // I only sell to people who respect the rules. Get lost!
                    Silas.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_110757_443"));
                    DC(int64(0x7ec56dc721168ab8), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_silas_trade_exit_1");
                    DC(int64(0x7ec56dc721168ad3), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x7ec56dc721168ad3), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x7ec56dc721168abc), EConversationDebugInfo::Executing);
                    // Sure. If you got the nuggs...
                    Silas.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_110801_1769"));
                    DC(int64(0x7ec56dc721168abc), EConversationDebugInfo::Done);
                    DC(int64(0xc890e89589b05725), EConversationDebugInfo::Executing);
                    Silas.AI.StartTradingWith(Hero);
                    DC(int64(0xc890e89589b05725), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_silas_trade_exit_2");
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */