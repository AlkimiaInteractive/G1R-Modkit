#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_OCBANDITSCAMP_OCBANDITSCAMP_OBJ_FIND : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3_OCBANDITSCAMP;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_OCBANDITSCAMP_OCBANDITSCAMP_OBJ_FIND-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x00000108), EConversationDebugInfo::Executing);
                Quest::OldCamp_OCCHAPTER3_OCBANDITSCAMP_OCBANDITSCAMP_OBJ_ACCESS.StartQuest();
                DC(int64(0x00000108), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_OCBANDITSCAMP, Document::UDocumentSegment_CH3_OCBANDITSCAMP_FoundCamp);
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_OCBANDITSCAMP_OCBANDITSCAMP_OBJ_FIND GetOldCamp_OCCHAPTER3_OCBANDITSCAMP_OCBANDITSCAMP_OBJ_FIND() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_OCBANDITSCAMP_OCBANDITSCAMP_OBJ_FIND>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_OCBANDITSCAMP_OCBANDITSCAMP_OBJ_FIND::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */