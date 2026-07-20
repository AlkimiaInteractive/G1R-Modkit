#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS_CLIMBCLIFFS_OBJ_RETURN : UG1RQuest
        {
            default InvolvedCharacters.Add(n"Hero");
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_CLIMBINGCLIFFS_CLIMBCLIFFS_OBJ_RETURN-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"Hero"); }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000007), EConversationDebugInfo::Executing);
                Hero.GiveExperience(G1R.XP_SC_CLIMBINGCLIFFS_GIVEJOINTS);
                DC(int64(0x00000007), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS_CLIMBCLIFFS_OBJ_RETURN GetSwampCamp_SCCHAPTER1_CLIMBINGCLIFFS_CLIMBCLIFFS_OBJ_RETURN() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS_CLIMBCLIFFS_OBJ_RETURN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_CLIMBINGCLIFFS_CLIMBCLIFFS_OBJ_RETURN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */