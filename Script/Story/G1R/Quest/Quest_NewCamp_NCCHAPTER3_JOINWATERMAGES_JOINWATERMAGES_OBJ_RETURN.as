#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_RETURN : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3_JOINWATERMAGES;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_RETURN-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestStarted() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_JOINWATERMAGES, Document::UDocumentSegment_CH4_JOINWATERMAGES_Return);
            }
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_RETURN GetNewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_RETURN() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_RETURN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_JOINWATERMAGES_JOINWATERMAGES_OBJ_RETURN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */