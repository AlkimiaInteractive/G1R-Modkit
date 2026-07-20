#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER2;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-NEWCAMP_NCCHAPTER2_GOTOPSICAMP-DESCRIPTION";
            default NameText = "QUEST-NEWCAMP_NCCHAPTER2_GOTOPSICAMP-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH2_GOTOPSICAMP;
            default QuestKind = EQuestKind::Main;
            default QuestGiverCharacterUniqueName = n"NC_ORG_LARES_801";
        }
        
        
        UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP GetNewCamp_NCCHAPTER2_GOTOPSICAMP() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER2_GOTOPSICAMP::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */