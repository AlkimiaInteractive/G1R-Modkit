#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_BROWNIEPOINTS : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1;
            default bExternalStartTrigger = true;
            default bExternalFailTrigger = true;
            default DescriptionText = "QUEST-OLDCAMP_OCCHAPTER1_BROWNIEPOINTS-DESCRIPTION";
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_BROWNIEPOINTS-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_BROWNIEPOINTS;
            default QuestKind = EQuestKind::Main;
            default QuestGiverCharacterUniqueName = n"OC_STT_DIEGO";
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_BROWNIEPOINTS GetOldCamp_OCCHAPTER1_BROWNIEPOINTS() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_BROWNIEPOINTS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_BROWNIEPOINTS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */