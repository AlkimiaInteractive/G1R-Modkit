#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_AUDIENCE : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_JOINOC;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_JOINOC_JOINOC_OBJ_AUDIENCE-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return Quest::OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_THORUS != nullptr && Quest::OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_THORUS.HasSucceeded();
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_AUDIENCE GetOldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_AUDIENCE() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_AUDIENCE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_JOINOC_JOINOC_OBJ_AUDIENCE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */