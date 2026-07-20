#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_HarpyGlossary_HarpyEntry2 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_HarpyGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Hunting_Claw_Trained);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Harpy, Document::UDocumentSegment_Glossary_Harpy_Entry2);
            }
        }
        
        
        UQuest_CreaturesGlossary_HarpyGlossary_HarpyEntry2 GetCreaturesGlossary_HarpyGlossary_HarpyEntry2() property
        {
            return Cast<UQuest_CreaturesGlossary_HarpyGlossary_HarpyEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_HarpyGlossary_HarpyEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */