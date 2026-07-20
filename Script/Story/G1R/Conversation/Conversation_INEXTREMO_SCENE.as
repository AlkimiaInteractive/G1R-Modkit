#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_INEXTREMO_SCENE : UConversationCharacterSettings
        {
            default ForCharacter = n"INEXTREMO_SCENE";
        }
        
        
        class UTopic_Hero__INEXTREMO_SCENE : UG1RDialogTopic
        {
            default ForCharacter = n"INEXTREMO_SCENE";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetInExtremo() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetGuard() const property
            {
                return GetCharacter(n"CHARACTER_DUM_GUARD_0");
            }
        }
        
        
        class UChoiceInextremo2973982 : UTopic_Hero__INEXTREMO_SCENE
        {
            default DebugId = int64(0x89b794a41990a1e4);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x89b794a41990a1e3), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0x89b794a41990a1e3), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceInextremo2974002 : UTopic_Hero__INEXTREMO_SCENE
        {
            default DebugId = int64(0x89b794a41990a1e9);
            default Caption = LocText("TEXT_WIP_CRYTNQJ_20260605_130043");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceInextremo2974002);
            
            default ExtraCharactersToInvite.Add(n"CHARACTER_DUM_GUARD_0");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0x89b794a419914c81), EConversationDebugInfo::Executing);
                // Thats enough! This way!
                Guard.AI.Say(LocText("TEXT_WIP_CRYTNQJ_20260605_130043"));
                DC(int64(0x89b794a419914c81), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */