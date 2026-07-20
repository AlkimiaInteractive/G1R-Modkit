#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_THORUS : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_BROWNIEPOINTS;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_THORUS-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldFail() const
            {
                return Quest::OldCamp_OCCHAPTER1_MORDRAGKO != nullptr && Quest::OldCamp_OCCHAPTER1_MORDRAGKO.HasFailed();
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_THORUS GetOldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_THORUS() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_THORUS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_THORUS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */