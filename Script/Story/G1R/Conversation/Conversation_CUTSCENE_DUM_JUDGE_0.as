#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_CUTSCENE_DUM_JUDGE_0 : UConversationCharacterSettings
        {
            default ForCharacter = n"CUTSCENE_DUM_JUDGE_0";
        }
        
        
        class UTopic_Hero__CUTSCENE_DUM_JUDGE_0 : UG1RDialogTopic
        {
            default ForCharacter = n"CUTSCENE_DUM_JUDGE_0";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetJudge() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceJudge587741 : UTopic_Hero__CUTSCENE_DUM_JUDGE_0
        {
            default DebugId = int64(0xafd73db6eab342eb);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xafd73db6eab342ea), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xafd73db6eab342ea), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceJudge587761 : UTopic_Hero__CUTSCENE_DUM_JUDGE_0
        {
            default DebugId = int64(0xafd73db6eab342f0);
            default Caption = LocText("TEXT_WIP_FEIRYVC_20250203_101409_3286");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceJudge587761);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xafd73db6eab342ee), EConversationDebugInfo::Executing);
                // <Text TEXT_WIP_FEIRYVC_20250203_101409_3286 not in ...
                Hero.AI.Say(LocText("TEXT_WIP_FEIRYVC_20250203_101409_3286"));
                DC(int64(0xafd73db6eab342ee), EConversationDebugInfo::Done);
                DC(int64(0xafd73db6eab342ef), EConversationDebugInfo::Executing);
                
                // <Text TEXT_WIP_FEIRYVC_20250203_101409_686 not in ...
                Judge.AI.Say(LocText("TEXT_WIP_FEIRYVC_20250203_101409_686"));
                DC(int64(0xafd73db6eab342ef), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */