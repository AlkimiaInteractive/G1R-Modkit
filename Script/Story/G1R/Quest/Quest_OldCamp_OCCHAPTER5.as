#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER5 : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER5-NAME";
        }
        
        
        UQuest_OldCamp_OCCHAPTER5 GetOldCamp_OCCHAPTER5() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER5>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER5::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */