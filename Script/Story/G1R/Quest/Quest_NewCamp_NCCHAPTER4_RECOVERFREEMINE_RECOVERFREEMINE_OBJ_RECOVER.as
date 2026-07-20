#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER4_RECOVERFREEMINE_RECOVERFREEMINE_OBJ_RECOVER : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER4_RECOVERFREEMINE;
            default bSucceedParent = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER4_RECOVERFREEMINE_RECOVERFREEMINE_OBJ_RECOVER-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER4_RECOVERFREEMINE_RECOVERFREEMINE_OBJ_RECOVER GetNewCamp_NCCHAPTER4_RECOVERFREEMINE_RECOVERFREEMINE_OBJ_RECOVER() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER4_RECOVERFREEMINE_RECOVERFREEMINE_OBJ_RECOVER>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER4_RECOVERFREEMINE_RECOVERFREEMINE_OBJ_RECOVER::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */