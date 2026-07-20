#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_MeatbugGlossary_MeatbugEntry2 : UG1RQuest
        {
            default ParentQuestClass = UQuest_CreaturesGlossary_MeatbugGlossary;
            default bExternalStartTrigger = true;
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE != nullptr && Quest::OldCamp_OCCHAPTER1_SNAFSRECIPE.HasSucceeded();
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Meatbug, Document::UDocumentSegment_Glossary_Meatbug_Entry2);
            }
        }
        
        
        UQuest_CreaturesGlossary_MeatbugGlossary_MeatbugEntry2 GetCreaturesGlossary_MeatbugGlossary_MeatbugEntry2() property
        {
            return Cast<UQuest_CreaturesGlossary_MeatbugGlossary_MeatbugEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_MeatbugGlossary_MeatbugEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */