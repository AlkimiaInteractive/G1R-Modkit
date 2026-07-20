#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER2 : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER2-NAME";
        }
        
        
        UQuest_OldCamp_OCCHAPTER2 GetOldCamp_OCCHAPTER2() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */