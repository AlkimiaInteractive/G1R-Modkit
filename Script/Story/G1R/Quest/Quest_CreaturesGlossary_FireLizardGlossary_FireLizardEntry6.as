#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_FireLizardGlossary_FireLizardEntry6 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_FireLizardGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Hunting_Skin_Trained);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_FireLizard, Document::UDocumentSegment_Glossary_FireLizard_Entry6);
            }
        }
        
        
        UQuest_CreaturesGlossary_FireLizardGlossary_FireLizardEntry6 GetCreaturesGlossary_FireLizardGlossary_FireLizardEntry6() property
        {
            return Cast<UQuest_CreaturesGlossary_FireLizardGlossary_FireLizardEntry6>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_FireLizardGlossary_FireLizardEntry6::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */