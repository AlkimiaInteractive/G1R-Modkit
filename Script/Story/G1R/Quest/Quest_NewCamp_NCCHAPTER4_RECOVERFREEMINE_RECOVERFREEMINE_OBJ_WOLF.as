#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER4_RECOVERFREEMINE_RECOVERFREEMINE_OBJ_WOLF : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER4_RECOVERFREEMINE;
            default bIsOptional = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER4_RECOVERFREEMINE_RECOVERFREEMINE_OBJ_WOLF-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER4_RECOVERFREEMINE_RECOVERFREEMINE_OBJ_WOLF GetNewCamp_NCCHAPTER4_RECOVERFREEMINE_RECOVERFREEMINE_OBJ_WOLF() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER4_RECOVERFREEMINE_RECOVERFREEMINE_OBJ_WOLF>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER4_RECOVERFREEMINE_RECOVERFREEMINE_OBJ_WOLF::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */