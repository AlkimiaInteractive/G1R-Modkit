#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_BACK : UG1RQuest
        {
            default ParentQuestClass = UQuest_BanditsCamp_BANDITSTRUST;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-BANDITSCAMP_BANDITSTRUST_BANDITSTRUST_OBJ_BACK-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_BACK GetBanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_BACK() property
        {
            return Cast<UQuest_BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_BACK>(UQuestSubsystem::Get().GetQuestByClass(UQuest_BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_BACK::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */