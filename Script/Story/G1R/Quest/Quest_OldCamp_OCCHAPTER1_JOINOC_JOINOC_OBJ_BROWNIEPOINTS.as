#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_BROWNIEPOINTS : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_JOINOC;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_JOINOC_JOINOC_OBJ_BROWNIEPOINTS-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_BROWNIEPOINTS GetOldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_BROWNIEPOINTS() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_BROWNIEPOINTS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_BROWNIEPOINTS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */