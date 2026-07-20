#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER4_FINDXARDAS : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER4;
            default bExternalStartTrigger = true;
            default bExternalFailTrigger = true;
            default bExternalSuccessTrigger = true;
            default DescriptionText = "QUEST-NEWCAMP_NCCHAPTER4_FINDXARDAS-DESCRIPTION";
            default NameText = "QUEST-NEWCAMP_NCCHAPTER4_FINDXARDAS-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH4_FINDXARDAS;
            default QuestKind = EQuestKind::Main;
            default QuestGiverCharacterUniqueName = n"NC_KDW_SATURAS_600";
        }
        
        
        UQuest_NewCamp_NCCHAPTER4_FINDXARDAS GetNewCamp_NCCHAPTER4_FINDXARDAS() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER4_FINDXARDAS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER4_FINDXARDAS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */