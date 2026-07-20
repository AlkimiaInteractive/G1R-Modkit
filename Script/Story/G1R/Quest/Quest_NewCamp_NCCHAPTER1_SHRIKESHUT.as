#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_SHRIKESHUT : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1;
            default bExternalStartTrigger = true;
            default bExternalFailTrigger = true;
            default DescriptionText = "QUEST-NEWCAMP_NCCHAPTER1_SHRIKESHUT-DESCRIPTION";
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_SHRIKESHUT-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_SHRIKESHUT;
            default QuestKind = EQuestKind::Side;
            default QuestGiverCharacterUniqueName = n"NC_SLD_GORN_699";
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_SHRIKESHUT GetNewCamp_NCCHAPTER1_SHRIKESHUT() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_SHRIKESHUT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_SHRIKESHUT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */