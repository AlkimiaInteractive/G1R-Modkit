#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_UL_NON_GILBERT_1500 : UConversationCharacterSettings
        {
            default ForCharacter = n"UL_NON_GILBERT_1500";
        }
        
        
        class UTopic_Hero__UL_NON_GILBERT_1500 : UG1RDialogTopic
        {
            default ForCharacter = n"UL_NON_GILBERT_1500";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGilbert() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGilbertExit : UTopic_Hero__UL_NON_GILBERT_1500
        {
            default DebugId = int64(0x5c1a474d15f6a2ae);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x54f88babba183060), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x54f88babba183060), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGilbertFirst : UTopic_Hero__UL_NON_GILBERT_1500
        {
            default DebugId = int64(0x5c1a474d15f6a2b0);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            
            default Rules.HideIfKnows(UChoiceGilbertFirst);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x5c1a474d15f6a2b1), Gilbert != nullptr && Gilbert.IsCloseToCharacter(Hero, 300.0f));
                }
                
                return Gilbert != nullptr && Gilbert.IsCloseToCharacter(Hero, 300.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x54f88babba183061), EConversationDebugInfo::Executing);
                // Look who found Old Gilbert's hideout. I don't get many ...
                Gilbert.AI.Say(LocText("DIA_GILBERT_FIRST_04_00"));
                DC(int64(0x54f88babba183061), EConversationDebugInfo::Done);
                DC(int64(0x54f88babba183062), EConversationDebugInfo::Executing);
                // Good work. 
                Gilbert.AI.Say(LocText("DIA_GILBERT_FIRST_04_01"));
                DC(int64(0x54f88babba183062), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_NON_GILBERT, Document::UDocumentSegment_Glossary_UL_NON_GILBERT_Introduction);
                DC(int64(0x5c1a474d15f6a2b4), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_VOM_GILBERTFOUND);
                DC(int64(0x5c1a474d15f6a2b4), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceGilbertHallo : UTopic_Hero__UL_NON_GILBERT_1500
        {
            default DebugId = int64(0x5c1a474d15f6a2b5);
            default Caption = LocText("DIA_GILBERT_HALLO_15_00");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceGilbertHallo);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x54f88babba183063), EConversationDebugInfo::Executing);
                // What are you doing out here?
                Hero.AI.Say(LocText("DIA_GILBERT_HALLO_15_00"));
                DC(int64(0x54f88babba183063), EConversationDebugInfo::Done);
                DC(int64(0x54f88babba183064), EConversationDebugInfo::Executing);
                
                // Oh, I just couldn't stand Gomez and his bootlickers ...
                Gilbert.AI.Say(LocText("DIA_GILBERT_HALLO_04_01"));
                DC(int64(0x54f88babba183064), EConversationDebugInfo::Done);
                DC(int64(0x54f88babba183065), EConversationDebugInfo::Executing);
                // I doubt any of them would remember me these days, but I ...
                Gilbert.AI.Say(LocText("DIA_GILBERT_HALLO_04_02"));
                DC(int64(0x54f88babba183065), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_UL_NON_GILBERT, Document::UDocumentSegment_Glossary_UL_NON_GILBERT_ExtraInfo);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */