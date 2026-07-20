#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ORCENCLAVE_THECHAMPIONBURIAL_THECHAMPIONBURIAL_OBJ_ACCESS : UG1RQuest
        {
            default ParentQuestClass = UQuest_ORCENCLAVE_THECHAMPIONBURIAL;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-ORCENCLAVE_THECHAMPIONBURIAL_THECHAMPIONBURIAL_OBJ_ACCESS-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_ORCENCLAVE_THECHAMPIONBURIAL_THECHAMPIONBURIAL_OBJ_ACCESS GetORCENCLAVE_THECHAMPIONBURIAL_THECHAMPIONBURIAL_OBJ_ACCESS() property
        {
            return Cast<UQuest_ORCENCLAVE_THECHAMPIONBURIAL_THECHAMPIONBURIAL_OBJ_ACCESS>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ORCENCLAVE_THECHAMPIONBURIAL_THECHAMPIONBURIAL_OBJ_ACCESS::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */