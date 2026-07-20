#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_HEARTS : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER4_FINDXARDAS;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_HEARTS-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_HEARTS GetNewCamp_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_HEARTS() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_HEARTS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_HEARTS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */