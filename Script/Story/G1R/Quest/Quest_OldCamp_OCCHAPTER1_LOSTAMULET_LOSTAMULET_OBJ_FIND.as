#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_LOSTAMULET_LOSTAMULET_OBJ_FIND : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_LOSTAMULET;
            default bExternalStartTrigger = true;
            default bExternalFailTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_LOSTAMULET_LOSTAMULET_OBJ_FIND-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_LOSTAMULET_LOSTAMULET_OBJ_FIND GetOldCamp_OCCHAPTER1_LOSTAMULET_LOSTAMULET_OBJ_FIND() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_LOSTAMULET_LOSTAMULET_OBJ_FIND>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_LOSTAMULET_LOSTAMULET_OBJ_FIND::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */