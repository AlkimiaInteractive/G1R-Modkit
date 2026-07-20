#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_NOV_DARRION_1312 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_NOV_DARRION_1312";
        }
        
        
        class UTopic_Hero__SC_NOV_DARRION_1312 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_NOV_DARRION_1312";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetDarrion() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetStone() const property
            {
                return GetCharacter(n"OCR_GRD_STONE_219");
            }
            
            AGothicCharacterState GetGorNaZar() const property
            {
                return GetCharacter(n"OG_TPL_GORNAZAR_1446");
            }
        }
        
        
        class UTopic_OCR_GRD_STONE_219__SC_NOV_DARRION_1312 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_NOV_DARRION_1312";
            default WithCharacter = n"OCR_GRD_STONE_219";
            
            AGothicCharacterState GetDarrion() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
            
            AGothicCharacterState GetStone() const property
            {
                return GetCharacter(n"OCR_GRD_STONE_219");
            }
            
            AGothicCharacterState GetGorNaZar() const property
            {
                return GetCharacter(n"OG_TPL_GORNAZAR_1446");
            }
        }
        
        
        class UChoiceDarrion112734 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x807d0bbb1200bdb9);
            default Caption = LocText("TEXT_WIP_VKWAAOH_20241127_122855");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceDarrion112734);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x807d0bbb1200be02), Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_FINDSWORD != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_FINDSWORD.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_FINDSWORD != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_FINDSWORD.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x807d0bbb1200bdb3), EConversationDebugInfo::Executing);
                // I'm looking for a templar. He's supposed to carry a ...
                Hero.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_122855"));
                DC(int64(0x807d0bbb1200bdb3), EConversationDebugInfo::Done);
                DB(int64(0x807d0bbb1200bdc4), G1R.Darrion_Teacher != 0);
                
                if (G1R.Darrion_Teacher != 0)
                {
                    DC(int64(0x807d0bbb1200be33), EConversationDebugInfo::Executing);
                    // Ah, me former student returns. Which piece was it that ...
                    Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_124123"));
                    DC(int64(0x807d0bbb1200be33), EConversationDebugInfo::Done);
                    DC(int64(0x807d0bbb1200be51), EConversationDebugInfo::Executing);
                    
                    // One of your special designs. And a templar who brags ...
                    Hero.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_124220"));
                    DC(int64(0x807d0bbb1200be51), EConversationDebugInfo::Done);
                    DC(int64(0x807d0bbb1200be52), EConversationDebugInfo::Executing);
                    
                    // You're talkin' about Gor Na Zar's blade. Curved ...
                    Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_124220_3719"));
                    DC(int64(0x807d0bbb1200be52), EConversationDebugInfo::Done);
                    DC(int64(0x807d0bbb1200beb9), EConversationDebugInfo::Executing);
                    // One of me masterpieces, if I may say so meself.
                    Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_131040"));
                    DC(int64(0x807d0bbb1200beb9), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FORGEDRIVALRIES_1, Document::UDocumentSegment_CH2_FORGEDRIVALRIES_1_DarrionInfo);
                    Subdialog(
                        UTopic_Darrion_113049,
                        UTopic_Darrion_113069,
                        UTopic_Darrion_113794
                    );
                }
                else
                {
                    DC(int64(0x807d0bbb1200bdcd), EConversationDebugInfo::Executing);
                    // I'm busy. If you ain't here to trade, move along.
                    Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_123358"));
                    DC(int64(0x807d0bbb1200bdcd), EConversationDebugInfo::Done);
                    DC(int64(0x807d0bbb1200be89), EConversationDebugInfo::Executing);
                    
                    // It's about one of your weapons.
                    Hero.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_125202"));
                    DC(int64(0x807d0bbb1200be89), EConversationDebugInfo::Done);
                    DC(int64(0x807d0bbb1200be8a), EConversationDebugInfo::Executing);
                    
                    // Half the camp carries me work. You gotta be more ...
                    Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_125203"));
                    DC(int64(0x807d0bbb1200be8a), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FORGEDRIVALRIES_1, Document::UDocumentSegment_CH2_FORGEDRIVALRIES_1_DarrionInfoDenied);
                    Subdialog(
                        UTopic_Darrion_112956,
                        UTopic_Darrion_113104
                    );
                }
            }
        }
        
        
        class UTopic_Darrion_113049 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x807d0bbb1200be44);
            default Caption = LocText("TEXT_WIP_VKWAAOH_20241127_124155_3750");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_113049);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x807d0bbb1200be45), EConversationDebugInfo::Executing);
                // Where can I find him?
                Hero.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_124155_3750"));
                DC(int64(0x807d0bbb1200be45), EConversationDebugInfo::Done);
                DC(int64(0x807d0bbb1200be50), EConversationDebugInfo::Executing);
                
                // He usually patrols near the camp entrance. Good luck, ...
                Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_124159"));
                DC(int64(0x807d0bbb1200be50), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FORGEDRIVALRIES_1, Document::UDocumentSegment_CH2_FORGEDRIVALRIES_1_DarrionInfoLocation);
                DC(int64(0x807d0bbb1200be47), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x807d0bbb1200be47), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Darrion_113069 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x807d0bbb1200be48);
            default Caption = LocText("TEXT_WIP_VKWAAOH_20241127_124155_1340");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_113069);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x807d0bbb1200be49), EConversationDebugInfo::Executing);
                // What makes this sword so special?
                Hero.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_124155_1340"));
                DC(int64(0x807d0bbb1200be49), EConversationDebugInfo::Done);
                DC(int64(0x807d0bbb1200be9e), EConversationDebugInfo::Executing);
                
                // Each weapon has its own demands. That one demanded some ...
                Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_130401"));
                DC(int64(0x807d0bbb1200be9e), EConversationDebugInfo::Done);
                DC(int64(0x807d0bbb1200be9f), EConversationDebugInfo::Executing);
                // And this one here demands me full attention right now ...
                Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_130519"));
                DC(int64(0x807d0bbb1200be9f), EConversationDebugInfo::Done);
                DC(int64(0x807d0bbb1200be4b), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x807d0bbb1200be4b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Darrion_113794 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x807d0bbb1200bea0);
            default Caption = LocText("TEXT_WIP_VKWAAOH_20241127_130613_3902");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_113794);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_VKWAAOH_20241127_130401"), int64(0x807d0bbb1200bea0));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x807d0bbb1200bea1), EConversationDebugInfo::Executing);
                // Could you tell me more about the weapon?
                Hero.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_130613_3902"));
                DC(int64(0x807d0bbb1200bea1), EConversationDebugInfo::Done);
                DC(int64(0x807d0bbb1200bea8), EConversationDebugInfo::Executing);
                
                // Some other time, perhaps.
                Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_130617"));
                DC(int64(0x807d0bbb1200bea8), EConversationDebugInfo::Done);
                DC(int64(0x807d0bbb1200beb3), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x807d0bbb1200beb3), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Darrion_112956 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x807d0bbb1200be1c);
            default Caption = LocText("TEXT_WIP_VKWAAOH_20241127_123824_491");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_112956);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x807d0bbb1200be1d), EConversationDebugInfo::Executing);
                // Can you at least point me in the right direction?
                Hero.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_123824_491"));
                DC(int64(0x807d0bbb1200be1d), EConversationDebugInfo::Done);
                DC(int64(0x807d0bbb1200be25), EConversationDebugInfo::Executing);
                
                // Ask the templars yourself. I've got work to do.
                Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_123942"));
                DC(int64(0x807d0bbb1200be25), EConversationDebugInfo::Done);
                DC(int64(0x807d0bbb1200be80), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x807d0bbb1200be80), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Darrion_113104 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x807d0bbb1200be5c);
            default Caption = LocText("TEXT_WIP_VKWAAOH_20241127_125007_2316");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_113104);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x807d0bbb1200be5d), EConversationDebugInfo::Executing);
                // Perhaps some ore would help refresh your memory?
                Hero.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_125007_2316"));
                DC(int64(0x807d0bbb1200be5d), EConversationDebugInfo::Done);
                DC(int64(0x807d0bbb1200be6a), EConversationDebugInfo::Executing);
                
                // I don't waste time on rumors about old works when new ...
                Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_125121"));
                DC(int64(0x807d0bbb1200be6a), EConversationDebugInfo::Done);
                DC(int64(0x807d0bbb1200be73), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x807d0bbb1200be73), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceDarrion112989 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x9b3a3b16bea7dfaa);
            default Caption = LocText("TEXT_WIP_VKWAAOH_20241127_173233");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceDarrion112989);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9b3a3b16bea7dfad), Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9b3a3b16bea7dfa4), EConversationDebugInfo::Executing);
                // I want you to make me a sword like Gor Na Zar's.
                Hero.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_173233"));
                DC(int64(0x9b3a3b16bea7dfa4), EConversationDebugInfo::Done);
                DB(int64(0x9b3a3b16bea7dfb3), G1R.Darrion_Teacher != 0);
                
                if (G1R.Darrion_Teacher != 0)
                {
                    DC(int64(0x9b3a3b16bea7dfd2), EConversationDebugInfo::Executing);
                    // Me own student, askin' me to duplicate a unique piece? ...
                    Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_173740"));
                    DC(int64(0x9b3a3b16bea7dfd2), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x9b3a3b16bea7dfcc), EConversationDebugInfo::Executing);
                    // And what do you think makes you worthy of such a blade?
                    Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_173641"));
                    DC(int64(0x9b3a3b16bea7dfcc), EConversationDebugInfo::Done);
                }
                Subdialog(
                    UTopic_Darrion_113172,
                    UTopic_Darrion_113152,
                    UTopic_Darrion_114904,
                    UTopic_Darrion_113238
                );
            }
        }
        
        
        class UTopic_Darrion_113172 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x9b3a3b16bea7dfdf);
            default Caption = LocText("TEXT_WIP_VKWAAOH_20241127_173844_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_113172);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9b3a3b16bea7e00e), G1R.Darrion_Teacher == 0);
                }
                
                return G1R.Darrion_Teacher == 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9b3a3b16bea7dfe0), EConversationDebugInfo::Executing);
                // I'm a blacksmith myself.
                Hero.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_173844_3286"));
                DC(int64(0x9b3a3b16bea7dfe0), EConversationDebugInfo::Done);
                DC(int64(0x9b3a3b16bea7e017), EConversationDebugInfo::Executing);
                
                // Are you now? And who taught you? That old curmudgeon, ...
                Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_174307"));
                DC(int64(0x9b3a3b16bea7e017), EConversationDebugInfo::Done);
                DC(int64(0x9b3a3b16bea7dfe2), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x9b3a3b16bea7dfe2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Darrion_113152 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x9b3a3b16bea7dfdb);
            default Caption = LocText("TEXT_WIP_VKWAAOH_20241127_173844_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_113152);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9b3a3b16bea7dfdc), EConversationDebugInfo::Executing);
                // I can pay.
                Hero.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_173844_2785"));
                DC(int64(0x9b3a3b16bea7dfdc), EConversationDebugInfo::Done);
                DC(int64(0x9b3a3b16bea7e00c), EConversationDebugInfo::Executing);
                
                // This isn't about ore. Each blade tells its own story. I ...
                Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_174007"));
                DC(int64(0x9b3a3b16bea7e00c), EConversationDebugInfo::Done);
                DC(int64(0x9b3a3b16bea7dfde), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x9b3a3b16bea7dfde), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Darrion_114904 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x9b3a3b16bea7e0bd);
            default Caption = LocText("TEXT_WIP_VKWAAOH_20241127_233316_2316");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_114904);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9b3a3b16bea7e0be), EConversationDebugInfo::Executing);
                // What would it take to change your mind?
                Hero.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_233316_2316"));
                DC(int64(0x9b3a3b16bea7e0be), EConversationDebugInfo::Done);
                DC(int64(0x9b3a3b16bea7e0c5), EConversationDebugInfo::Executing);
                
                // You don't get it, do you? Each blade I forge tells its ...
                Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_233327"));
                DC(int64(0x9b3a3b16bea7e0c5), EConversationDebugInfo::Done);
                DC(int64(0x9b3a3b16bea7e0c7), EConversationDebugInfo::Executing);
                // Yes, copies will appear - that's what happens to all ...
                Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_233410"));
                DC(int64(0x9b3a3b16bea7e0c7), EConversationDebugInfo::Done);
                DC(int64(0x9b3a3b16bea7e0c8), EConversationDebugInfo::Executing);
                // But I won't cheapen mine by makin' them myself.
                Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_233445"));
                DC(int64(0x9b3a3b16bea7e0c8), EConversationDebugInfo::Done);
                DC(int64(0x9b3a3b16bea7e0c0), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x9b3a3b16bea7e0c0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Darrion_113238 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x9b3a3b16bea7dff4);
            default Caption = LocText("TEXT_WIP_VKWAAOH_20241127_173852_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_113238);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_VKWAAOH_20241127_174007"), int64(0x9b3a3b16bea7dff4));
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_VKWAAOH_20241127_233445"), int64(0x9b3a3b16bea7dff4));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9b3a3b16bea7dff5), EConversationDebugInfo::Executing);
                // Then teach me how to make it myself.
                Hero.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_173852_1609"));
                DC(int64(0x9b3a3b16bea7dff5), EConversationDebugInfo::Done);
                DB(int64(0x9b3a3b16bea7e033), G1R.Darrion_Teacher != 0);
                
                if (G1R.Darrion_Teacher != 0)
                {
                    DC(int64(0x9b3a3b16bea7e03c), EConversationDebugInfo::Executing);
                    // Now, that sounds more promisin'! At least SOME of me ...
                    Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_174817"));
                    DC(int64(0x9b3a3b16bea7e03c), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x9b3a3b16bea7e042), EConversationDebugInfo::Executing);
                    // Ha! Stone's apprentice askin' ME for a design?
                    Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_174834"));
                    DC(int64(0x9b3a3b16bea7e042), EConversationDebugInfo::Done);
                }
                DC(int64(0x9b3a3b16bea7e049), EConversationDebugInfo::Executing);
                // Still, I doubt you're ready for such a refined blade.
                Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_175049_1769"));
                DC(int64(0x9b3a3b16bea7e049), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDarrion113520 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x9b3a3b16bea7e052);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDarrion112989);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9b3a3b16bea7e058), EConversationDebugInfo::Executing);
                
                // What makes you think I'm not ready?
                Hero.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_175347"));
                DC(int64(0x9b3a3b16bea7e058), EConversationDebugInfo::Done);
                DC(int64(0x9b3a3b16bea7e059), EConversationDebugInfo::Executing);
                
                // Because you ain't gonna master this kind of art over ...
                Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_175351"));
                DC(int64(0x9b3a3b16bea7e059), EConversationDebugInfo::Done);
                DC(int64(0x9b3a3b16bea7e06a), EConversationDebugInfo::Executing);
                
                // I've forged plenty of weapons.
                Hero.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_180002"));
                DC(int64(0x9b3a3b16bea7e06a), EConversationDebugInfo::Done);
                DC(int64(0x9b3a3b16bea7e05a), EConversationDebugInfo::Executing);
                
                // Prove it, then. Show me your craftmanship. Make me a ...
                Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_175622"));
                DC(int64(0x9b3a3b16bea7e05a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FORGEDRIVALRIES_1, Document::UDocumentSegment_CH2_FORGEDRIVALRIES_1_Darrion);
                Subdialog(
                    UTopic_Darrion_113666,
                    UTopic_Darrion_113686,
                    UTopic_Darrion_113956,
                    UTopic_Darrion_114469,
                    UTopic_Darrion_114623
                );
            }
        }
        
        
        class UTopic_Darrion_113666 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x9b3a3b16bea7e05c);
            default Caption = LocText("TEXT_WIP_VKWAAOH_20241127_175824_491");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_113666);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9b3a3b16bea7e05d), EConversationDebugInfo::Executing);
                // And then ... ?
                Hero.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_175824_491"));
                DC(int64(0x9b3a3b16bea7e05d), EConversationDebugInfo::Done);
                DC(int64(0x9b3a3b16bea7e068), EConversationDebugInfo::Executing);
                
                // Then you'll have earned an attempt at my design.
                Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_175828"));
                DC(int64(0x9b3a3b16bea7e068), EConversationDebugInfo::Done);
                DC(int64(0x9b3a3b16bea7e069), EConversationDebugInfo::Executing);
                // Though, whatever you forge, it ain't gonna carry the ...
                Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_175851"));
                DC(int64(0x9b3a3b16bea7e069), EConversationDebugInfo::Done);
                DC(int64(0x9b3a3b16bea7e05f), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x9b3a3b16bea7e05f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Darrion_113686 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x9b3a3b16bea7e060);
            default Caption = LocText("TEXT_WIP_VKWAAOH_20241127_175824_3750");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_113686);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9b3a3b16bea7e061), EConversationDebugInfo::Executing);
                // Where can I get the design for that?
                Hero.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_175824_3750"));
                DC(int64(0x9b3a3b16bea7e061), EConversationDebugInfo::Done);
                DC(int64(0x9b3a3b16bea7e06c), EConversationDebugInfo::Executing);
                
                // As it happens, I've got some up for tradin'.
                Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_180140"));
                DC(int64(0x9b3a3b16bea7e06c), EConversationDebugInfo::Done);
                DC(int64(0x9b3a3b16bea7e0bc), EConversationDebugInfo::Executing);
                // Consider it an investment in your craft.
                Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_232904"));
                DC(int64(0x9b3a3b16bea7e0bc), EConversationDebugInfo::Done);
                DC(int64(0x9b3a3b16bea7e063), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x9b3a3b16bea7e063), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Darrion_113956 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x9b3a3b16bea7e06f);
            default Caption = LocText("TEXT_WIP_VKWAAOH_20241127_180259_731");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_113956);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_VKWAAOH_20241127_180140"), int64(0x9b3a3b16bea7e06f));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9b3a3b16bea7e070), EConversationDebugInfo::Executing);
                // I'm supposed to buy a design from you to craft a weapon ...
                Hero.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_180259_731"));
                DC(int64(0x9b3a3b16bea7e070), EConversationDebugInfo::Done);
                DC(int64(0x9b3a3b16bea7e077), EConversationDebugInfo::Executing);
                
                // You wanna learn, don't you? And, well, all of my work ...
                Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_180331"));
                DC(int64(0x9b3a3b16bea7e077), EConversationDebugInfo::Done);
                DC(int64(0x9b3a3b16bea7e078), EConversationDebugInfo::Executing);
                // But your choice, not mine. Or get your design somewhere ...
                Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_180408"));
                DC(int64(0x9b3a3b16bea7e078), EConversationDebugInfo::Done);
                DC(int64(0x9b3a3b16bea7e072), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x9b3a3b16bea7e072), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Darrion_114469 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x9b3a3b16bea7e081);
            default Caption = LocText("TEXT_WIP_VKWAAOH_20241127_181515_1340");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_114469);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9b3a3b16bea7e082), EConversationDebugInfo::Executing);
                // I'll get to it.
                Hero.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_181515_1340"));
                DC(int64(0x9b3a3b16bea7e082), EConversationDebugInfo::Done);
                DC(int64(0x9b3a3b16bea7e08b), EConversationDebugInfo::Executing);
                
                // We'll see what you're capable of.
                Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_181703"));
                DC(int64(0x9b3a3b16bea7e08b), EConversationDebugInfo::Done);
                DC(int64(0x9b3a3b16bea7e08a), EConversationDebugInfo::Executing);
                // And if you want the design, let's trade.
                Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_181607"));
                DC(int64(0x9b3a3b16bea7e08a), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad441), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION.SucceedQuest();
                DC(int64(0x6ce9557b654ad441), EConversationDebugInfo::Done);
                DC(int64(0x6ce9557b654ad447), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF.StartQuest();
                DC(int64(0x6ce9557b654ad447), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Darrion_114623 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x9b3a3b16bea7e094);
            default Caption = LocText("TEXT_WIP_VKWAAOH_20241127_181738_3719");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_114623);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9b3a3b16bea7e095), EConversationDebugInfo::Executing);
                // Sounds like it's not worth the trouble.
                Hero.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_181738_3719"));
                DC(int64(0x9b3a3b16bea7e095), EConversationDebugInfo::Done);
                DC(int64(0x9b3a3b16bea7e09c), EConversationDebugInfo::Executing);
                
                // I expected more spine from someone bold enough to ask ...
                Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_181747"));
                DC(int64(0x9b3a3b16bea7e09c), EConversationDebugInfo::Done);
                DC(int64(0x9b3a3b16bea7e09d), EConversationDebugInfo::Executing);
                // If you've found your bollocks: You know me terms and ...
                Darrion.AI.Say(LocText("TEXT_WIP_VKWAAOH_20241127_181756"));
                DC(int64(0x9b3a3b16bea7e09d), EConversationDebugInfo::Done);
                DC(int64(0x81f98c56dfa2d608), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x81f98c56dfa2d608), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDarrion114011 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x63e0ed597bfd45b1);
            default Caption = LocText("TEXT_WIP_HKWAAOH_20241129_124346");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x63e0ed597bfd45b4), Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x63e0ed597bfd45ab), EConversationDebugInfo::Executing);
                // I have the sword you wanted. 
                Hero.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_124346"));
                DC(int64(0x63e0ed597bfd45ab), EConversationDebugInfo::Done);
                DB(int64(0x63e0ed597bfd4694), Hero != nullptr && Hero.HasItem(UItMw_2H_Sword_Light_01_Stone, 1, 0));
                DB(int64(0x63e0ed597bfd46a1), Hero != nullptr && Hero.HasItem(UItMw_2H_Sword_Light_01, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItMw_2H_Sword_Light_01_Stone, 1, 0))
                {
                    
                }
                else if (Hero != nullptr && Hero.HasItem(UItMw_2H_Sword_Light_01, 1, 0))
                {
                    
                }
                else
                {
                    DC(int64(0x63e0ed597bfd45df), EConversationDebugInfo::Executing);
                    // And where is it? Did you accidentally swap it or ... You ...
                    Darrion.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_124749"));
                    DC(int64(0x63e0ed597bfd45df), EConversationDebugInfo::Done);
                    DC(int64(0x63e0ed597bfd48ef), EConversationDebugInfo::Executing);
                    // Come back when you got the blade.
                    Darrion.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_155141"));
                    DC(int64(0x63e0ed597bfd48ef), EConversationDebugInfo::Done);
                    DC(int64(0x63e0ed597bfd46e1), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x63e0ed597bfd46e1), EConversationDebugInfo::Done);
                    return;
                }
                Subdialog(
                    UTopic_Darrion_114823,
                    UTopic_Darrion_114843,
                    UTopic_Darrion_115075
                );
            }
        }
        
        
        class UTopic_Darrion_114823 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x63e0ed597bfd4730);
            default Caption = LocText("TEXT_WIP_HKWAAOH_20241129_154132");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_114823);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x63e0ed597bfd48cd), Hero != nullptr && Hero.HasItem(UItMw_2H_Sword_Light_01_Stone, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMw_2H_Sword_Light_01_Stone, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x63e0ed597bfd45ce), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Darrion, UItMw_2H_Sword_Light_01_Stone, 1);
                DC(int64(0x63e0ed597bfd45ce), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd45f4), EConversationDebugInfo::Executing);
                // Hm ... not what I expected. Clean lines, perfect ...
                Darrion.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_124855_2785"));
                DC(int64(0x63e0ed597bfd45f4), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Darrion_114148,
                    UTopic_Darrion_114128
                );
            }
        }
        
        
        class UTopic_Darrion_114843 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x63e0ed597bfd4734);
            default Caption = LocText("TEXT_WIP_HKWAAOH_20241129_154132_1340");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x63e0ed597bfd48cd), Hero != nullptr && Hero.HasItem(UItMw_2H_Sword_Light_01, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMw_2H_Sword_Light_01, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x63e0ed597bfd45ce), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Darrion, UItMw_2H_Sword_Light_01, 1);
                DC(int64(0x63e0ed597bfd45ce), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FORGEDRIVALRIES_1, Document::UDocumentSegment_CH2_FORGEDRIVALRIES_1_HeroSwordDelivered);
                DC(int64(0x63e0ed597bfd45e9), EConversationDebugInfo::Executing);
                // Let me see ... Decent work, passable balance. ...
                Darrion.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_124808_1924"));
                DC(int64(0x63e0ed597bfd45e9), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd45f1), EConversationDebugInfo::Executing);
                
                // Well?
                Hero.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_124830"));
                DC(int64(0x63e0ed597bfd45f1), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd45f2), EConversationDebugInfo::Executing);
                
                // It's ... serviceable. Not exactly inspired work, but you ...
                Darrion.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_124835"));
                DC(int64(0x63e0ed597bfd45f2), EConversationDebugInfo::Done);
                DB(int64(0x63e0ed597bfd4679), G1R.ForgedRivalries_DeliverStoneCraft != 0);
                
                if (G1R.ForgedRivalries_DeliverStoneCraft != 0)
                {
                    DC(int64(0x63e0ed597bfd467f), EConversationDebugInfo::Executing);
                    // And this time I know it's your work, at least. Crude as ...
                    Darrion.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_141318_2995"));
                    DC(int64(0x63e0ed597bfd467f), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Darrion_115075 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x63e0ed597bfd48db);
            default Caption = LocText("TEXT_WIP_HKWAAOH_20241129_155114_94");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x63e0ed597bfd48dc), EConversationDebugInfo::Executing);
                // Never mind.
                Hero.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_155114_94"));
                DC(int64(0x63e0ed597bfd48dc), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd48f0), EConversationDebugInfo::Executing);
                
                // Come back when you got the blade.
                Darrion.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_155141"));
                DC(int64(0x63e0ed597bfd48f0), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd48f1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x63e0ed597bfd48f1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Darrion_114148 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x63e0ed597bfd4610);
            default Caption = LocText("TEXT_WIP_HKWAAOH_20241129_125051_686");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_114148);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x63e0ed597bfd4611), EConversationDebugInfo::Executing);
                // Not really. Stone forged it.
                Hero.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_125051_686"));
                DC(int64(0x63e0ed597bfd4611), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd4636), EConversationDebugInfo::Executing);
                
                // You went runnin' to him - to the Old Camp? And now ...
                Darrion.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_140711"));
                DC(int64(0x63e0ed597bfd4636), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FORGEDRIVALRIES_1, Document::UDocumentSegment_CH2_FORGEDRIVALRIES_1_StoneSwordDisappointed);
                Subdialog(
                    UTopic_Darrion_114314,
                    UTopic_Darrion_114334
                );
                DC(int64(0x63e0ed597bfd465c), EConversationDebugInfo::Executing);
                // Get your hands dirty and do the work yourself.
                Darrion.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_141145_1769"));
                DC(int64(0x63e0ed597bfd465c), EConversationDebugInfo::Done);
                DC(int64(0xf6512580bb1b2770), EConversationDebugInfo::Executing);
                G1R.ForgedRivalries_DeliverStoneCraft = 1;
                DC(int64(0xf6512580bb1b2770), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd4665), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x63e0ed597bfd4665), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Darrion_114128 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x63e0ed597bfd460c);
            default Caption = LocText("TEXT_WIP_HKWAAOH_20241129_125051_3436");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_114128);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x63e0ed597bfd460d), EConversationDebugInfo::Executing);
                // Yes, I did.
                Hero.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_125051_3436"));
                DC(int64(0x63e0ed597bfd460d), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd461a), EConversationDebugInfo::Executing);
                
                // The style is ... oddly familiar. But a deal's a deal - ...
                Darrion.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_125056"));
                DC(int64(0x63e0ed597bfd461a), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_FORGEDRIVALRIES_1, Document::UDocumentSegment_CH2_FORGEDRIVALRIES_1_StoneSwordDeliveredLie);
            }
        }
        
        
        class UTopic_Darrion_114314 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x63e0ed597bfd4640);
            default Caption = LocText("TEXT_WIP_HKWAAOH_20241129_140834_3569");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_114314);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x63e0ed597bfd4641), EConversationDebugInfo::Executing);
                // You want craftsmanship? Here it is. Doesn't matter who ...
                Hero.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_140834_3569"));
                DC(int64(0x63e0ed597bfd4641), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd464e), EConversationDebugInfo::Executing);
                
                // It does matter if you want to learn from ME. I teach ...
                Darrion.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_141127"));
                DC(int64(0x63e0ed597bfd464e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Darrion_114334 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x63e0ed597bfd4644);
            default Caption = LocText("TEXT_WIP_HKWAAOH_20241129_140834_443");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_114334);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x63e0ed597bfd4645), EConversationDebugInfo::Executing);
                
                // The task was to bring you a Light Two-Hander, now you ...
                Hero.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_140834_443"));
                DC(int64(0x63e0ed597bfd4645), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd464c), EConversationDebugInfo::Executing);
                
                // Then go peddle your wise-arsin' to the traders. I teach ...
                Darrion.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_140913"));
                DC(int64(0x63e0ed597bfd464c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDarrion115296 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x4e67fb9648183518);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceDarrion115296);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4e67fb964818351b), G1R != nullptr && G1R.IsInChapter(3));
                    DB(int64(0x4e67fb9648183554), Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1 != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1.HasSucceeded());
                }
                
                if (G1R != nullptr && !G1R.IsInChapter(3))
                    return false;
                
                if (Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1 != nullptr && !Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1.HasSucceeded())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4e67fb9648183513), EConversationDebugInfo::Executing);
                // Well, well, the scout returns. Been quite busy, eh?
                Darrion.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_154115_41"));
                DC(int64(0x4e67fb9648183513), EConversationDebugInfo::Done);
                DC(int64(0x4e67fb964818355b), EConversationDebugInfo::Executing);
                
                // As always. What are you talking about?
                Hero.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_155328"));
                DC(int64(0x4e67fb964818355b), EConversationDebugInfo::Done);
                DC(int64(0x4e67fb964818355c), EConversationDebugInfo::Executing);
                
                // Copies of the War Sword - in the Old Camp. So, either ...
                Darrion.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_155335"));
                DC(int64(0x4e67fb964818355c), EConversationDebugInfo::Done);
                DC(int64(0xc7ba07b900e7e138), EConversationDebugInfo::Executing);
                // Ah. No, I get it. You gave it to Stone. Hope you made ...
                Darrion.AI.Say(LocText("TEXT_WIP_UBJDHIL_20241219_222846"));
                DC(int64(0xc7ba07b900e7e138), EConversationDebugInfo::Done);
                DB(int64(0x4e67fb9648183556), G1R.Darrion_Teacher != 0);
                DB(int64(0x4e67fb9648183651), Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION.HasSucceeded());
                DB(int64(0x4e67fb9648183556), G1R.Stone_Teacher != 0);
                DB(int64(0x4e67fb9648183651), Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION.HasSucceeded());
                DB(int64(0x4e67fb964818368e), GorNaZar != nullptr && GorNaZar.IsEveryoneOfThisKindDead());
                DB(int64(0xae41e45eb9ebb118), Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION != nullptr && !Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION.HasSucceeded());
                
                if (G1R.Darrion_Teacher != 0 && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION.HasSucceeded())
                {
                    DC(int64(0x4e67fb964818355e), EConversationDebugInfo::Executing);
                    // Me own student ... hawkin' off me art. Is that what you ...
                    Darrion.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_155417_2238"));
                    DC(int64(0x4e67fb964818355e), EConversationDebugInfo::Done);
                }
                else if (G1R.Stone_Teacher != 0 && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION.HasSucceeded())
                {
                    DC(int64(0x4e67fb9648183564), EConversationDebugInfo::Executing);
                    // But what else did I expect from someone studyin' under ...
                    Darrion.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_155429_1924"));
                    DC(int64(0x4e67fb9648183564), EConversationDebugInfo::Done);
                }
                else if (GorNaZar != nullptr && GorNaZar.IsEveryoneOfThisKindDead() && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION != nullptr && !Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_TALKDARION.HasSucceeded())
                {
                    DC(int64(0x4e67fb9648183670), EConversationDebugInfo::Executing);
                    // One moment, Gor Na Zar's proudly wieldin' me finest ...
                    Darrion.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_174514_2316"));
                    DC(int64(0x4e67fb9648183670), EConversationDebugInfo::Done);
                    DC(int64(0x5c4c1b1d1616149f), EConversationDebugInfo::Executing);
                    // Imagine me face when I found out that Stone's forgin' ...
                    Darrion.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_110558"));
                    DC(int64(0x5c4c1b1d1616149f), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x4e67fb9648183698), EConversationDebugInfo::Executing);
                    // But what's more important: I heard about Gor Na Zar's ...
                    Darrion.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_175113_153"));
                    DC(int64(0x4e67fb9648183698), EConversationDebugInfo::Done);
                    DC(int64(0x21bf47f8baf4c79b), EConversationDebugInfo::Executing);
                    // And you were here, askin' about his sword, right before ...
                    Darrion.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_113042"));
                    DC(int64(0x21bf47f8baf4c79b), EConversationDebugInfo::Done);
                    Subdialog(
                        UTopic_Darrion_135196,
                        UTopic_Darrion_135216
                    );
                }
                Subdialog(
                    UTopic_Darrion_115465,
                    UTopic_Darrion_115485
                );
                DC(int64(0x4e67fb96481835bf), EConversationDebugInfo::Executing);
                // Perhaps you can make amends. Help balance the scales ...
                Darrion.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_155847_3569"));
                DC(int64(0x4e67fb96481835bf), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Darrion_115542,
                    UTopic_Darrion_115562,
                    UTopic_Darrion_115584,
                    UTopic_Darrion_115604,
                    UTopic_Darrion_116309,
                    UTopic_Darrion_116337
                );
            }
        }
        
        
        class UTopic_Darrion_135196 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0xc7ba07b900e7e156);
            default Caption = LocText("TEXT_WIP_UBJDHIL_20241219_224541");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_135196);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc7ba07b900e7e157), EConversationDebugInfo::Executing);
                // That's right. The War Sword.
                Hero.AI.Say(LocText("TEXT_WIP_UBJDHIL_20241219_224541_2083"));
                DC(int64(0xc7ba07b900e7e157), EConversationDebugInfo::Done);
                DC(int64(0xc7ba07b900e7e166), EConversationDebugInfo::Executing);
                
                // Gor Na Zar's life was all about two things: The Sleeper ...
                Darrion.AI.Say(LocText("TEXT_WIP_UBJDHIL_20241219_224647"));
                DC(int64(0xc7ba07b900e7e166), EConversationDebugInfo::Done);
                DC(int64(0xc7ba07b900e7e168), EConversationDebugInfo::Executing);
                // And this blade I made just for him. And it was not ...
                Darrion.AI.Say(LocText("TEXT_WIP_UBJDHIL_20241219_225218"));
                DC(int64(0xc7ba07b900e7e168), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Darrion_135216 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0xc7ba07b900e7e15a);
            default Caption = LocText("TEXT_WIP_UBJDHIL_20241219_224541_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_135216);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc7ba07b900e7e15b), EConversationDebugInfo::Executing);
                
                // I can't remember that I was.
                Hero.AI.Say(LocText("TEXT_WIP_UBJDHIL_20241219_224541_1924"));
                DC(int64(0xc7ba07b900e7e15b), EConversationDebugInfo::Done);
                DC(int64(0xc7ba07b900e7e167), EConversationDebugInfo::Executing);
                
                // Is that so? Well, I can remember quite well. You were on ...
                Darrion.AI.Say(LocText("TEXT_WIP_UBJDHIL_20241219_224803"));
                DC(int64(0xc7ba07b900e7e167), EConversationDebugInfo::Done);
                DC(int64(0xc7ba07b900e7e169), EConversationDebugInfo::Executing);
                // A blade I crafted for Gor Na Zar. Not for that dimwit, ...
                Darrion.AI.Say(LocText("TEXT_WIP_UBJDHIL_20241219_225325"));
                DC(int64(0xc7ba07b900e7e169), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Darrion_115465 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x4e67fb96481835a0);
            default Caption = LocText("TEXT_WIP_PTPTBXD_20241202_155726_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_115465);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4e67fb96481835a1), EConversationDebugInfo::Executing);
                
                // I had nothing to do with it.
                Hero.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_155726_2386"));
                DC(int64(0x4e67fb96481835a1), EConversationDebugInfo::Done);
                DC(int64(0x4e67fb96481835ac), EConversationDebugInfo::Executing);
                
                // Yes, you did. Stone's copyin' my art and hawkin' it off ...
                Darrion.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_155752"));
                DC(int64(0x4e67fb96481835ac), EConversationDebugInfo::Done);
                DB(int64(0x4e67fb9648183603), G1R.ForgedRivalries_DeliverStoneCraft != 0);
                DB(int64(0x4e67fb9648183687), Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF.HasSucceeded());
                DB(int64(0x4e67fb9648183679), Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF.HasSucceeded());
                
                if (G1R.ForgedRivalries_DeliverStoneCraft != 0 && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF.HasSucceeded())
                {
                    DC(int64(0x4e67fb9648183609), EConversationDebugInfo::Executing);
                    // You're the only one who's seen both our work up close. ...
                    Darrion.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_174000_1340"));
                    DC(int64(0x4e67fb9648183609), EConversationDebugInfo::Done);
                }
                else if (Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF.HasSucceeded())
                {
                    DC(int64(0x4e67fb9648183613), EConversationDebugInfo::Executing);
                    // You're the only one I trusted with my design. My ...
                    Darrion.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_174020_3719"));
                    DC(int64(0x4e67fb9648183613), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0x4e67fb96481836ad), EConversationDebugInfo::Executing);
                    // And you're the only one who was interested in that ...
                    Darrion.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_175337_292"));
                    DC(int64(0x4e67fb96481836ad), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Darrion_115485 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x4e67fb96481835a4);
            default Caption = LocText("TEXT_WIP_PTPTBXD_20241202_155726_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_115485);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4e67fb96481835a5), EConversationDebugInfo::Executing);
                // That's just how it goes.
                Hero.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_155726_1609"));
                DC(int64(0x4e67fb96481835a5), EConversationDebugInfo::Done);
                DC(int64(0x4e67fb96481835ad), EConversationDebugInfo::Executing);
                
                // Yeah ... I guess. You're one of those blokes. You get ...
                Darrion.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_155822"));
                DC(int64(0x4e67fb96481835ad), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Darrion_115542 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x4e67fb96481835c5);
            default Caption = LocText("TEXT_WIP_PTPTBXD_20241202_155946_2801");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_115542);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4e67fb96481835c6), EConversationDebugInfo::Executing);
                
                // What do you want me to do?
                Hero.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_155946_2801"));
                DC(int64(0x4e67fb96481835c6), EConversationDebugInfo::Done);
                DC(int64(0x4e67fb96481835e1), EConversationDebugInfo::Executing);
                
                // There's this war hammer. Equally graceful and heavy. Not ...
                Darrion.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_160105"));
                DC(int64(0x4e67fb96481835e1), EConversationDebugInfo::Done);
                DC(int64(0x4e67fb96481835e3), EConversationDebugInfo::Executing);
                // The thing is, it's Gomez' design. It's gotta be ...
                Darrion.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_160520"));
                DC(int64(0x4e67fb96481835e3), EConversationDebugInfo::Done);
                DC(int64(0x4e67fb96481836b6), EConversationDebugInfo::Executing);
                // The perfect opportunity to test Stone's... respect for ...
                Darrion.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_175516"));
                DC(int64(0x4e67fb96481836b6), EConversationDebugInfo::Done);
                DC(int64(0x4e67fb96481835e6), EConversationDebugInfo::Executing);
                
                // So you want me to steal it? From the ore barons' castle? ...
                Hero.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_162615"));
                DC(int64(0x4e67fb96481835e6), EConversationDebugInfo::Done);
                DC(int64(0x4e67fb96481835e7), EConversationDebugInfo::Executing);
                
                // I know, but let's call it ... redistribution o' ...
                Darrion.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_162622"));
                DC(int64(0x4e67fb96481835e7), EConversationDebugInfo::Done);
                DC(int64(0x4e67fb96481835c8), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x4e67fb96481835c8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Darrion_115562 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x4e67fb96481835c9);
            default Caption = LocText("TEXT_WIP_PTPTBXD_20241202_155946_1769");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_115562);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4e67fb96481835ca), EConversationDebugInfo::Executing);
                // Why would I help you?
                Hero.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_155946_1769"));
                DC(int64(0x4e67fb96481835ca), EConversationDebugInfo::Done);
                DC(int64(0x4e67fb96481835e4), EConversationDebugInfo::Executing);
                
                // 'Cause you'll get both weapon and wisdom. And 'cause I ...
                Darrion.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_160601"));
                DC(int64(0x4e67fb96481835e4), EConversationDebugInfo::Done);
                DC(int64(0x4e67fb96481835cc), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x4e67fb96481835cc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Darrion_115584 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x4e67fb96481835d1);
            default Caption = LocText("TEXT_WIP_PTPTBXD_20241202_155956_491");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_115584);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_PTPTBXD_20241202_162622"), int64(0x4e67fb96481835d1));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4e67fb96481835d2), EConversationDebugInfo::Executing);
                // Is that some sort of trial?
                Hero.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_155956_491"));
                DC(int64(0x4e67fb96481835d2), EConversationDebugInfo::Done);
                DC(int64(0x4e67fb96481835e5), EConversationDebugInfo::Executing);
                
                // Let's say ... more like a lesson forged in fire.
                Darrion.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_160709"));
                DC(int64(0x4e67fb96481835e5), EConversationDebugInfo::Done);
                DC(int64(0x4e67fb96481835d4), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x4e67fb96481835d4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Darrion_115604 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x4e67fb96481835d9);
            default Caption = LocText("TEXT_WIP_PTPTBXD_20241202_155957_2995");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_115604);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4e67fb96481835da), EConversationDebugInfo::Executing);
                // And if I refuse?
                Hero.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_155957_2995"));
                DC(int64(0x4e67fb96481835da), EConversationDebugInfo::Done);
                DC(int64(0x4e67fb96481835ea), EConversationDebugInfo::Executing);
                
                // Then we're done. Go your merry way and let me do my ...
                Darrion.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_173320"));
                DC(int64(0x4e67fb96481835ea), EConversationDebugInfo::Done);
                DC(int64(0x4e67fb96481835dc), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x4e67fb96481835dc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Darrion_116309 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x4e67fb96481835eb);
            default Caption = LocText("TEXT_WIP_PTPTBXD_20241202_173336_3750");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_116309);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_PTPTBXD_20241202_162622"), int64(0x4e67fb96481835eb));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4e67fb96481835ec), EConversationDebugInfo::Executing);
                // I'll do it.
                Hero.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_173336_3750"));
                DC(int64(0x4e67fb96481835ec), EConversationDebugInfo::Done);
                DC(int64(0x4e67fb96481835f3), EConversationDebugInfo::Executing);
                
                // Good. Get that design from Gomez's quarters and bring it ...
                Darrion.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_173357"));
                DC(int64(0x4e67fb96481835f3), EConversationDebugInfo::Done);
                DC(int64(0xa9e336d1e56ae676), EConversationDebugInfo::Executing);
                // My forge stays cold for you until this is settled.
                Darrion.AI.Say(LocText("TEXT_WIP_JPADCNF_20250130_145819"));
                DC(int64(0xa9e336d1e56ae676), EConversationDebugInfo::Done);
                DC(int64(0x9c3f4375e4b6bd57), EConversationDebugInfo::Executing);
                
                // He's gonna forge that war hammer.
                Hero.AI.Say(LocText("TEXT_WIP_UBJDHIL_20241219_235549"));
                DC(int64(0x9c3f4375e4b6bd57), EConversationDebugInfo::Done);
                DC(int64(0x4e67fb96481835f4), EConversationDebugInfo::Executing);
                
                // And he'll be goin' on and on about it, 'cause he'll ...
                Darrion.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_173420"));
                DC(int64(0x4e67fb96481835f4), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_FORGEDRIVALRIES_2, Document::UDocumentSegment_CH3_FORGEDRIVALRIES_2_Start);
                DC(int64(0x1b323555ce015fcf), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2.StartQuest();
                DC(int64(0x1b323555ce015fcf), EConversationDebugInfo::Done);
                DC(int64(0xa9e336d1e56ae675), EConversationDebugInfo::Executing);
                G1R.ForgedRivalries2_DarrionBanTrade = 1;
                DC(int64(0xa9e336d1e56ae675), EConversationDebugInfo::Done);
                DC(int64(0x21bf47f8baf4c7ac), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x21bf47f8baf4c7ac), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Darrion_116337 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x4e67fb96481835f5);
            default Caption = LocText("TEXT_WIP_PTPTBXD_20241202_173430_731");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_116337);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_PTPTBXD_20241202_162622"), int64(0x4e67fb96481835f5));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4e67fb96481835f6), EConversationDebugInfo::Executing);
                // I need time to think about it.
                Hero.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_173430_731"));
                DC(int64(0x4e67fb96481835f6), EConversationDebugInfo::Done);
                DC(int64(0x4e67fb96481835fd), EConversationDebugInfo::Executing);
                
                // Do that. But me forge stays cold for you until this is ...
                Darrion.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_173448"));
                DC(int64(0x4e67fb96481835fd), EConversationDebugInfo::Done);
                DC(int64(0xae41e45eb9ebb17d), EConversationDebugInfo::Executing);
                G1R.ForgedRivalries2_DarrionBanTrade = 1;
                DC(int64(0xae41e45eb9ebb17d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDarrion115330 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0xfda0c719b53e183e);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Darrion_114128);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Darrion_114843);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Darrion_114843);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                Subdialog(
                    UTopic_Darrion_11417822,
                    UTopic_Darrion_11419822
                );
            }
        }
        
        
        class UTopic_Darrion_11417822 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x63e0ed597bfd4624);
            default Caption = LocText("TEXT_WIP_HKWAAOH_20241129_125146_2386");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_11417822);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x63e0ed597bfd4625), EConversationDebugInfo::Executing);
                // Was all this really necessary?
                Hero.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_125146_2386"));
                DC(int64(0x63e0ed597bfd4625), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd4634), EConversationDebugInfo::Executing);
                
                // Every master tests his students. And you've passed the ...
                Darrion.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_125229"));
                DC(int64(0x63e0ed597bfd4634), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd4635), EConversationDebugInfo::Executing);
                // You know how to forge, I'll show you how to create.
                Darrion.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_125238"));
                DC(int64(0x63e0ed597bfd4635), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd4627), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x63e0ed597bfd4627), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Darrion_11419822 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x63e0ed597bfd4628);
            default Caption = LocText("TEXT_WIP_HKWAAOH_20241129_125146_1609");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_11419822);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x63e0ed597bfd4629), EConversationDebugInfo::Executing);
                // So you'll teach me how to craft that sword?
                Hero.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_125146_1609"));
                DC(int64(0x63e0ed597bfd4629), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd468c), EConversationDebugInfo::Executing);
                
                // Yes ... though, whether you'll live up to the task is ...
                Darrion.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_141925"));
                DC(int64(0x63e0ed597bfd468c), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd46f8), EConversationDebugInfo::Executing);
                // I call it the War Sword and it requires a delicate ...
                Darrion.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_142537"));
                DC(int64(0x63e0ed597bfd46f8), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd46f9), EConversationDebugInfo::Executing);
                // The curved crossguard must be perfectly weighted, and ...
                Darrion.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_142612"));
                DC(int64(0x63e0ed597bfd46f9), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd46fa), EConversationDebugInfo::Executing);
                // And that red stone in the pommel isn't just decoration - ...
                Darrion.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_142635"));
                DC(int64(0x63e0ed597bfd46fa), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd46fb), EConversationDebugInfo::Executing);
                // Well then, good luck.
                Darrion.AI.Say(LocText("TEXT_WIP_HKWAAOH_20241129_142723"));
                DC(int64(0x63e0ed597bfd46fb), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd471f), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1_FORGEDRIVALRIES_1_OBJ_PROOF.SucceedQuest();
                DC(int64(0x63e0ed597bfd471f), EConversationDebugInfo::Done);
                DC(int64(0x9733703e8358421b), EConversationDebugInfo::Executing);
                Hero.LearnRecipe(UReMi_Smith_Blade_Arming);
                DC(int64(0x9733703e8358421b), EConversationDebugInfo::Done);
                DC(int64(0x9733703e8358421d), EConversationDebugInfo::Executing);
                Hero.LearnRecipe(UReMi_Smith_1H_Sword_05);
                DC(int64(0x9733703e8358421d), EConversationDebugInfo::Done);
                DC(int64(0x9733703e8358421f), EConversationDebugInfo::Executing);
                Hero.LearnRecipe(UReMw_1H_Sword_05);
                DC(int64(0x9733703e8358421f), EConversationDebugInfo::Done);
                DC(int64(0x63e0ed597bfd4715), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x63e0ed597bfd4715), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceDarrion115678 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x21bf47f8baf4c7b7);
            default Caption = LocText("TEXT_WIP_OTPTBXD_20241203_124020");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Darrion_116337);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x21bf47f8baf4c7b1), EConversationDebugInfo::Executing);
                // About your offer ...
                Hero.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_124020"));
                DC(int64(0x21bf47f8baf4c7b1), EConversationDebugInfo::Done);
                DC(int64(0x21bf47f8baf4c7b2), EConversationDebugInfo::Executing);
                
                // Made up your mind?
                Darrion.AI.Say(LocText("TEXT_WIP_OTPTBXD_20241203_124020_41"));
                DC(int64(0x21bf47f8baf4c7b2), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Darrion_115692,
                    UTopic_Darrion_115712
                );
            }
        }
        
        
        class UTopic_Darrion_115692 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x21bf47f8baf4c7ba);
            default Caption = LocText("TEXT_WIP_PTPTBXD_20241202_173336_3750");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_115692);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x21bf47f8baf4c7bb), EConversationDebugInfo::Executing);
                // I'll do it.
                Hero.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_173336_3750"));
                DC(int64(0x21bf47f8baf4c7bb), EConversationDebugInfo::Done);
                DC(int64(0x21bf47f8baf4c7d6), EConversationDebugInfo::Executing);
                
                // Good. Get that design from Gomez's quarters and bring it ...
                Darrion.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_173357"));
                DC(int64(0x21bf47f8baf4c7d6), EConversationDebugInfo::Done);
                DC(int64(0x9c3f4375e4b6bd8a), EConversationDebugInfo::Executing);
                
                // He's gonna forge that war hammer.
                Hero.AI.Say(LocText("TEXT_WIP_KEQZAEL_20241220_184325"));
                DC(int64(0x9c3f4375e4b6bd8a), EConversationDebugInfo::Done);
                DC(int64(0x21bf47f8baf4c7d7), EConversationDebugInfo::Executing);
                
                // And he'll be goin' on and on about it, 'cause he'll ...
                Darrion.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_173420"));
                DC(int64(0x21bf47f8baf4c7d7), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_FORGEDRIVALRIES_2, Document::UDocumentSegment_CH3_FORGEDRIVALRIES_2_Start);
                DC(int64(0x1b323555ce015fdd), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2.StartQuest();
                DC(int64(0x1b323555ce015fdd), EConversationDebugInfo::Done);
                DC(int64(0x21bf47f8baf4c7d8), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x21bf47f8baf4c7d8), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Darrion_115712 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x21bf47f8baf4c7be);
            default Caption = LocText("TEXT_WIP_PTPTBXD_20241202_173430_731");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x21bf47f8baf4c7bf), EConversationDebugInfo::Executing);
                // I need time to think about it.
                Hero.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_173430_731"));
                DC(int64(0x21bf47f8baf4c7bf), EConversationDebugInfo::Done);
                DC(int64(0x21bf47f8baf4c7dd), EConversationDebugInfo::Executing);
                
                // Do that. But me forge stays cold for you until this is ...
                Darrion.AI.Say(LocText("TEXT_WIP_PTPTBXD_20241202_173448"));
                DC(int64(0x21bf47f8baf4c7dd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDarrion118090 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x9d6a42d3c185d5d6);
            default Caption = LocText("TEXT_WIP_ITPTBXD_20241205_105214");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceDarrion118090);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9d6a42d3c185d5d9), Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVECRAFTTODARRION != nullptr && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVECRAFTTODARRION.IsRunning());
                }
                
                return Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVECRAFTTODARRION != nullptr && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVECRAFTTODARRION.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9d6a42d3c185d5d0), EConversationDebugInfo::Executing);
                
                // I have Stone's new weapon.
                Hero.AI.Say(LocText("TEXT_WIP_ITPTBXD_20241205_105214"));
                DC(int64(0x9d6a42d3c185d5d0), EConversationDebugInfo::Done);
                DC(int64(0x9d6a42d3c185d5d1), EConversationDebugInfo::Executing);
                
                // Ah! Well, show me.
                Darrion.AI.Say(LocText("TEXT_WIP_ITPTBXD_20241205_105214_41"));
                DC(int64(0x9d6a42d3c185d5d1), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_FORGEDRIVALRIES_2, Document::UDocumentSegment_CH3_FORGEDRIVALRIES_2_CompletedLie);
                DC(int64(0x9d6a42d3c185d5df), EConversationDebugInfo::Executing);
                Hero.AI.GiveItemTo(Darrion, UItMw_1H_Mace_Warhammer_02, 1);
                DC(int64(0x9d6a42d3c185d5df), EConversationDebugInfo::Done);
                DC(int64(0xf116f3f589b32f19), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2_FORGEDRIVALRIES_2_OBJ_GIVECRAFTTODARRION.SucceedQuest();
                DC(int64(0xf116f3f589b32f19), EConversationDebugInfo::Done);
                DC(int64(0x9d6a42d3c185d5f1), EConversationDebugInfo::Executing);
                // Hm ... ain't even half bad. Good enough for him to brag ...
                Darrion.AI.Say(LocText("TEXT_WIP_ITPTBXD_20241205_105528_1924"));
                DC(int64(0x9d6a42d3c185d5f1), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Darrion_118161,
                    UTopic_Darrion_118181,
                    UTopic_Darrion_134270
                );
                DC(int64(0x9d6a42d3c185d614), EConversationDebugInfo::Executing);
                // Ah, even if he keeps his gob shut about it, I'm sure ...
                Darrion.AI.Say(LocText("TEXT_WIP_ITPTBXD_20241205_110956_686"));
                DC(int64(0x9d6a42d3c185d614), EConversationDebugInfo::Done);
                DC(int64(0x3d66573aa360eb74), EConversationDebugInfo::Executing);
                // Speakin' of: You were supposed to steal the design out ...
                Darrion.AI.Say(LocText("TEXT_WIP_ITPTBXD_20241205_151828"));
                DC(int64(0x3d66573aa360eb74), EConversationDebugInfo::Done);
                DC(int64(0x4f6fb39363d17800), EConversationDebugInfo::Executing);
                // And you did good. So I'll teach you how to forge the war ...
                Darrion.AI.Say(LocText("TEXT_WIP_KEQZAEL_20241220_205450"));
                DC(int64(0x4f6fb39363d17800), EConversationDebugInfo::Done);
                DC(int64(0x4f6fb39363d17809), EConversationDebugInfo::Executing);
                
                // Show me how to forge the war hammer.
                Hero.AI.Say(LocText("TEXT_WIP_KEQZAEL_20241220_205921"));
                DC(int64(0x4f6fb39363d17809), EConversationDebugInfo::Done);
                DC(int64(0x4f6fb39363d1780a), EConversationDebugInfo::Executing);
                
                // So, the head needs perfect counterweightin'. 
                Darrion.AI.Say(LocText("TEXT_WIP_KEQZAEL_20241220_205921_2083"));
                DC(int64(0x4f6fb39363d1780a), EConversationDebugInfo::Done);
                DC(int64(0x4f6fb39363d17866), EConversationDebugInfo::Executing);
                // See how the spike balances the war hammer face? 
                Darrion.AI.Say(LocText("TEXT_WIP_KEQZAEL_20241220_210459"));
                DC(int64(0x4f6fb39363d17866), EConversationDebugInfo::Done);
                DC(int64(0x4f6fb39363d17867), EConversationDebugInfo::Executing);
                // The shaft needs iron reinforcement here, and here. It's ...
                Darrion.AI.Say(LocText("TEXT_WIP_KEQZAEL_20241220_210501"));
                DC(int64(0x4f6fb39363d17867), EConversationDebugInfo::Done);
                DC(int64(0x6d39c4a98cb04b24), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2.SucceedQuest();
                DC(int64(0x6d39c4a98cb04b24), EConversationDebugInfo::Done);
                DC(int64(0x9733703e8358424b), EConversationDebugInfo::Executing);
                Hero.LearnRecipe(UReMi_Smith_Head_Warhammer);
                DC(int64(0x9733703e8358424b), EConversationDebugInfo::Done);
                DC(int64(0x9733703e8358424d), EConversationDebugInfo::Executing);
                Hero.LearnRecipe(UReMi_Smith_1H_Mace_Warhammer_02);
                DC(int64(0x9733703e8358424d), EConversationDebugInfo::Done);
                DC(int64(0x9733703e8358424f), EConversationDebugInfo::Executing);
                Hero.LearnRecipe(UReMw_1H_Mace_Warhammer_02);
                DC(int64(0x9733703e8358424f), EConversationDebugInfo::Done);
                DC(int64(0xe3408f1b9992e6b1), EConversationDebugInfo::Executing);
                G1R.ForgedRivalries2_DarrionBanTrade = 0;
                DC(int64(0xe3408f1b9992e6b1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Darrion_118161 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x9d6a42d3c185d5f9);
            default Caption = LocText("TEXT_WIP_ITPTBXD_20241205_105557_2785");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_118161);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x6d39c4a98cb04b9b), G1R.ForgedRivalries2_StoneKnowsDesignIsGomez != 0);
                }
                
                return G1R.ForgedRivalries2_StoneKnowsDesignIsGomez != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9d6a42d3c185d5fa), EConversationDebugInfo::Executing);
                // He knew the design belongs to Gomez.
                Hero.AI.Say(LocText("TEXT_WIP_ITPTBXD_20241205_105557_2785"));
                DC(int64(0x9d6a42d3c185d5fa), EConversationDebugInfo::Done);
                DC(int64(0x9d6a42d3c185d605), EConversationDebugInfo::Executing);
                
                // Bloody bastard ... smarter than I gave him credit for. ...
                Darrion.AI.Say(LocText("TEXT_WIP_ITPTBXD_20241205_110809"));
                DC(int64(0x9d6a42d3c185d605), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Darrion_118181 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x9d6a42d3c185d5fd);
            default Caption = LocText("TEXT_WIP_ITPTBXD_20241205_105557_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_118181);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x6d39c4a98cb04ba4), G1R.ForgedRivalries2_StoneKnowsDarrionPlanFull != 0);
                }
                
                return G1R.ForgedRivalries2_StoneKnowsDarrionPlanFull != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x9d6a42d3c185d5fe), EConversationDebugInfo::Executing);
                
                // I told him about your plan.
                Hero.AI.Say(LocText("TEXT_WIP_ITPTBXD_20241205_105557_3286"));
                DC(int64(0x9d6a42d3c185d5fe), EConversationDebugInfo::Done);
                DC(int64(0x9d6a42d3c185d606), EConversationDebugInfo::Executing);
                
                // You did ... what?
                Darrion.AI.Say(LocText("TEXT_WIP_ITPTBXD_20241205_110848"));
                DC(int64(0x9d6a42d3c185d606), EConversationDebugInfo::Done);
                DC(int64(0x9d6a42d3c185d607), EConversationDebugInfo::Executing);
                
                // I told him. He's working his ass off and he doesn't ...
                Hero.AI.Say(LocText("TEXT_WIP_ITPTBXD_20241205_110903"));
                DC(int64(0x9d6a42d3c185d607), EConversationDebugInfo::Done);
                DC(int64(0x9d6a42d3c185d608), EConversationDebugInfo::Executing);
                
                // You bloody fool ... Got such a big heart, eh? Well, you ...
                Darrion.AI.Say(LocText("TEXT_WIP_ITPTBXD_20241205_110911"));
                DC(int64(0x9d6a42d3c185d608), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_FORGEDRIVALRIES_2, Document::UDocumentSegment_CH3_FORGEDRIVALRIES_2_CompletedTrue);
                DC(int64(0x6d39c4a98cb04af0), EConversationDebugInfo::Executing);
                G1R.ForgedRivalries2_DarrionAngry = 1;
                DC(int64(0x6d39c4a98cb04af0), EConversationDebugInfo::Done);
                DC(int64(0x6d39c4a98cb04b08), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2.FailQuest();
                DC(int64(0x6d39c4a98cb04b08), EConversationDebugInfo::Done);
                DC(int64(0xe45ba7b3e6f75f6), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_FORGEDRIVALRIES2_REFUSEDARRION);
                DC(int64(0xe45ba7b3e6f75f6), EConversationDebugInfo::Done);
                DC(int64(0x4f6fb39363d177df), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4f6fb39363d177df), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UTopic_Darrion_134270 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x4f6fb39363d177cb);
            default Caption = LocText("TEXT_WIP_KEQZAEL_20241220_201517");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_134270);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4f6fb39363d177cc), EConversationDebugInfo::Executing);
                // If you say so ...
                Hero.AI.Say(LocText("TEXT_WIP_KEQZAEL_20241220_201517_41"));
                DC(int64(0x4f6fb39363d177cc), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDarrion121919 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0xa7deef969d1cb4f5);
            default Caption = LocText("TEXT_WIP_GILDIL_20241216_121504_1284");
            default PriorityRank = 3;
            default PropertyTags.AddTag(GameplayTag::Skill_Crafting_Blacksmith_Master);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf11f5810a9502101), G1R != nullptr && G1R.HasReachedChapter(3));
                    DB(int64(0xf11f5810a95021b1), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Crafting_Blacksmith_Master));
                    DB(int64(0xf11f5810a95021b2), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Crafting_Blacksmith_Trained));
                    DB(int64(0xf11f5810a95020f8), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    DB(int64(0xf11f5810a9502101), G1R != nullptr && G1R.HasReachedChapter(2));
                    DB(int64(0xf11f5810a95021b1), Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Crafting_Blacksmith_Master));
                    DB(int64(0xf11f5810a95021b2), Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Crafting_Blacksmith_Trained));
                }
                
                if (G1R != nullptr && G1R.HasReachedChapter(3) && Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Crafting_Blacksmith_Master) && Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Crafting_Blacksmith_Trained))
                    return true;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp) && G1R != nullptr && G1R.HasReachedChapter(2) && Hero != nullptr && !Hero.HasLearnedSkill(UGE_Skill_Crafting_Blacksmith_Master) && Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Crafting_Blacksmith_Trained))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa7deef969d1cb4f3), EConversationDebugInfo::Executing);
                // I want to improve my smithing.
                Hero.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_152247"));
                DC(int64(0xa7deef969d1cb4f3), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_DARRION, Document::UDocumentSegment_Glossary_SC_NOV_DARRION_Teacher);
                DB(int64(0xa7deef969d1cb4f8), Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Crafting_Blacksmith_Master));
                
                if (Hero != nullptr && Hero.HasEnoughSkillpointsToLearnSkill(UGE_Skill_Crafting_Blacksmith_Master))
                {
                    DB(int64(0xa7deef969d1cb507), Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Crafting_Blacksmith_Master));
                    
                    if (Hero != nullptr && Hero.HasEnoughOreToLearnSkill(UGE_Skill_Crafting_Blacksmith_Master))
                    {
                        DC(int64(0xa7deef969d1cb512), EConversationDebugInfo::Executing);
                        // You've got a fair grasp of the craft already, so it's ...
                        Darrion.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_152541"));
                        DC(int64(0xa7deef969d1cb512), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb518), EConversationDebugInfo::Executing);
                        // I'm talkin' swords and axes that'll deal some real ...
                        Darrion.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_152639"));
                        DC(int64(0xa7deef969d1cb518), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb519), EConversationDebugInfo::Executing);
                        // Principle's the same as with one-handers, but the bigger ...
                        Darrion.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_152746"));
                        DC(int64(0xa7deef969d1cb519), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb51a), EConversationDebugInfo::Executing);
                        // The point o' balance sits lower - that way, you've got ...
                        Darrion.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_152759"));
                        DC(int64(0xa7deef969d1cb51a), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb51b), EConversationDebugInfo::Executing);
                        // And you've got to temper 'em with more care than you ...
                        Darrion.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_153018"));
                        DC(int64(0xa7deef969d1cb51b), EConversationDebugInfo::Done);
                        DC(int64(0xa7deef969d1cb51c), EConversationDebugInfo::Executing);
                        // So, stay sharp! You'll be gettin' the hang of it.
                        Darrion.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_153050"));
                        DC(int64(0xa7deef969d1cb51c), EConversationDebugInfo::Done);
                        DC(int64(0xf11f5810a95020cf), EConversationDebugInfo::Executing);
                        Hero.LearnSkill(UGE_Skill_Crafting_Blacksmith_Master);
                        DC(int64(0xf11f5810a95020cf), EConversationDebugInfo::Done);
                        DC(int64(0xedc84834f122c48e), EConversationDebugInfo::Executing);
                        G1R.Darrion_Teacher = 1;
                        DC(int64(0xedc84834f122c48e), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e835841d3), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReMi_Smith_Head_Broadaxe);
                        DC(int64(0x9733703e835841d3), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e835841d5), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReMi_Smith_Head_Morningstar);
                        DC(int64(0x9733703e835841d5), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e835841d7), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReMi_Smith_1H_Axe_Old_01);
                        DC(int64(0x9733703e835841d7), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e835841d9), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReMw_1H_Axe_Old_01);
                        DC(int64(0x9733703e835841d9), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e835841db), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReMi_Smith_1H_Mace_01);
                        DC(int64(0x9733703e835841db), EConversationDebugInfo::Done);
                        DC(int64(0x9733703e835841dd), EConversationDebugInfo::Executing);
                        Hero.LearnRecipe(UReMw_1H_Mace_01);
                        DC(int64(0x9733703e835841dd), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_darrion_121919_exit_1");
                        DC(int64(0xf11f5810a95020d8), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0xf11f5810a95020d8), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0xa7deef969d1cb508), EConversationDebugInfo::Executing);
                        // Bring me some ore first, hm?
                        Darrion.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_152529"));
                        DC(int64(0xa7deef969d1cb508), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_darrion_121919_exit_2");
                    }
                }
                else
                {
                    DC(int64(0xa7deef969d1cb50d), EConversationDebugInfo::Executing);
                    // Your mind's gotta be free. So, free it.
                    Darrion.AI.Say(LocText("TEXT_WIP_CDCKZPD_20241107_152535"));
                    DC(int64(0xa7deef969d1cb50d), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_darrion_121919_exit_3");
                }
            }
        }
        
        
        class UChoiceDarrion122609 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0xaa0a3e56784d73f1);
            default Caption = LocText("TEXT_WIP_TRYREI_20241211_163750");
            default PriorityRank = 3;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDarrion122657);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb389e02722739e4e), Hero != nullptr && !Hero.HasItem(UItKe_Dungeonkey, 1, 0));
                }
                
                return Hero != nullptr && !Hero.HasItem(UItKe_Dungeonkey, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xaa0a3e56784d73e8), EConversationDebugInfo::Executing);
                // About the key ...
                Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_163750"));
                DC(int64(0xaa0a3e56784d73e8), EConversationDebugInfo::Done);
                DB(int64(0xaa0a3e56784d740b), G1R.Darrion_MakeKey.IsValid() && G1R.Darrion_MakeKey.IsAtLeastXDaysAgo(1));
                
                if (G1R.Darrion_MakeKey.IsValid() && G1R.Darrion_MakeKey.IsAtLeastXDaysAgo(1))
                {
                    DC(int64(0xaa0a3e56784d7424), EConversationDebugInfo::Executing);
                    // Here. Not really a beauty, but it'll do.
                    Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_164044"));
                    DC(int64(0xaa0a3e56784d7424), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_FORGEDRIVALRIES_3, Document::UDocumentSegment_CH5_FORGEDRIVALRIES_3_OpenGate);
                    DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Executing);
                    Darrion.AddItemToInventory(UItKe_Dungeonkey, 1);
                    DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Done);
                    DC(int64(0xaa0a3e56784d751b), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETDARRIONKEY.SucceedQuest();
                    DC(int64(0xaa0a3e56784d751b), EConversationDebugInfo::Done);
                    DC(int64(0xaa0a3e56784d747a), EConversationDebugInfo::Executing);
                    Darrion.AI.GiveItemTo(Hero, UItKe_Dungeonkey, 1);
                    DC(int64(0xaa0a3e56784d747a), EConversationDebugInfo::Done);
                    DC(int64(0x3d41c45fd116e2cd), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_OPENGATE.StartQuest();
                    DC(int64(0x3d41c45fd116e2cd), EConversationDebugInfo::Done);
                    DC(int64(0xaa0a3e56784d743b), EConversationDebugInfo::Executing);
                    // I sharpened and oiled it. It should open the door quick ...
                    Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_164100_3436"));
                    DC(int64(0xaa0a3e56784d743b), EConversationDebugInfo::Done);
                    DC(int64(0xaa0a3e56784d7445), EConversationDebugInfo::Executing);
                    
                    // Thanks.
                    Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_164122"));
                    DC(int64(0xaa0a3e56784d7445), EConversationDebugInfo::Done);
                    DC(int64(0xaa0a3e56784d7446), EConversationDebugInfo::Executing);
                    
                    // Tell him I expect him at my forge. And remind him that ...
                    Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_164123"));
                    DC(int64(0xaa0a3e56784d7446), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_darrion_122609_exit_1");
                    DC(int64(0xaa0a3e56784d746f), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xaa0a3e56784d746f), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0xaa0a3e56784d7413), EConversationDebugInfo::Executing);
                    // I told you it'll take some time. You wanna open that ...
                    Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_164011"));
                    DC(int64(0xaa0a3e56784d7413), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_darrion_122609_exit_2");
                    DC(int64(0xaa0a3e56784d741c), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xaa0a3e56784d741c), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
        class UChoiceDarrion122657 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0xd5620db18c8d7257);
            default Caption = FText::FromString("[Followup Topic]");;
            default bIsFollowupTopic = true;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Darrion_122083);
            default Rules.AllowIfCharacterHasKnowledgeOf(UTopic_Darrion_124613);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8e0053f528bb197b), EConversationDebugInfo::Executing);
                // And why exactly should I help a man who's been a thorn ...
                Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_172247"));
                DC(int64(0x8e0053f528bb197b), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Darrion_12209422,
                    UTopic_Darrion_12211422,
                    UTopic_Darrion_12286322
                );
            }
        }
        
        
        class UTopic_Darrion_12209422 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x8ed75c01d98f0cc0);
            default Caption = LocText("TEXT_WIP_TRYREI_20241211_160343_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_12209422);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8ed75c01d98f0cc1), EConversationDebugInfo::Executing);
                // Because it's the right thing to do.
                Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_160343_41"));
                DC(int64(0x8ed75c01d98f0cc1), EConversationDebugInfo::Done);
                DC(int64(0x8ed75c01d98f0ccf), EConversationDebugInfo::Executing);
                
                // The right thing? Look around you. This is a prison ...
                Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_160404"));
                DC(int64(0x8ed75c01d98f0ccf), EConversationDebugInfo::Done);
                DB(int64(0x8ed75c01d98f0cfa), Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1 != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1.HasSucceeded());
                
                if (Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1 != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1.HasSucceeded())
                {
                    DC(int64(0x8ed75c01d98f0d0c), EConversationDebugInfo::Executing);
                    // That bastard stole my sword design. And you helped him ...
                    Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_160607_2785"));
                    DC(int64(0x8ed75c01d98f0d0c), EConversationDebugInfo::Done);
                    DB(int64(0x8ed75c01d98f0d2c), G1R.ForgedRivalries2_DarrionAngry != 0);
                    
                    if (G1R.ForgedRivalries2_DarrionAngry != 0)
                    {
                        DC(int64(0x8ed75c01d98f0d3c), EConversationDebugInfo::Executing);
                        // And when I tried to even the score, you turned on me, ...
                        Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_160823_3436"));
                        DC(int64(0x8ed75c01d98f0d3c), EConversationDebugInfo::Done);
                        DC(int64(0x8ed75c01d98f0d44), EConversationDebugInfo::Executing);
                        // For all I care, he can keep countin' pebbles in that ...
                        Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_160914"));
                        DC(int64(0x8ed75c01d98f0d44), EConversationDebugInfo::Done);
                        GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_FORGEDRIVALRIES_3, Document::UDocumentSegment_CH5_FORGEDRIVALRIES_3_DarrionRejected);
                        DC(int64(0xaa0a3e56784d73c2), EConversationDebugInfo::Executing);
                        Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY.FailQuest();
                        DC(int64(0xaa0a3e56784d73c2), EConversationDebugInfo::Done);
                        DC(int64(0x8ed75c01d98f0d45), EConversationDebugInfo::Executing);
                        EndConversation();
                        DC(int64(0x8ed75c01d98f0d45), EConversationDebugInfo::Done);
                        return;
                    }
                    else
                    {
                        DC(int64(0x8ed75c01d98f0d03), EConversationDebugInfo::Executing);
                        // I don't have time for you right now.
                        Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_160601_1924"));
                        DC(int64(0x8ed75c01d98f0d03), EConversationDebugInfo::Done);
                        DC(int64(0x8ed75c01d98f0d4d), EConversationDebugInfo::Executing);
                        ReturnToLastSelection(1);
                        DC(int64(0x8ed75c01d98f0d4d), EConversationDebugInfo::Done);
                    }
                }
                else
                {
                    DC(int64(0x8ed75c01d98f0d03), EConversationDebugInfo::Executing);
                    // I don't have time for you right now.
                    Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_160601_1924"));
                    DC(int64(0x8ed75c01d98f0d03), EConversationDebugInfo::Done);
                    DC(int64(0x8ed75c01d98f0d4d), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x8ed75c01d98f0d4d), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Darrion_12211422 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x8ed75c01d98f0cc4);
            default Caption = LocText("TEXT_WIP_TRYREI_20241211_160343_2238");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_12211422);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8ed75c01d98f0d1c), G1R.ForgedRivalries2_DarrionMarkedCraft != 0);
                }
                
                return G1R.ForgedRivalries2_DarrionMarkedCraft != 0;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8ed75c01d98f0cc5), EConversationDebugInfo::Executing);
                // You helped put him there.
                Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_160343_2238"));
                DC(int64(0x8ed75c01d98f0cc5), EConversationDebugInfo::Done);
                DC(int64(0x8ed75c01d98f0d64), EConversationDebugInfo::Executing);
                
                // Well, I was gonna wound his pride, but ...
                Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_161126"));
                DC(int64(0x8ed75c01d98f0d64), EConversationDebugInfo::Done);
                DC(int64(0x8ed75c01d98f0d65), EConversationDebugInfo::Executing);
                // He brought it on himself! He shouldn't have copied me ...
                Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_161207"));
                DC(int64(0x8ed75c01d98f0d65), EConversationDebugInfo::Done);
                DC(int64(0x8ed75c01d98f0cc7), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x8ed75c01d98f0cc7), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Darrion_12286322 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x8ed75c01d98f0d66);
            default Caption = LocText("TEXT_WIP_TRYREI_20241211_161404_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_12286322);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8ed75c01d98f0d67), EConversationDebugInfo::Executing);
                // He'll work under you. In your forge.
                Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_161404_3286"));
                DC(int64(0x8ed75c01d98f0d67), EConversationDebugInfo::Done);
                DC(int64(0x8ed75c01d98f0d71), EConversationDebugInfo::Executing);
                
                // What? Stone? In my forge? Answerin' to ME?
                Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_161430"));
                DC(int64(0x8ed75c01d98f0d71), EConversationDebugInfo::Done);
                DC(int64(0x8ed75c01d98f0dd8), EConversationDebugInfo::Executing);
                
                // His own words.
                Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_161817"));
                DC(int64(0x8ed75c01d98f0dd8), EConversationDebugInfo::Done);
                DC(int64(0x8ed75c01d98f0dd9), EConversationDebugInfo::Executing);
                
                // Now THAT... that's worth discussin'.
                Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_161818"));
                DC(int64(0x8ed75c01d98f0dd9), EConversationDebugInfo::Done);
                DB(int64(0x8ed75c01d98f0df0), G1R.ForgedRivalries2_DarrionAngry != 0);
                DB(int64(0xb389e02722739d5e), G1R.ForgedRivalries2_DarrionAngry == 0);
                DB(int64(0xb389e02722739d6c), Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_TRYREI_20241211_153825")));
                
                if (G1R.ForgedRivalries2_DarrionAngry != 0)
                {
                    DC(int64(0x8ed75c01d98f0df9), EConversationDebugInfo::Executing);
                    // Do you really think your word's still worth anythin' ...
                    Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_162159_686"));
                    DC(int64(0x8ed75c01d98f0df9), EConversationDebugInfo::Done);
                    DC(int64(0x8ed75c01d98f0e01), EConversationDebugInfo::Executing);
                    // But if Stone truly wants to work for me ... well, fine. ...
                    Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_162237"));
                    DC(int64(0x8ed75c01d98f0e01), EConversationDebugInfo::Done);
                    DC(int64(0x8ed75c01d98f0e02), EConversationDebugInfo::Executing);
                    // Now leave. I've got work to do.
                    Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_162757"));
                    DC(int64(0x8ed75c01d98f0e02), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_FORGEDRIVALRIES_3, Document::UDocumentSegment_CH5_FORGEDRIVALRIES_3_DarrionRejected);
                    DC(int64(0xaa0a3e56784d73b1), EConversationDebugInfo::Executing);
                    G1R.ForgedRivalries3_DarrionWillAcceptStone = 1;
                    DC(int64(0xaa0a3e56784d73b1), EConversationDebugInfo::Done);
                    DC(int64(0xaa0a3e56784d73c2), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY.FailQuest();
                    DC(int64(0xaa0a3e56784d73c2), EConversationDebugInfo::Done);
                    DC(int64(0xaa0a3e56784d73b9), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xaa0a3e56784d73b9), EConversationDebugInfo::Done);
                    return;
                }
                else if (G1R.ForgedRivalries2_DarrionAngry == 0 && Hero != nullptr && !Hero.HasListenedTo(LocText("TEXT_WIP_TRYREI_20241211_153825")))
                {
                    DC(int64(0xaa0a3e56784d73ca), EConversationDebugInfo::Executing);
                    // The mighty Stone ... crumblin' at last. Fine, what do ...
                    Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_163510"));
                    DC(int64(0xaa0a3e56784d73ca), EConversationDebugInfo::Done);
                    DC(int64(0xaa0a3e56784d73cb), EConversationDebugInfo::Executing);
                    
                    // The key to his cell. Can you forge it?
                    Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_163539"));
                    DC(int64(0xaa0a3e56784d73cb), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_FORGEDRIVALRIES_3, Document::UDocumentSegment_CH5_FORGEDRIVALRIES_3_DarrionHelp);
                    DC(int64(0x123f53d08c63cd78), EConversationDebugInfo::Executing);
                    RequestCameraReverseShot();
                    DC(int64(0x123f53d08c63cd78), EConversationDebugInfo::Done);
                    DB(int64(0x123f53d08c63cdd0), Darrion != nullptr && Darrion.IsSitting());
                    
                    if (Darrion != nullptr && Darrion.IsSitting())
                    {
                        DC(int64(0xaa0a3e56784d73cd), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(Darrion, UItMs_StoneSketch, 1);
                        DC(int64(0xaa0a3e56784d73cd), EConversationDebugInfo::Done);
                        DC(int64(0xb389e02722739d25), EConversationDebugInfo::Executing);
                        Darrion.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadNoteSeated);
                        DC(int64(0xb389e02722739d25), EConversationDebugInfo::Done);
                    }
                    else
                    {
                        DC(int64(0xaa0a3e56784d73cd), EConversationDebugInfo::Executing);
                        Hero.AI.GiveItemTo(Darrion, UItMs_StoneSketch, 1);
                        DC(int64(0xaa0a3e56784d73cd), EConversationDebugInfo::Done);
                        DC(int64(0xb389e02722739d25), EConversationDebugInfo::Executing);
                        Darrion.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadNote);
                        DC(int64(0xb389e02722739d25), EConversationDebugInfo::Done);
                    }
                }
                DC(int64(0xaa0a3e56784d7409), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY.SucceedQuest();
                DC(int64(0xaa0a3e56784d7409), EConversationDebugInfo::Done);
                DC(int64(0xaa0a3e56784d7519), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_GETDARRIONKEY.StartQuest();
                DC(int64(0xaa0a3e56784d7519), EConversationDebugInfo::Done);
                DC(int64(0xaa0a3e56784d73d5), EConversationDebugInfo::Executing);
                // That's gonna take a bit. Keys are always fiddly work - ...
                Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_163645"));
                DC(int64(0xaa0a3e56784d73d5), EConversationDebugInfo::Done);
                DC(int64(0xaa0a3e56784d73df), EConversationDebugInfo::Executing);
                // Now let me work. I've gotta focus.
                Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_163734"));
                DC(int64(0xaa0a3e56784d73df), EConversationDebugInfo::Done);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Executing);
                Darrion.AddItemToInventory(UItMs_StoneSketch, 1);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Done);
                DC(int64(0x29c6f9942ac73400), EConversationDebugInfo::Executing);
                G1R.Darrion_MakeKey = FInGameTime::Now();
                DC(int64(0x29c6f9942ac73400), EConversationDebugInfo::Done);
                DC(int64(0xb389e02722739d27), EConversationDebugInfo::Executing);
                Darrion.AI.EndAnyOngoingInteraction();
                DC(int64(0xb389e02722739d27), EConversationDebugInfo::Done);
                DC(int64(0xb389e02722739d29), EConversationDebugInfo::Executing);
                Darrion.AI.GiveItemTo(Hero, UItMs_StoneSketch, 1);
                DC(int64(0xb389e02722739d29), EConversationDebugInfo::Done);
                DC(int64(0xaa0a3e56784d73e0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xaa0a3e56784d73e0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceDarrion124471 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0xb75d79e3d48fdca);
            default Caption = LocText("TEXT_WIP_TRYREI_20241211_153104");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceDarrion124471);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xb75d79e3d48fe38), Hero != nullptr && Hero.HasItem(UItMs_StoneSketch, 1, 0));
                }
                
                return Hero != nullptr && Hero.HasItem(UItMs_StoneSketch, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb75d79e3d48fdc1), EConversationDebugInfo::Executing);
                // I need something crafted.
                Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_153104"));
                DC(int64(0xb75d79e3d48fdc1), EConversationDebugInfo::Done);
                DB(int64(0xe3408f1b9992e6bc), Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2 != nullptr && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2.HasSucceeded());
                DB(int64(0xe3408f1b9992e6d9), G1R.ForgedRivalries2_DarrionAngry == 0);
                DB(int64(0xe3408f1b9992e6da), G1R.ForgedRivalries2_DarrionBanTrade != 0);
                
                if (Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2 != nullptr && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2.HasSucceeded() && G1R.ForgedRivalries2_DarrionAngry == 0 && G1R.ForgedRivalries2_DarrionBanTrade != 0)
                {
                    DC(int64(0xe3408f1b9992e6dc), EConversationDebugInfo::Executing);
                    G1R.ForgedRivalries2_DarrionBanTrade = 0;
                    DC(int64(0xe3408f1b9992e6dc), EConversationDebugInfo::Done);
                }
                DB(int64(0xe3408f1b9992e7cd), G1R.ForgedRivalries2_DarrionAngry != 0);
                
                if (G1R.ForgedRivalries2_DarrionAngry != 0)
                {
                    DC(int64(0xb75d79e3d48fde1), EConversationDebugInfo::Executing);
                    // You've got some nerve approachin' me with work.
                    Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_153226"));
                    DC(int64(0xb75d79e3d48fde1), EConversationDebugInfo::Done);
                    DC(int64(0xb75d79e3d48fdf5), EConversationDebugInfo::Executing);
                    
                    // This is different.
                    Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_153246"));
                    DC(int64(0xb75d79e3d48fdf5), EConversationDebugInfo::Done);
                    DC(int64(0xb75d79e3d48fdf6), EConversationDebugInfo::Executing);
                    
                    // Yeah, of course. COMPLETELY different if it serves your ...
                    Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_153247"));
                    DC(int64(0xb75d79e3d48fdf6), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xb75d79e3d48fdea), EConversationDebugInfo::Executing);
                    // What do you have?
                    Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_153236"));
                    DC(int64(0xb75d79e3d48fdea), EConversationDebugInfo::Done);
                }
                Subdialog(
                    UTopic_Darrion_124593,
                    UTopic_Darrion_124613
                );
            }
        }
        
        
        class UTopic_Darrion_124593 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0xb75d79e3d48fe13);
            default Caption = LocText("TEXT_WIP_TRYREI_20241211_153339_651");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_124593);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xb75d79e3d48fe14), EConversationDebugInfo::Executing);
                // I need a key. Here, take a look.
                Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_153339_651"));
                DC(int64(0xb75d79e3d48fe14), EConversationDebugInfo::Done);
                DC(int64(0x123f53d08c63cd78), EConversationDebugInfo::Executing);
                RequestCameraReverseShot();
                DC(int64(0x123f53d08c63cd78), EConversationDebugInfo::Done);
                DB(int64(0x123f53d08c63cd12), Hero != nullptr && Hero.IsSitting());
                
                if (Hero != nullptr && Hero.IsSitting())
                {
                    DC(int64(0xb75d79e3d48fe60), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Darrion, UItMs_StoneSketch, 1);
                    DC(int64(0xb75d79e3d48fe60), EConversationDebugInfo::Done);
                    DC(int64(0x351b082ef71509c1), EConversationDebugInfo::Executing);
                    Darrion.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadNoteSeated);
                    DC(int64(0x351b082ef71509c1), EConversationDebugInfo::Done);
                }
                else
                {
                    DC(int64(0xb75d79e3d48fe60), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Darrion, UItMs_StoneSketch, 1);
                    DC(int64(0xb75d79e3d48fe60), EConversationDebugInfo::Done);
                    DC(int64(0x351b082ef71509c1), EConversationDebugInfo::Executing);
                    Darrion.AI.BeginInteractionWithoutSpot(GameplayTag::Action_Conversation_ReadNote);
                    DC(int64(0x351b082ef71509c1), EConversationDebugInfo::Done);
                }
                DC(int64(0xb75d79e3d48fe68), EConversationDebugInfo::Executing);
                // Let me have look ... hm ... that bit ... the pattern ...
                Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_153825"));
                DC(int64(0xb75d79e3d48fe68), EConversationDebugInfo::Done);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Executing);
                Darrion.AddItemToInventory(UItMs_StoneSketch, 1);
                DC(int64(0x805acc2e0c489bb), EConversationDebugInfo::Done);
                DC(int64(0x17cb8402a110ff6e), EConversationDebugInfo::Executing);
                Darrion.AI.EndAnyOngoingInteraction();
                DC(int64(0x17cb8402a110ff6e), EConversationDebugInfo::Done);
                DC(int64(0x17cb8402a110ff70), EConversationDebugInfo::Executing);
                Darrion.AI.GiveItemTo(Hero, UItMs_StoneSketch, 1);
                DC(int64(0x17cb8402a110ff70), EConversationDebugInfo::Done);
                DC(int64(0x80ac2d222e8b38fb), EConversationDebugInfo::Executing);
                // Did you get that from the castle? Looks like warder ...
                Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_155703_3984"));
                DC(int64(0x80ac2d222e8b38fb), EConversationDebugInfo::Done);
                DC(int64(0x80ac2d222e8b392a), EConversationDebugInfo::Executing);
                // And the only dungeon I know of is in the Old Camp. What ...
                Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_155719"));
                DC(int64(0x80ac2d222e8b392a), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Darrion_122063,
                    UTopic_Darrion_122357,
                    UTopic_Darrion_122083
                );
            }
        }
        
        
        class UTopic_Darrion_124613 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0xb75d79e3d48fe17);
            default Caption = LocText("TEXT_WIP_TRYREI_20241211_154241_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_124613);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x80ac2d222e8b3853), EConversationDebugInfo::Executing);
                // It's for Stone. Gomez put him behind bars.
                Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_154241_1924"));
                DC(int64(0x80ac2d222e8b3853), EConversationDebugInfo::Done);
                DC(int64(0x80ac2d222e8b38cd), EConversationDebugInfo::Executing);
                
                // Stone? In Gomez's dungeon?
                Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_155443"));
                DC(int64(0x80ac2d222e8b38cd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Darrion_122063 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x80ac2d222e8b384e);
            default Caption = LocText("TEXT_WIP_TRYREI_20241211_154241_2083");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_122063);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x80ac2d222e8b384f), EConversationDebugInfo::Executing);
                
                // Can you make it or not?
                Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_154241_2083"));
                DC(int64(0x80ac2d222e8b384f), EConversationDebugInfo::Done);
                DB(int64(0x80ac2d222e8b3866), G1R.ForgedRivalries2_DarrionAngry != 0);
                
                if (G1R.ForgedRivalries2_DarrionAngry != 0)
                {
                    DC(int64(0x80ac2d222e8b386e), EConversationDebugInfo::Executing);
                    // With me eyes closed! But I won't. I ain't wastin' any ...
                    Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_154338"));
                    DC(int64(0x80ac2d222e8b386e), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_FORGEDRIVALRIES_3, Document::UDocumentSegment_CH5_FORGEDRIVALRIES_3_DarrionRejected);
                    DC(int64(0xaa0a3e56784d73c2), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY.FailQuest();
                    DC(int64(0xaa0a3e56784d73c2), EConversationDebugInfo::Done);
                    DC(int64(0x80ac2d222e8b3880), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x80ac2d222e8b3880), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x80ac2d222e8b3877), EConversationDebugInfo::Executing);
                    // Could? Yes. Will? Not until you tell me what this is ...
                    Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_154342"));
                    DC(int64(0x80ac2d222e8b3877), EConversationDebugInfo::Done);
                    DC(int64(0x80ac2d222e8b3888), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x80ac2d222e8b3888), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Darrion_122357 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x80ac2d222e8b3890);
            default Caption = LocText("TEXT_WIP_TRYREI_20241211_154642_3286");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_122357);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x80ac2d222e8b3891), EConversationDebugInfo::Executing);
                // That's my business.
                Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_154642_3286"));
                DC(int64(0x80ac2d222e8b3891), EConversationDebugInfo::Done);
                DB(int64(0x80ac2d222e8b38a3), G1R.ForgedRivalries2_DarrionAngry != 0);
                
                if (G1R.ForgedRivalries2_DarrionAngry != 0)
                {
                    DC(int64(0x80ac2d222e8b38ab), EConversationDebugInfo::Executing);
                    // Don't expect any help, then. Now get out!
                    Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_155154"));
                    DC(int64(0x80ac2d222e8b38ab), EConversationDebugInfo::Done);
                    GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH5_FORGEDRIVALRIES_3, Document::UDocumentSegment_CH5_FORGEDRIVALRIES_3_DarrionRejected);
                    DC(int64(0xaa0a3e56784d73c2), EConversationDebugInfo::Executing);
                    Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ASKDARRIONKEY.FailQuest();
                    DC(int64(0xaa0a3e56784d73c2), EConversationDebugInfo::Done);
                    DC(int64(0x80ac2d222e8b38b4), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x80ac2d222e8b38b4), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DC(int64(0x80ac2d222e8b38bc), EConversationDebugInfo::Executing);
                    // My forge, my business. And craftin' keys for doors in ...
                    Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_155253"));
                    DC(int64(0x80ac2d222e8b38bc), EConversationDebugInfo::Done);
                    DC(int64(0x80ac2d222e8b38c5), EConversationDebugInfo::Executing);
                    ReturnToLastSelection(1);
                    DC(int64(0x80ac2d222e8b38c5), EConversationDebugInfo::Done);
                }
            }
        }
        
        
        class UTopic_Darrion_122083 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x80ac2d222e8b3852);
            default Caption = LocText("TEXT_WIP_TRYREI_20241211_154241_1924");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_122083);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x80ac2d222e8b3853), EConversationDebugInfo::Executing);
                // It's for Stone. Gomez put him behind bars.
                Hero.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_154241_1924"));
                DC(int64(0x80ac2d222e8b3853), EConversationDebugInfo::Done);
                DC(int64(0x80ac2d222e8b38cd), EConversationDebugInfo::Executing);
                
                // Stone? In Gomez's dungeon?
                Darrion.AI.Say(LocText("TEXT_WIP_TRYREI_20241211_155443"));
                DC(int64(0x80ac2d222e8b38cd), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDarrion130722 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x901d3081e789a6ca);
            default Caption = LocText("TEXT_WIP_XRYREI_20241215_173851");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceDarrion130722);
            
            default Rules.RequireCharacterCloseToWaypoint(n"OCR_GRD_STONE_219", n"FP_SC_SMALLTALK_13", 1500.0f, int64(0x901d3081e789a6ca));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x901d3081e789a6d3), Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3 != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3.HasSucceeded());
                }
                
                return Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3 != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x901d3081e789a6bf), EConversationDebugInfo::Executing);
                
                // How is work?
                Hero.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_173851"));
                DC(int64(0x901d3081e789a6bf), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a6c0), EConversationDebugInfo::Executing);
                
                // Great, now that I have a new assistant ... And not just ...
                Darrion.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_173851_1340"));
                DC(int64(0x901d3081e789a6c0), EConversationDebugInfo::Done);
                Subdialog(
                    UTopic_Darrion_130731,
                    UTopic_Darrion_130751,
                    UTopic_Darrion_130799
                );
            }
        }
        
        
        class UTopic_Darrion_130731 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x901d3081e789a6f1);
            default Caption = LocText("TEXT_WIP_XRYREI_20241215_174102_2316");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_130731);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x901d3081e789a7b8), Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1 != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1.HasSucceeded());
                }
                
                return Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1 != nullptr && Quest::OldCamp_OCCHAPTER2_FORGEDRIVALRIES_1.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x901d3081e789a6f2), EConversationDebugInfo::Executing);
                // Are you two still fighting?
                Hero.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_174102_2316"));
                DC(int64(0x901d3081e789a6f2), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a702), EConversationDebugInfo::Executing);
                
                // Bah, nonsense. He's workin' for me now, that settles it ...
                Darrion.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_174105"));
                DC(int64(0x901d3081e789a702), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a703), EConversationDebugInfo::Executing);
                // And he's good at what he does. No artistry perhaps, but ...
                Darrion.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_174117"));
                DC(int64(0x901d3081e789a703), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a6f4), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x901d3081e789a6f4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Darrion_130751 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x901d3081e789a6f5);
            default Caption = LocText("TEXT_WIP_XRYREI_20241215_174102_153");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_130751);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x901d3081e789a6f6), EConversationDebugInfo::Executing);
                // Seems you two work well together.
                Hero.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_174102_153"));
                DC(int64(0x901d3081e789a6f6), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a704), EConversationDebugInfo::Executing);
                
                // When he's not grumblin' about "those bloody ornaments," ...
                Darrion.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_174136"));
                DC(int64(0x901d3081e789a704), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a705), EConversationDebugInfo::Executing);
                // Recently, he thought he could suggest simplifyin' one of ...
                Darrion.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_174150"));
                DC(int64(0x901d3081e789a705), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a706), EConversationDebugInfo::Executing);
                // And you know what's the worst part about it? I had to ...
                Darrion.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_174207"));
                DC(int64(0x901d3081e789a706), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a6f8), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x901d3081e789a6f8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Darrion_130799 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x901d3081e789a707);
            default Caption = LocText("TEXT_WIP_XRYREI_20241215_174223_292");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Darrion_130799);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x901d3081e789a708), EConversationDebugInfo::Executing);
                // How is it going with Stone?
                Hero.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_174223_292"));
                DC(int64(0x901d3081e789a708), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a714), EConversationDebugInfo::Executing);
                
                // Quite well. I mean, he ain't got a choice. Where else ...
                Darrion.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_174238"));
                DC(int64(0x901d3081e789a714), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a715), EConversationDebugInfo::Executing);
                // And besides, with his eye for function, and me vision ...
                Darrion.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_174254"));
                DC(int64(0x901d3081e789a715), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a716), EConversationDebugInfo::Executing);
                // There's no reason for bolsterin' his pride. He's doin' ...
                Darrion.AI.Say(LocText("TEXT_WIP_XRYREI_20241215_174318"));
                DC(int64(0x901d3081e789a716), EConversationDebugInfo::Done);
                DC(int64(0x901d3081e789a70a), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x901d3081e789a70a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDarrion145449_0 : UTopic_OCR_GRD_STONE_219__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x8f9c81f83532676a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceDarrion145449);
            
            default RequiredNearbyCharacters.Add(n"Hero");
            default Rules.HideIfKnows(UChoiceDarrion145449_0);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x8f9c81f83532677c), Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ESCORT != nullptr && Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ESCORT.HasSucceeded());
                    DB(int64(0x8f9c81f8353267a3), Stone != nullptr && Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_ScNew));
                    DB(int64(0x8f9c81f8353267a4), Stone != nullptr && Stone.IsCloseToCharacter(Darrion, 800.0f));
                }
                
                if (Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ESCORT != nullptr && !Quest::OldCamp_OCCHAPTER5_FORGEDRIVALRIES_3_FORGEDRIVALRIES_3_OBJ_ESCORT.HasSucceeded())
                    return false;
                
                if (Stone != nullptr && !Stone.HasAssignedDailyRoutine(UDailyRoutine_OCR_GRD_Stone_219_ScNew))
                    return false;
                
                if (Stone != nullptr && !Stone.IsCloseToCharacter(Darrion, 800.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x8f9c81f835326761), EConversationDebugInfo::Executing);
                // So, I'm wastin' too much time on art, ain't I?
                Darrion.AI.Say(LocText("TEXT_WIP_HVXGRO_20250129_092233_41"));
                DC(int64(0x8f9c81f835326761), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDarrion145449_1 : UTopic_OCR_GRD_STONE_219__SC_NOV_DARRION_1312
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDarrion145449_0);
            default Rules.HideIfKnows(UChoiceDarrion145449_1);
            default DebugId = int64(0x8f9c81f83532676a);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa9e336d1e56ae679), EConversationDebugInfo::Executing);
                
                // Yep ...
                Stone.AI.Say(LocText("TEXT_WIP_JPADCNF_20250130_150835"));
                DC(int64(0xa9e336d1e56ae679), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDarrion145449_2 : UTopic_OCR_GRD_STONE_219__SC_NOV_DARRION_1312
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDarrion145449_1);
            default Rules.HideIfKnows(UChoiceDarrion145449_2);
            default DebugId = int64(0x8f9c81f83532676a);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa9e336d1e56ae67a), EConversationDebugInfo::Executing);
                
                // It's what makes a weapon complete, Stone.
                Darrion.AI.Say(LocText("TEXT_WIP_JPADCNF_20250130_150837"));
                DC(int64(0xa9e336d1e56ae67a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDarrion145449_3 : UTopic_OCR_GRD_STONE_219__SC_NOV_DARRION_1312
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDarrion145449_2);
            default Rules.HideIfKnows(UChoiceDarrion145449_3);
            default DebugId = int64(0x8f9c81f83532676a);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa9e336d1e56ae67b), EConversationDebugInfo::Executing);
                
                // Really? Funny how me weapons work just fine without it, ...
                Stone.AI.Say(LocText("TEXT_WIP_JPADCNF_20250130_150837_2083"));
                DC(int64(0xa9e336d1e56ae67b), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDarrion145449_4 : UTopic_OCR_GRD_STONE_219__SC_NOV_DARRION_1312
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDarrion145449_3);
            default Rules.HideIfKnows(UChoiceDarrion145449_4);
            default DebugId = int64(0x8f9c81f83532676a);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa9e336d1e56ae67c), EConversationDebugInfo::Executing);
                
                // But that's why your weapons aren’t as good. They lack ...
                Darrion.AI.Say(LocText("TEXT_WIP_JPADCNF_20250130_150838"));
                DC(int64(0xa9e336d1e56ae67c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDarrion145449_5 : UTopic_OCR_GRD_STONE_219__SC_NOV_DARRION_1312
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDarrion145449_4);
            default Rules.HideIfKnows(UChoiceDarrion145449_5);
            default DebugId = int64(0x8f9c81f83532676a);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa9e336d1e56ae67d), EConversationDebugInfo::Executing);
                
                // Me blades have more character than-
                Stone.AI.Say(LocText("TEXT_WIP_JPADCNF_20250130_150839"));
                DC(int64(0xa9e336d1e56ae67d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDarrion145449_6 : UTopic_OCR_GRD_STONE_219__SC_NOV_DARRION_1312
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDarrion145449_5);
            default Rules.HideIfKnows(UChoiceDarrion145449_6);
            default DebugId = int64(0x8f9c81f83532676a);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa9e336d1e56ae67e), EConversationDebugInfo::Executing);
                
                // Than what? Than me? Is that what you were gonna say?
                Darrion.AI.Say(LocText("TEXT_WIP_JPADCNF_20250130_150913"));
                DC(int64(0xa9e336d1e56ae67e), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDarrion145449 : UTopic_OCR_GRD_STONE_219__SC_NOV_DARRION_1312
        {
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceDarrion145449_6);
            default Rules.HideIfKnows(UChoiceDarrion145449);
            default DebugId = int64(0x8f9c81f83532676a);
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa9e336d1e56ae67f), EConversationDebugInfo::Executing);
                
                // No, no. Never mind. Just quit botherin' me.
                Stone.AI.Say(LocText("TEXT_WIP_JPADCNF_20250130_150913_2238"));
                DC(int64(0xa9e336d1e56ae67f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDarrion146985 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0xae41e45eb9ebb133);
            default Caption = LocText("TEXT_WIP_JPADCNF_20250130_141600");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xae41e45eb9ebb129), EConversationDebugInfo::Executing);
                
                // I need some things. Let's trade.
                Hero.AI.Say(LocText("TEXT_WIP_JPADCNF_20250130_141600"));
                DC(int64(0xae41e45eb9ebb129), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_DARRION, Document::UDocumentSegment_Glossary_SC_NOV_DARRION_Introduction_Trader);
                DB(int64(0xe3408f1b9992e6bc), Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2 != nullptr && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2.HasSucceeded());
                DB(int64(0xe3408f1b9992e6d9), G1R.ForgedRivalries2_DarrionAngry == 0);
                DB(int64(0xe3408f1b9992e6da), G1R.ForgedRivalries2_DarrionBanTrade != 0);
                
                if (Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2 != nullptr && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2.HasSucceeded() && G1R.ForgedRivalries2_DarrionAngry == 0 && G1R.ForgedRivalries2_DarrionBanTrade != 0)
                {
                    DC(int64(0xe3408f1b9992e6dc), EConversationDebugInfo::Executing);
                    G1R.ForgedRivalries2_DarrionBanTrade = 0;
                    DC(int64(0xe3408f1b9992e6dc), EConversationDebugInfo::Done);
                }
                DB(int64(0x7ec56dc721168ce8), Darrion != nullptr && Darrion.IsAngryTowards(Hero));
                
                if (Darrion != nullptr && Darrion.IsAngryTowards(Hero))
                {
                    DC(int64(0x7ec56dc721168cf5), EConversationDebugInfo::Executing);
                    // I only sell to people who respect the rules. Get lost!
                    Darrion.AI.Say(LocText("TEXT_WIP_SSLLGEC_20250210_120950"));
                    DC(int64(0x7ec56dc721168cf5), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_darrion_146985_exit_1");
                    DC(int64(0x7ec56dc721168cff), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x7ec56dc721168cff), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DB(int64(0xae41e45eb9ebb173), G1R.ForgedRivalries2_DarrionBanTrade != 0);
                    
                    if (G1R.ForgedRivalries2_DarrionBanTrade != 0)
                    {
                        DC(int64(0xa9e336d1e56ae446), EConversationDebugInfo::Executing);
                        // I tould you already. My forge is closed to you.
                        Darrion.AI.Say(LocText("TEXT_WIP_JPADCNF_20250130_142612"));
                        DC(int64(0xa9e336d1e56ae446), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_darrion_146985_exit_2");
                    }
                    else
                    {
                        DC(int64(0xa9e336d1e56ae452), EConversationDebugInfo::Executing);
                        // Take a look.
                        Darrion.AI.Say(LocText("TEXT_WIP_JPADCNF_20250130_142642"));
                        DC(int64(0xa9e336d1e56ae452), EConversationDebugInfo::Done);
                        DC(int64(0x2ef8bd322c6eb69f), EConversationDebugInfo::Executing);
                        Darrion.AI.StartTradingWith(Hero);
                        DC(int64(0x2ef8bd322c6eb69f), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_darrion_146985_exit_3");
                    }
                }
            }
        }
        
        
        class UChoiceDarrion156692 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0xdcba2e5afdadf7ab);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceDarrion156692);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdcba2e5afdadf7b7), Hero != nullptr && Hero.IsCloseToCharacter(Darrion, 600.0f));
                    DB(int64(0xdcba2e5afdadf7b9), G1R != nullptr && G1R.IsInChapter(3));
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Darrion, 600.0f))
                    return false;
                
                if (G1R != nullptr && !G1R.IsInChapter(3))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdcba2e5afdadf7a2), EConversationDebugInfo::Executing);
                // A proper fuck-up, that is ... "salvation" me arse. ...
                Darrion.AI.Say(LocText("TEXT_WIP_LNXNLPG_20250213_135759_41"));
                DC(int64(0xdcba2e5afdadf7a2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDarrion156713 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0xdcba2e5afdadf7c4);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            
            default Rules.HideIfKnows(UChoiceDarrion156713);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdcba2e5afdadf7b7), Hero != nullptr && Hero.IsCloseToCharacter(Darrion, 600.0f));
                    DB(int64(0xdcba2e5afdadf7b9), Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasBeenStarted());
                }
                
                if (Hero != nullptr && !Hero.IsCloseToCharacter(Darrion, 600.0f))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD != nullptr && !Quest::SwampCamp_SCCHAPTER3_ORCGRAVEYARD.HasBeenStarted())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdcba2e5afdadf7bb), EConversationDebugInfo::Executing);
                // What's that supposed to mean? I thought the Sleeper was ...
                Darrion.AI.Say(LocText("TEXT_WIP_LNXNLPG_20250213_140402_2238"));
                DC(int64(0xdcba2e5afdadf7bb), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceDarrion182803 : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x3e9d2f5631dc480d);
            default Caption = LocText("TEXT_WIP_PDTFPHF_20250312_155610");
            default PriorityRank = 3;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x3e9d2f5631dc4803), EConversationDebugInfo::Executing);
                
                // I want to improve my armor.
                Hero.AI.Say(LocText("TEXT_WIP_PDTFPHF_20250312_155610"));
                DC(int64(0x3e9d2f5631dc4803), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_DARRION, Document::UDocumentSegment_Glossary_SC_NOV_DARRION_Armor);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_DARRION, Document::UDocumentSegment_Glossary_SC_NOV_DARRION_Introduction_Trader);
                DB(int64(0xe3408f1b9992e6bc), Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2 != nullptr && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2.HasSucceeded());
                DB(int64(0xe3408f1b9992e6d9), G1R.ForgedRivalries2_DarrionAngry == 0);
                DB(int64(0xe3408f1b9992e6da), G1R.ForgedRivalries2_DarrionBanTrade != 0);
                
                if (Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2 != nullptr && Quest::SwampCamp_SCCHAPTER3_FORGEDRIVALRIES_2.HasSucceeded() && G1R.ForgedRivalries2_DarrionAngry == 0 && G1R.ForgedRivalries2_DarrionBanTrade != 0)
                {
                    DC(int64(0xe3408f1b9992e6dc), EConversationDebugInfo::Executing);
                    G1R.ForgedRivalries2_DarrionBanTrade = 0;
                    DC(int64(0xe3408f1b9992e6dc), EConversationDebugInfo::Done);
                }
                DB(int64(0x3e9d2f5631dc483f), Darrion != nullptr && Darrion.IsAngryTowards(Hero));
                
                if (Darrion != nullptr && Darrion.IsAngryTowards(Hero))
                {
                    DC(int64(0x3e9d2f5631dc4848), EConversationDebugInfo::Executing);
                    // I cant work with someone who doesnt follow the rules. ...
                    Darrion.AI.Say(LocText("TEXT_WIP_PDTFPHF_20250312_155909"));
                    DC(int64(0x3e9d2f5631dc4848), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_darrion_182803_exit_1");
                    DC(int64(0x3e9d2f5631dc4852), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0x3e9d2f5631dc4852), EConversationDebugInfo::Done);
                    return;
                }
                else
                {
                    DB(int64(0x3e9d2f5631dc485c), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                    
                    if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    {
                        DB(int64(0x3e9d2f5631dc4872), Hero != nullptr && Hero.Inventory.HasEquippedItem(UTpl_Armor));
                        
                        if (Hero != nullptr && Hero.Inventory.HasEquippedItem(UTpl_Armor))
                        {
                            DC(int64(0x3e9d2f5631dc4898), EConversationDebugInfo::Executing);
                            // Of course. I'll help you with your armor and I'm sure ...
                            Darrion.AI.Say(LocText("TEXT_WIP_PDTFPHF_20250312_160600_3902"));
                            DC(int64(0x3e9d2f5631dc4898), EConversationDebugInfo::Done);
                            DC(int64(0x3e9d2f5631dc48a6), EConversationDebugInfo::Executing);
                            Darrion.AI.StartCustomizingArmorWith(Hero);
                            DC(int64(0x3e9d2f5631dc48a6), EConversationDebugInfo::Done);
                            
                            Other.Remember(n"choice_darrion_182803_exit_2");
                        }
                        else
                        {
                            DC(int64(0x3e9d2f5631dc487e), EConversationDebugInfo::Executing);
                            // I cant work with that armor.
                            Darrion.AI.Say(LocText("TEXT_WIP_PDTFPHF_20250312_160448_2316"));
                            DC(int64(0x3e9d2f5631dc487e), EConversationDebugInfo::Done);
                            DC(int64(0x3e9d2f5631dc488a), EConversationDebugInfo::Executing);
                            // Equip a templar armor and come back.
                            Darrion.AI.Say(LocText("TEXT_WIP_PDTFPHF_20250312_160504"));
                            DC(int64(0x3e9d2f5631dc488a), EConversationDebugInfo::Done);
                            
                            Other.Remember(n"choice_darrion_182803_exit_3");
                            DC(int64(0x3e9d2f5631dc488b), EConversationDebugInfo::Executing);
                            EndConversation();
                            DC(int64(0x3e9d2f5631dc488b), EConversationDebugInfo::Done);
                            return;
                        }
                    }
                    else
                    {
                        DC(int64(0x3e9d2f5631dc4866), EConversationDebugInfo::Executing);
                        // Sorry brother, I can't share this knowledge with ...
                        Darrion.AI.Say(LocText("TEXT_WIP_PDTFPHF_20250312_160101_3719"));
                        DC(int64(0x3e9d2f5631dc4866), EConversationDebugInfo::Done);
                        
                        Other.Remember(n"choice_darrion_182803_exit_4");
                    }
                }
            }
        }
        
        
        class UChoiceDarrionExit : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x5be68cd9f622dcbb);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5be68cd9f622dcbc), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x5be68cd9f622dcbc), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceDarrionHello : UTopic_Hero__SC_NOV_DARRION_1312
        {
            default DebugId = int64(0x5be68cd9f622dcbd);
            default Caption = LocText("DIA_DARRION_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceDarrionHello);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xa096bf2f702d8087), G1R != nullptr && !G1R.HasReachedChapter(3));
                    DB(int64(0xa096bf2f702d8094), Hero != nullptr && !Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp));
                }
                
                if (G1R != nullptr && G1R.HasReachedChapter(3))
                    return false;
                
                if (Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_SwampCamp))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x5be68cd9f622dcbf), EConversationDebugInfo::Executing);
                // Hey. I'm new here, and I want to get to know the camp.
                Hero.AI.Say(LocText("DIA_DARRION_HELLO_15_00"));
                DC(int64(0x5be68cd9f622dcbf), EConversationDebugInfo::Done);
                DC(int64(0x5be68cd9f622dcc0), EConversationDebugInfo::Executing);
                
                // Then you came to the wrong place - ever since the ...
                Darrion.AI.Say(LocText("DIA_DARRION_HELLO_11_01"));
                DC(int64(0x5be68cd9f622dcc0), EConversationDebugInfo::Done);
                DC(int64(0x5be68cd9f622dcc1), EConversationDebugInfo::Executing);
                // Bottom line, I got no time to chat. Don't bother me ...
                Darrion.AI.Say(LocText("DIA_DARRION_HELLO_11_02"));
                DC(int64(0x5be68cd9f622dcc1), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_DARRION, Document::UDocumentSegment_Glossary_SC_NOV_DARRION_Introduction_Trader);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */