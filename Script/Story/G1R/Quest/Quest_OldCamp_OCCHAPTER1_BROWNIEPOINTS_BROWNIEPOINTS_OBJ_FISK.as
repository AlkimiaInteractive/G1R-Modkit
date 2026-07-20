#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_FISK : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_BROWNIEPOINTS;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_FISK-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER != nullptr && Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER != nullptr && Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER.HasSucceeded();
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_FISK GetOldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_FISK() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_FISK>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_BROWNIEPOINTS_BROWNIEPOINTS_OBJ_FISK::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */