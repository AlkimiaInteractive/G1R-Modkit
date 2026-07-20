#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_FINDFOCUS : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER3_FORTRESS;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_FINDFOCUS-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItMs_Focus_03, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000bd), EConversationDebugInfo::Executing);
                Quest::SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_REPORT.StartQuest();
                DC(int64(0x000000bd), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_FINDFOCUS GetSwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_FINDFOCUS() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_FINDFOCUS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER3_FORTRESS_FORTRESS_OBJ_FINDFOCUS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */