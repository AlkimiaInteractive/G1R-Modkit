#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_GUY : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_LOSTNEK;
            default bIsOptional = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_GUY-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_GUY GetOldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_GUY() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_GUY>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_GUY::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */