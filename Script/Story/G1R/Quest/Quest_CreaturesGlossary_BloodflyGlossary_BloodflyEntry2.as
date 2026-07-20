#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_BloodflyGlossary_BloodflyEntry2 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_BloodflyGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Hunting_Stings_Trained);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Bloodfly, Document::UDocumentSegment_Glossary_Bloodfly_Entry2);
            }
        }
        
        
        UQuest_CreaturesGlossary_BloodflyGlossary_BloodflyEntry2 GetCreaturesGlossary_BloodflyGlossary_BloodflyEntry2() property
        {
            return Cast<UQuest_CreaturesGlossary_BloodflyGlossary_BloodflyEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_BloodflyGlossary_BloodflyEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */