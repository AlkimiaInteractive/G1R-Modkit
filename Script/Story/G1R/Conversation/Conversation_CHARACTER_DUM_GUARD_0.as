#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_CHARACTER_DUM_GUARD_0 : UConversationCharacterSettings
        {
            default ForCharacter = n"CHARACTER_DUM_GUARD_0";
        }
        
        
        class UTopic_Hero__CHARACTER_DUM_GUARD_0 : UG1RDialogTopic
        {
            default ForCharacter = n"CHARACTER_DUM_GUARD_0";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetGuard() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceGuard587693 : UTopic_Hero__CHARACTER_DUM_GUARD_0
        {
            default DebugId = int64(0xafd73db6eab342e2);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xafd73db6eab342e1), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xafd73db6eab342e1), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceGuard587713 : UTopic_Hero__CHARACTER_DUM_GUARD_0
        {
            default DebugId = int64(0xafd73db6eab342e7);
            default Caption = LocText("TEXT_WIP_FEIRYVC_20250203_101141_1924");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceGuard587713);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xafd73db6eab342e5), EConversationDebugInfo::Executing);
                // <Text TEXT_WIP_FEIRYVC_20250203_101141_1924 not in ...
                Hero.AI.Say(LocText("TEXT_WIP_FEIRYVC_20250203_101141_1924"));
                DC(int64(0xafd73db6eab342e5), EConversationDebugInfo::Done);
                DC(int64(0xafd73db6eab342e6), EConversationDebugInfo::Executing);
                
                // <Text TEXT_WIP_FEIRYVC_20250203_101141_2785 not in ...
                Guard.AI.Say(LocText("TEXT_WIP_FEIRYVC_20250203_101141_2785"));
                DC(int64(0xafd73db6eab342e6), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */