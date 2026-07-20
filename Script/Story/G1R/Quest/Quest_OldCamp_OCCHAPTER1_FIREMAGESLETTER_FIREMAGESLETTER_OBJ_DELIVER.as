#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_FIREMAGESLETTER_FIREMAGESLETTER_OBJ_DELIVER : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_FIREMAGESLETTER;
            default bSucceedParent = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_FIREMAGESLETTER_FIREMAGESLETTER_OBJ_DELIVER-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_FIREMAGESLETTER_FIREMAGESLETTER_OBJ_DELIVER GetOldCamp_OCCHAPTER1_FIREMAGESLETTER_FIREMAGESLETTER_OBJ_DELIVER() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_FIREMAGESLETTER_FIREMAGESLETTER_OBJ_DELIVER>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_FIREMAGESLETTER_FIREMAGESLETTER_OBJ_DELIVER::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */