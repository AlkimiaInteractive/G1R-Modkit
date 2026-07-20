#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_FINDNOVICE : UG1RQuest
        {
            default ParentQuestClass = UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-SWAMPCAMP_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_FINDNOVICE-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_FINDNOVICE GetSwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_FINDNOVICE() property
        {
            return Cast<UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_FINDNOVICE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_SwampCamp_SCCHAPTER1_RECRUITDUSTY_RECRUITDUSTY_OBJ_FINDNOVICE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */