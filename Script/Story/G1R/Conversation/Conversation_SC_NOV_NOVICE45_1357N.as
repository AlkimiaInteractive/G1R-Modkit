#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_NOV_NOVICE45_1357N : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_NOV_NOVICE45_1357N";
        }
        
        
        class UTopic_Hero__SC_NOV_NOVICE45_1357N : UG1RDialogTopic
        {
            default ForCharacter = n"SC_NOV_NOVICE45_1357N";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetNovice45() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceNovice4582946 : UTopic_Hero__SC_NOV_NOVICE45_1357N
        {
            default DebugId = int64(0xed124491d1410be);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            default Rules.HideIfKnows(UChoiceNovice4582946);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xed124491d1410bd), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xed124491d1410bd), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceNovice4582962 : UTopic_Hero__SC_NOV_NOVICE45_1357N
        {
            default DebugId = int64(0xed124491d1410c2);
            default Caption = LocText("TEXT_WIP_CSEDFEF_20240308_141938_1924");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceNovice4582962);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf2a42eb10820c706), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND.IsRunning());
                    DB(int64(0x188124b8621e6b7f), Hero != nullptr && !Hero.HasItem(UItWr_Scroll_AbandonMineSketch, 1, 0));
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
                DC(int64(0xed124491d1410c0), EConversationDebugInfo::Executing);
                // I'm looking for Caine's hut. You know where it is? 
                Hero.AI.Say(LocText("TEXT_WIP_CSEDFEF_20240308_141938_1924"));
                DC(int64(0xed124491d1410c0), EConversationDebugInfo::Done);
                DC(int64(0xed124491d1410c1), EConversationDebugInfo::Executing);
                
                // Ha, I can hardly find me own. But hmm ... Caine, you ...
                Novice45.AI.Say(LocText("TEXT_WIP_CSEDFEF_20240308_141938_2785"));
                DC(int64(0xed124491d1410c1), EConversationDebugInfo::Done);
                DC(int64(0xac160bfd93ad0f38), EConversationDebugInfo::Executing);
                // It's somewhere nearby. Just keep lookin'. 
                Novice45.AI.Say(LocText("TEXT_WIP_IXHZGRJ_20240322_001125"));
                DC(int64(0xac160bfd93ad0f38), EConversationDebugInfo::Done);
                DC(int64(0xed124491d1410c4), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xed124491d1410c4), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceNovice4583332 : UTopic_Hero__SC_NOV_NOVICE45_1357N
        {
            default DebugId = int64(0x57d402a666ffcd4d);
            default Caption = LocText("TEXT_WIP_OPTVPFF_20240311_152459");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceNovice4583332);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0x9992203cb3d285), Hero != nullptr && Hero.HasItem(UItWr_Scroll_AbandonMineSketch, 1, 0));
                    DB(int64(0xf2a42eb10820c707), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND.IsRunning());
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
                DC(int64(0x57d402a666ffcd4b), EConversationDebugInfo::Executing);
                // Hey, I found this drawing. Looks like a cave or ...
                Hero.AI.Say(LocText("TEXT_WIP_OPTVPFF_20240311_152459"));
                DC(int64(0x57d402a666ffcd4b), EConversationDebugInfo::Done);
                DC(int64(0x57d402a666ffcd4c), EConversationDebugInfo::Executing);
                
                // Hmm ... I ain't been around the Colony much. They were ...
                Novice45.AI.Say(LocText("TEXT_WIP_OPTVPFF_20240311_152459_686"));
                DC(int64(0x57d402a666ffcd4c), EConversationDebugInfo::Done);
                DC(int64(0xac160bfd93ad0f3a), EConversationDebugInfo::Executing);
                // Best thing that ever happened to me, honestly. The gurus ...
                Novice45.AI.Say(LocText("TEXT_WIP_IXHZGRJ_20240322_001345"));
                DC(int64(0xac160bfd93ad0f3a), EConversationDebugInfo::Done);
                DC(int64(0xac160bfd93ad0f3b), EConversationDebugInfo::Executing);
                
                // Interesting. Can you think of anyone who knows his way ...
                Hero.AI.Say(LocText("TEXT_WIP_IXHZGRJ_20240322_001414"));
                DC(int64(0xac160bfd93ad0f3b), EConversationDebugInfo::Done);
                DC(int64(0xac160bfd93ad0f3c), EConversationDebugInfo::Executing);
                
                // Lemme think ... probably Lester. He's always out and ...
                Novice45.AI.Say(LocText("TEXT_WIP_IXHZGRJ_20240322_001451"));
                DC(int64(0xac160bfd93ad0f3c), EConversationDebugInfo::Done);
                DC(int64(0x57d402a666ffcd4f), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x57d402a666ffcd4f), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */