#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_REPORT : UG1RQuest
        {
            default ParentQuestClass = UQuest_BanditsCamp_BANDITSTRUST;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-BANDITSCAMP_BANDITSTRUST_BANDITSTRUST_OBJ_REPORT-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_REPORT GetBanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_REPORT() property
        {
            return Cast<UQuest_BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_REPORT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_REPORT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */