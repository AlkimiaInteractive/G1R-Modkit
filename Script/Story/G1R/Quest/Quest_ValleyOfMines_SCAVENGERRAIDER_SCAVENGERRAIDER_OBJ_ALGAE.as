#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_ALGAE : UG1RQuest
        {
            default ParentQuestClass = UQuest_ValleyOfMines_SCAVENGERRAIDER;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-VALLEYOFMINES_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_ALGAE-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_ALGAE GetValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_ALGAE() property
        {
            return Cast<UQuest_ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_ALGAE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_ALGAE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */