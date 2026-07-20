#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_CUTSCENE_DUM_KINGRHOBAR_0 : UConversationCharacterSettings
        {
            default ForCharacter = n"CUTSCENE_DUM_KINGRHOBAR_0";
        }
        
        
        class UTopic_Hero__CUTSCENE_DUM_KINGRHOBAR_0 : UG1RDialogTopic
        {
            default ForCharacter = n"CUTSCENE_DUM_KINGRHOBAR_0";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetKingRhobar() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceKingrhobar587547 : UTopic_Hero__CUTSCENE_DUM_KINGRHOBAR_0
        {
            default DebugId = int64(0xafd73db6eab342d8);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xafd73db6eab342d7), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xafd73db6eab342d7), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceKingrhobar587567 : UTopic_Hero__CUTSCENE_DUM_KINGRHOBAR_0
        {
            default DebugId = int64(0xafd73db6eab342dd);
            default Caption = LocText("TEXT_WIP_FEIRYVC_20250203_100800_41");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceKingrhobar587567);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xafd73db6eab342db), EConversationDebugInfo::Executing);
                // <Text TEXT_WIP_FEIRYVC_20250203_100800_41 not in ...
                Hero.AI.Say(LocText("TEXT_WIP_FEIRYVC_20250203_100800_41"));
                DC(int64(0xafd73db6eab342db), EConversationDebugInfo::Done);
                DC(int64(0xafd73db6eab342dc), EConversationDebugInfo::Executing);
                
                // <Text TEXT_WIP_FEIRYVC_20250203_100800_2083 not in ...
                KingRhobar.AI.Say(LocText("TEXT_WIP_FEIRYVC_20250203_100800_2083"));
                DC(int64(0xafd73db6eab342dc), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */