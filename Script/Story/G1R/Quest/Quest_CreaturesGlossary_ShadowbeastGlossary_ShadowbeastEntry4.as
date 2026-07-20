#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_ShadowbeastGlossary_ShadowbeastEntry4 : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary_ShadowbeastGlossary;
            default bExternalStartTrigger = true;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Shadowbeast, Document::UDocumentSegment_Glossary_Shadowbeast_Entry4);
            }
        }
        
        
        UQuest_CreaturesGlossary_ShadowbeastGlossary_ShadowbeastEntry4 GetCreaturesGlossary_ShadowbeastGlossary_ShadowbeastEntry4() property
        {
            return Cast<UQuest_CreaturesGlossary_ShadowbeastGlossary_ShadowbeastEntry4>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_ShadowbeastGlossary_ShadowbeastEntry4::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */