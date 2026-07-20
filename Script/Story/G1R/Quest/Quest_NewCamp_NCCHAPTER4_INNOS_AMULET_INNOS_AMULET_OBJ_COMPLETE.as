#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER4_INNOS_AMULET_INNOS_AMULET_OBJ_COMPLETE : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER4_INNOS_AMULET;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER4_INNOS_AMULET_INNOS_AMULET_OBJ_COMPLETE-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER4_INNOS_AMULET_INNOS_AMULET_OBJ_COMPLETE GetNewCamp_NCCHAPTER4_INNOS_AMULET_INNOS_AMULET_OBJ_COMPLETE() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER4_INNOS_AMULET_INNOS_AMULET_OBJ_COMPLETE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER4_INNOS_AMULET_INNOS_AMULET_OBJ_COMPLETE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */