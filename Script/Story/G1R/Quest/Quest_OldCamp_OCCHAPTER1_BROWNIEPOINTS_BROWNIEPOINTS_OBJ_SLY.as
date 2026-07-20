#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SLY : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_BROWNIEPOINTS;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SLY-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SLY GetOldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SLY() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SLY>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_SLY::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */