#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER4_MCPLATEARMOR_MCPLATEARMOR_OBJ_WAIT : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER4_MCPLATEARMOR;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER4_MCPLATEARMOR_MCPLATEARMOR_OBJ_WAIT-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER4_MCPLATEARMOR_MCPLATEARMOR_OBJ_WAIT GetNewCamp_NCCHAPTER4_MCPLATEARMOR_MCPLATEARMOR_OBJ_WAIT() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER4_MCPLATEARMOR_MCPLATEARMOR_OBJ_WAIT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER4_MCPLATEARMOR_MCPLATEARMOR_OBJ_WAIT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */