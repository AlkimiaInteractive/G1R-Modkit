#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_FreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_DELIVER : UG1RQuest
        {
            default ParentQuestClass = UQuest_FreeMine_BALOROS_WAFFE;
            default bSucceedParent = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-FREEMINE_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_DELIVER-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return Quest::FreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_BEER != nullptr && Quest::FreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_BEER.HasSucceeded() && Quest::FreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_APPLE != nullptr && Quest::FreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_APPLE.HasSucceeded() && Quest::FreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_BREAD != nullptr && Quest::FreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_BREAD.HasSucceeded() && Quest::FreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_CHEESE != nullptr && Quest::FreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_CHEESE.HasSucceeded() && Quest::FreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_GRAPES != nullptr && Quest::FreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_GRAPES.HasSucceeded() && Quest::FreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_BRANDY != nullptr && Quest::FreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_BRANDY.HasSucceeded();
            }
        }
        
        
        UQuest_FreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_DELIVER GetFreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_DELIVER() property
        {
            return Cast<UQuest_FreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_DELIVER>(UQuestSubsystem::Get().GetQuestByClass(UQuest_FreeMine_BALOROS_WAFFE_BALOROS_WAFFE_OBJ_DELIVER::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */