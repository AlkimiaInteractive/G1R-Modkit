#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_CHROMANIN_CHROMANIN_OBJ_RESOLVE : UG1RQuest
        {
            default ParentQuestClass = UQuest_ValleyOfMines_CHROMANIN;
            default bSucceedParent = true;
            default NameText = "QUEST-VALLEYOFMINES_CHROMANIN_CHROMANIN_OBJ_RESOLVE-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH1_CHROMANIN, Document::UDocumentSegment_CH1_CHROMANIN_Book6);
            }
        }
        
        
        UQuest_ValleyOfMines_CHROMANIN_CHROMANIN_OBJ_RESOLVE GetValleyOfMines_CHROMANIN_CHROMANIN_OBJ_RESOLVE() property
        {
            return Cast<UQuest_ValleyOfMines_CHROMANIN_CHROMANIN_OBJ_RESOLVE>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_CHROMANIN_CHROMANIN_OBJ_RESOLVE::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */