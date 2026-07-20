#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_SPREADJOINTS_SPREADJOINTS_OBJ_REPORT : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_SPREADJOINTS;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_SPREADJOINTS_SPREADJOINTS_OBJ_REPORT-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestStarted() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_SPREADJOINTS, Document::UDocumentSegment_CH1_SPREADJOINTS_Report);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_SPREADJOINTS_SPREADJOINTS_OBJ_REPORT GetNewCamp_NCCHAPTER1_SPREADJOINTS_SPREADJOINTS_OBJ_REPORT() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_SPREADJOINTS_SPREADJOINTS_OBJ_REPORT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_SPREADJOINTS_SPREADJOINTS_OBJ_REPORT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */