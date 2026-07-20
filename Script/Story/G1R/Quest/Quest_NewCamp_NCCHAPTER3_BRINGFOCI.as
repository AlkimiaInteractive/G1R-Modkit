#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER3_BRINGFOCI : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER3;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default DescriptionText = "QUEST-NEWCAMP_NCCHAPTER3_BRINGFOCI-DESCRIPTION";
            default NameText = "QUEST-NEWCAMP_NCCHAPTER3_BRINGFOCI-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH3_BRINGFOCI;
            default QuestKind = EQuestKind::Main;
            default QuestGiverCharacterUniqueName = n"NC_KDW_SATURAS_600";
        }
        
        
        UQuest_NewCamp_NCCHAPTER3_BRINGFOCI GetNewCamp_NCCHAPTER3_BRINGFOCI() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER3_BRINGFOCI>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER3_BRINGFOCI::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */