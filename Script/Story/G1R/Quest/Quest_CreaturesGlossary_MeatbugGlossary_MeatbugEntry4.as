#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_MeatbugGlossary_MeatbugEntry4 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_MeatbugGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasItem(UItAr_Scroll_TransformMeatbug, 1, 0);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Meatbug, Document::UDocumentSegment_Glossary_Meatbug_Entry4);
            }
        }
        
        
        UQuest_CreaturesGlossary_MeatbugGlossary_MeatbugEntry4 GetCreaturesGlossary_MeatbugGlossary_MeatbugEntry4() property
        {
            return Cast<UQuest_CreaturesGlossary_MeatbugGlossary_MeatbugEntry4>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_MeatbugGlossary_MeatbugEntry4::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */