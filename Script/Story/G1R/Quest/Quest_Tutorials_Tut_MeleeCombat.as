#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_Tutorials_Tut_MeleeCombat : UG1RQuest
        {
            default ParentQuestClass = UQuest_Tutorials;
        }
        
        
        UQuest_Tutorials_Tut_MeleeCombat GetTutorials_Tut_MeleeCombat() property
        {
            return Cast<UQuest_Tutorials_Tut_MeleeCombat>(UQuestSubsystem::Get().GetQuestByClass(UQuest_Tutorials_Tut_MeleeCombat::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */