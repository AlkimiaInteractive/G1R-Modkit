#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_SPREADJOINTS_SPREADJOINTS_OBJ_SPREAD : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_SPREADJOINTS;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_SPREADJOINTS_SPREADJOINTS_OBJ_SPREAD-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return G1R.NC_JointsDistributed >= 10;
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000071), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER1_SPREADJOINTS_SPREADJOINTS_OBJ_REPORT.StartQuest();
                DC(int64(0x00000071), EConversationDebugInfo::Done);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_SPREADJOINTS_SPREADJOINTS_OBJ_SPREAD GetNewCamp_NCCHAPTER1_SPREADJOINTS_SPREADJOINTS_OBJ_SPREAD() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_SPREADJOINTS_SPREADJOINTS_OBJ_SPREAD>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_SPREADJOINTS_SPREADJOINTS_OBJ_SPREAD::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */