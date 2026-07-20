#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_OldCamp_OCCHAPTER1_FISKNEWDEALER_FISKNEWDEALER_OBJ_FENCE : UG1RQuest
        {
            default ParentQuestClass = UQuest_OldCamp_OCCHAPTER1_FISKNEWDEALER;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-OLDCAMP_OCCHAPTER1_FISKNEWDEALER_FISKNEWDEALER_OBJ_FENCE-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_OldCamp_OCCHAPTER1_FISKNEWDEALER_FISKNEWDEALER_OBJ_FENCE GetOldCamp_OCCHAPTER1_FISKNEWDEALER_FISKNEWDEALER_OBJ_FENCE() property
        {
            return Cast<UQuest_OldCamp_OCCHAPTER1_FISKNEWDEALER_FISKNEWDEALER_OBJ_FENCE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_OldCamp_OCCHAPTER1_FISKNEWDEALER_FISKNEWDEALER_OBJ_FENCE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */