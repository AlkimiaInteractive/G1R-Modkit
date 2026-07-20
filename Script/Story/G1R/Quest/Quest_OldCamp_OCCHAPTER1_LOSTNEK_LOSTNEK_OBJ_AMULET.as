#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_AMULET : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_LOSTNEK;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_AMULET-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_AMULET GetOldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_AMULET() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_AMULET>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_LOSTNEK_LOSTNEK_OBJ_AMULET::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */