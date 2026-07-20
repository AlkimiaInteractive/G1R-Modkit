#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_NCBANDITSCAMP_NCBANDITSCAMP_OBJ_FIND : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3_NCBANDITSCAMP;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER3_NCBANDITSCAMP_NCBANDITSCAMP_OBJ_FIND-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x000000b2), EConversationDebugInfo::Executing);
                Quest::NewCamp_NCCHAPTER3_NCBANDITSCAMP_NCBANDITSCAMP_OBJ_ACCESS.StartQuest();
                DC(int64(0x000000b2), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_NCBANDITSCAMP, Document::UDocumentSegment_CH3_NCBANDITSCAMP_FoundCamp);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_NCBANDITSCAMP_NCBANDITSCAMP_OBJ_FIND GetNewCamp_NCCHAPTER3_NCBANDITSCAMP_NCBANDITSCAMP_OBJ_FIND() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_NCBANDITSCAMP_NCBANDITSCAMP_OBJ_FIND>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_NCBANDITSCAMP_NCBANDITSCAMP_OBJ_FIND::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */