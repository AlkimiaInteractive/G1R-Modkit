#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_REPORT : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3_TRIALOFFIRE;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_REPORT-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_SEA != nullptr && Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_SEA.HasSucceeded() && Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_WATERFALL != nullptr && Quest::OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_WATERFALL.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestStarted() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_TRIALOFFIRE, Document::UDocumentSegment_CH3_TRIALOFFIRE_ReportCorristo);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_TRIALOFFIRE, Document::UDocumentSegment_CH3_TRIALOFFIRE_ReportMilten);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_REPORT GetOldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_REPORT() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_REPORT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_TRIALOFFIRE_TRIALOFFIRE_OBJ_REPORT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */