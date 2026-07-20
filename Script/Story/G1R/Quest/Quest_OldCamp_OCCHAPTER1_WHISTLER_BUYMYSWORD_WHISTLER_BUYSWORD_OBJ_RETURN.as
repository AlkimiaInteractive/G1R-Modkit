#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD_WHISTLER_BUYSWORD_OBJ_RETURN : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD;
            default bSucceedParent = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_WHISTLER_BUYMYSWORD_WHISTLER_BUYSWORD_OBJ_RETURN-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD_WHISTLER_BUYSWORD_OBJ_BUY != nullptr && Quest::OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD_WHISTLER_BUYSWORD_OBJ_BUY.HasSucceeded();
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD_WHISTLER_BUYSWORD_OBJ_RETURN GetOldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD_WHISTLER_BUYSWORD_OBJ_RETURN() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD_WHISTLER_BUYSWORD_OBJ_RETURN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_WHISTLER_BUYMYSWORD_WHISTLER_BUYSWORD_OBJ_RETURN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */