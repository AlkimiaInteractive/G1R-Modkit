#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_NewCamp_NCCHAPTER1_DAMLURKER_DAMLURKER_OBJ_RETURN : UG1RQuest
        {
            default ParentQuestClass = UQuest_NewCamp_NCCHAPTER1_DAMLURKER;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-NEWCAMP_NCCHAPTER1_DAMLURKER_DAMLURKER_OBJ_RETURN-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_NewCamp_NCCHAPTER1_DAMLURKER_DAMLURKER_OBJ_RETURN GetNewCamp_NCCHAPTER1_DAMLURKER_DAMLURKER_OBJ_RETURN() property
        {
            return Cast<UQuest_NewCamp_NCCHAPTER1_DAMLURKER_DAMLURKER_OBJ_RETURN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_NewCamp_NCCHAPTER1_DAMLURKER_DAMLURKER_OBJ_RETURN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */