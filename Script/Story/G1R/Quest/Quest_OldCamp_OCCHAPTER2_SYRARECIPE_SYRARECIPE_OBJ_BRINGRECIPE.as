#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_BRINGRECIPE : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER2_SYRARECIPE;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_BRINGRECIPE-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_BRINGRECIPE GetOldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_BRINGRECIPE() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_BRINGRECIPE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_BRINGRECIPE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */