#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_BiterGlossary_BiterEntry4 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_BiterGlossary;
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
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Biter, Document::UDocumentSegment_Glossary_Biter_Entry4);
            }
        }
        
        
        UQuest_CreaturesGlossary_BiterGlossary_BiterEntry4 GetCreaturesGlossary_BiterGlossary_BiterEntry4() property
        {
            return Cast<UQuest_CreaturesGlossary_BiterGlossary_BiterEntry4>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_BiterGlossary_BiterEntry4::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */