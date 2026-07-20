#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_FM_SLD_OKYL_752 : UConversationCharacterSettings
        {
            default ForCharacter = n"FM_SLD_OKYL_752";
        }
        
        
        class UTopic_Hero__FM_SLD_OKYL_752 : UG1RDialogTopic
        {
            default ForCharacter = n"FM_SLD_OKYL_752";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetOkyl() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceSld752OkylExit : UTopic_Hero__FM_SLD_OKYL_752
        {
            default DebugId = int64(0xdc32ebd5adf13d54);
            default Caption = LocText("DIA_SLD_752_OKYL_EXIT_INFO_15_01");
            default PriorityRank = 5;
            default PropertyTags.AddTag(GameplayTag::Conversation_Topic_End);
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdc32ebd5adf13d55), EConversationDebugInfo::Executing);
                // I got to go.
                Hero.AI.Say(LocText("DIA_SLD_752_OKYL_EXIT_INFO_15_01"));
                DC(int64(0xdc32ebd5adf13d55), EConversationDebugInfo::Done);
                DC(int64(0xdc32ebd5adf13d56), EConversationDebugInfo::Executing);
                
                // Wasn't asking you to stay.
                Okyl.AI.Say(LocText("DIA_SLD_752_OKYL_EXIT_INFO_11_02"));
                DC(int64(0xdc32ebd5adf13d56), EConversationDebugInfo::Done);
                DC(int64(0xdc32ebd5adf13d57), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xdc32ebd5adf13d57), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSld752OkylInmine : UTopic_Hero__FM_SLD_OKYL_752
        {
            default DebugId = int64(0xdc32ebd5adf13d5e);
            default Caption = LocText("DIA_SLD_752_OKYL_INMINE_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSld752OkylInmine);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdc32ebd5adf13d5f), EConversationDebugInfo::Executing);
                // I wanted to check out the mine. 
                Hero.AI.Say(LocText("DIA_SLD_752_OKYL_INMINE_INFO_15_01"));
                DC(int64(0xdc32ebd5adf13d5f), EConversationDebugInfo::Done);
                DC(int64(0xdc32ebd5adf13d60), EConversationDebugInfo::Executing);
                
                // Well, in that case, who am I to stop you?
                Okyl.AI.Say(LocText("DIA_SLD_752_OKYL_INMINE_INFO_11_02"));
                DC(int64(0xdc32ebd5adf13d60), EConversationDebugInfo::Done);
                DC(int64(0xdc32ebd5adf13d61), EConversationDebugInfo::Executing);
                // Look, you're obviously a freshie, so Iet me spell it out ...
                Okyl.AI.Say(LocText("DIA_SLD_752_OKYL_INMINE_INFO_11_03"));
                DC(int64(0xdc32ebd5adf13d61), EConversationDebugInfo::Done);
                DC(int64(0xdc32ebd5adf13d62), EConversationDebugInfo::Executing);
                // Try and go in anyway and you're a dead man. Same goes ...
                Okyl.AI.Say(LocText("DIA_SLD_752_OKYL_INMINE_INFO_11_04"));
                DC(int64(0xdc32ebd5adf13d62), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_FM_SLD_OKYL, Document::UDocumentSegment_Glossary_FM_SLD_OKYL_Access);
            }
        }
        
        
        class UChoiceSld752OkylIntro : UTopic_Hero__FM_SLD_OKYL_752
        {
            default DebugId = int64(0xdc32ebd5adf13d51);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::WalkToOther;
            
            default Rules.HideIfKnows(UChoiceSld752OkylIntro);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdc32ebd5adf13d52), Okyl != nullptr && Okyl.IsCloseToCharacter(Hero, 300.0f));
                }
                
                return Okyl != nullptr && Okyl.IsCloseToCharacter(Hero, 300.0f);
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdc32ebd5adf13d53), EConversationDebugInfo::Executing);
                // Hey, you. You're not one of my boys - what are you doing ...
                Okyl.AI.Say(LocText("DIA_SLD_752_OKYL_INTRO_INFO_11_01"));
                DC(int64(0xdc32ebd5adf13d53), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_FM_SLD_OKYL, Document::UDocumentSegment_Glossary_FM_SLD_OKYL_Introduction);
            }
        }
        
        
        class UChoiceSld752OkylPermit : UTopic_Hero__FM_SLD_OKYL_752
        {
            default DebugId = int64(0xdc32ebd5adf13d63);
            default Caption = LocText("DIA_SLD_752_OKYL_PERMIT_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.AllowIfCharacterHasKnowledgeOf(UChoiceSld752OkylInmine);
            default Rules.HideIfKnows(UChoiceSld752OkylPermit);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdc32ebd5adf13d64), EConversationDebugInfo::Executing);
                // Do I have your permission?
                Hero.AI.Say(LocText("DIA_SLD_752_OKYL_PERMIT_INFO_15_01"));
                DC(int64(0xdc32ebd5adf13d64), EConversationDebugInfo::Done);
                DC(int64(0xdc32ebd5adf13d65), EConversationDebugInfo::Executing);
                
                // I don't even know you. Why by Beliar would I let you in?
                Okyl.AI.Say(LocText("DIA_SLD_752_OKYL_PERMIT_INFO_11_02"));
                DC(int64(0xdc32ebd5adf13d65), EConversationDebugInfo::Done);
                DC(int64(0xdc32ebd5adf13d66), EConversationDebugInfo::Executing);
                // Now go bother someone else, I got things to take care ...
                Okyl.AI.Say(LocText("DIA_SLD_752_OKYL_PERMIT_INFO_11_03"));
                DC(int64(0xdc32ebd5adf13d66), EConversationDebugInfo::Done);
                DC(int64(0xdc32ebd5adf13d67), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xdc32ebd5adf13d67), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceSld752OkylUmsehen : UTopic_Hero__FM_SLD_OKYL_752
        {
            default DebugId = int64(0xdc32ebd5adf13d58);
            default Caption = LocText("DIA_SLD_752_OKYL_UMSEHEN_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSld752OkylUmsehen);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdc32ebd5adf13d59), EConversationDebugInfo::Executing);
                // Just looking around.
                Hero.AI.Say(LocText("DIA_SLD_752_OKYL_UMSEHEN_INFO_15_01"));
                DC(int64(0xdc32ebd5adf13d59), EConversationDebugInfo::Done);
                DC(int64(0xdc32ebd5adf13d5a), EConversationDebugInfo::Executing);
                
                // Well then, don't cause any trouble, and you won't get ...
                Okyl.AI.Say(LocText("DIA_SLD_752_OKYL_UMSEHEN_INFO_11_02"));
                DC(int64(0xdc32ebd5adf13d5a), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceSld752OkylWerbistdu : UTopic_Hero__FM_SLD_OKYL_752
        {
            default DebugId = int64(0xdc32ebd5adf13d5b);
            default Caption = LocText("DIA_SLD_752_OKYL_WERBISTDU_INFO_15_01");
            default PriorityRank = 1;
            
            default Rules.HideIfKnows(UChoiceSld752OkylWerbistdu);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdc32ebd5adf13d5c), EConversationDebugInfo::Executing);
                
                // Who are you?
                Hero.AI.Say(LocText("DIA_SLD_752_OKYL_WERBISTDU_INFO_15_01"));
                DC(int64(0xdc32ebd5adf13d5c), EConversationDebugInfo::Done);
                DC(int64(0xdc32ebd5adf13d5d), EConversationDebugInfo::Executing);
                
                // Okyl. I'm in charge of the Cauldron.
                Okyl.AI.Say(LocText("DIA_SLD_752_OKYL_WERBISTDU_INFO_11_02"));
                DC(int64(0xdc32ebd5adf13d5d), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_FM_SLD_OKYL, Document::UDocumentSegment_Glossary_FM_SLD_OKYL_Who);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */