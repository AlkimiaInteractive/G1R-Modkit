#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER2_MEETYBERION_MEETYBERION_OBJ_MEET : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER2_MEETYBERION;
            default bSucceedParent = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER2_MEETYBERION_MEETYBERION_OBJ_MEET-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_SwampCamp_SCCHAPTER2_MEETYBERION_MEETYBERION_OBJ_MEET GetSwampCamp_SCCHAPTER2_MEETYBERION_MEETYBERION_OBJ_MEET() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER2_MEETYBERION_MEETYBERION_OBJ_MEET>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER2_MEETYBERION_MEETYBERION_OBJ_MEET::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */