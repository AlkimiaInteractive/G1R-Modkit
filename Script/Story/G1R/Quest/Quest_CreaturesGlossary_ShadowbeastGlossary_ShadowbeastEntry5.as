#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_ShadowbeastGlossary_ShadowbeastEntry5 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_ShadowbeastGlossary;
            default bExternalStartTrigger = true;
            
            AGothicCharacterState GetHero() const property { return GetCharacter(n"HERO"); }
            
            UFUNCTION(BlueprintOverride)
            bool ShouldSucceed() const
            {
                return Hero != nullptr && Hero.HasLearnedSkill(UGE_Skill_Hunting_Spines_Trained);
            }
            
            UFUNCTION(BlueprintOverride)
            void HandleQuestSucceeded() 
            {
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Shadowbeast, Document::UDocumentSegment_Glossary_Shadowbeast_Entry5);
            }
        }
        
        
        UQuest_CreaturesGlossary_ShadowbeastGlossary_ShadowbeastEntry5 GetCreaturesGlossary_ShadowbeastGlossary_ShadowbeastEntry5() property
        {
            return Cast<UQuest_CreaturesGlossary_ShadowbeastGlossary_ShadowbeastEntry5>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_ShadowbeastGlossary_ShadowbeastEntry5::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */