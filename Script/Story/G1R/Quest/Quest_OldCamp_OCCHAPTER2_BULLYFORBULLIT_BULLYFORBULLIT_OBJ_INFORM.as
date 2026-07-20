#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER2_BULLYFORBULLIT_BULLYFORBULLIT_OBJ_INFORM : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER2_BULLYFORBULLIT;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER2_BULLYFORBULLIT_BULLYFORBULLIT_OBJ_INFORM-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER2_BULLYFORBULLIT_BULLYFORBULLIT_OBJ_INFORM GetOldCamp_OCCHAPTER2_BULLYFORBULLIT_BULLYFORBULLIT_OBJ_INFORM() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER2_BULLYFORBULLIT_BULLYFORBULLIT_OBJ_INFORM>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER2_BULLYFORBULLIT_BULLYFORBULLIT_OBJ_INFORM::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */