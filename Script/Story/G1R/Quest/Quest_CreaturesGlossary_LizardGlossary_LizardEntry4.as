#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_LizardGlossary_LizardEntry4 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_LizardGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Hunting_Scutes_Trained);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Lizard, Document::UDocumentSegment_Glossary_Lizard_Entry4);
            }
        }
        
        
        UQuest_CreaturesGlossary_LizardGlossary_LizardEntry4 GetCreaturesGlossary_LizardGlossary_LizardEntry4() property
        {
            return Cast<UQuest_CreaturesGlossary_LizardGlossary_LizardEntry4>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_LizardGlossary_LizardEntry4::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */