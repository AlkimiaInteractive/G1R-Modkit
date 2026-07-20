#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_DRINK : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldMine_OMCHAPTER2_STORAGESHED;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDMINE_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_DRINK-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_DRINK GetOldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_DRINK() property
        {
            return Cast<UQuest_OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_DRINK>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_DRINK::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */