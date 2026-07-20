#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_NOV_NOVICE10_1317 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_NOV_NOVICE10_1317";
        }
        
        
        class UTopic_Hero__SC_NOV_NOVICE10_1317 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_NOV_NOVICE10_1317";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetNovice10() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceNovice1083067 : UTopic_Hero__SC_NOV_NOVICE10_1317
        {
            default DebugId = int64(0x57d402a666ffcd3b);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            default Rules.HideIfKnows(UChoiceNovice1083067);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x57d402a666ffcd3a), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x57d402a666ffcd3a), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceNovice1083083 : UTopic_Hero__SC_NOV_NOVICE10_1317
        {
            default DebugId = int64(0x57d402a666ffcd3f);
            default Caption = LocText("TEXT_WIP_OPTVPFF_20240311_123649_41");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceNovice1083083);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf2a42eb10820c703), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND.IsRunning());
                    DB(int64(0x188124b8621e6b82), Hero != nullptr && !Hero.HasItem(UItWr_Scroll_AbandonMineSketch, 1, 0));
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
                DC(int64(0x57d402a666ffcd3d), EConversationDebugInfo::Executing);
                // Where can I find Caine's hut?
                Hero.AI.Say(LocText("TEXT_WIP_OPTVPFF_20240311_123649_41"));
                DC(int64(0x57d402a666ffcd3d), EConversationDebugInfo::Done);
                DC(int64(0x57d402a666ffcd3e), EConversationDebugInfo::Executing);
                
                // Kalom's apprentice? Tsk, no idea, man. Ask someone else.
                Novice10.AI.Say(LocText("TEXT_WIP_OPTVPFF_20240311_123649_2083"));
                DC(int64(0x57d402a666ffcd3e), EConversationDebugInfo::Done);
                DC(int64(0x57d402a666ffcd41), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x57d402a666ffcd41), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceNovice1083128 : UTopic_Hero__SC_NOV_NOVICE10_1317
        {
            default DebugId = int64(0x57d402a666ffcd44);
            default Caption = LocText("TEXT_WIP_OPTVPFF_20240311_152235");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceNovice1083128);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xf2a42eb10820c6f3), Hero != nullptr && Hero.HasItem(UItWr_Scroll_AbandonMineSketch, 1, 0));
                    DB(int64(0xf2a42eb10820c704), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND.IsRunning());
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
                DC(int64(0x57d402a666ffcd42), EConversationDebugInfo::Executing);
                // I found this drawing here in Caine's hut. Any idea what ...
                Hero.AI.Say(LocText("TEXT_WIP_OPTVPFF_20240311_152235"));
                DC(int64(0x57d402a666ffcd42), EConversationDebugInfo::Done);
                DC(int64(0x57d402a666ffcd43), EConversationDebugInfo::Executing);
                
                // A ... cave? I don't know, I haven't been out there much. 
                Novice10.AI.Say(LocText("TEXT_WIP_OPTVPFF_20240311_152235_1924"));
                DC(int64(0x57d402a666ffcd43), EConversationDebugInfo::Done);
                DC(int64(0xdd6977046c25a88a), EConversationDebugInfo::Executing);
                // Maybe try Lester. The guy's always sitting on his ass, ...
                Novice10.AI.Say(LocText("TEXT_WIP_ATMTGUC_20240403_164004"));
                DC(int64(0xdd6977046c25a88a), EConversationDebugInfo::Done);
                DC(int64(0x57d402a666ffcd46), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x57d402a666ffcd46), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */