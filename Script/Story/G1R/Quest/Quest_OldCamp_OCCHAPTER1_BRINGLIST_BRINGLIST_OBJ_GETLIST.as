#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_OBJ_GETLIST : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_BRINGLIST;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_BRINGLIST_BRINGLIST_OBJ_GETLIST-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_OBJ_GETLIST GetOldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_OBJ_GETLIST() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_OBJ_GETLIST>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_OBJ_GETLIST::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */