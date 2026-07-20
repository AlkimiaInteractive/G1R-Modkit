#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_CHROMANIN : UG1RQuest
        {
            default ParentQuestClass = UQuest_ValleyOfMines;
            default DescriptionText = "QUEST-VALLEYOFMINES_CHROMANIN-DESCRIPTION";
            default NameText = "QUEST-VALLEYOFMINES_CHROMANIN-NAME";
            default QuestlogDocumentClass = Document::UDocument_CH1_CHROMANIN;
            default QuestKind = EQuestKind::Side;
        }
        
        
        UQuest_ValleyOfMines_CHROMANIN GetValleyOfMines_CHROMANIN() property
        {
            return Cast<UQuest_ValleyOfMines_CHROMANIN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_CHROMANIN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */