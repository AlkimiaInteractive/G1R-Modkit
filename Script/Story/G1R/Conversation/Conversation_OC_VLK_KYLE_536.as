#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_OC_VLK_KYLE_536 : UConversationCharacterSettings
        {
            default ForCharacter = n"OC_VLK_KYLE_536";
        }
        
        
        class UTopic_Hero__OC_VLK_KYLE_536 : UG1RDialogTopic
        {
            default ForCharacter = n"OC_VLK_KYLE_536";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetKyle() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceKyleExit : UTopic_Hero__OC_VLK_KYLE_536
        {
            default DebugId = int64(0xefcb5d7f69824f3);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xd4df5e661922d921), EConversationDebugInfo::Executing);
                if (ensure(IsValid(Kyle))) { Kyle.RefuseToTalk(120); }
                DC(int64(0xd4df5e661922d921), EConversationDebugInfo::Done);
                DC(int64(0xefcb5d7f69824f5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xefcb5d7f69824f5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceKyleHutrage : UTopic_Hero__OC_VLK_KYLE_536
        {
            default DebugId = int64(0xefcb5d7f69824f6);
            default Caption = FText::FromString("[Forced Conversation]");;
            default PriorityRank = -1;
            default ForceSettings.ApproachBy = EConversationForceWalk::None;
            default ForceSettings.RangeType = EConversationForceRangeType::CloseRange;
            
            default Rules.RequireCharacterCloseToWaypoint(n"SELF", n"FP_OC_STANDAROUND_60", 300.0f, int64(0xefcb5d7f69824f6));
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xefcb5d7f69824f7), Kyle != nullptr && !Kyle.IsRefusingToTalkWith(Hero));
                    DB(int64(0xefcb5d7f69824f8), Kyle != nullptr && Kyle.IsCloseToCharacter(Hero, 2000.0f));
                }
                
                if (Kyle != nullptr && Kyle.IsRefusingToTalkWith(Hero))
                    return false;
                
                if (Kyle != nullptr && !Kyle.IsCloseToCharacter(Hero, 2000.0f))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xefcb5d7f69824f9), EConversationDebugInfo::Executing);
                // How many times do I gotta tell you bastards to stop ...
                Kyle.AI.Say(LocText("DIA_KYLE_HUTRAGE_10_00"));
                DC(int64(0xefcb5d7f69824f9), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_KYLE, Document::UDocumentSegment_Glossary_OC_VLK_KYLE_Introduction);
                DC(int64(0xd4df5e661922f9c2), EConversationDebugInfo::Executing);
                Kyle.RefuseToTalk(120);
                DC(int64(0xd4df5e661922f9c2), EConversationDebugInfo::Done);
            }
        }
        
        
        class UChoiceKyleProblem : UTopic_Hero__OC_VLK_KYLE_536
        {
            default DebugId = int64(0xefcb5d7f69824fa);
            default Caption = LocText("DIA_KYLE_PROBLEM_15_00");
            default PriorityRank = 2;
            
            default Rules.HideIfKnows(UChoiceKyleProblem);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xefcb5d7f69824fb), EConversationDebugInfo::Executing);
                // What's your problem?
                Hero.AI.Say(LocText("DIA_KYLE_PROBLEM_15_00"));
                DC(int64(0xefcb5d7f69824fb), EConversationDebugInfo::Done);
                DC(int64(0xefcb5d7f69824fc), EConversationDebugInfo::Executing);
                
                // You're the problem! You and your lot!
                Kyle.AI.Say(LocText("DIA_KYLE_PROBLEM_10_01"));
                DC(int64(0xefcb5d7f69824fc), EConversationDebugInfo::Done);
                DC(int64(0xefcb5d7f69824fd), EConversationDebugInfo::Executing);
                // All I wanted was a hut for meself.
                Kyle.AI.Say(LocText("DIA_KYLE_PROBLEM_10_02"));
                DC(int64(0xefcb5d7f69824fd), EConversationDebugInfo::Done);
                DC(int64(0xefcb5d7f69824fe), EConversationDebugInfo::Executing);
                // Yeah, they warned me not to build it here, but what ...
                Kyle.AI.Say(LocText("DIA_KYLE_PROBLEM_10_03"));
                DC(int64(0xefcb5d7f69824fe), EConversationDebugInfo::Done);
                DC(int64(0xefcb5d7f69824ff), EConversationDebugInfo::Executing);
                // You think ANY of these bastards told me what'd happen if ...
                Kyle.AI.Say(LocText("DIA_KYLE_PROBLEM_10_04"));
                DC(int64(0xefcb5d7f69824ff), EConversationDebugInfo::Done);
                DC(int64(0x423c311dbf8d0dfa), EConversationDebugInfo::Executing);
                
                // What happened?
                Hero.AI.Say(LocText("TEXT_WIP_BDCKZPD_20241104_172004"));
                DC(int64(0x423c311dbf8d0dfa), EConversationDebugInfo::Done);
                DC(int64(0xefcb5d7f6982500), EConversationDebugInfo::Executing);
                
                // Well, you're lookin' at it! I'd just finished buildin', ...
                Kyle.AI.Say(LocText("DIA_KYLE_PROBLEM_10_05"));
                DC(int64(0xefcb5d7f6982500), EConversationDebugInfo::Done);
                DC(int64(0xefcb5d7f6982501), EConversationDebugInfo::Executing);
                // Those bloody arseholes, I hate them! I can't tell you ...
                Kyle.AI.Say(LocText("DIA_KYLE_PROBLEM_10_06"));
                DC(int64(0xefcb5d7f6982501), EConversationDebugInfo::Done);
                DC(int64(0xefcb5d7f6982502), EConversationDebugInfo::Executing);
                // EVERYONE just walks through here like they own this ...
                Kyle.AI.Say(LocText("DIA_KYLE_PROBLEM_10_07"));
                DC(int64(0xefcb5d7f6982502), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_OC_VLK_KYLE, Document::UDocumentSegment_Glossary_OC_VLK_KYLE_HutStory);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */