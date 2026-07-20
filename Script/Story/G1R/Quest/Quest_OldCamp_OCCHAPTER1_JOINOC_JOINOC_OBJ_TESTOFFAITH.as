#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_TESTOFFAITH : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_JOINOC;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_JOINOC_JOINOC_OBJ_TESTOFFAITH-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_TESTOFFAITH GetOldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_TESTOFFAITH() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_TESTOFFAITH>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_TESTOFFAITH::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */