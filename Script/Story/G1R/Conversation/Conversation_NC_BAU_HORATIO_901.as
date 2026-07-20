#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_NC_BAU_HORATIO_901 : UConversationCharacterSettings
        {
            default ForCharacter = n"NC_BAU_HORATIO_901";
        }
        
        
        class UTopic_Hero__NC_BAU_HORATIO_901 : UG1RDialogTopic
        {
            default ForCharacter = n"NC_BAU_HORATIO_901";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetHoratio() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceHoratio77631 : UTopic_Hero__NC_BAU_HORATIO_901
        {
            default DebugId = int64(0xa3dd9ec62ea21fee);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHoratioHelpstr);
            default Rules.HideIfKnows(UChoiceHoratio77631);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xa3dd9ec62ea21fed), EConversationDebugInfo::Executing);
                // Okay: when you hit someone, your technique matters just ...
                Horatio.AI.Say(LocText("TEXT_DAVID_20231117_162411_41"));
                DC(int64(0xa3dd9ec62ea21fed), EConversationDebugInfo::Done);
                DC(int64(0xa3dd9ec62ea21ff0), EConversationDebugInfo::Executing);
                // You gotta put your WHOLE body into the movement, from ...
                Horatio.AI.Say(LocText("TEXT_DAVID_20231117_163524"));
                DC(int64(0xa3dd9ec62ea21ff0), EConversationDebugInfo::Done);
                DC(int64(0xa3dd9ec62ea21ff1), EConversationDebugInfo::Executing);
                // Do that, and you'll hit twice as hard. 
                Horatio.AI.Say(LocText("TEXT_DAVID_20231117_163532"));
                DC(int64(0xa3dd9ec62ea21ff1), EConversationDebugInfo::Done);
                DC(int64(0x61a39c21bde6d0d9), EConversationDebugInfo::Executing);
                Hero.IncreaseStrengthAttributeBy(5);
                DC(int64(0x61a39c21bde6d0d9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHoratio81404 : UTopic_Hero__NC_BAU_HORATIO_901
        {
            default DebugId = int64(0xc7da5a4b7839c916);
            default Caption = LocText("TEXT_WIP_BKSKLDM_20240219_125029");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceHoratio81404);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_HORATIO_HELLO_BECOOL_09_01"), int64(0xc7da5a4b7839c916));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc7da5a4b7839c91c), Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning());
                }
                
                return Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN != nullptr && Quest::NewCamp_NCCHAPTER1_RICELORDFOREMAN.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc7da5a4b7839c914), EConversationDebugInfo::Executing);
                // Bran, the foreman, has gone missing. Any idea where he ...
                Hero.AI.Say(LocText("TEXT_WIP_BKSKLDM_20240219_125029"));
                DC(int64(0xc7da5a4b7839c914), EConversationDebugInfo::Done);
                DC(int64(0xc7da5a4b7839c915), EConversationDebugInfo::Executing);
                
                // Nah. Can't say I care, either. The man's a bastard if ...
                Horatio.AI.Say(LocText("TEXT_WIP_BKSKLDM_20240219_125029_41"));
                DC(int64(0xc7da5a4b7839c915), EConversationDebugInfo::Done);
                DC(int64(0x72b4a4fbf2b74bb9), EConversationDebugInfo::Executing);
                // No wonder the Rice Lord likes him so much. 
                Horatio.AI.Say(LocText("TEXT_WIP_QIWVLHC_20240315_183858"));
                DC(int64(0x72b4a4fbf2b74bb9), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHoratioExit : UTopic_Hero__NC_BAU_HORATIO_901
        {
            default DebugId = int64(0xc9a6e7941a18d283);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc9a6e7941a18d284), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc9a6e7941a18d284), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceHoratioHello : UTopic_Hero__NC_BAU_HORATIO_901
        {
            default DebugId = int64(0xc9a6e7941a18d296);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceHoratioHello);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_HORATIO, Document::UDocumentSegment_Glossary_NC_BAU_HORATIO_Introduction);
                DC(int64(0x61a39c21bde6d0f1), EConversationDebugInfo::Executing);
                Horatio.AI.GotoCharacter(Hero, 200.0f);
                DC(int64(0x61a39c21bde6d0f1), EConversationDebugInfo::Done);
                DC(int64(0xc9a6e7941a18d298), EConversationDebugInfo::Executing);
                // What are you doing here? You lookin' for trouble?
                Horatio.AI.Say(LocText("DIA_HORATIO_HELLO_09_00"));
                DC(int64(0xc9a6e7941a18d298), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceHoratioHelloBecool,
                    UChoiceHoratioHelloPissoff
                );
            }
        }
        
        
        class UChoiceHoratioHelloBecool : UTopic_Hero__NC_BAU_HORATIO_901
        {
            default DebugId = int64(0xe8603e87342bc241);
            default Caption = LocText("DIA_HORATIO_HELLO_BECOOL_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc9a6e7941a18d2a0), EConversationDebugInfo::Executing);
                // Relax. I'm new here.
                Hero.AI.Say(LocText("DIA_HORATIO_HELLO_BECOOL_15_00"));
                DC(int64(0xc9a6e7941a18d2a0), EConversationDebugInfo::Done);
                DC(int64(0xc9a6e7941a18d2a1), EConversationDebugInfo::Executing);
                
                // Hmm. You seem alright. You never know in this place ... ...
                Horatio.AI.Say(LocText("DIA_HORATIO_HELLO_BECOOL_09_01"));
                DC(int64(0xc9a6e7941a18d2a1), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHoratioHelloPissoff : UTopic_Hero__NC_BAU_HORATIO_901
        {
            default DebugId = int64(0xe8603e87342bc23b);
            default Caption = LocText("DIA_HORATIO_HELLO_PISSOFF_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc9a6e7941a18d29b), EConversationDebugInfo::Executing);
                
                // Trouble from who? A rice farmer?
                Hero.AI.Say(LocText("DIA_HORATIO_HELLO_PISSOFF_15_00"));
                DC(int64(0xc9a6e7941a18d29b), EConversationDebugInfo::Done);
                DC(int64(0xc9a6e7941a18d29c), EConversationDebugInfo::Executing);
                
                // Just 'cause I work the fields doesn't mean I'm helpless ...
                Horatio.AI.Say(LocText("DIA_HORATIO_HELLO_PISSOFF_09_01"));
                DC(int64(0xc9a6e7941a18d29c), EConversationDebugInfo::Done);
                DC(int64(0xc9a6e7941a18d29d), EConversationDebugInfo::Executing);
                // If you want a beating, just say the word.
                Horatio.AI.Say(LocText("DIA_HORATIO_HELLO_PISSOFF_09_02"));
                DC(int64(0xc9a6e7941a18d29d), EConversationDebugInfo::Done);
                DC(int64(0xc9a6e7941a18d29e), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc9a6e7941a18d29e), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceHoratioHelpstr : UTopic_Hero__NC_BAU_HORATIO_901
        {
            default DebugId = int64(0xc9a6e7941a18d2cf);
            default Caption = LocText("DIA_HORATIO_HELPSTR_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHoratioPleaseteachstrRicelord);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHoratioThoughtstrRicelord);
            default Rules.HideIfKnows(UChoiceHoratioHelpstr);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc9a6e7941a18d2d1), EConversationDebugInfo::Executing);
                // I WILL take on the Ricelord. If you help me. 
                Hero.AI.Say(LocText("DIA_HORATIO_HELPSTR_15_00"));
                DC(int64(0xc9a6e7941a18d2d1), EConversationDebugInfo::Done);
                DC(int64(0xc9a6e7941a18d2d2), EConversationDebugInfo::Executing);
                
                // Hmm ... all right. I swore to never attack anyone again, ...
                Horatio.AI.Say(LocText("DIA_HORATIO_HELPSTR_09_01"));
                DC(int64(0xc9a6e7941a18d2d2), EConversationDebugInfo::Done);
                DC(int64(0x1f5fd3f5fa7573c3), EConversationDebugInfo::Executing);
                // I guess I could show you a trick or two.
                Horatio.AI.Say(LocText("TEXT_WIP_FSVMXID_20241010_152954"));
                DC(int64(0x1f5fd3f5fa7573c3), EConversationDebugInfo::Done);
                DC(int64(0xc9a6e7941a18d2d3), EConversationDebugInfo::Executing);
                
                // I'm listening.
                Hero.AI.Say(LocText("DIA_HORATIO_HELPSTR_15_02"));
                DC(int64(0xc9a6e7941a18d2d3), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_HORATIO, Document::UDocumentSegment_Glossary_NC_BAU_HORATIO_Learning);
            }
        }
        
        
        class UChoiceHoratioPleaseteachstr : UTopic_Hero__NC_BAU_HORATIO_901
        {
            default DebugId = int64(0xc9a6e7941a18d2b2);
            default Caption = LocText("DIA_HORATIO_PLEASETEACHSTR_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHoratioStory);
            default Rules.HideIfKnows(UChoiceHoratioPleaseteachstr);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc9a6e7941a18d2b4), EConversationDebugInfo::Executing);
                // Can you teach me to get stronger? 
                Hero.AI.Say(LocText("DIA_HORATIO_PLEASETEACHSTR_15_00"));
                DC(int64(0xc9a6e7941a18d2b4), EConversationDebugInfo::Done);
                DC(int64(0xc9a6e7941a18d2b5), EConversationDebugInfo::Executing);
                
                // Hm. Say I could - what would you use your strength for? 
                Horatio.AI.Say(LocText("DIA_HORATIO_PLEASETEACHSTR_09_01"));
                DC(int64(0xc9a6e7941a18d2b5), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_HORATIO, Document::UDocumentSegment_Glossary_NC_BAU_HORATIO_Teacher);
                Subdialog(
                    UChoiceHoratioPleaseteachstrDefend,
                    UChoiceHoratioPleaseteachstrRicelord,
                    UChoiceHoratioPleaseteachstrAttack
                );
            }
        }
        
        
        class UChoiceHoratioPleaseteachstrDefend : UTopic_Hero__NC_BAU_HORATIO_901
        {
            default DebugId = int64(0xe8603e87342bc25d);
            default Caption = LocText("DIA_HORATIO_PLEASETEACHSTR_DEFEND_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc9a6e7941a18d2b9), EConversationDebugInfo::Executing);
                // To defend myself. 
                Hero.AI.Say(LocText("DIA_HORATIO_PLEASETEACHSTR_DEFEND_15_00"));
                DC(int64(0xc9a6e7941a18d2b9), EConversationDebugInfo::Done);
                DC(int64(0xc9a6e7941a18d2ba), EConversationDebugInfo::Executing);
                
                // The best self defense is runnin' away. Crackin' skulls ...
                Horatio.AI.Say(LocText("DIA_HORATIO_PLEASETEACHSTR_DEFEND_09_01"));
                DC(int64(0xc9a6e7941a18d2ba), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHoratioPleaseteachstrRicelord : UTopic_Hero__NC_BAU_HORATIO_901
        {
            default DebugId = int64(0xe8603e87342bc262);
            default Caption = LocText("DIA_HORATIO_PLEASETEACHSTR_RICELORD_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x21f7e63154690118), Hero != nullptr && Hero.HasKnowledgeOf(UChoiceJeremiahHoratio::StaticClass()));
                }
                
                return Hero != nullptr && Hero.HasKnowledgeOf(UChoiceJeremiahHoratio::StaticClass());
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc9a6e7941a18d2be), EConversationDebugInfo::Executing);
                
                // To take on the Rice Lord and his goons. 
                Hero.AI.Say(LocText("DIA_HORATIO_PLEASETEACHSTR_RICELORD_15_00"));
                DC(int64(0xc9a6e7941a18d2be), EConversationDebugInfo::Done);
                DC(int64(0xc9a6e7941a18d2bf), EConversationDebugInfo::Executing);
                
                // Hmm ... you wouldn't be the first to try that. 
                Horatio.AI.Say(LocText("DIA_HORATIO_PLEASETEACHSTR_RICELORD_09_01"));
                DC(int64(0xc9a6e7941a18d2bf), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHoratioPleaseteachstrAttack : UTopic_Hero__NC_BAU_HORATIO_901
        {
            default DebugId = int64(0xe8603e87342bc268);
            default Caption = LocText("DIA_HORATIO_PLEASETEACHSTR_ATTACK_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x21f7e6315469011c), Hero != nullptr && !Hero.HasKnowledgeOf(UChoiceJeremiahHoratio::StaticClass()));
                }
                
                return Hero != nullptr && !Hero.HasKnowledgeOf(UChoiceJeremiahHoratio::StaticClass());
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc9a6e7941a18d2c2), EConversationDebugInfo::Executing);
                
                // To make sure the bastards here respect me. 
                Hero.AI.Say(LocText("DIA_HORATIO_PLEASETEACHSTR_ATTACK_15_00"));
                DC(int64(0xc9a6e7941a18d2c2), EConversationDebugInfo::Done);
                DC(int64(0xc9a6e7941a18d2c3), EConversationDebugInfo::Executing);
                
                // And before you know it, you have another bastard on your ...
                Horatio.AI.Say(LocText("DIA_HORATIO_PLEASETEACHSTR_ATTACK_09_01"));
                DC(int64(0xc9a6e7941a18d2c3), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHoratioSorry : UTopic_Hero__NC_BAU_HORATIO_901
        {
            default DebugId = int64(0xc9a6e7941a18d2a2);
            default Caption = LocText("DIA_HORATIO_SORRY_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHoratioHelloPissoff);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc9a6e7941a18d2a3), EConversationDebugInfo::Executing);
                
                // Sorry for what I said earlier. 
                Hero.AI.Say(LocText("DIA_HORATIO_SORRY_15_00"));
                DC(int64(0xc9a6e7941a18d2a3), EConversationDebugInfo::Done);
                DC(int64(0xc9a6e7941a18d2a4), EConversationDebugInfo::Executing);
                
                // Too late for that now. 
                Horatio.AI.Say(LocText("DIA_HORATIO_SORRY_09_01"));
                DC(int64(0xc9a6e7941a18d2a4), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_HORATIO, Document::UDocumentSegment_Glossary_NC_BAU_HORATIO_Ignore);
            }
        }
        
        
        class UChoiceHoratioStory : UTopic_Hero__NC_BAU_HORATIO_901
        {
            default DebugId = int64(0xc9a6e7941a18d2a5);
            default Caption = LocText("DIA_HORATIO_STORY_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHoratioHelloBecool);
            default Rules.HideIfKnows(UChoiceHoratioStory);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc9a6e7941a18d2a6), EConversationDebugInfo::Executing);
                // What's a guy like you doing with the farmers?
                Hero.AI.Say(LocText("DIA_HORATIO_STORY_15_00"));
                DC(int64(0xc9a6e7941a18d2a6), EConversationDebugInfo::Done);
                DC(int64(0xc9a6e7941a18d2a7), EConversationDebugInfo::Executing);
                
                // Lee asked me the same thing. I'm done fighting pointless ...
                Horatio.AI.Say(LocText("DIA_HORATIO_STORY_09_01"));
                DC(int64(0xc9a6e7941a18d2a7), EConversationDebugInfo::Done);
                DC(int64(0xc9a6e7941a18d2a8), EConversationDebugInfo::Executing);
                // They're what got me in here to start with. 
                Horatio.AI.Say(LocText("DIA_HORATIO_STORY_09_02"));
                DC(int64(0xc9a6e7941a18d2a8), EConversationDebugInfo::Done);
                DC(int64(0xc9a6e7941a18d2a9), EConversationDebugInfo::Executing);
                
                // What happened? 
                Hero.AI.Say(LocText("DIA_HORATIO_STORY_15_03"));
                DC(int64(0xc9a6e7941a18d2a9), EConversationDebugInfo::Done);
                DC(int64(0xc9a6e7941a18d2aa), EConversationDebugInfo::Executing);
                
                // Ah, the same stupid story you've heard a million times ...
                Horatio.AI.Say(LocText("DIA_HORATIO_STORY_09_04"));
                DC(int64(0xc9a6e7941a18d2aa), EConversationDebugInfo::Done);
                DC(int64(0x72b4a4fbf2b74bb7), EConversationDebugInfo::Executing);
                
                // You killed him?
                Hero.AI.Say(LocText("TEXT_WIP_QIWVLHC_20240315_182348"));
                DC(int64(0x72b4a4fbf2b74bb7), EConversationDebugInfo::Done);
                DC(int64(0xc9a6e7941a18d2ab), EConversationDebugInfo::Executing);
                
                // By accident. Hit his head on the cobblestone, the poor ...
                Horatio.AI.Say(LocText("DIA_HORATIO_STORY_09_05"));
                DC(int64(0xc9a6e7941a18d2ab), EConversationDebugInfo::Done);
                DC(int64(0x72b4a4fbf2b74bb8), EConversationDebugInfo::Executing);
                // So, yeah. I'm done with the fightin' ... unless it's to ...
                Horatio.AI.Say(LocText("TEXT_WIP_QIWVLHC_20240315_182452"));
                DC(int64(0x72b4a4fbf2b74bb8), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHoratioThanks : UTopic_Hero__NC_BAU_HORATIO_901
        {
            default DebugId = int64(0xc9a6e7941a18d2d6);
            default Caption = LocText("DIA_HORATIO_THANKS_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHoratio77631);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc9a6e7941a18d2d7), EConversationDebugInfo::Executing);
                
                // That was useful. Thanks. 
                Hero.AI.Say(LocText("DIA_HORATIO_THANKS_15_00"));
                DC(int64(0xc9a6e7941a18d2d7), EConversationDebugInfo::Done);
                DC(int64(0xc9a6e7941a18d2d8), EConversationDebugInfo::Executing);
                
                // Sure. And remember: use this for a just cause. And ONLY ...
                Horatio.AI.Say(LocText("DIA_HORATIO_THANKS_09_01"));
                DC(int64(0xc9a6e7941a18d2d8), EConversationDebugInfo::Done);
                DC(int64(0x4c3c0bd4878197e6), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4c3c0bd4878197e6), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceHoratioThoughtstr : UTopic_Hero__NC_BAU_HORATIO_901
        {
            default DebugId = int64(0xc9a6e7941a18d2c4);
            default Caption = LocText("DIA_HORATIO_THOUGHTSTR_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHoratioPleaseteachstrAttack);
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHoratioPleaseteachstrDefend);
            default Rules.HideIfKnows(UChoiceHoratioThoughtstrRicelord);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc9a6e7941a18d2c5), EConversationDebugInfo::Executing);
                // About you teaching me ...
                Hero.AI.Say(LocText("DIA_HORATIO_THOUGHTSTR_15_00"));
                DC(int64(0xc9a6e7941a18d2c5), EConversationDebugInfo::Done);
                DC(int64(0xc9a6e7941a18d2c6), EConversationDebugInfo::Executing);
                
                // I'm not going to. Unless you came up with a better ...
                Horatio.AI.Say(LocText("DIA_HORATIO_THOUGHTSTR_09_01"));
                DC(int64(0xc9a6e7941a18d2c6), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceHoratioThoughtstrNoidea,
                    UChoiceHoratioThoughtstrRicelord
                );
            }
        }
        
        
        class UChoiceHoratioThoughtstrNoidea : UTopic_Hero__NC_BAU_HORATIO_901
        {
            default DebugId = int64(0xe8603e87342bc274);
            default Caption = LocText("DIA_HORATIO_THOUGHTSTR_NOIDEA_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc9a6e7941a18d2c9), EConversationDebugInfo::Executing);
                // I haven't.
                Hero.AI.Say(LocText("DIA_HORATIO_THOUGHTSTR_NOIDEA_15_00"));
                DC(int64(0xc9a6e7941a18d2c9), EConversationDebugInfo::Done);
                DC(int64(0xc9a6e7941a18d2ca), EConversationDebugInfo::Executing);
                
                // Thought so.
                Horatio.AI.Say(LocText("DIA_HORATIO_THOUGHTSTR_NOIDEA_09_01"));
                DC(int64(0xc9a6e7941a18d2ca), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_NC_BAU_HORATIO, Document::UDocumentSegment_Glossary_NC_BAU_HORATIO_Reason);
            }
        }
        
        
        class UChoiceHoratioThoughtstrRicelord : UTopic_Hero__NC_BAU_HORATIO_901
        {
            default DebugId = int64(0xe8603e87342bc278);
            default Caption = LocText("DIA_HORATIO_THOUGHTSTR_RICELORD_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UChoiceHoratioThoughtstrRicelord);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x21f7e63154690127), Hero != nullptr && Hero.HasKnowledgeOf(UChoiceJeremiahHoratio::StaticClass()));
                }
                
                return Hero != nullptr && Hero.HasKnowledgeOf(UChoiceJeremiahHoratio::StaticClass());
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc9a6e7941a18d2cd), EConversationDebugInfo::Executing);
                // I have. I want to take on the Rice Lord and his goons. 
                Hero.AI.Say(LocText("DIA_HORATIO_THOUGHTSTR_RICELORD_15_00"));
                DC(int64(0xc9a6e7941a18d2cd), EConversationDebugInfo::Done);
                DC(int64(0xc9a6e7941a18d2ce), EConversationDebugInfo::Executing);
                
                // Hmm ... you wouldn't be the first to try that. 
                Horatio.AI.Say(LocText("DIA_HORATIO_PLEASETEACHSTR_RICELORD_09_01"));
                DC(int64(0xc9a6e7941a18d2ce), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceHoratioWasser : UTopic_Hero__NC_BAU_HORATIO_901
        {
            default DebugId = int64(0xc9a6e7941a18d285);
            default Caption = LocText("INFO_HORATIO_WASSER_15_00");
            default PriorityRank = 4;
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x69133b250939ac2f), G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday());
                    DB(int64(0x21f7e631546900e0), Quest::NewCamp_NCCHAPTER1_CARRYWATER != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER.HasSucceeded());
                    DB(int64(0x21f7e631546900e1), Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 1, 0));
                    DB(int64(0xf79434341a6aad7c), Horatio != nullptr && !Horatio.HasStoryEventInMemoryFromToday(n"GivenWater_Daily", Hero));
                    DB(int64(0x69133b250939ac30), G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday());
                    DB(int64(0x21f7e631546900df), Quest::NewCamp_NCCHAPTER1_CARRYWATER != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER.IsRunning());
                    DB(int64(0xf79434341a6aad89), Horatio != nullptr && !Horatio.HasStoryEventInMemoryFromToday(n"GivenWater_Daily", Hero));
                }
                
                if (G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday() && Quest::NewCamp_NCCHAPTER1_CARRYWATER != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER.HasSucceeded() && Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 1, 0) && Horatio != nullptr && !Horatio.HasStoryEventInMemoryFromToday(n"GivenWater_Daily", Hero))
                    return true;
                
                if (G1R.Lefty_WorkDay.IsValid() && G1R.Lefty_WorkDay.IsToday() && Quest::NewCamp_NCCHAPTER1_CARRYWATER != nullptr && Quest::NewCamp_NCCHAPTER1_CARRYWATER.IsRunning() && Horatio != nullptr && !Horatio.HasStoryEventInMemoryFromToday(n"GivenWater_Daily", Hero))
                    return true;
                
                return false;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc9a6e7941a18d287), EConversationDebugInfo::Executing);
                
                // Lefty sends me. I have some water for you.
                Hero.AI.Say(LocText("INFO_HORATIO_WASSER_15_00"));
                DC(int64(0xc9a6e7941a18d287), EConversationDebugInfo::Done);
                DB(int64(0xc9a6e7941a18d289), Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 1, 0));
                
                if (Hero != nullptr && Hero.HasItem(UItFo_Potion_Water_01, 1, 0))
                {
                    DC(int64(0xc9a6e7941a18d28a), EConversationDebugInfo::Executing);
                    // Thanks, friend. I was just about to drink the mud.
                    Horatio.AI.Say(LocText("INFO_HORATIO_WASSER_09_01"));
                    DC(int64(0xc9a6e7941a18d28a), EConversationDebugInfo::Done);
                    DC(int64(0x61a39c21bde6d146), EConversationDebugInfo::Executing);
                    Hero.AI.GiveItemTo(Horatio, UItFo_Potion_Water_01, 1);
                    DC(int64(0x61a39c21bde6d146), EConversationDebugInfo::Done);
                    DB(int64(0xc9a6e7941a18d28d), Horatio != nullptr && Horatio.IsSitting());
                    
                    if (Horatio != nullptr && Horatio.IsSitting())
                    {
                        DC(int64(0x61a39c21bde6d222), EConversationDebugInfo::Executing);
                        G1R.Peasants_have_water += 1;
                        DC(int64(0x61a39c21bde6d222), EConversationDebugInfo::Done);
                        DC(int64(0xf79434341a6aadaf), EConversationDebugInfo::Executing);
                        Horatio.StoreStoryEventInMemory(n"GivenWater_Daily", Hero);
                        DC(int64(0xf79434341a6aadaf), EConversationDebugInfo::Done);
                        DC(int64(0x7690d612d787ac8f), EConversationDebugInfo::Executing);
                        Horatio.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_DrinkSeated, 7);
                        DC(int64(0x7690d612d787ac8f), EConversationDebugInfo::Done);
                        DC(int64(0x7690d612d787aca6), EConversationDebugInfo::Executing);
                        Horatio.RemoveItemFromInventory(UItFo_Potion_Water_01, 1, 0);
                        DC(int64(0x7690d612d787aca6), EConversationDebugInfo::Done);
                        DB(int64(0xc9a6e7941a18d293), G1R.Peasants_have_water >= G1R.DurstigeBauern);
                        
                        if (G1R.Peasants_have_water >= G1R.DurstigeBauern)
                        {
                            DC(int64(0x61a39c21bde6d136), EConversationDebugInfo::Executing);
                            Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.SucceedQuest();
                            DC(int64(0x61a39c21bde6d136), EConversationDebugInfo::Done);
                            
                            Other.Remember(n"choice_horatio_wasser_exit_1");
                        }
                        else
                        {
                            
                            Other.Remember(n"choice_horatio_wasser_exit_2");
                        }
                    }
                    else
                    {
                        DC(int64(0x61a39c21bde6d222), EConversationDebugInfo::Executing);
                        G1R.Peasants_have_water += 1;
                        DC(int64(0x61a39c21bde6d222), EConversationDebugInfo::Done);
                        DC(int64(0xf79434341a6aadaf), EConversationDebugInfo::Executing);
                        Horatio.StoreStoryEventInMemory(n"GivenWater_Daily", Hero);
                        DC(int64(0xf79434341a6aadaf), EConversationDebugInfo::Done);
                        DC(int64(0x7690d612d787ac8f), EConversationDebugInfo::Executing);
                        Horatio.AI.TryInteractionWithoutSpot(GameplayTag::Action_Conversation_Drink, 7);
                        DC(int64(0x7690d612d787ac8f), EConversationDebugInfo::Done);
                        DC(int64(0x7690d612d787aca6), EConversationDebugInfo::Executing);
                        Horatio.RemoveItemFromInventory(UItFo_Potion_Water_01, 1, 0);
                        DC(int64(0x7690d612d787aca6), EConversationDebugInfo::Done);
                        DB(int64(0xc9a6e7941a18d293), G1R.Peasants_have_water >= G1R.DurstigeBauern);
                        
                        if (G1R.Peasants_have_water >= G1R.DurstigeBauern)
                        {
                            DC(int64(0x61a39c21bde6d136), EConversationDebugInfo::Executing);
                            Quest::NewCamp_NCCHAPTER1_CARRYWATER_CARRYWATER_OBJ_DISTRIBUTE.SucceedQuest();
                            DC(int64(0x61a39c21bde6d136), EConversationDebugInfo::Done);
                            
                            Other.Remember(n"choice_horatio_wasser_exit_3");
                        }
                        else
                        {
                            
                            Other.Remember(n"choice_horatio_wasser_exit_2");
                        }
                    }
                }
                else
                {
                    DC(int64(0xc9a6e7941a18d295), EConversationDebugInfo::Executing);
                    // Where? If this is a joke, it's not funny. 
                    Horatio.AI.Say(LocText("INFO_HORATIO_WASSER_NOWATER_09_00"));
                    DC(int64(0xc9a6e7941a18d295), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_horatio_wasser_exit_5");
                }
            }
        }
        
        
        class UChoiceHoratioWhyhere : UTopic_Hero__NC_BAU_HORATIO_901
        {
            default DebugId = int64(0xc9a6e7941a18d2ac);
            default Caption = LocText("DIA_HORATIO_WHYHERE_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceHoratioStory);
            default Rules.HideIfKnows(UChoiceHoratioWhyhere);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc9a6e7941a18d2ad), EConversationDebugInfo::Executing);
                // Why did you join THIS camp?
                Hero.AI.Say(LocText("DIA_HORATIO_WHYHERE_15_00"));
                DC(int64(0xc9a6e7941a18d2ad), EConversationDebugInfo::Done);
                DC(int64(0xc9a6e7941a18d2ae), EConversationDebugInfo::Executing);
                
                // Well, what are my options? Gomez and his warders are ...
                Horatio.AI.Say(LocText("DIA_HORATIO_WHYHERE_09_01"));
                DC(int64(0xc9a6e7941a18d2ae), EConversationDebugInfo::Done);
                DC(int64(0xc9a6e7941a18d2af), EConversationDebugInfo::Executing);
                // The Loons are an alright bunch, but I just don't believe ...
                Horatio.AI.Say(LocText("DIA_HORATIO_WHYHERE_09_02"));
                DC(int64(0xc9a6e7941a18d2af), EConversationDebugInfo::Done);
                DC(int64(0xc9a6e7941a18d2b0), EConversationDebugInfo::Executing);
                
                // That leaves the New Camp ...
                Hero.AI.Say(LocText("DIA_HORATIO_WHYHERE_15_03"));
                DC(int64(0xc9a6e7941a18d2b0), EConversationDebugInfo::Done);
                DC(int64(0xc9a6e7941a18d2b1), EConversationDebugInfo::Executing);
                
                // That's right. Honestly, no idea if that plan of the ...
                Horatio.AI.Say(LocText("DIA_HORATIO_WHYHERE_09_04"));
                DC(int64(0xc9a6e7941a18d2b1), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */