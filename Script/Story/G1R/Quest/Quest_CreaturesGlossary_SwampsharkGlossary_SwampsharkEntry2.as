#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_SwampsharkGlossary_SwampsharkEntry2 : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary_SwampsharkGlossary;
            default bExternalStartTrigger = true;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Swampshark, Document::UDocumentSegment_Glossary_Swampshark_Entry2);
            }
        }
        
        
        UQuest_CreaturesGlossary_SwampsharkGlossary_SwampsharkEntry2 GetCreaturesGlossary_SwampsharkGlossary_SwampsharkEntry2() property
        {
            return Cast<UQuest_CreaturesGlossary_SwampsharkGlossary_SwampsharkEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_SwampsharkGlossary_SwampsharkEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */