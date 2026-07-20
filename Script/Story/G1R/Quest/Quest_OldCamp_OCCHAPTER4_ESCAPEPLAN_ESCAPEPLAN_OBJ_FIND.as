#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER4_ESCAPEPLAN_ESCAPEPLAN_OBJ_FIND : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER4_ESCAPEPLAN;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER4_ESCAPEPLAN_ESCAPEPLAN_OBJ_FIND-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestStarted() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_ESCAPEPLAN, Document::UDocumentSegment_CH4_ESCAPEPLAN_Note);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER4_ESCAPEPLAN_ESCAPEPLAN_OBJ_FIND GetOldCamp_OCCHAPTER4_ESCAPEPLAN_ESCAPEPLAN_OBJ_FIND() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER4_ESCAPEPLAN_ESCAPEPLAN_OBJ_FIND>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER4_ESCAPEPLAN_ESCAPEPLAN_OBJ_FIND::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */