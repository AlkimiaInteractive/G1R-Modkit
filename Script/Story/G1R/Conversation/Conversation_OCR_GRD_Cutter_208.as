#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OCR_GRD_CUTTER_208 : UConversationCharacterSettings
        {
            default ForCharacter = n"OCR_GRD_CUTTER_208";
        }
        
        
        class UTopic_Hero__OCR_GRD_CUTTER_208 : UG1RDialogTopic
        {
            default ForCharacter = n"OCR_GRD_CUTTER_208";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetCutter() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceCutterBurg : UTopic_Hero__OCR_GRD_CUTTER_208
        {
            default DebugId = int64(0x177019e984454b8e);
            default Caption = LocText("DIA_CUTTER_BURG_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCutterHello);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x177019e984454b8f), EConversationDebugInfo::Executing);
                // What's the story behind this place?
                Hero.AI.Say(LocText("DIA_CUTTER_BURG_15_00"));
                DC(int64(0x177019e984454b8f), EConversationDebugInfo::Done);
                DC(int64(0x167d579702b3e6ea), EConversationDebugInfo::Executing);
                
                // What do you want, a history lesson? (snorts) Fine, why ...
                Cutter.AI.Say(LocText("TEXT_WIP_RUKFIKD_20241029_171858"));
                DC(int64(0x167d579702b3e6ea), EConversationDebugInfo::Done);
                DC(int64(0x177019e984454b90), EConversationDebugInfo::Executing);
                // There ain't much to tell, though - the fortress belonged ...
                Cutter.AI.Say(LocText("DIA_CUTTER_BURG_08_01"));
                DC(int64(0x177019e984454b90), EConversationDebugInfo::Done);
                DC(int64(0x177019e984454b91), EConversationDebugInfo::Executing);
                // I wasn't there when they stormed the castle, but it was ...
                Cutter.AI.Say(LocText("DIA_CUTTER_BURG_08_02"));
                DC(int64(0x177019e984454b91), EConversationDebugInfo::Done);
                DC(int64(0x177019e984454b92), EConversationDebugInfo::Executing);
                // Even before the Barrier, when they had us all crammed up ...
                Cutter.AI.Say(LocText("DIA_CUTTER_BURG_08_03"));
                DC(int64(0x177019e984454b92), EConversationDebugInfo::Done);
                DC(int64(0x177019e984454b93), EConversationDebugInfo::Executing);
                
                // The castle has dungeons? 
                Hero.AI.Say(LocText("DIA_CUTTER_BURG_15_04"));
                DC(int64(0x177019e984454b93), EConversationDebugInfo::Done);
                DC(int64(0x177019e984454b94), EConversationDebugInfo::Executing);
                
                // 'Course it does. They're empty these days, though - ...
                Cutter.AI.Say(LocText("DIA_CUTTER_BURG_08_05"));
                DC(int64(0x177019e984454b94), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceCutterExit : UTopic_Hero__OCR_GRD_CUTTER_208
        {
            default DebugId = int64(0x177019e984454b87);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x177019e984454b88), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x177019e984454b88), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceCutterHello : UTopic_Hero__OCR_GRD_CUTTER_208
        {
            default DebugId = int64(0x177019e984454b89);
            default Caption = LocText("DIA_CUTTER_HELLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceCutterHello);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x936c5e1e9d76f9aa), Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.HasSucceeded());
                }
                
                return Quest::OldCamp_OCCHAPTER1_JOINOC != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x177019e984454b8b), EConversationDebugInfo::Executing);
                // That's a lot of space you got in this castle. 
                Hero.AI.Say(LocText("DIA_CUTTER_HELLO_15_00"));
                DC(int64(0x177019e984454b8b), EConversationDebugInfo::Done);
                DC(int64(0x177019e984454b8c), EConversationDebugInfo::Executing);
                
                // Never seen YOU before. Who are you?
                Cutter.AI.Say(LocText("DIA_CUTTER_HELLO_08_01"));
                DC(int64(0x177019e984454b8c), EConversationDebugInfo::Done);
                DC(int64(0x177019e984454b8d), EConversationDebugInfo::Executing);
                
                // I'm new here. Just taking a look around. 
                Hero.AI.Say(LocText("DIA_CUTTER_HELLO_15_02"));
                DC(int64(0x177019e984454b8d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_GRD_CUTTER, Document::UDocumentSegment_Glossary_OC_GRD_CUTTER_Introduction);
            }
        }
        
        
        class UChoiceCutterPerm : UTopic_Hero__OCR_GRD_CUTTER_208
        {
            default DebugId = int64(0x177019e984454b95);
            default Caption = LocText("DIA_CUTTER_PERM_15_00");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceCutterBurg);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x177019e984454b96), EConversationDebugInfo::Executing);
                // What's life like as a warder? 
                Hero.AI.Say(LocText("DIA_CUTTER_PERM_15_00"));
                DC(int64(0x177019e984454b96), EConversationDebugInfo::Done);
                DC(int64(0x177019e984454b97), EConversationDebugInfo::Executing);
                
                // Quiet. We're the biggest and the most powerful camp of ...
                Cutter.AI.Say(LocText("DIA_CUTTER_PERM_08_01"));
                DC(int64(0x177019e984454b97), EConversationDebugInfo::Done);
                DC(int64(0x167d579702b3e6ef), EConversationDebugInfo::Executing);
                // Except for the occasional bandit, that is. 
                Cutter.AI.Say(LocText("TEXT_WIP_RUKFIKD_20241029_173314"));
                DC(int64(0x167d579702b3e6ef), EConversationDebugInfo::Done);
                DC(int64(0x177019e984454b98), EConversationDebugInfo::Executing);
                
                // I see. 
                Hero.AI.Say(LocText("DIA_CUTTER_PERM_15_02"));
                DC(int64(0x177019e984454b98), EConversationDebugInfo::Done);
                DC(int64(0x177019e984454b99), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x177019e984454b99), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGrd208CutterWelcome : UTopic_Hero__OCR_GRD_CUTTER_208
        {
            default DebugId = int64(0x177019e984454b9a);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceGrd208CutterWelcome);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x177019e984454b9b), Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard));
                }
                
                return Hero != nullptr && Hero.IsTrulyPartOfGuild(GameplayTag::Guild_Human_OldCamp_Guard);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x177019e984454b9c), EConversationDebugInfo::Executing);
                // Good choice, friend. You'll fit right in with us. 
                Cutter.AI.Say(LocText("GRD_208_CUTTER_WELCOME_INFO_08_01"));
                DC(int64(0x177019e984454b9c), EConversationDebugInfo::Done);
                DC(int64(0x177019e984454b9d), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x177019e984454b9d), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */