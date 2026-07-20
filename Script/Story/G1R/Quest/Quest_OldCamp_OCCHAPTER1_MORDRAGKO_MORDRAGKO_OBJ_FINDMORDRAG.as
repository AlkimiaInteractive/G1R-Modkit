#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_MORDRAGKO_MORDRAGKO_OBJ_FINDMORDRAG : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_MORDRAGKO;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_MORDRAGKO_MORDRAGKO_OBJ_FINDMORDRAG-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_MORDRAGKO_MORDRAGKO_OBJ_FINDMORDRAG GetOldCamp_OCCHAPTER1_MORDRAGKO_MORDRAGKO_OBJ_FINDMORDRAG() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_MORDRAGKO_MORDRAGKO_OBJ_FINDMORDRAG>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_MORDRAGKO_MORDRAGKO_OBJ_FINDMORDRAG::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */