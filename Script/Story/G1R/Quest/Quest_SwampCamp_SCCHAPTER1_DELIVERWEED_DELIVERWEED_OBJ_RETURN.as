#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_RETURN : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1_DELIVERWEED;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_RETURN-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_RETURN GetSwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_RETURN() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_RETURN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_DELIVERWEED_DELIVERWEED_OBJ_RETURN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */