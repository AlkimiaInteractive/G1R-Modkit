#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_ZARR : UG1RQuest
        {
            default InvolvedCharacters.Add(n"FM_OSL_TARROK_2001");
            default ParentQuestClass = UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU;
            default bExternalStartTrigger = true;
            default NameText = "QUEST-VALLEYOFMINES_VOMCHAPTER4_ULUMULU_ULUMULU_OBJ_ZARR-NAME";
            default QuestKind = EQuestKind::Subobjective;
            
            AGothicCharacterState GetTarrok() const property { return GetCharacter(n"FM_OSL_TARROK_2001"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Tarrok != nullptr && Tarrok.IsEveryoneOfThisKindDead();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                DC(int64(0x0000006c), EConversationDebugInfo::Executing);
                Quest::ValleyOfMines_VoMCHAPTER4_PATHTOORCENCLAVE.StartQuest();
                DC(int64(0x0000006c), EConversationDebugInfo::Done);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_PATHTOORCENCLAVE, Document::UDocumentSegment_CH4_PATHTOORCENCLAVE_Start);
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_CH4_ULUMULU, Document::UDocumentSegment_CH4_ULUMULU_TarrokDead);
            }
        }
        
        
        UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_ZARR GetValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_ZARR() property
        {
            return Cast<UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_ZARR>(UQuestSubsystem::Get().GetQuestByClass(UQuest_ValleyOfMines_VoMCHAPTER4_ULUMULU_ULUMULU_OBJ_ZARR::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */