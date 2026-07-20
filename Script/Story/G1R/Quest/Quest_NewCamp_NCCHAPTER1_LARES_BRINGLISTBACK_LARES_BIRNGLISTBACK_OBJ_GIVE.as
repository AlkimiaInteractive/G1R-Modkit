#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK_LARES_BIRNGLISTBACK_OBJ_GIVE : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_LARES_BRINGLISTBACK_LARES_BIRNGLISTBACK_OBJ_GIVE-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK_LARES_BIRNGLISTBACK_OBJ_GIVE GetNewCamp_NCCHAPTER1_LARES_BRINGLISTBACK_LARES_BIRNGLISTBACK_OBJ_GIVE() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK_LARES_BIRNGLISTBACK_OBJ_GIVE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_LARES_BRINGLISTBACK_LARES_BIRNGLISTBACK_OBJ_GIVE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */