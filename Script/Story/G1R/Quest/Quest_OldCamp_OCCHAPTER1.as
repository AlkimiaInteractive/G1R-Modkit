#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1 : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1-NAME";
        }
        
        
        UQuest_OldCamp_OCCHAPTER1 GetOldCamp_OCCHAPTER1() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */