#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_MILTEN : UG1RQuest
        {
            default ParentQuestClass = UQuest_SleeperTemple_STCHAPTER5_URIZIEL;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SLEEPERTEMPLE_STCHAPTER5_URIZIEL_URIZIEL_OBJ_MILTEN-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_MILTEN GetSleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_MILTEN() property
        {
            return Cast<UQuest_SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_MILTEN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_MILTEN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */