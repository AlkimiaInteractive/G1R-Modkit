#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_VLK_JESSE_564 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_VLK_JESSE_564";
        }
        
        
        class UTopic_Hero__OC_VLK_JESSE_564 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_VLK_JESSE_564";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetJesse() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceJesseExit : UTopic_Hero__OC_VLK_JESSE_564
        {
            default DebugId = int64(0x4764bd1fb02dc1ef);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4764bd1fb02dc1f0), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4764bd1fb02dc1f0), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceJesseHallo : UTopic_Hero__OC_VLK_JESSE_564
        {
            default DebugId = int64(0x4764bd1fb02dc1f1);
            default Caption = LocText("DIA_JESSE_HALLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceHerekBully);
            default Rules.HideIfKnows(UChoiceJesseHallo);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4764bd1fb02dc1f2), EConversationDebugInfo::Executing);
                // How is it going?
                Hero.AI.Say(LocText("DIA_JESSE_HALLO_15_00"));
                DC(int64(0x4764bd1fb02dc1f2), EConversationDebugInfo::Done);
                DC(int64(0x4764bd1fb02dc1f3), EConversationDebugInfo::Executing);
                
                // I'm all right. You're new here, ain't you? 
                Jesse.AI.Say(LocText("DIA_JESSE_HALLO_03_01"));
                DC(int64(0x4764bd1fb02dc1f3), EConversationDebugInfo::Done);
                DC(int64(0x9d1cf82c34323479), EConversationDebugInfo::Executing);
                
                // Is it that obvious?
                Hero.AI.Say(LocText("TEXT_WIP_ADCKZPD_20241105_142006"));
                DC(int64(0x9d1cf82c34323479), EConversationDebugInfo::Done);
                DC(int64(0x9d1cf82c3432347a), EConversationDebugInfo::Executing);
                
                // Kind of. Here's some advice, as a welcome gift: never ...
                Jesse.AI.Say(LocText("TEXT_WIP_ADCKZPD_20241105_142015"));
                DC(int64(0x9d1cf82c3432347a), EConversationDebugInfo::Done);
                DC(int64(0x4764bd1fb02dc1f4), EConversationDebugInfo::Executing);
                // If they ask you for protection money, or "donations" as ...
                Jesse.AI.Say(LocText("DIA_JESSE_HALLO_03_02"));
                DC(int64(0x4764bd1fb02dc1f4), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_JESSE, Document::UDocumentSegment_Glossary_OC_VLK_JESSE_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_JESSE, Document::UDocumentSegment_Glossary_OC_VLK_JESSE_Warning);
            }
        }
        
        
        class UChoiceJesseMission : UTopic_Hero__OC_VLK_JESSE_564
        {
            default DebugId = int64(0x4764bd1fb02dc1fd);
            default Caption = LocText("DIA_JESSE_MISSION_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceJesseMission);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_JESSE_WARN_03_05"), int64(0x4764bd1fb02dc1fd));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4764bd1fb02dc1fe), Quest::JESSE_PAYFORME != nullptr && !Quest::JESSE_PAYFORME.HasBeenStarted());
                }
                
                return Quest::JESSE_PAYFORME != nullptr && !Quest::JESSE_PAYFORME.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4764bd1fb02dc1ff), EConversationDebugInfo::Executing);
                // Why did you warn me about Bloodwyn? 
                Hero.AI.Say(LocText("DIA_JESSE_MISSION_15_00"));
                DC(int64(0x4764bd1fb02dc1ff), EConversationDebugInfo::Done);
                DC(int64(0x4764bd1fb02dc200), EConversationDebugInfo::Executing);
                
                // Well ... one hand washes the other right? You've been ...
                Jesse.AI.Say(LocText("DIA_JESSE_MISSION_03_01"));
                DC(int64(0x4764bd1fb02dc200), EConversationDebugInfo::Done);
                DC(int64(0x4764bd1fb02dc201), EConversationDebugInfo::Executing);
                // You could even say you owe me something now. Right? 
                Jesse.AI.Say(LocText("DIA_JESSE_MISSION_03_02"));
                DC(int64(0x4764bd1fb02dc201), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceJesseMissionForgetit,
                    UChoiceJesseMissionWhat,
                    UChoiceJesseMissionNo,
                    UChoiceJesseMissionYes
                );
            }
        }
        
        
        class UChoiceJesseMissionForgetit : UTopic_Hero__OC_VLK_JESSE_564
        {
            default DebugId = int64(0xe8603e87342be69f);
            default Caption = LocText("DIA_JESSE_MISSION_FORGETIT_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4764bd1fb02dc204), EConversationDebugInfo::Executing);
                // I don't owe you anything. 
                Hero.AI.Say(LocText("DIA_JESSE_MISSION_FORGETIT_15_00"));
                DC(int64(0x4764bd1fb02dc204), EConversationDebugInfo::Done);
                DC(int64(0x4764bd1fb02dc205), EConversationDebugInfo::Executing);
                
                // ... You just don't like making friends, do you? Fine. ...
                Jesse.AI.Say(LocText("DIA_JESSE_MISSION_FORGETIT_03_01"));
                DC(int64(0x4764bd1fb02dc205), EConversationDebugInfo::Done);
                DC(int64(0x74f9b73e1b66ed24), EConversationDebugInfo::Executing);
                Jesse.SetRelationshipTowards(Hero, ERelationship::Angry);
                DC(int64(0x74f9b73e1b66ed24), EConversationDebugInfo::Done);
                DC(int64(0x4764bd1fb02dc207), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x4764bd1fb02dc207), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceJesseMissionWhat : UTopic_Hero__OC_VLK_JESSE_564
        {
            default DebugId = int64(0xe8603e87342be6a5);
            default Caption = LocText("DIA_JESSE_MISSION_WHAT_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4764bd1fb02dc209), EConversationDebugInfo::Executing);
                // What did you have in mind? 
                Hero.AI.Say(LocText("DIA_JESSE_MISSION_WHAT_15_00"));
                DC(int64(0x4764bd1fb02dc209), EConversationDebugInfo::Done);
                DC(int64(0x4764bd1fb02dc20a), EConversationDebugInfo::Executing);
                
                // Well, you see, I'm clean out of nuggets, and Bloodwyn's ...
                Jesse.AI.Say(LocText("DIA_JESSE_MISSION_WHAT_03_01"));
                DC(int64(0x4764bd1fb02dc20a), EConversationDebugInfo::Done);
                DC(int64(0x4764bd1fb02dc20b), EConversationDebugInfo::Executing);
                // Seeing as I helped you out, how about you cover my ten? ...
                Jesse.AI.Say(LocText("DIA_JESSE_MISSION_WHAT_03_02"));
                DC(int64(0x4764bd1fb02dc20b), EConversationDebugInfo::Done);
                DC(int64(0x74f9b73e1b66ed2b), EConversationDebugInfo::Executing);
                Jesse.SetTrueGuild(UGE_Guild_None);
                DC(int64(0x74f9b73e1b66ed2b), EConversationDebugInfo::Done);
                DC(int64(0x4764bd1fb02dc20d), EConversationDebugInfo::Executing);
                ReturnToLastSelection(1);
                DC(int64(0x4764bd1fb02dc20d), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJesseMissionNo : UTopic_Hero__OC_VLK_JESSE_564
        {
            default DebugId = int64(0xe8603e87342be6ac);
            default Caption = LocText("DIA_JESSE_MISSION_NO_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_JESSE_MISSION_WHAT_03_02"), int64(0xe8603e87342be6ac));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4764bd1fb02dc20f), EConversationDebugInfo::Executing);
                // Forget about it. I'm not paying for you.
                Hero.AI.Say(LocText("DIA_JESSE_MISSION_NO_15_00"));
                DC(int64(0x4764bd1fb02dc20f), EConversationDebugInfo::Done);
                DC(int64(0x4764bd1fb02dc210), EConversationDebugInfo::Executing);
                
                // ... You just don't like making friends, do you? Fine. ...
                Jesse.AI.Say(LocText("DIA_JESSE_MISSION_FORGETIT_03_01"));
                DC(int64(0x4764bd1fb02dc210), EConversationDebugInfo::Done);
                DC(int64(0x74f9b73e1b66ed32), EConversationDebugInfo::Executing);
                Jesse.SetRelationshipTowards(Hero, ERelationship::Angry);
                DC(int64(0x74f9b73e1b66ed32), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJesseMissionYes : UTopic_Hero__OC_VLK_JESSE_564
        {
            default DebugId = int64(0xe8603e87342be6b1);
            default Caption = LocText("DIA_JESSE_MISSION_YES_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4764bd1fb02dc213), EConversationDebugInfo::Executing);
                // I'll see what I can do.
                Hero.AI.Say(LocText("DIA_JESSE_MISSION_YES_15_00"));
                DC(int64(0x4764bd1fb02dc213), EConversationDebugInfo::Done);
                DC(int64(0x4764bd1fb02dc214), EConversationDebugInfo::Executing);
                
                // Thanks, man! You're my savior. Let me know once it's ...
                Jesse.AI.Say(LocText("DIA_JESSE_MISSION_YES_03_01"));
                DC(int64(0x4764bd1fb02dc214), EConversationDebugInfo::Done);
                DC(int64(0x74f9b73e1b66ed38), EConversationDebugInfo::Executing);
                Quest::JESSE_PAYFORME.StartQuest();
                DC(int64(0x74f9b73e1b66ed38), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceJesseMissuccess : UTopic_Hero__OC_VLK_JESSE_564
        {
            default DebugId = int64(0x4764bd1fb02dc216);
            default Caption = LocText("DIA_JESSE_MISSUCCESS_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceJesseMissuccess);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x4764bd1fb02dc217), Quest::JESSE_PAYFORME != nullptr && Quest::JESSE_PAYFORME.HasSucceeded());
                }
                
                return Quest::JESSE_PAYFORME != nullptr && Quest::JESSE_PAYFORME.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4764bd1fb02dc218), EConversationDebugInfo::Executing);
                // I gave Bloodwyn your ten. 
                Hero.AI.Say(LocText("DIA_JESSE_MISSUCCESS_15_00"));
                DC(int64(0x4764bd1fb02dc218), EConversationDebugInfo::Done);
                DC(int64(0x4764bd1fb02dc219), EConversationDebugInfo::Executing);
                
                // You did? Great. That makes us even. 
                Jesse.AI.Say(LocText("DIA_JESSE_MISSUCCESS_03_01"));
                DC(int64(0x4764bd1fb02dc219), EConversationDebugInfo::Done);
                DC(int64(0x74f9b73e1b66ed4c), EConversationDebugInfo::Executing);
                Jesse.SetTrueGuild(UGE_Guild_Human_OldCamp_Digger);
                DC(int64(0x74f9b73e1b66ed4c), EConversationDebugInfo::Done);
                Subdialog(
                    UChoiceJesseMissuccessWaaas,
                    UChoiceJesseMissuccessOk
                );
            }
        }
        
        
        class UChoiceJesseMissuccessWaaas : UTopic_Hero__OC_VLK_JESSE_564
        {
            default DebugId = int64(0xe8603e87342be6bc);
            default Caption = LocText("DIA_JESSE_MISSUCCESS_WAAAS_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4764bd1fb02dc21d), EConversationDebugInfo::Executing);
                // That's all? I spent ten nuggets for something I already ...
                Hero.AI.Say(LocText("DIA_JESSE_MISSUCCESS_WAAAS_15_00"));
                DC(int64(0x4764bd1fb02dc21d), EConversationDebugInfo::Done);
                DC(int64(0x4764bd1fb02dc21e), EConversationDebugInfo::Executing);
                
                // Well, how should I have known that?
                Jesse.AI.Say(LocText("DIA_JESSE_MISSUCCESS_WAAAS_03_01"));
                DC(int64(0x4764bd1fb02dc21e), EConversationDebugInfo::Done);
                DC(int64(0x9d1cf82c34323476), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x9d1cf82c34323476), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceJesseMissuccessOk : UTopic_Hero__OC_VLK_JESSE_564
        {
            default DebugId = int64(0xe8603e87342be6c1);
            default Caption = LocText("DIA_JESSE_MISSUCCESS_OK_15_00");
            default PriorityRank = 0;
            default bIsSubTopic = true;
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4764bd1fb02dc221), EConversationDebugInfo::Executing);
                // We are. One hand washes the other. 
                Hero.AI.Say(LocText("DIA_JESSE_MISSUCCESS_OK_15_00"));
                DC(int64(0x4764bd1fb02dc221), EConversationDebugInfo::Done);
                DC(int64(0x6da0b63c604a6f70), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x6da0b63c604a6f70), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceJesseWarn : UTopic_Hero__OC_VLK_JESSE_564
        {
            default DebugId = int64(0x4764bd1fb02dc1f5);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceJesseWarn);
            
            default Rules.RequireCharacterHasListenedTo(n"HERO", LocText("DIA_HEREK_BULLY_01_00"), int64(0x4764bd1fb02dc1f5));
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x4764bd1fb02dc1f7), EConversationDebugInfo::Executing);
                // Hey, you. That was you who refused to pay Bloodwyn, ...
                Jesse.AI.Say(LocText("DIA_JESSE_WARN_03_00"));
                DC(int64(0x4764bd1fb02dc1f7), EConversationDebugInfo::Done);
                DC(int64(0x4764bd1fb02dc1f8), EConversationDebugInfo::Executing);
                
                // What do you want? 
                Hero.AI.Say(LocText("DIA_JESSE_WARN_15_01"));
                DC(int64(0x4764bd1fb02dc1f8), EConversationDebugInfo::Done);
                DC(int64(0x4764bd1fb02dc1f9), EConversationDebugInfo::Executing);
                
                // Just want to warn you. You see, Bloodwyn paid several ...
                Jesse.AI.Say(LocText("DIA_JESSE_WARN_03_02"));
                DC(int64(0x4764bd1fb02dc1f9), EConversationDebugInfo::Done);
                DC(int64(0x4764bd1fb02dc1fa), EConversationDebugInfo::Executing);
                // For example, I saw him talking to that guy over there, ...
                Jesse.AI.Say(LocText("DIA_JESSE_WARN_03_03"));
                DC(int64(0x4764bd1fb02dc1fa), EConversationDebugInfo::Done);
                DC(int64(0x4764bd1fb02dc1fb), EConversationDebugInfo::Executing);
                
                // Your warning about Herek comes a bit late.
                Hero.AI.Say(LocText("DIA_JESSE_WARN_15_04"));
                DC(int64(0x4764bd1fb02dc1fb), EConversationDebugInfo::Done);
                DC(int64(0x4764bd1fb02dc1fc), EConversationDebugInfo::Executing);
                
                // Oh? Shit. Well, you're still standing, so I guess that's ...
                Jesse.AI.Say(LocText("DIA_JESSE_WARN_03_05"));
                DC(int64(0x4764bd1fb02dc1fc), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_JESSE, Document::UDocumentSegment_Glossary_OC_VLK_JESSE_Introduction);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_JESSE, Document::UDocumentSegment_Glossary_OC_VLK_JESSE_WarningTooLate);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */