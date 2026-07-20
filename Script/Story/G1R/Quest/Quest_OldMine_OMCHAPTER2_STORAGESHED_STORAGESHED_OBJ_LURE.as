#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_LURE : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldMine_OMCHAPTER2_STORAGESHED;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDMINE_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_LURE-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_LURE GetOldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_LURE() property
        {
            return Cast<UQuest_OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_LURE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldMine_OMCHAPTER2_STORAGESHED_STORAGESHED_OBJ_LURE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */