#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_DEXTER : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_BROWNIEPOINTS;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_DEXTER-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_DEXTER GetOldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_DEXTER() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_DEXTER>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_DEXTER::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */