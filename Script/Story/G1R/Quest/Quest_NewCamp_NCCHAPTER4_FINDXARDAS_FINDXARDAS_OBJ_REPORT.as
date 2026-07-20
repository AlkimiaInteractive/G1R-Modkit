#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_REPORT : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER4_FINDXARDAS;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_REPORT-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_REPORT GetNewCamp_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_REPORT() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_REPORT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER4_FINDXARDAS_FINDXARDAS_OBJ_REPORT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */