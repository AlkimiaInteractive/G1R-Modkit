#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_RETURN : UG1RQuest
        {
            default ParentQuestClass = UQuest_SleeperTemple_STCHAPTER5_URIZIEL;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SLEEPERTEMPLE_STCHAPTER5_URIZIEL_URIZIEL_OBJ_RETURN-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_RETURN GetSleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_RETURN() property
        {
            return Cast<UQuest_SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_RETURN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SleeperTemple_STCHAPTER5_URIZIEL_URIZIEL_OBJ_RETURN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */