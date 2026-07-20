#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_SC_NOV_NOVICE04_1309 : UConversationCharacterSettings
        {
            default ForCharacter = n"SC_NOV_NOVICE04_1309";
        }
        
        
        class UTopic_Hero__SC_NOV_NOVICE04_1309 : UG1RDialogTopic
        {
            default ForCharacter = n"SC_NOV_NOVICE04_1309";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetNovice04() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceNovice0485916 : UTopic_Hero__SC_NOV_NOVICE04_1309
        {
            default DebugId = int64(0xdc24fe363c0a9bf4);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            default Rules.HideIfKnows(UChoiceNovice0485916);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xdc24fe363c0a9bf3), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xdc24fe363c0a9bf3), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceNovice0485932 : UTopic_Hero__SC_NOV_NOVICE04_1309
        {
            default DebugId = int64(0xdc24fe363c0a9bf8);
            default Caption = LocText("TEXT_WIP_MWAGUXL_20240319_110829_41");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceNovice0485932);
            
            UFUNCTION(BlueprintOverride)
            bool IsVisible() const
            {
                if (IsStoryDebuggerAttached())
                {
                    DB(int64(0xdc24fe363c0a9bfe), Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND != nullptr && Quest::SwampCamp_SCCHAPTER2_FINDINGCAINE_FINDINGCAINE_OBJ_FIND.IsRunning());
                    DB(int64(0x188124b8621e6b83), Hero != nullptr && !Hero.HasItem(UItWr_Scroll_AbandonMineSketch, 1, 0));
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
                DC(int64(0xdc24fe363c0a9bf6), EConversationDebugInfo::Executing);
                // Hey, can you point me to Caine's hut? 
                Hero.AI.Say(LocText("TEXT_WIP_MWAGUXL_20240319_110829_41"));
                DC(int64(0xdc24fe363c0a9bf6), EConversationDebugInfo::Done);
                DB(int64(0x5dcd7126285f56e), Novice04 != nullptr && Novice04.IsCloseToWaypoint(n"IO_SC_CHAIR_30", 200.0f));
                
                if (Novice04 != nullptr && Novice04.IsCloseToWaypoint(n"IO_SC_CHAIR_30", 200.0f))
                {
                    DC(int64(0x5dcd7126285f56f), EConversationDebugInfo::Executing);
                    // Wh... do you have any idea what time it is? I'm trying ...
                    Novice04.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_145613"));
                    DC(int64(0x5dcd7126285f56f), EConversationDebugInfo::Done);
                    DC(int64(0x5dcd7126285f570), EConversationDebugInfo::Executing);
                    
                    // I'm just-
                    Hero.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_145613_41"));
                    DC(int64(0x5dcd7126285f570), EConversationDebugInfo::Done);
                    DC(int64(0x5dcd7126285f57e), EConversationDebugInfo::Executing);
                    
                    // Piss off!
                    Novice04.AI.Say(LocText("TEXT_WIP_DDCKZPD_20241106_145846"));
                    DC(int64(0x5dcd7126285f57e), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_novice04_85932_exit_1");
                }
                else
                {
                    DC(int64(0xdc24fe363c0a9bf7), EConversationDebugInfo::Executing);
                    // Oh godsdammit, can't you see I'm busy? Go bother someone ...
                    Novice04.AI.Say(LocText("TEXT_WIP_MWAGUXL_20240319_110829_2083"));
                    DC(int64(0xdc24fe363c0a9bf7), EConversationDebugInfo::Done);
                    
                    Other.Remember(n"choice_novice04_85932_exit_2");
                    DC(int64(0xdc24fe363c0a9bfa), EConversationDebugInfo::Executing);
                    EndConversation();
                    DC(int64(0xdc24fe363c0a9bfa), EConversationDebugInfo::Done);
                    return;
                }
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */