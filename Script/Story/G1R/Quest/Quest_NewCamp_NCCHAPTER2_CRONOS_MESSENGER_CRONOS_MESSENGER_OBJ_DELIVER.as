#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER2_CRONOS_MESSENGER_CRONOS_MESSENGER_OBJ_DELIVER : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER2_CRONOS_MESSENGER;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER2_CRONOS_MESSENGER_CRONOS_MESSENGER_OBJ_DELIVER-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER2_CRONOS_MESSENGER_CRONOS_MESSENGER_OBJ_DELIVER GetNewCamp_NCCHAPTER2_CRONOS_MESSENGER_CRONOS_MESSENGER_OBJ_DELIVER() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER2_CRONOS_MESSENGER_CRONOS_MESSENGER_OBJ_DELIVER>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER2_CRONOS_MESSENGER_CRONOS_MESSENGER_OBJ_DELIVER::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */