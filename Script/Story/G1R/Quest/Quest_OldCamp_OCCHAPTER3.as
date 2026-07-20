#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3 : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3-NAME";
        }
        
        
        UQuest_OldCamp_OCCHAPTER3 GetOldCamp_OCCHAPTER3() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */