#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER4 : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER4-NAME";
        }
        
        
        UQuest_OldCamp_OCCHAPTER4 GetOldCamp_OCCHAPTER4() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER4>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER4::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */