#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_GORN : UG1RQuest
        {
            default ParentQuestClass = UQuest_SleeperTemple_STCHAPTER5_URIZIEL;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SLEEPERTEMPLE_STCHAPTER5_URIZIEL_URIZIEL_OBJ_GORN-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_GORN GetSleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_GORN() property
        {
            return Cast<UQuest_SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_GORN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_GORN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */