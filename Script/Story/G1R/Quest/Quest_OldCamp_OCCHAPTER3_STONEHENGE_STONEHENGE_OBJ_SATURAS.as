#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER3_STONEHENGE_STONEHENGE_OBJ_SATURAS : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER3_STONEHENGE;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER3_STONEHENGE_STONEHENGE_OBJ_SATURAS-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER3_STONEHENGE_STONEHENGE_OBJ_SATURAS GetOldCamp_OCCHAPTER3_STONEHENGE_STONEHENGE_OBJ_SATURAS() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER3_STONEHENGE_STONEHENGE_OBJ_SATURAS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER3_STONEHENGE_STONEHENGE_OBJ_SATURAS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */