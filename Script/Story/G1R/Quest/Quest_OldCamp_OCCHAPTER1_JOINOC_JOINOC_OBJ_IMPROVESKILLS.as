#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_IMPROVESKILLS : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_JOINOC;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_JOINOC_JOINOC_OBJ_IMPROVESKILLS-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_IMPROVESKILLS GetOldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_IMPROVESKILLS() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_IMPROVESKILLS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_IMPROVESKILLS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */