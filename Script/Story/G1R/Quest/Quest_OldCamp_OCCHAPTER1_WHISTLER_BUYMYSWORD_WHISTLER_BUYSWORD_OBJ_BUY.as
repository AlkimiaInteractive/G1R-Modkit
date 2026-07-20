#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD_WHISTLER_BUYSWORD_OBJ_BUY : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD;
            default bExternalFailTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_WHISTLER_BUYMYSWORD_WHISTLER_BUYSWORD_OBJ_BUY-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD_WHISTLER_BUYSWORD_OBJ_BUY GetOldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD_WHISTLER_BUYSWORD_OBJ_BUY() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD_WHISTLER_BUYSWORD_OBJ_BUY>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD_WHISTLER_BUYSWORD_OBJ_BUY::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */