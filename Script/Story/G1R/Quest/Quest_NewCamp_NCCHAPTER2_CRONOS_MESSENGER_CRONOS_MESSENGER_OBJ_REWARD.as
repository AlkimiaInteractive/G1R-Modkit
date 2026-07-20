#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER2_CRONOS_MESSENGER_CRONOS_MESSENGER_OBJ_REWARD : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER2_CRONOS_MESSENGER;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER2_CRONOS_MESSENGER_CRONOS_MESSENGER_OBJ_REWARD-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER2_CRONOS_MESSENGER_CRONOS_MESSENGER_OBJ_REWARD GetNewCamp_NCCHAPTER2_CRONOS_MESSENGER_CRONOS_MESSENGER_OBJ_REWARD() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER2_CRONOS_MESSENGER_CRONOS_MESSENGER_OBJ_REWARD>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER2_CRONOS_MESSENGER_CRONOS_MESSENGER_OBJ_REWARD::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */