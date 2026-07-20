#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_WAIT : UG1RQuest
        {
            default ParentQuestClass = UQuest_ValleyOfMines_SCAVENGERRAIDER;
            default bSucceedParent = true;
            default bExternalStartTrigger = true;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-VALLEYOFMINES_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_WAIT-NAME";
            default QuestKind = EQuestKind::Subobjective;
        }
        
        
        UQuest_ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_WAIT GetValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_WAIT() property
        {
            return Cast<UQuest_ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_WAIT>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_SCAVENGERRAIDER_SCAVENGERRAIDER_OBJ_WAIT::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */