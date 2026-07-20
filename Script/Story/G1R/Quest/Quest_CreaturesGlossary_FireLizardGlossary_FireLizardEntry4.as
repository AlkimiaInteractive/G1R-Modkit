#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_FireLizardGlossary_FireLizardEntry4 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_FireLizardGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Hunting_Organ_Trained);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_FireLizard, Document::UDocumentSegment_Glossary_FireLizard_Entry4);
            }
        }
        
        
        UQuest_CreaturesGlossary_FireLizardGlossary_FireLizardEntry4 GetCreaturesGlossary_FireLizardGlossary_FireLizardEntry4() property
        {
            return Cast<UQuest_CreaturesGlossary_FireLizardGlossary_FireLizardEntry4>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_FireLizardGlossary_FireLizardEntry4::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */