#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER2_FOCUS_FOCUS_OBJ_GETFOCUS : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER2_FOCUS;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER2_FOCUS_FOCUS_OBJ_GETFOCUS-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItMs_Focus_01, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000075), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER2_FOCUS_FOCUS_OBJ_RETURN.StartQuest();
                DC(int64(0x00000075), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER2_FOCUS_FOCUS_OBJ_GETFOCUS GetSwampCamp_SCCHAPTER2_FOCUS_FOCUS_OBJ_GETFOCUS() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER2_FOCUS_FOCUS_OBJ_GETFOCUS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER2_FOCUS_FOCUS_OBJ_GETFOCUS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */