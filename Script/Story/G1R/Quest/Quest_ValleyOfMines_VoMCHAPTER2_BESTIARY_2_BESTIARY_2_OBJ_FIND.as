#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FIND : UG1RQuest
        {
            default ParentQuestClass = UQuest_ValleyOfMines_VoMCHAPTER2_BESTIARY_2;
            default bExternalSuccessTrigger = true;
            default NameText = "QUEST-VALLEYOFMINES_VOMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FIND-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldBeAvailable() const
            {
                return G1R.Cavalorn_BestiaryDiscovered == 0 && Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_CAVALORN != nullptr && !Quest::ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_CAVALORN.HasBeenStarted();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestStarted() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH2_BESTIARY_2, Document::UDocumentSegment_CH2_BESTIARY_2_Start);
            }
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FIND GetValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FIND() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FIND>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER2_BESTIARY_2_BESTIARY_2_OBJ_FIND::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */