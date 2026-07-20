#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_WAITSNAF : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER2_SYRARECIPE;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_WAITSNAF-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_WAITSNAF GetOldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_WAITSNAF() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_WAITSNAF>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_WAITSNAF::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */