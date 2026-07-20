#ifdef WITH_STORY_G1R
namespace G1R
{
    namespace Quest
    {
        class UQuest_CreaturesGlossary_SnapperGlossary_SnapperEntry2 : UG1RQuest
        {
            default InvolvedCharacters.Add(n"HERO");
            default ParentQuestClass = UQuest_CreaturesGlossary_SnapperGlossary;
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
                GetCharacter(n"Hero").UnlockDocumentSegment(Document::UDocument_Glossary_Snapper, Document::UDocumentSegment_Glossary_Snapper_Entry2);
            }
        }
        
        
        UQuest_CreaturesGlossary_SnapperGlossary_SnapperEntry2 GetCreaturesGlossary_SnapperGlossary_SnapperEntry2() property
        {
            return Cast<UQuest_CreaturesGlossary_SnapperGlossary_SnapperEntry2>(UQuestSubsystem::Get().GetQuestByClass(UQuest_CreaturesGlossary_SnapperGlossary_SnapperEntry2::StaticClass()));
        }
        
    }
}
#endif /* WITH_STORY_G1R */