#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_STONEHENGE_STONEHENGE_OBJ_DOOR : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3_STONEHENGE;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_STONEHENGE_STONEHENGE_OBJ_DOOR-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_STONEHENGE_STONEHENGE_OBJ_DOOR GetOldCamp_OCCHAPTER3_STONEHENGE_STONEHENGE_OBJ_DOOR() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_STONEHENGE_STONEHENGE_OBJ_DOOR>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_STONEHENGE_STONEHENGE_OBJ_DOOR::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */