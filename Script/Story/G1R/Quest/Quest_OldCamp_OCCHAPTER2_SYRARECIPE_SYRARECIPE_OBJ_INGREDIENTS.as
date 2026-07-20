#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_INGREDIENTS : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER2_SYRARECIPE;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_INGREDIENTS-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_INGREDIENTS GetOldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_INGREDIENTS() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_INGREDIENTS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER2_SYRARECIPE_SYRARECIPE_OBJ_INGREDIENTS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */