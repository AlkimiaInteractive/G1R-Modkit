#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER3_BESTIARY_3_BESTIARY_3_OBJ_CAVALORN : UG1RQuest
        {
            default ParentQuestClass = UQuest_ValleyOfMines_VoMCHAPTER3_BESTIARY_3;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-VALLEYOFMINES_VOMCHAPTER3_BESTIARY_3_BESTIARY_3_OBJ_CAVALORN-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldBeAvailable() const
            {
                return G1R.Cavalorn_BestiaryDiscovered != 0 && Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3_BESTIARY_3_OBJ_FIND != nullptr && !Quest::ValleyOfMines_VoMCHAPTER3_BESTIARY_3_BESTIARY_3_OBJ_FIND.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestStarted() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH3_BESTIARY_3, Document::UDocumentSegment_CH3_BESTIARY_3_AnotherBook);
            }
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER3_BESTIARY_3_BESTIARY_3_OBJ_CAVALORN GetValleyOfMines_VoMCHAPTER3_BESTIARY_3_BESTIARY_3_OBJ_CAVALORN() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER3_BESTIARY_3_BESTIARY_3_OBJ_CAVALORN>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER3_BESTIARY_3_BESTIARY_3_OBJ_CAVALORN::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */