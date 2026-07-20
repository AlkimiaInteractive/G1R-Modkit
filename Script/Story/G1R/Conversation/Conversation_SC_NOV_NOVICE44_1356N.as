#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_NOV_NOVICE44_1356N : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_NOV_NOVICE44_1356N";
        }
        
        
        class UTopic_Hero__SC_NOV_NOVICE44_1356N : UG1RDialogTopic
        {
            default ForCharacter = n"SC_NOV_NOVICE44_1356N";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetNovice44() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceNovice4482818 : UTopic_Hero__SC_NOV_NOVICE44_1356N
        {
            default DebugId = int64(0xed124491d1410b6);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            default Rules.HideIfKnows(UChoiceNovice4482818);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xed124491d1410b5), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xed124491d1410b5), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceNovice4482834 : UTopic_Hero__SC_NOV_NOVICE44_1356N
        {
            default DebugId = int64(0xed124491d1410ba);
            default Caption = LocText("TEXT_WIP_CSEDFEF_20240308_141740_41");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceNovice4482834);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdc24fe363c0a9bfc), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND.IsRunning());
                    DB(int64(0x188124b8621e6b81), Hero != nullptr && !Hero.HasItem(UItWr_Scroll_AbandonMineSketch, 1, 0));
                }
                
                if (Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND.IsRunning())
                    return false;
                
                if (Hero != nullptr && Hero.HasItem(UItWr_Scroll_AbandonMineSketch, 1, 0))
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xed124491d1410b8), EConversationDebugInfo::Executing);
                // You know which of those huts is Caine's?
                Hero.AI.Say(LocText("TEXT_WIP_CSEDFEF_20240308_141740_41"));
                DC(int64(0xed124491d1410b8), EConversationDebugInfo::Done);
                DC(int64(0xed124491d1410b9), EConversationDebugInfo::Executing);
                
                // Yes. 
                Novice44.AI.Say(LocText("TEXT_WIP_CSEDFEF_20240308_141740_2083"));
                DC(int64(0xed124491d1410b9), EConversationDebugInfo::Done);
                DC(int64(0xac160bfd93ad0f36), EConversationDebugInfo::Executing);
                
                // And ... are you going to tell me? 
                Hero.AI.Say(LocText("TEXT_WIP_IXHZGRJ_20240322_000229"));
                DC(int64(0xac160bfd93ad0f36), EConversationDebugInfo::Done);
                DC(int64(0xdd6977046c25a887), EConversationDebugInfo::Executing);
                
                // Hmm?
                Novice44.AI.Say(LocText("TEXT_WIP_ATMTGUC_20240403_161843"));
                DC(int64(0xdd6977046c25a887), EConversationDebugInfo::Done);
                DC(int64(0xdd6977046c25a888), EConversationDebugInfo::Executing);
                
                // Caine's hut. Where? 
                Hero.AI.Say(LocText("TEXT_WIP_ATMTGUC_20240403_161850"));
                DC(int64(0xdd6977046c25a888), EConversationDebugInfo::Done);
                DC(int64(0xac160bfd93ad0f37), EConversationDebugInfo::Executing);
                
                // Oh. Sure. The one right behind me. 
                Novice44.AI.Say(LocText("TEXT_WIP_IXHZGRJ_20240322_000239"));
                DC(int64(0xac160bfd93ad0f37), EConversationDebugInfo::Done);
                DC(int64(0xed124491d1410bc), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xed124491d1410bc), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceNovice4483311 : UTopic_Hero__SC_NOV_NOVICE44_1356N
        {
            default DebugId = int64(0x57d402a666ffcd49);
            default Caption = LocText("TEXT_WIP_OPTVPFF_20240311_152427");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceNovice4483311);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9992203cb3d283), Hero != nullptr && Hero.HasItem(UItWr_Scroll_AbandonMineSketch, 1, 0));
                    DB(int64(0x188124b8621e6b80), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND.IsRunning());
                }
                
                if (Hero != nullptr && !Hero.HasItem(UItWr_Scroll_AbandonMineSketch, 1, 0))
                    return false;
                
                if (Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND != nullptr && !Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND.IsRunning())
                    return false;
                
                return true;
            }
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x57d402a666ffcd47), EConversationDebugInfo::Executing);
                // I found this drawing. Do you know this place?
                Hero.AI.Say(LocText("TEXT_WIP_OPTVPFF_20240311_152427"));
                DC(int64(0x57d402a666ffcd47), EConversationDebugInfo::Done);
                DC(int64(0x57d402a666ffcd48), EConversationDebugInfo::Executing);
                
                // (Stoned) Drawing ... nice ... 
                Novice44.AI.Say(LocText("TEXT_WIP_OPTVPFF_20240311_152427_3436"));
                DC(int64(0x57d402a666ffcd48), EConversationDebugInfo::Done);
                DC(int64(0xdd6977046c25a889), EConversationDebugInfo::Executing);
                
                // He's plastered. This is pointless. 
                Hero.AI.Say(LocText("TEXT_WIP_ATMTGUC_20240403_162030"));
                DC(int64(0xdd6977046c25a889), EConversationDebugInfo::Done);
                DC(int64(0x57d402a666ffcd50), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x57d402a666ffcd50), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */