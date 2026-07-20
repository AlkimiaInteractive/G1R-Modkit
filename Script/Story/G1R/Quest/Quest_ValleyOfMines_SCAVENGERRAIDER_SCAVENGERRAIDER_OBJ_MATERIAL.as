#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_MATERIAL : UG1RQuest
        {
            default ParentQuestClass = UQuest_ValleyOfMines_SCAVENGERRAIDER;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-VALLEYOFMINES_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_MATERIAL-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_MATERIAL GetValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_MATERIAL() property
        {
            return Cast<UQuest_ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_MATERIAL>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_MATERIAL::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */