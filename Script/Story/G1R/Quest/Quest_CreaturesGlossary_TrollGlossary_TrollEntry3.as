#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_TrollGlossary_TrollEntry3 : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary_TrollGlossary;
            default bExternalStartTrigger = true;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU != nullptr && Quest::ValleyOfMines_VoMCHAPTER4_ULUMULU.IsRunning();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Troll, Document::UDocumentSegment_Glossary_Troll_Entry3);
            }
        }
        
        
        UQuest_CreaturesGlossary_TrollGlossary_TrollEntry3 GetCreaturesGlossary_TrollGlossary_TrollEntry3() property
        {
            return Cast<UQuest_CreaturesGlossary_TrollGlossary_TrollEntry3>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_TrollGlossary_TrollEntry3::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */