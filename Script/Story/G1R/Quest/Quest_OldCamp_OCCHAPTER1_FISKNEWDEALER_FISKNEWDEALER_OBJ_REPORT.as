#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_FISKNEWDEALER_FISKNEWDEALER_OBJ_REPORT : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_FISKNEWDEALER;
            default bSucceedParent = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_FISKNEWDEALER_FISKNEWDEALER_OBJ_REPORT-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldStart() const
            {
                return Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER_FISKNEWDEALER_OBJ_FENCE != nullptr && Quest::OldCamp_OCCHAPTER1_FISKNEWDEALER_FISKNEWDEALER_OBJ_FENCE.HasSucceeded();
            }
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_FISKNEWDEALER_FISKNEWDEALER_OBJ_REPORT GetOldCamp_OCCHAPTER1_FISKNEWDEALER_FISKNEWDEALER_OBJ_REPORT() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_FISKNEWDEALER_FISKNEWDEALER_OBJ_REPORT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_FISKNEWDEALER_FISKNEWDEALER_OBJ_REPORT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */