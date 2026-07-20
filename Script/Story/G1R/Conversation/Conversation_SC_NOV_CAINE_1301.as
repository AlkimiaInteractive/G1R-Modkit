#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_NOV_CAINE_1301 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_NOV_CAINE_1301";
        }
        
        
        class UTopic_Hero__SC_NOV_CAINE_1301 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_NOV_CAINE_1301";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetCaine() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceCaine144631 : UTopic_Hero__SC_NOV_CAINE_1301
        {
            default DebugId = int64(0xcf6cde32246c7ef5);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default bIsAmbientTopic = true;
            default ForceSettings.RangeType = EConversationForceRangeType::SurroundingRange;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            
            default Rules.HideIfKnows(UChoiceCaine144631);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("TEXT_WIP_OTYHSLC_20240229_190141"), int64(0xcf6cde32246c7ef5));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xcf6cde32246c7ef4), EConversationDebugInfo::Executing);
                // Baal Cadar is also close with the Sleeper... Master ...
                Caine.AI.Say(LocText("TEXT_WIP_PVXGRO_20250121_142745_2772"));
                DC(int64(0xcf6cde32246c7ef4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCaineAddinfokalom : UTopic_Hero__SC_NOV_CAINE_1301
        {
            default DebugId = int64(0xc80f6c9606ad399);
            default Caption = LocText("DIA_CAINE_ADDINFOKALOM_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCaineJob);
            default Rules.HideIfKnows(UChoiceCaineAddinfokalom);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc80f6c9606ad39a), EConversationDebugInfo::Executing);
                
                // What else can you tell me about your master?
                Hero.AI.Say(LocText("DIA_CAINE_ADDINFOKALOM_15_00"));
                DC(int64(0xc80f6c9606ad39a), EConversationDebugInfo::Done);
                DC(int64(0xc80f6c9606ad39b), EConversationDebugInfo::Executing);
                
                // Hmm ... he's a great alchemist, well, maybe the best in ...
                Caine.AI.Say(LocText("DIA_CAINE_ADDINFOKALOM_13_01"));
                DC(int64(0xc80f6c9606ad39b), EConversationDebugInfo::Done);
                DC(int64(0x38b1a30fd9916db4), EConversationDebugInfo::Executing);
                // He's seen the Sleeper more clearly than most of us. It's ...
                Caine.AI.Say(LocText("TEXT_WIP_OTYHSLC_20240229_190141"));
                DC(int64(0x38b1a30fd9916db4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCaineExit : UTopic_Hero__SC_NOV_CAINE_1301
        {
            default DebugId = int64(0xc80f6c9606ad383);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc80f6c9606ad384), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xc80f6c9606ad384), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCaineHallo : UTopic_Hero__SC_NOV_CAINE_1301
        {
            default DebugId = int64(0xc80f6c9606ad385);
            default Caption = LocText("DIA_CAINE_HALLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceCaineHallo);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc80f6c9606ad386), EConversationDebugInfo::Executing);
                // Hey. I'm new here.
                Hero.AI.Say(LocText("DIA_CAINE_HALLO_15_00"));
                DC(int64(0xc80f6c9606ad386), EConversationDebugInfo::Done);
                DC(int64(0xc80f6c9606ad387), EConversationDebugInfo::Executing);
                
                // Hmm? Oh. I ... see. I'm Caine, Cor Kalom's apprentice. ...
                Caine.AI.Say(LocText("DIA_CAINE_HALLO_13_01"));
                DC(int64(0xc80f6c9606ad387), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_CAINE, Document::UDocumentSegment_Glossary_SC_NOV_CAINE_Introduction);
                Subdialog(
                    UChoiceCaineHalloNein,
                    UChoiceCaineHalloJa,
                    UTopic_Caine_82145
                );
            }
        }
        
        
        class UChoiceCaineHalloNein : UTopic_Hero__SC_NOV_CAINE_1301
        {
            default DebugId = int64(0x2b7b0b4220247b8c);
            default Caption = LocText("DIA_CAINE_HALLO_NEIN_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc80f6c9606ad38a), EConversationDebugInfo::Executing);
                // No.
                Hero.AI.Say(LocText("DIA_CAINE_HALLO_NEIN_15_00"));
                DC(int64(0xc80f6c9606ad38a), EConversationDebugInfo::Done);
                DC(int64(0xc80f6c9606ad38b), EConversationDebugInfo::Executing);
                
                // What? Then you can't have been here long. 
                Caine.AI.Say(LocText("DIA_CAINE_HALLO_NEIN_13_01"));
                DC(int64(0xc80f6c9606ad38b), EConversationDebugInfo::Done);
                DC(int64(0xc80f6c9606ad38c), EConversationDebugInfo::Executing);
                // Master Kalom, he's um ... important. Veeery important. ...
                Caine.AI.Say(LocText("DIA_CAINE_HALLO_NEIN_13_02"));
                DC(int64(0xc80f6c9606ad38c), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCaineHalloJa : UTopic_Hero__SC_NOV_CAINE_1301
        {
            default DebugId = int64(0xc07afa9e1d078207);
            default Caption = LocText("DIA_CAINE_HALLO_JA_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc80f6c9606ad38e), EConversationDebugInfo::Executing);
                
                // I do.
                Hero.AI.Say(LocText("DIA_CAINE_HALLO_JA_15_00"));
                DC(int64(0xc80f6c9606ad38e), EConversationDebugInfo::Done);
                DC(int64(0xc80f6c9606ad38f), EConversationDebugInfo::Executing);
                
                // Good. That's ... good.
                Caine.AI.Say(LocText("DIA_CAINE_HALLO_JA_13_01"));
                DC(int64(0xc80f6c9606ad38f), EConversationDebugInfo::Done);
            }
        }
        
        
        class UTopic_Caine_82145 : UTopic_Hero__SC_NOV_CAINE_1301
        {
            default DebugId = int64(0x38b1a30fd9916dad);
            default Caption = LocText("TEXT_WIP_OTYHSLC_20240229_185635_41");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.HideIfKnows(UTopic_Caine_82145);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x38b1a30fd9916dae), EConversationDebugInfo::Executing);
                
                // Are you okay? You sound ... confused.
                Hero.AI.Say(LocText("TEXT_WIP_OTYHSLC_20240229_185635_41"));
                DC(int64(0x38b1a30fd9916dae), EConversationDebugInfo::Done);
                DC(int64(0x38b1a30fd9916db1), EConversationDebugInfo::Executing);
                
                // Oh, I do? I'm sorry. I've just been ... you know ... ...
                Caine.AI.Say(LocText("TEXT_WIP_OTYHSLC_20240229_185647"));
                DC(int64(0x38b1a30fd9916db1), EConversationDebugInfo::Done);
                DC(int64(0x5dcd7126285f54e), EConversationDebugInfo::Executing);
                
                // Quite hard by the looks of it ... 
                Hero.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_141621"));
                DC(int64(0x5dcd7126285f54e), EConversationDebugInfo::Done);
                DC(int64(0x38b1a30fd9916db2), EConversationDebugInfo::Executing);
                
                // Um ... yeah. So, you know Kalom?
                Caine.AI.Say(LocText("TEXT_WIP_OTYHSLC_20240229_185719"));
                DC(int64(0x38b1a30fd9916db2), EConversationDebugInfo::Done);
                DC(int64(0x38b1a30fd9916db0), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x38b1a30fd9916db0), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCaineJob : UTopic_Hero__SC_NOV_CAINE_1301
        {
            default DebugId = int64(0xc80f6c9606ad390);
            default Caption = LocText("DIA_CAINE_JOB_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCaineHalloNein);
            default Rules.HideIfKnows(UChoiceCaineJob);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc80f6c9606ad391), EConversationDebugInfo::Executing);
                // What's your job around here?
                Hero.AI.Say(LocText("DIA_CAINE_JOB_15_00"));
                DC(int64(0xc80f6c9606ad391), EConversationDebugInfo::Done);
                DC(int64(0xc80f6c9606ad392), EConversationDebugInfo::Executing);
                
                // Oh ... this and that. I help Master Kalom with his ...
                Caine.AI.Say(LocText("DIA_CAINE_JOB_13_01"));
                DC(int64(0xc80f6c9606ad392), EConversationDebugInfo::Done);
                DC(int64(0xc80f6c9606ad393), EConversationDebugInfo::Executing);
                // Potions, swampweed, and dreamjuice. That we make from ...
                Caine.AI.Say(LocText("DIA_CAINE_JOB_13_02"));
                DC(int64(0xc80f6c9606ad393), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCaineWosekret : UTopic_Hero__SC_NOV_CAINE_1301
        {
            default DebugId = int64(0xc80f6c9606ad394);
            default Caption = LocText("DIA_CAINE_WOSEKRET_15_00");
            default PriorityRank = 2;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCaineJob);
            default Rules.HideIfKnows(UChoiceCaineWosekret);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc80f6c9606ad395), EConversationDebugInfo::Executing);
                
                // You brew potions from minecrawler mandibles?
                Hero.AI.Say(LocText("DIA_CAINE_WOSEKRET_15_00"));
                DC(int64(0xc80f6c9606ad395), EConversationDebugInfo::Done);
                DC(int64(0xc80f6c9606ad396), EConversationDebugInfo::Executing);
                
                // The dreamjuice, yes. Master Kalom pays well for the ...
                Caine.AI.Say(LocText("DIA_CAINE_WOSEKRET_13_01"));
                DC(int64(0xc80f6c9606ad396), EConversationDebugInfo::Done);
                DC(int64(0xc80f6c9606ad397), EConversationDebugInfo::Executing);
                // But don't get any ideas, yes? Minecrawlers are ...
                Caine.AI.Say(LocText("DIA_CAINE_WOSEKRET_13_02"));
                DC(int64(0xc80f6c9606ad397), EConversationDebugInfo::Done);
                DC(int64(0xc80f6c9606ad398), EConversationDebugInfo::Executing);
                // He goes to the Old Mine every morning and comes back at ...
                Caine.AI.Say(LocText("DIA_CAINE_WOSEKRET_13_03"));
                DC(int64(0xc80f6c9606ad398), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceNov1301CaineChest : UTopic_Hero__SC_NOV_CAINE_1301
        {
            default DebugId = int64(0xc80f6c9606ad39c);
            default Caption = LocText("NOV_1301_CAINE_CHEST_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceNov1301CaineChest);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xc80f6c9606ad39d), Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE.IsRunning());
                }
                
                return Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_KALOMSRECIPE.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xc80f6c9606ad39e), EConversationDebugInfo::Executing);
                
                // Do you know where Kalom keeps his recipes?
                Hero.AI.Say(LocText("NOV_1301_CAINE_CHEST_INFO_15_01"));
                DC(int64(0xc80f6c9606ad39e), EConversationDebugInfo::Done);
                DC(int64(0xc80f6c9606ad39f), EConversationDebugInfo::Executing);
                
                // Hmm ...? Why do you ask?
                Caine.AI.Say(LocText("NOV_1301_CAINE_CHEST_INFO_13_02"));
                DC(int64(0xc80f6c9606ad39f), EConversationDebugInfo::Done);
                DC(int64(0xa86abab5986ff719), EConversationDebugInfo::Executing);
                
                // Just curious.
                Hero.AI.Say(LocText("TEXT_NISEA_20231228_152459"));
                DC(int64(0xa86abab5986ff719), EConversationDebugInfo::Done);
                DC(int64(0xa86abab5986ff71a), EConversationDebugInfo::Executing);
                
                // Mmm ... I see. Uh, curiosity is good, says Y'Berion ... ...
                Caine.AI.Say(LocText("TEXT_NISEA_20231228_152531"));
                DC(int64(0xa86abab5986ff71a), EConversationDebugInfo::Done);
                DC(int64(0xa86abab5986ff71c), EConversationDebugInfo::Executing);
                // Wait, that's not what you asked. His chest. That's where ...
                Caine.AI.Say(LocText("TEXT_NISEA_20231228_152604"));
                DC(int64(0xa86abab5986ff71c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_SC_NOV_CAINE, Document::UDocumentSegment_Glossary_SC_NOV_CAINE_Introduction);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */