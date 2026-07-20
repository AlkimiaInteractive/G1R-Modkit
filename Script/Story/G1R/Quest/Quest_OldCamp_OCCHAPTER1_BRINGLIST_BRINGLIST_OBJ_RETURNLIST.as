#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_OBJ_RETURNLIST : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_BRINGLIST;
            default bSucceedParent = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_BRINGLIST_BRINGLIST_OBJ_RETURNLIST-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return Quest::OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_OBJ_GETLIST != nullptr && Quest::OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_OBJ_GETLIST.HasSucceeded();
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_OBJ_RETURNLIST GetOldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_OBJ_RETURNLIST() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_OBJ_RETURNLIST>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_BRINGLIST_BRINGLIST_OBJ_RETURNLIST::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */