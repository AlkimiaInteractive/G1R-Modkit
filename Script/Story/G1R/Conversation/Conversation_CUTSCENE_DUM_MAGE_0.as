#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Conversation
    {
        class UConversationCharacterSettings_G1R_CUTSCENE_DUM_MAGE_0 : UConversationCharacterSettings
        {
            default ForCharacter = n"CUTSCENE_DUM_MAGE_0";
        }
        
        
        class UTopic_Hero__CUTSCENE_DUM_MAGE_0 : UG1RDialogTopic
        {
            default ForCharacter = n"CUTSCENE_DUM_MAGE_0";
            default WithCharacter = n"Hero";
            
            AGothicCharacterState GetMage() const property
            {
                return Self;
            }
            
            AGothicCharacterState GetHero() const property
            {
                return GetCharacter(n"HERO");
            }
        }
        
        
        class UChoiceMage587785 : UTopic_Hero__CUTSCENE_DUM_MAGE_0
        {
            default DebugId = int64(0xafd73db6eab342f3);
            default Caption = LocText("TEXT_DIALOG_END");
            default PriorityRank = 5;
            default JustOne.Add(n"End");
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xafd73db6eab342f2), EConversationDebugInfo::Executing);
                EndConversation();
                DC(int64(0xafd73db6eab342f2), EConversationDebugInfo::Done);
                return;
            }
        }
        
        
        class UChoiceMage587805 : UTopic_Hero__CUTSCENE_DUM_MAGE_0
        {
            default DebugId = int64(0xafd73db6eab342f8);
            default Caption = LocText("TEXT_WIP_FEIRYVC_20250203_101424_3984");
            default PriorityRank = 3;
            
            default Rules.HideIfKnows(UChoiceMage587805);
            
            UFUNCTION(BlueprintOverride)
            void Act()
            {
                DC(int64(0xafd73db6eab342f6), EConversationDebugInfo::Executing);
                // <Text TEXT_WIP_FEIRYVC_20250203_101424_3984 not in ...
                Hero.AI.Say(LocText("TEXT_WIP_FEIRYVC_20250203_101424_3984"));
                DC(int64(0xafd73db6eab342f6), EConversationDebugInfo::Done);
                DC(int64(0xafd73db6eab342f7), EConversationDebugInfo::Executing);
                
                // <Text TEXT_WIP_FEIRYVC_20250203_101424_1609 not in ...
                Mage.AI.Say(LocText("TEXT_WIP_FEIRYVC_20250203_101424_1609"));
                DC(int64(0xafd73db6eab342f7), EConversationDebugInfo::Done);
            }
        }
        
        
    }
}
#endif /* WITH_STORY_G1R */