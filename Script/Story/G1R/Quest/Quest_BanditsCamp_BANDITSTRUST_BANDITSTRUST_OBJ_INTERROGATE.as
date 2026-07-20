#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE : UG1RQuest
        {
            default ParentQuestClass = UQuest_BanditsCamp_BANDITSTRUST;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-BANDITSCAMP_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE GetBanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE() property
        {
            return Cast<UQuest_BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_BanditsCamp_BANDITSTRUST_BANDITSTRUST_OBJ_INTERROGATE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */