#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_SNAF : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_LOSTNEK;
            default bIsOptional = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_SNAF-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_SNAF GetOldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_SNAF() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_SNAF>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_SNAF::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */