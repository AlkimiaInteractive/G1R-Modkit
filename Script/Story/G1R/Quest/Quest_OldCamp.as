#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp : UG1RQuest
        {
            default NameText = "QUEST-OLDCAMP-NAME";
            default Questline = UQuestline_G1R_OldCamp;
        }
        
        
        UQuest_OldCamp GetOldCamp() property
        {
            return Cast<UQuest_OldCamp>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */