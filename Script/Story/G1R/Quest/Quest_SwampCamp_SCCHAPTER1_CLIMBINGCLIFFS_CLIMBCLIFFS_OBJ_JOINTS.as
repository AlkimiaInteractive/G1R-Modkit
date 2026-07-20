#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS_CLIMBCLIFFS_OBJ_JOINTS : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_CLIMBINGCLIFFS_CLIMBCLIFFS_OBJ_JOINTS-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItMi_Joint_02, 6, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000001), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS_CLIMBCLIFFS_OBJ_RETURN.StartQuest();
                DC(int64(0x00000001), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS_CLIMBCLIFFS_OBJ_JOINTS GetSwampCamp_SCCHAPTER1_CLIMBINGCLIFFS_CLIMBCLIFFS_OBJ_JOINTS() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS_CLIMBCLIFFS_OBJ_JOINTS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS_CLIMBCLIFFS_OBJ_JOINTS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */