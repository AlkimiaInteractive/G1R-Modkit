#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SleeperTemple_STCHAPTER5_URIZIEL : UG1RQuest
        {
            default ParentQuestClass = UQuest_SleeperTemple_STCHAPTER5;
            default bExternalStartTrigger = true;
            default DescriptionText = "QUEST-SLEEPERTEMPLE_STCHAPTER5_URIZIEL-DESCRIPTION";
            default NameText = "QUEST-SLEEPERTEMPLE_STCHAPTER5_URIZIEL-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH5_URIZIEL;
            default QuestKind = EQuestKind::Main;
            default QuestGiverCharacterUniqueName = n"XT_DMB_XARDAS_404";
        }
        
        
        UQuest_SleeperTemple_STCHAPTER5_URIZIEL GetSleeperTemple_STCHAPTER5_URIZIEL() property
        {
            return Cast<UQuest_SleeperTemple_STCHAPTER5_URIZIEL>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SleeperTemple_STCHAPTER5_URIZIEL::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */